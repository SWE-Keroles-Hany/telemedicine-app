import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          foregroundColor: ColorManger.white,
          centerTitle: true,
          title: Text(
            "Check Yourself",
            style: textTheme.titleLarge!.copyWith(color: ColorManger.white),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.r),
          child: ListView(
            children: [
              //! Search
              SearchTextForm(
                searchHint: "Search For Symptoms",
                controller: searchController,
                onSearch: (value) {},
              ),
              SizedBox(height: 20.h),
              //! Symptoms & Number  Selected Symptoms
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomAppLabel(label: "Select Symptoms"),
                  Text(
                    "4 Selected",
                    style: textTheme.titleMedium!.copyWith(
                      color: ColorManger.aquaMint,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.h),
              //! Symptom List
              Symptoms(),
              SizedBox(height: 15.h),
              //! Describe Label...
              CustomAppLabel(label: "Describe How You Feel"),
              SizedBox(height: 10.h),
              //! describtion
              CustomInputField(
                maxLines: 5,
                title: "Type More Details about your symptoms",
                controller: describeController,
                validator: (value) => AppValidations.descibeValidator(value),
              ),
              SizedBox(height: 20.h),
              //! Analyze Button
              CustomButton(
                onPressed: () {},
                title: "Analyze Symptoms",
                titleColor: ColorManger.black,
                bgColor: ColorManger.aquaMint,
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
