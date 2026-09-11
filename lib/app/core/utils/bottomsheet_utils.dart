import 'package:flutter/material.dart';
import 'package:myapp/app/core/resources/res_colors.dart';
import 'package:myapp/app/core/resources/res_text_styles.dart';
import 'package:myapp/app/widgets/buttons/app_button_outline.dart';

extension BottomSheetExtension on BuildContext {
  Future<T?> showBottomSheetApp<T>({
    required Widget child,
    bool isScrollControlled = true,
    bool useSafeArea = true,
    Color backgroundColor = Colors.transparent,
    double ratioHeight = 2,
    bool isDismissible = true,
    bool enableDrag = true,
  }) {
    return showModalBottomSheet<T>(
      context: this,
      isScrollControlled: isScrollControlled,
      useSafeArea: useSafeArea,
      backgroundColor: backgroundColor,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      barrierColor: Colors.black.withValues(alpha: 0.4),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (_) => PopScope(
        canPop: false,
        child: Container(
          width: MediaQuery.of(this).size.width,
          height: (MediaQuery.of(this).size.height / ratioHeight),
          decoration: BoxDecoration(
            color: ResColors().white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
          ),
          child: child,
        ),
      ),
    );
  }

  Future<void> showInputBottomSheet(
    BuildContext context, {
    required Widget child,
    String? labelLeft,
    String? labelRight,
    Function? onActionLeft,
    Function? onActionRight,
    bool? isUseButton = true,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true, // 🔥 bắt buộc
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black.withValues(alpha: 0.4),
      builder: (context) {
        return _InputBottomSheet(
          child: Column(
            children: [
              child,
              Visibility(
                visible: isUseButton ?? true,
                child: Column(
                  children: [
                    Divider(
                      thickness: 8,
                      color: ResColors().gray_100,
                      height: 0,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: AppButtonOutline(
                            borderColor: ResColors().white,
                            height: 50,
                            onPressed: () {
                              Navigator.pop(context);
                              onActionLeft?.call();
                            },
                            child: Text(
                              labelLeft ?? 'Cancel',
                              style: ResTextStyles().s18w500.copyWith(
                                color: ResColors().gray_900,
                              ),
                            ),
                          ),
                        ),

                        Container(
                          height: 50,
                          width: 1,
                          color: ResColors().gray_100,
                        ),

                        Expanded(
                          child: AppButtonOutline(
                            borderColor: ResColors().white,
                            height: 50,
                            onPressed: () {
                              onActionRight?.call();
                              Navigator.pop(context);
                            },
                            child: Text(
                              labelRight ?? 'OK',
                              style: ResTextStyles().s18w500.copyWith(
                                color: ResColors().orange_500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

extension BottomSheetExt on BuildContext {
  Future<T?> showBottomSheetAutoHeight<T>({
    required Widget child,
    bool isDismissible = true,
    bool enableDrag = true,
    bool useSafeArea = true,
    Color barrierColor = const Color(0x66000000),
    double maxHeightRatio = 0.9,
  }) {
    return showModalBottomSheet<T>(
      context: this,
      isScrollControlled: true,
      useSafeArea: useSafeArea,
      backgroundColor: Colors.transparent,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      barrierColor: barrierColor,
      builder: (_) =>
          _AutoHeightBottomSheet(maxHeightRatio: maxHeightRatio, child: child),
    );
  }
}

class _AutoHeightBottomSheet extends StatelessWidget {
  const _AutoHeightBottomSheet({
    required this.child,
    required this.maxHeightRatio,
  });

  final Widget child;
  final double maxHeightRatio;

  @override
  Widget build(BuildContext context) {
    final maxHeight = MediaQuery.of(context).size.height * maxHeightRatio;

    return Wrap(
      children: [
        Container(
          constraints: BoxConstraints(maxHeight: maxHeight),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: child,
          ),
        ),
      ],
    );
  }
}

class _InputBottomSheet extends StatelessWidget {
  const _InputBottomSheet({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        padding: const EdgeInsets.only(bottom: 24),
        child: SingleChildScrollView(child: child),
      ),
    );
  }
}
