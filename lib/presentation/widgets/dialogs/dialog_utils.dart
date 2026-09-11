import 'package:awesome_extensions/awesome_extensions_flutter.dart';
import 'package:flutter/material.dart';
import 'package:myapp/app/core/extensions/size_ext.dart';
import 'package:myapp/app/core/extensions/string_ext.dart';
import 'package:myapp/app/core/resources/res_colors.dart';
import 'package:myapp/app/core/resources/res_text_styles.dart';
import 'package:myapp/presentation/widgets/buttons/second_button.dart';
import 'package:myapp/presentation/widgets/buttons/outline_button_custom.dart';
import 'package:myapp/i18n/strings.g.dart';

abstract class DialogUtil {
  static Future<void> showAlertDialogUlti(
    BuildContext context, {
    required String title,
    Function? onAction,
    String? message,
  }) async {
    await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (dialogContext) {
        return AlertDialog(
          backgroundColor: ResColors().white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          contentPadding: const EdgeInsets.all(16),
          actionsAlignment: MainAxisAlignment.center,
          actionsPadding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
          titlePadding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
          buttonPadding: EdgeInsets.zero,
          insetPadding: const EdgeInsets.symmetric(horizontal: 20),

          content: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.info_outline_rounded, size: 60),
                VerticalSize.h24.heightBox,
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: ResTextStyles().s16w500.copyWith(
                    color: ResColors().gray900,
                  ),
                ),
                Visibility(
                  visible: message.toContent.isNotEmpty,
                  child: Text(
                    message.toContent,
                    textAlign: TextAlign.center,
                    style: ResTextStyles().s14w500.copyWith(
                      color: ResColors().gray500,
                    ),
                  ),
                ).paddingOnly(top: 4),
                VerticalSize.h40.heightBox,
                SecondButton(
                  height: 50,
                  onPressed: () {
                    Navigator.of(dialogContext).pop();
                    if (onAction != null) {
                      onAction();
                    }
                  },
                  child: Text(
                    context.t.common.ok,
                    style: ResTextStyles().s16w500.copyWith(
                      color: ResColors().white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static Future<void> showConfirmDialogUltis(
    BuildContext context, {
    required String labelLeft,
    required String labelRight,
    Function? onActionLeft,
    Function? onActionRight,
    bool? isButtonRed,
    required String title,
    String? message,
  }) async {
    await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (dialogContext) {
        return AlertDialog(
          backgroundColor: ResColors().white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          contentPadding: const EdgeInsets.all(16),
          actionsAlignment: MainAxisAlignment.center,
          actionsPadding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
          titlePadding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
          buttonPadding: EdgeInsets.zero,
          insetPadding: const EdgeInsets.symmetric(horizontal: 16),
          content: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: ResTextStyles().s16w500.copyWith(
                    color: ResColors().gray900,
                  ),
                ),
                Visibility(
                  visible: message.toContent.isNotEmpty,
                  child: Text(
                    message.toContent,
                    textAlign: TextAlign.center,
                    style: ResTextStyles().s14w500.copyWith(
                      color: ResColors().gray800,
                    ),
                  ),
                ).paddingOnly(top: 4),
                VerticalSize.h24.heightBox,
                Row(
                  children: [
                    OutlineButtonCustom(
                      height: 50,
                      onPressed: () {
                        Navigator.of(dialogContext).pop();
                        if (onActionLeft != null) {
                          onActionLeft();
                        }
                      },
                      child: Text(
                        labelLeft,
                        style: ResTextStyles().s16w500.copyWith(
                          color: ResColors().gray900,
                        ),
                      ),
                    ).expanded(),
                    HorizontalSize.w16.widthBox,
                    SecondButton(
                      color: isButtonRed == true
                          ? ResColors().red500
                          : ResColors().blue500,
                      height: 50,
                      onPressed: () {
                        Navigator.of(dialogContext).pop();
                        if (onActionRight != null) {
                          onActionRight();
                        }
                      },
                      child: Text(
                        labelRight,
                        style: ResTextStyles().s16w500.copyWith(
                          color: ResColors().white,
                        ),
                      ),
                    ).expanded(),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
