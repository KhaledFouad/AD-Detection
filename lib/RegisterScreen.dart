// ignore_for_file: file_names

import 'package:bio2/LoginScreen.dart';
import 'package:bio2/home.dart';
import 'package:bio2/paints/AppColor.dart';
import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

import 'custom widgets/customText.dart';
import 'custom widgets/default_button.dart';
import 'custom widgets/default_text.dart';
import 'custom widgets/textFormFeild.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController userNameController =
      TextEditingController(text: "khaled");
  TextEditingController emailController =
      TextEditingController(text: "TunA1234@gmail.com");
  TextEditingController passwordController =
      TextEditingController(text: "TunA12345");
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   userNameController.addListener(() {
  //     setState(() {
  //       valid1 = userNameController.text.isNotEmpty;
  //     });
  //   });
  //   emailController.addListener(() {
  //     setState(() {
  //       valid2 = emailController.text.isNotEmpty;
  //     });
  //   });
  //   passwordController.addListener(() {
  //     if (passwordController.text.length >= 8) {
  //       setState(() {
  //         valid3 = passwordController.text.isNotEmpty;
  //       });
  //     } else {
  //       setState(() {
  //         valid3 = false;
  //       });
  //     }
  //   });
  // }

  // @override
  // void dispose() {
  //   // Clean up the controller when the widget is disposed.
  //   userNameController.dispose();
  //   emailController.dispose();
  //   passwordController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // toolbarHeight: 90,
        backgroundColor: Colors.white,
        elevation: 0,

        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()
                    // detectionScreen()
                    // HomeScreen()
                    ),
              );
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            const CustomText("Create Account",
                fontSize: 28, fontweight: FontWeight.w500),
            const SizedBox(height: 8),
            const SizedBox(height: 44),
            Form(
              key: formkey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DefaultFormField(
                      controller: userNameController,
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      hintText: "Username",
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter Your Username';
                        } else {}
                      },
                      prefixIcon: Icon(
                        Icons.person_outline_rounded,
                        size: 30,
                        color: AppColor.thirdFont,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    DefaultFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email';
                        } else if (!RegExp(
                                "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9+_.-]+.[com]")
                            .hasMatch(value)) {
                          return 'Please Enter Valid as example@gmail.com';
                        } else {}
                      },
                      hintText: "Email",
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        size: 30,
                        color: AppColor.thirdFont,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    DefaultFormField(
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                      maxLines: 1,
                      obscureText: true,
                      hintText: "Password",
                      prefixIcon: Icon(
                        Icons.lock_outline_rounded,
                        size: 30,
                        color: AppColor.thirdFont,
                      ),
                      // onChanged: (p0) {
                      //   setState(() {
                      //     valid3 = false;
                      //   });
                      // },
                      suffixIcon: InkWell(
                        onTap: () {},
                        child: Icon(
                          // registerCubit.visible == true
                          //     ? Icons.visibility_off
                          //     : Icons.visibility,
                          Icons.visibility,
                          size: 30,
                          color: AppColor.thirdFont,
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "please enter password";
                        } else if (passwordController.text.length <= 8) {
                          return "please enter a valid password";
                        } else {
                          // registerCubit.passwordDone();
                        }
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.015,
                    ),
                    CustomText(
                      "Password must be at least 8 characters",
                      fontSize: 14,
                      textColor: AppColor.thirdFont,
                      // registerCubit.valid3
                      //     ? AppColor.successColor
                      //     : AppColor.thirdFont,
                      fontweight: FontWeight.w400,
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 105),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DefaultText(
                  text: "Already have an account?",
                  fontSize: 14,
                  color: AppColor.thirdFont,
                  fontWeight: FontWeight.w500,
                ),
                const SizedBox(width: 6),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()
                          // detectionScreen()
                          // HomeScreen()
                          ),
                    );
                  },
                  child: DefaultText(
                    text: "login",
                    fontSize: 14,
                    color: AppColor.primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            DefaultMaterialButton(
              onPressed: () {
                // if (formkey.currentState!.validate() &&
                //     registerCubit.valid1 &
                //             registerCubit.valid2 &
                //             registerCubit.valid3 ==
                //         true) {
                //   registerCubit.userRegister(
                //       userName: userNameController.text,
                //       email: emailController.text,
                //       password: passwordController.text);
                //   Navigator.pushNamed(
                //       context, AppRoutes.navigationPageRoute);
                // }

                // if (formkey.currentState!.validate()) {
                //   // MyCache.putString(
                //   //     key: MyCacheKey.email, value: emailController.text);
                //   // MyCache.putString(
                //   //     key: MyCacheKey.password, value: passwordController.text);
                // }
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Homepage()
                      // detectionScreen()
                      // HomeScreen()
                      ),
                );
              },
              text: "Create account",
              textColor: AppColor.white,
              // registerCubit.valid1 &
              //             registerCubit.valid2 &
              //             registerCubit.valid3 ==
              //         false
              //     ? AppColor.secFont
              //     : AppColor.white,
              fontSize: 16,
              radius: 1000,
              background: AppColor.primaryColor,
              // registerCubit.valid1 &
              //             registerCubit.valid2 &
              //             registerCubit.valid3 ==
              //         false
              //     ? AppColor.buttonColor
              //     : AppColor.primaryColor,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Divider(
                    color: AppColor.buttonColor,
                    thickness: 1,
                    endIndent: 5,
                  ),
                ),
                const SizedBox(width: 25),
                DefaultText(
                  text: "Or Sign up With Account",
                  fontSize: 14,
                  color: AppColor.secFont,
                  fontWeight: FontWeight.w400,
                ),
                const SizedBox(width: 25),
                Expanded(
                  child: Divider(
                    color: AppColor.buttonColor,
                    thickness: 1,
                    indent: 5,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32.5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Image.asset(
                    "assets/Button1.png",
                    width: 40.w,
                  ),
                ),
                const SizedBox(width: 18),
                Expanded(
                  child: Image.asset(
                    "assets/Button.png",
                    width: 40.w,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
