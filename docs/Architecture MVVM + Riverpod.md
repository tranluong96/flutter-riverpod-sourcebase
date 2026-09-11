# Kiến trúc MVVM + Riverpod

> Tài liệu mô tả kiến trúc MVVM cho dự án Flutter: các lớp View, ViewModel, Domain (tùy chọn), Repository, Service; cấu trúc thư mục theo lớp, luồng state, ưu/nhược điểm, cách test và quy ước làm việc.

## 1. Tổng quan

Tài liệu về **kiến trúc và state** của ứng dụng Flutter: áp dụng mô hình **MVVM** (View – ViewModel – Model), thư mục tổ chức theo từng lớp của MVVM, quản lý state và dependency injection bằng **Riverpod**. Trong đó `Notifier` của Riverpod đóng vai trò **ViewModel**.

| Hạng mục | Công nghệ |
| --- | --- |
| Kiến trúc | MVVM (View – ViewModel – Model), thư mục theo lớp |
| State management + DI | Riverpod (`hooks_riverpod`, generated provider) |
| State model | Freezed (state bất biến) |
| Navigation | AutoRoute hoặc GoRouter |
| Data | Dio + Retrofit (remote), SharedPreferences + Hive (local), truy cập qua Repository |

### 2. Kiến trúc

### 2.1 Cấu trúc thư mục

```text
lib/
├── main.dart                  # Entry point, bootstrap, error handlers
├── app/                       # Hạ tầng dùng chung (không chứa nghiệp vụ)
│   ├── base/                  # Base class, quy ước dùng chung
│   ├── configs/               # Cấu hình ứng dụng
│   ├── core/                  # Network (Dio), storage, extensions, resources
│   ├── language/              # State + logic ngôn ngữ
│   └── routers/               # AppRouter, route definitions
├── presentation/              # VIEW + VIEWMODEL (Presentation layer)
│   ├── widgets/               # Widget dùng chung: overlay, loading, toast, theme
│   ├── splash/
│   │   └── views/splash_page.dart
│   ├── onboarding/
│   │   └── views/onboarding_page.dart   # Màn đơn giản: chỉ cần View
│   ├── auth/
│   │   └── login/
│   │       ├── views/login_page.dart              # View
│   │       └── view_models/
│   │           ├── login_view_model.dart          # ViewModel (Notifier)
│   │           └── login_state.dart               # UI state (Freezed)
│   ├── shell/                 # App shell (khung điều hướng chính)
│   └── home/
│       ├── views/home_page.dart                   # View (ConsumerWidget)
│       ├── view_models/
│       │   ├── home_view_model.dart               # ViewModel (Notifier)
│       │   └── home_state.dart                    # UI state (Freezed, bất biến)
│       └── widgets/                               # Widget riêng của màn hình (nếu cần)
├── domain/                    # (Tùy chọn) chỉ thêm khi logic phức tạp / dùng lại nhiều nơi
│   ├── models/                # Entity thuần
│   └── use_cases/             # Use case
├── data/                      # MODEL layer
│   ├── models/                # Data model / DTO (json, freezed)
│   ├── services/              # Service: giao tiếp thô với nguồn dữ liệu
│   │   ├── remote/            #   API client (Dio + Retrofit)
│   │   └── local/             #   SharedPreferences, Hive
│   └── repositories/          # Repository: nguồn dữ liệu duy nhất cho ViewModel
└── i18n/                      # File dịch + code sinh bởi Slang
```

### 2.2 Tổ chức thư mục theo lớp MVVM

- Thư mục cấp cao nhất phản ánh đúng các lớp của kiến trúc: `presentation/` (View + ViewModel), `domain/` (tùy chọn), `data/` (Repository, Service, Model).
- `presentation/` là **Presentation layer**: mỗi màn hình có một thư mục riêng, bên trong chia theo vai trò `views/`, `view_models/`, `widgets/`. Mỗi màn hình sở hữu **View** (page), **ViewModel** (Notifier) và **UI state** (Freezed).
- `data/` là **Model layer**: **Repository**, **Service** (remote/local) và **Model/DTO**, dùng chung cho các màn hình.
- `domain/` là lớp **tùy chọn**: entity và use case, chỉ thêm khi logic phức tạp hoặc cần dùng lại ở nhiều ViewModel.
- `app/` là hạ tầng dùng chung (network, storage, router, language), không chứa nghiệp vụ. Widget dùng chung đặt ở `presentation/widgets/`.
- State ngắn hạn chỉ phục vụ một widget thì để tại widget (`useState` / `StatefulWidget`), **không cần** đưa hết lên ViewModel.

### 2.3 Các lớp MVVM và trách nhiệm

| Lớp | Vị trí | Trách nhiệm | Không được làm |
| --- | --- | --- | --- |
| **View** | `presentation/<screen>/views/*_page.dart`, `widgets/` | Vẽ UI theo state (`ref.watch`); chuyển sự kiện người dùng sang ViewModel (`ref.read(...notifier)`); side-effect UI như toast, điều hướng (`ref.listen`). | Chứa logic nghiệp vụ; gọi Repository/Service; import `data/`. |
| **ViewModel** | `presentation/<screen>/view_models/*_view_model.dart` (Notifier) | Nhận action từ View; gọi Repository/Use case; chuyển kết quả thành UI state; xử lý loading, lỗi, validate input. | Import widget Flutter hoặc dùng `BuildContext`; gọi Dio/Hive/SharedPreferences trực tiếp; gọi chéo ViewModel của màn hình khác. |
| **UI State** | `presentation/<screen>/view_models/*_state.dart` (Freezed) | Dữ liệu bất biến mà View cần để vẽ (`isLoading`, `items`, `errorMessage`...). | Chứa logic hoặc widget. |
| **Domain** (tùy chọn) | `domain/models`, `domain/use_cases` | Entity thuần; use case gom logic nghiệp vụ dùng lại ở nhiều ViewModel hoặc ghép nhiều Repository. | Phụ thuộc Flutter hoặc Service; tạo use case chỉ để chuyển tiếp 1 lời gọi. |
| **Repository** | `data/repositories/` | Nguồn dữ liệu duy nhất cho ViewModel: gọi Service remote/local, cache, mapping DTO sang model, đổi exception kỹ thuật thành lỗi nghiệp vụ. | Biết View/ViewModel; giữ UI state. |
| **Service** | `data/services/remote`, `local` | Giao tiếp thô với nguồn dữ liệu: HTTP (Retrofit), Hive, SharedPreferences. | Chứa logic nghiệp vụ; biết Repository. |
| **Model / DTO** | `data/models/` | Cấu trúc dữ liệu từ API/DB, (de)serialize bằng json_serializable/Freezed. | Chứa logic UI. |

### 2.4 Cấu trúc gợi ý của một màn hình

Mỗi màn hình gồm 3 file chính (View, ViewModel, State), ví dụ với `home`:

```text
presentation/home/
├── views/
│   └── home_page.dart         # View: vẽ UI theo state, chuyển sự kiện sang ViewModel
├── view_models/
│   ├── home_view_model.dart   # ViewModel (Notifier): logic trình bày, gọi Repository
│   └── home_state.dart        # UI state (Freezed, bất biến)
└── widgets/                   # (tùy chọn) widget riêng của màn hình
```

Nếu màn hình lớn, thêm thư mục `widgets/` để chứa widget riêng của màn hình. Page đơn giản không có logic (ví dụ `splash_page.dart`, `onboarding_page.dart`) chỉ cần View, không bắt buộc có ViewModel.

Repository và Service không nằm trong `presentation/` mà ở `data/`, ví dụ: `data/repositories/product_repository.dart`, `data/services/remote/product_api.dart`.

### 2.5 Quy tắc phụ thuộc

Phụ thuộc đi **một chiều**: `View → ViewModel → (Use case) → Repository → Service`. Dữ liệu quay ngược lại chỉ qua state.

- **View** chỉ dùng ViewModel/State của chính màn hình và widget chung ở `presentation/widgets`.
- **ViewModel** chỉ lấy dữ liệu qua Repository (hoặc Use case) bằng provider; không gọi Service trực tiếp.
- `app/core` và `data` **không** import ngược `presentation`; `domain` không import `presentation` và `data/services`.
- Màn hình **không** gọi chéo trực tiếp vào ViewModel/state của màn hình khác; nếu cần dùng chung, đưa xuống Repository/Use case ở `data/` hoặc `domain/`, hoặc provider dùng chung ở `app/`.
- Repository và Service được khai báo thành provider để dễ override bằng fake khi test.
- Generated file (`*.g.dart`, `*.freezed.dart`) không sửa tay.

### 2.6 Luồng khởi động

1. `main.dart` khởi tạo Flutter binding và error handlers.
2. Nạp file env, khởi tạo SharedPreferences và Hive.
3. Tạo `ProviderContainer`, deep link và language provider.
4. `MyApp` chạy trong `UncontrolledProviderScope` và `TranslationProvider`.
5. Repository, Service và ViewModel được tạo lazy khi View đọc provider lần đầu.

## 3. Diagram (flowchart / graph)

### 3.1 Tổng quan các lớp

Tổng quan các lớp MVVM

### 3.2 Luồng State (Riverpod)

Luồng state MVVM với Riverpod

### 3.3 Sequence: một thao tác của người dùng

Sequence một thao tác người dùng

### 4. State và luồng chạy

- **ViewModel** (Notifier) giữ logic trình bày; **state** là dữ liệu UI bất biến (dùng `Freezed`).
- View dùng `ref.watch` để nhận state và rebuild.
- Gọi action qua `ref.read(provider.notifier)`.
- ViewModel lấy dữ liệu từ **Repository** (qua provider); Repository gọi Service và trả model đã map.

| API | Dùng khi | Lưu ý |
| --- | --- | --- |
| `ref.watch` | Trong `build` để rebuild theo state | Không dùng trong callback (onPressed...) |
| `ref.read` | Trong callback/event, gọi `.notifier` | Không dùng trong `build` để lấy state |
| `ref.listen` | Side-effect khi state đổi (toast, navigate) | Tránh đăng ký lặp trong `build` |

### Ví dụ: một màn hình đủ các lớp (home)

```dart
// data/repositories/product_repository.dart  (Model layer)
@riverpod
ProductRepository productRepository(Ref ref) =>
    ProductRepository(ref.watch(productApiProvider)); // Service (Retrofit)

class ProductRepository {
  ProductRepository(this._api);
  final ProductApi _api;

  Future<List<Product>> fetch() async {
    try {
      final dtos = await _api.getProducts();     // gọi Service
      return dtos.map((e) => e.toModel()).toList(); // mapping DTO -> model
    } on DioException catch (e) {
      throw AppException.fromDio(e);             // lỗi kỹ thuật -> lỗi nghiệp vụ
    }
  }
}
```

```dart
// presentation/home/view_models/home_state.dart  (UI state)
@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(true) bool isLoading,
    @Default(<Product>[]) List<Product> products,
    String? errorMessage,
  }) = _HomeState;
}
```

```dart
// presentation/home/view_models/home_view_model.dart  (ViewModel)
@riverpod
class HomeViewModel extends _$HomeViewModel {
  @override
  HomeState build() => const HomeState();

  Future<void> load() async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final products = await ref.read(productRepositoryProvider).fetch();
      state = state.copyWith(isLoading: false, products: products);
    } on AppException catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.message);
    }
  }
}
```

```dart
// presentation/home/views/home_page.dart  (View)
class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeViewModelProvider);   // nhận state, rebuild

    // Tải dữ liệu lần đầu khi màn hình được tạo
    useEffect(() {
      Future.microtask(() => ref.read(homeViewModelProvider.notifier).load());
      return null;
    }, const []);

    if (state.isLoading) return const LoadingView();
    return ProductList(
      products: state.products,
      onRefresh: () => ref.read(homeViewModelProvider.notifier).load(), // action
    );
  }
}
```

### 5. Ưu điểm

- **Tách trách nhiệm rõ**: View chỉ vẽ, ViewModel giữ logic trình bày, Repository lo dữ liệu, Service lo giao tiếp thô.
- **State tập trung**, luồng cập nhật một chiều; UI phản ứng theo provider.
- **Scalability**: các lớp độc lập, thêm màn hình mới chỉ thêm thư mục trong `presentation/` và tái sử dụng Repository có sẵn.
- **Testability**: test ViewModel chỉ cần fake Repository; test Repository chỉ cần fake Service; không cần dựng UI.
- **Nguồn dữ liệu duy nhất**: đổi API, thêm cache hoặc đổi local storage chỉ sửa ở Repository, không ảnh hưởng ViewModel/View.
- **Type safety + giảm boilerplate** nhờ code generation (Riverpod, Freezed, Retrofit).
- **Dễ phân chia việc** trong team: tách người làm UI (`presentation/`) và người làm dữ liệu (`data/`), hoặc chia theo màn hình.
- **Dễ onboarding**: nhìn thư mục (`presentation`, `domain`, `data`) và hậu tố file (`_page`, `_view_model`, `_state`, `_repository`) là biết vai trò.

### 6. Nhược điểm

- **Ranh giới giữa các lớp không bị ép buộc**: View vẫn có thể gọi thẳng Repository/Service hoặc ViewModel vẫn có thể dùng `BuildContext`, khiến kiến trúc bị rò rỉ dần nếu không kiểm soát khi review.

## 8. Unit test

**Cách viết unit test**: Unit test là bước cần làm để nghiệp vụ chạy đúng và hạn chế bug. Viết unit test cho logic nghiệp vụ, chuyển trạng thái, xử lý lỗi và mapping dữ liệu; đưa `flutter test` vào CI để bắt lỗi trước khi merge. UI đơn giản hoặc code chỉ nối framework thì bổ sung bằng widget/integration test.

### Ví dụ: kiểm tra state khởi đầu

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:myapp/presentation/home/view_models/home_view_model.dart';

void main() {
  test('starts with loading state and no products', () {
    final container = ProviderContainer.test();

    final state = container.read(homeViewModelProvider);

    expect(state.isLoading, isTrue);
    expect(state.products, isEmpty);
  });
}
```

### Ví dụ: override dependency bằng fake

```dart
class FakeProductRepository implements ProductRepository {
  @override
  Future<List<Product>> fetch() async => [Product(id: 1, name: 'A')];
}

void main() {
  test('load() puts products into state', () async {
    final container = ProviderContainer.test(
      overrides: [
        productRepositoryProvider.overrideWithValue(FakeProductRepository()),
      ],
    );

    await container.read(homeViewModelProvider.notifier).load();

    final state = container.read(homeViewModelProvider);
    expect(state.products, hasLength(1));
    expect(state.isLoading, isFalse);
  });
}
```

### Nguyên tắc

- Khai báo dependency thành provider → override bằng fake trong test → gọi action qua `.notifier` → assert state cuối và lỗi.
- `ProviderContainer.test()` tự dispose container sau test.
- **Không gọi API thật** trong unit test.

| Ưu điểm | Nhược điểm |
| --- | --- |
| Nhanh, ít phụ thuộc thiết bị/network | Cần viết fake/fixture, bảo trì khi nghiệp vụ đổi |
| Dễ tái hiện lỗi, refactor an toàn hơn | Không thay thế widget/integration test |
| Là tài liệu sống mô tả hành vi mong đợi của logic | Không chứng minh native plugin hoạt động đúng |

### Quy ước đặt file test

Source base yêu cầu viết unit test cho **ViewModel** và **Repository**. File test nằm trong thư mục `test/` ở gốc project (ngang hàng `lib/`), cấu trúc bên trong phản chiếu `lib/`, tên file kết thúc bằng `_test.dart`:

```text
lib/presentation/auth/login/view_models/login_view_model.dart
test/presentation/auth/login/view_models/login_view_model_test.dart

lib/data/repositories/product_repository.dart
test/data/repositories/product_repository_test.dart
```

### Ví dụ: Unit test cho Login

Test `LoginViewModel` (Notifier): thay Repository bằng fake, gọi `login()` qua `.notifier`, rồi kiểm tra state và tác dụng phụ. Không gọi API thật, không cần dựng UI.

> Tên class, file và provider dưới đây là ví dụ, cần đổi cho khớp source thật. Điều kiện để test được: Repository phải là provider riêng, ViewModel không gọi trực tiếp `Dio`, `SharedPreferences` hay Service. Việc lưu token do `AuthRepository` đảm nhiệm nên được kiểm thử ở test của Repository, không nằm trong test của ViewModel.

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:myapp/presentation/auth/login/view_models/login_view_model.dart';

class FakeAuthRepository implements AuthRepository {
  FakeAuthRepository({this.error});
  final AuthException? error;
  int callCount = 0;

  @override
  Future<User> login(String email, String password) async {
    callCount++;
    if (error != null) throw error!;
    return const User(id: 1, token: 'token-123');
  }
}

void main() {
  ProviderContainer makeContainer(FakeAuthRepository repo) {
    final container = ProviderContainer.test(
      overrides: [
        authRepositoryProvider.overrideWithValue(repo),
      ],
    );
    // Giữ provider sống suốt test (provider autoDispose)
    container.listen(loginViewModelProvider, (_, __) {});
    return container;
  }

  test('input rỗng -> báo lỗi và KHÔNG gọi repository', () async {
    final repo = FakeAuthRepository();
    final container = makeContainer(repo);

    await container.read(loginViewModelProvider.notifier).login('', '');

    expect(container.read(loginViewModelProvider).errorMessage, 'invalid_input');
    expect(repo.callCount, 0);
  });

  test('đăng nhập thành công -> isSuccess', () async {
    final repo = FakeAuthRepository();
    final container = makeContainer(repo);

    await container
        .read(loginViewModelProvider.notifier)
        .login('a@mail.com', '123456');

    final state = container.read(loginViewModelProvider);
    expect(state.isSuccess, isTrue);
    expect(state.isLoading, isFalse);
    expect(repo.callCount, 1);
  });

  test('đăng nhập thất bại -> có errorMessage, isSuccess = false', () async {
    final repo = FakeAuthRepository(error: const AuthException('wrong_password'));
    final container = makeContainer(repo);

    await container
        .read(loginViewModelProvider.notifier)
        .login('a@mail.com', 'sai');

    final state = container.read(loginViewModelProvider);
    expect(state.isSuccess, isFalse);
    expect(state.errorMessage, 'wrong_password');
  });
}
```

### Ví dụ: Unit test cho Repository

Test Repository bằng cách thay Service (API client, storage) bằng fake, kiểm tra mapping DTO sang model và việc đổi lỗi kỹ thuật thành lỗi nghiệp vụ. Không cần `ProviderContainer` vì Repository là class thuần.

```dart
import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/data/repositories/product_repository.dart';

class FakeProductApi implements ProductApi {
  FakeProductApi({this.error});
  final DioException? error;

  @override
  Future<List<ProductDto>> getProducts() async {
    if (error != null) throw error!;
    return [const ProductDto(id: 1, title: 'A')];
  }
}

void main() {
  test('fetch() map DTO sang model', () async {
    final repo = ProductRepository(FakeProductApi());

    final products = await repo.fetch();

    expect(products.single, const Product(id: 1, name: 'A'));
  });

  test('fetch() đổi DioException thành AppException', () async {
    final repo = ProductRepository(FakeProductApi(
      error: DioException(requestOptions: RequestOptions(path: '/products')),
    ));

    expect(repo.fetch(), throwsA(isA<AppException>()));
  });
}
```

### Các case nên có cho Login

| Case | Kiểm tra |
| --- | --- |
| State ban đầu | Chưa loading, chưa lỗi |
| Validate input (rỗng, sai định dạng email) | Có lỗi, repository không bị gọi |
| Thành công | `isSuccess = true`, Repository được gọi 1 lần (token do Repository lưu, kiểm thử ở test của Repository) |
| Sai mật khẩu / lỗi nghiệp vụ | Có `errorMessage`, không lưu token |
| Lỗi mạng / timeout | Có lỗi phù hợp, `isLoading` trở về `false` |
| Chuỗi state | Có `loading` trước, kết quả sau |

### Lưu ý khi viết test

- **Giữ provider sống:** provider sinh ra thường là autoDispose, cần `container.listen(...)` để state không bị reset giữa các lần `read`.
- **Fake hay mock:** fake tự viết dễ đọc và ít giòn hơn; nếu cần `verify` số lần gọi hoặc tham số thì dùng `mocktail`.
- **Phạm vi:** chỉ test ViewModel. Nút bấm, điều hướng sau khi login thuộc về widget/integration test.
- **Chạy test:** `flutter test test/presentation/auth/login/view_models/login_view_model_test.dart`