import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/app/core/extensions/size_ext.dart';
import 'package:myapp/app/core/extensions/string_ext.dart';
import 'package:myapp/app/core/extensions/time_ext.dart';
import 'package:myapp/app/core/resources/res_colors.dart';
import 'package:myapp/app/core/resources/res_text_styles.dart';
import 'package:myapp/i18n/strings.g.dart';
import 'package:myapp/ui/widgets/input/label_text_field.dart';

class AppDatePickerField extends StatelessWidget {
  final String label;
  final DateTime? selectedDate;
  final ValueChanged<DateTime?> onDateSelected;
  final String? hintText;
  final bool isRequired;

  const AppDatePickerField({
    super.key,
    required this.label,
    this.selectedDate,
    required this.onDateSelected,
    this.hintText,
    this.isRequired = false,
  });

  @override
  Widget build(BuildContext context) {
    final displayDate = selectedDate != null
        ? selectedDate!.localizedFullDate
        : hintText.toContent;

    return LabelTextField(
      label: label,
      isRequired: isRequired,
      child: InkWell(
        onTap: () async {
          final DateTime? picked = await showDatePicker(
            context: context,
            initialDate: selectedDate ?? DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime.now(),
            confirmText: t.common.ok,
            cancelText: t.common.cancel,
            builder: (context, child) {
              return Theme(
                data: Theme.of(context).copyWith(
                  colorScheme: ColorScheme.light(
                    primary: ResColors().yellow500,
                    onPrimary: ResColors().white,
                    onSurface: ResColors().textPrimary,
                  ),
                  textButtonTheme: TextButtonThemeData(
                    style: TextButton.styleFrom(
                      foregroundColor: ResColors().yellow500,
                    ),
                  ),
                ),
                child: child!,
              );
            },
          );
          if (picked != null) {
            onDateSelected(picked);
          }
        },
        child: Container(
          height: VerticalSize.h48,
          padding: EdgeInsets.symmetric(horizontal: HorizontalSize.w14),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: ResColors().white,
            borderRadius: BorderRadius.circular(SizeExt.s8.r),
            border: Border.all(color: ResColors().neutral200, width: 1),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                displayDate,
                style: selectedDate != null
                    ? ResTextStyles().s16w400.copyWith(
                        color: ResColors().textPrimary,
                      )
                    : ResTextStyles().s16w400.copyWith(
                        color: ResColors().textLow,
                      ),
              ),
              Row(
                spacing: HorizontalSize.w12,
                children: [
                  if (selectedDate != null)
                    InkWell(
                      onTap: () {
                        onDateSelected(null);
                      },
                      child: Icon(
                        Icons.close,
                        color: ResColors().textLow,
                        size: SizeExt.s20,
                      ),
                    ),
                  Icon(
                    Icons.calendar_today_outlined,
                    color: ResColors().textLow,
                    size: SizeExt.s20,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
