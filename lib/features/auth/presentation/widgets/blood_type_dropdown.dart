import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:telemedicine/core/theme/color_manger.dart';

const List<String> bloodTypes = [
  'A-',
  'A+',
  'B-',
  'B+',
  'AB-',
  'AB+',
  'O-',
  'O+',
];

class BloodTypeDropdown extends StatelessWidget {
  const BloodTypeDropdown({
    super.key,
    this.value,
    required this.onChanged,
    this.validator,
  });

  final String? value;
  final ValueChanged<String?> onChanged;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return FormField<String>(
      key: ValueKey(value),
      initialValue: value,
      validator: validator ??
          (v) {
            if (v == null || v.isEmpty) return "Please select your blood type";
            return null;
          },
      builder: (fieldState) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          
            DropdownMenu<String>(
              width: 250.w,
              initialSelection: fieldState.value,
              textStyle: textTheme.titleMedium!.copyWith(
                color: ColorManger.white,
              ),
              hintText: "Choose your blood type",
              inputDecorationTheme: InputDecorationTheme(
                filled: true,
                fillColor: ColorManger.darkTealGreen,
                border: border(Colors.grey),
                enabledBorder: border(Colors.grey),
                focusedBorder: border(ColorManger.aquaMint),
                hintStyle: textTheme.titleMedium!.copyWith(
                  color: ColorManger.mediumGray,
                ),
              ),
              menuStyle: MenuStyle(
                backgroundColor: WidgetStatePropertyAll(ColorManger.white)  ,
              ),
              trailingIcon: const Icon(
                Icons.arrow_drop_down,
                color: ColorManger.white,
              ),
              dropdownMenuEntries: bloodTypes
                  .map(
                    (type) => DropdownMenuEntry<String>(
                      value: type,
                      label: type,
                    ),
                  )
                  .toList(),
              onSelected: (selected) {
                fieldState.didChange(selected);
                onChanged(selected);
              },
            ),
            if (fieldState.hasError)
              Padding(
                padding: EdgeInsets.only(top: 4.h, left: 4.w),
                child: Text(
                  fieldState.errorText ?? "",
                  style: textTheme.labelMedium!.copyWith(
                    color: ColorManger.red,
                    fontSize: 14.sp,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }

  OutlineInputBorder border(Color color) {
    return OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide:  BorderSide(
                  color: color,
                  width: 1.5,
                ),
              );
  }
}
