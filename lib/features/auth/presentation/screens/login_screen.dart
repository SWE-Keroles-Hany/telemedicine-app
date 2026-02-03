import 'package:flutter/material.dart';
import 'package:telemedicine/core/helper/validations/app_validations.dart';
import 'package:telemedicine/core/theme/app_theme.dart';
import 'package:telemedicine/features/auth/presentation/screens/signup_screen.dart';
import 'package:telemedicine/features/auth/presentation/widgets/custom_button.dart';
import 'package:telemedicine/features/auth/presentation/widgets/custom_input_field.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "LoginScreen";
  LoginScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final height = MediaQuery.of(context).size.height;
    final globalKey = GlobalKey<FormState>();

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppTheme.backGroundColor,
        body: Padding(
          padding: const EdgeInsets.all(18),
          child: SingleChildScrollView(
            child: Form(
              key: globalKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: height * 0.1),
                  Image.asset(
                    height: 120,
                    width: 100,
                    "assets/icons/telemedicine.png",
                  ),
                  SizedBox(height: 20),
                  Text(
                    textAlign: TextAlign.center,
                    "Welcome Back!",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 27,
                    ),
                  ),
                  SizedBox(height: 20),

                  //! ==
                  Text(
                    textAlign: TextAlign.center,
                    "Login To Your Account to Continue",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 20),

                  CustomInputField(
                    title: "Enter Your E-mail",
                    controller: emailController,
                    validator: (name) => AppValidations.nameValidator(name),
                  ),
                  SizedBox(height: 20),
                  CustomInputField(
                    title: "Enter Your Password",
                    controller: passwordController,
                    validator: (password) =>
                        AppValidations.nameValidator(password),
                  ),
                  SizedBox(height: 20),
                  CustomButton(
                    onPressed: () {
                      if (globalKey.currentState!.validate()) {}
                    },
                    title: "Login",
                    titleColor: Colors.black,
                    bgColor: Colors.green,
                    width: double.infinity,
                  ),
                  Row(
                    children: [
                      Text(
                        "Don't Have an Account ?",
                        style: textTheme.titleLarge!.copyWith(
                          fontSize: 22,

                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(
                            context,
                          ).pushReplacementNamed(SignUpScreen.routeName);
                        },
                        child: Text("SignUp", style: textTheme.titleLarge),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
