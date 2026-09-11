import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/app/core/extensions/string_ext.dart';
import 'package:myapp/app/core/resources/res_colors.dart';
import 'package:myapp/app/core/resources/res_text_styles.dart';

mixin BasePageMixin {
  // ===== Config =====
  String? get title => null;
  String? get subTitle => null;

  bool get isShowAppbar => true;
  bool get isUseBack => true;

  List<Widget>? get actionsWidget => null;
  Widget? get flexibleSpaceWidget => null;

  bool get resizeToAvoidBottomInset => false;

  // ===== Required =====
  Widget buildBody(BuildContext context);

  // ===== Optional =====
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    if (!isShowAppbar) return null;

    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      backgroundColor: ResColors().primary_400,
      centerTitle: true,
      elevation: 0,
      title: title == null
          ? null
          : Column(
              children: [
                Text(
                  title!.toContent,
                  style: ResTextStyles().s20w500.copyWith(
                    color: ResColors().textPrimary,
                  ),
                ),
              ],
            ),
      leading: isUseBack && context.router.canPop()
          ? IconButton(
              icon: Icon(Icons.arrow_left_outlined),
              onPressed: () => context.router.maybePop(),
              splashColor: ResColors().orange_400,
            )
          : null,
      actions: actionsWidget,
      flexibleSpace: flexibleSpaceWidget,
    );
  }

  Widget buildPage(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: buildBody(context),
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
    );
  }
}
