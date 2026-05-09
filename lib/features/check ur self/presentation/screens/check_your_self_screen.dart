import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:telemedicine/core/helper/validations/app_validations.dart';
import 'package:telemedicine/core/theme/color_manger.dart';
import 'package:telemedicine/core/widgets/custom_app_label.dart';
import 'package:telemedicine/features/auth/presentation/widgets/custom_button.dart';
import 'package:telemedicine/features/auth/presentation/widgets/custom_input_field.dart';
import 'package:telemedicine/features/check%20ur%20self/presentation/widgets/search_text_form.dart';
import 'package:telemedicine/features/check%20ur%20self/presentation/widgets/symptoms.dart';

class CheckYourSelfScreen extends StatefulWidget {
  static const String routeName = "CheckYourSelfScreen";
  const CheckYourSelfScreen({super.key});

  @override
  State<CheckYourSelfScreen> createState() => _CheckYourSelfScreenState();
}

class _CheckYourSelfScreenState extends State<CheckYourSelfScreen> {
  TextEditingController searchController = TextEditingController();
  TextEditingController describeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: ColorManager.white,
          centerTitle: true,
          title: Text(
            'check_yourself.title'.tr(),
            style: textTheme.titleLarge!.copyWith(color: ColorManager.white),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.r),
          child: ListView(
            children: [
              //! Search
              SearchTextForm(
                searchHint: 'check_yourself.search_symptoms'.tr(),
                controller: searchController,
                onSearch: (value) {},
              ),
              SizedBox(height: 20.h),
              //! Symptoms & Number  Selected Symptoms
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomAppLabel(label: 'check_yourself.select_symptoms'.tr()),
                  Text(
                    '4 ${'check_yourself.selected_count'.tr()}',
                    style: textTheme.titleMedium!.copyWith(
                      color: ColorManager.aquaMint,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.h),
              //! Symptom List
              Symptoms(),
              SizedBox(height: 15.h),
              //! Describe Label...
              CustomAppLabel(
                label: 'check_yourself.describe_how_you_feel'.tr(),
              ),
              SizedBox(height: 10.h),
              //! describtion
              CustomInputField(
                maxLines: 5,
                title: 'check_yourself.type_details'.tr(),
                controller: describeController,
                validator: (value) => AppValidations.descibeValidator(value),
              ),
              SizedBox(height: 20.h),
              //! Analyze Button
              CustomButton(
                onPressed: () {},
                title: 'check_yourself.analyze_symptoms'.tr(),
                titleColor: ColorManager.black,
                bgColor: ColorManager.aquaMint,
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
