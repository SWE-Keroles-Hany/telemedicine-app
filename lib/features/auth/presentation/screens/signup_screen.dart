import 'package:flutter/material.dart';
import 'package:telemedicine/core/helper/validations/app_validations.dart';
import 'package:telemedicine/features/auth/presentation/screens/login_screen.dart';
import 'package:telemedicine/features/auth/presentation/widgets/custom_button.dart';
import 'package:telemedicine/features/auth/presentation/widgets/custom_input_field.dart';

class SignUpScreen extends StatelessWidget {
  static const String routeName = "SignUpScreen";
  SignUpScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final globalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 246, 245, 245),
        body: Padding(
          padding: const EdgeInsets.all(18),
          child: SingleChildScrollView(
            child: Form(
              key: globalKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 30),

                  // SizedBox(height: height * 0.1),
                  Image.asset(
                    height: 120,
                    width: 100,
                    // fit: BoxFit.fitWidth,
                    "assets/icons/telemedicine.png",
                  ),

                  SizedBox(height: 30),
                  Text(
                    textAlign: TextAlign.center,
                    "Register",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 22,
                    ),
                  ),
                  SizedBox(height: 15),

                  CustomInputField(
                    title: "Enter Your Name",
                    controller: nameController,
                    validator: (name) => AppValidations.nameValidator(name),
                  ),
                  SizedBox(height: 15),

                  CustomInputField(
                    title: "Enter Your E-mail",
                    controller: emailController,
                    validator: (email) => AppValidations.emailValidator(email),
                  ),
                  SizedBox(height: 15),
                  CustomInputField(
                    title: "Enter Your Password",
                    controller: passwordController,
                    validator: (password) =>
                        AppValidations.passwordValidator(value: password),
                  ),
                  SizedBox(height: 15),
                  CustomInputField(
                    title: "Enter Your Address",
                    controller: addressController,
                    validator: (address) =>
                        AppValidations.addressValidator(address),
                  ),
                  SizedBox(height: 15),
                  CustomButton(
                    onPressed: () {
                      if (globalKey.currentState!.validate()) {}
                    },
                    title: "SignUp",
                    titleColor: Colors.black,
                    bgColor: Colors.green,
                    width: double.infinity,
                  ),

                  Row(
                    children: [
                      Text(
                        "Do Have an Account ?",
                        style: textTheme.titleLarge!.copyWith(
                          fontSize: 22,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(
                            context,
                          ).pushReplacementNamed(LoginScreen.routeName);
                        },
                        child: Text("Login", style: textTheme.titleLarge),
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
