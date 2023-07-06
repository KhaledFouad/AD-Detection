// ignore_for_file: avoid_print

import 'package:bio2/RegisterScreen.dart';
import 'package:bio2/custom%20widgets/customText.dart';
import 'package:bio2/custom%20widgets/textFormFeild.dart';
import 'package:bio2/home.dart';
import 'package:bio2/paints/AppColor.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'custom widgets/default_button.dart';
import 'custom widgets/default_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController =
      TextEditingController(text: "TunA1234@gmail.com");
  TextEditingController passwordController =
      TextEditingController(text: "TunA12345");
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  // void _loadUserEmailPassword() async {
  //   print("Load Email");
  //   try {
  //     SharedPreferences _prefs = await SharedPreferences.getInstance();
  //     var _email = _prefs.getString("email") ?? "";
  //     var _password = _prefs.getString("password") ?? "";
  //     var _remeberMe = _prefs.getBool("remember_me") ?? false;

  //     print(_remeberMe);
  //     print(_email);
  //     print(_password);
  //     if (_remeberMe) {
  //       setState(() {
  //         // _isChecked = true;
  //       });
  //       emailController.text = _email;
  //       passwordController.text = _password;
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // void userLogin(String email, String password) {
  //   DioHelper.postData(
  //       endPoint: EndPoints.loginURL,
  //       data: {"email": email, "password": password}).then((value) {
  //     loginModel = LoginModel.fromJson(value.data);
  //     EndPoints.userToken = loginModel!.token!;
  //     print("${EndPoints.userToken} success");
  //   });
  // }

  // void _handleRemeberme(bool value) {
  //   _isChecked = value;
  //   SharedPreferences.getInstance().then(
  //     (prefs) {
  //       prefs.setBool("remember_me", value);
  //       prefs.setString('Username', userNameController.text);
  //       prefs.setString('Password', passwordController.text);
  //     },
  //   );
  //   setState(() {
  //     _isChecked = value;
  //   });
  // }
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   _loadUserEmailPassword();

  //   emailController.addListener(() {
  //     setState(() {
  //       valid1 = emailController.text.isNotEmpty;
  //     });
  //   });

  //   passwordController.addListener(() {
  //     if (passwordController.text.length >= 8) {
  //       setState(() {
  //         valid2 = passwordController.text.isNotEmpty;
  //       });
  //     } else {
  //       setState(() {
  //         valid2 = false;
  //       });
  //     }
  //   });
  // }

  // @override
  // void dispose() {
  //   // Clean up the controller when the widget is disposed.
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            const CustomText("Login",
                fontSize: 28, fontweight: FontWeight.w500),
            SizedBox(height: 0.8.h),
            SizedBox(height: 4.4.h),
            Form(
              key: formkey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DefaultFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      hintText: "Email",
                      prefixIcon: Icon(
                        Icons.person_outline_rounded,
                        size: 30,
                        color: AppColor.thirdFont,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter your email";
                        }
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    DefaultFormField(
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.next,
                      maxLines: 1,
                      obscureText: true,
                      //  visible == false ? true : false,
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
                          // loginCubit.visible == true
                          //     ? Icons.visibility_off
                          //     :  Icons.visibility
                          Icons.visibility,
                          size: 30,
                          color: AppColor.thirdFont,
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty ||
                            passwordController.text.length >= 8) {
                          // setState(() {});
                          return "please enter valid password";
                        }
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.0015,
                    ),
                    Row(
                      children: [
                        Checkbox(
                          activeColor: AppColor.primaryColor,
                          value: false,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          onChanged: (value) {
                            // loginCubit.changeCheck(value);
                            // loginCubit.isChecked = value!;
                            // SharedPreferences.getInstance().then(
                            //   (prefs) {
                            //     prefs.setBool("remember_me", value);
                            //     prefs.setString(
                            //         'Username', emailController.text);
                            //     prefs.setString(
                            //         'Password', passwordController.text);
                            //   },
                            // );
                            // setState(() {
                            //   loginCubit.isChecked = value;
                            // });
                          },
                          //_handleRemeberme,
                        ),
                        CustomText("Remember me",
                            fontSize: 14, textColor: AppColor.balck2),
                        Spacer(),
                        InkWell(
                          onTap: () {},
                          child: CustomText(
                            "Forgot Password?",
                            fontSize: 14,
                            textColor: AppColor.primaryColor,
                            fontweight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 19.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DefaultText(
                  text: "Dont’t have an account?",
                  fontSize: 14,
                  color: AppColor.thirdFont,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(width: 0.6.w),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegisterScreen()
                          // detectionScreen()
                          // HomeScreen()
                          ),
                    );
                  },
                  child: DefaultText(
                    text: "Register",
                    fontSize: 14,
                    color: AppColor.primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(height: 2.h),
            DefaultMaterialButton(
                onPressed: () {
                  // if (formkey.currentState!.validate()
                  //     //  && loginCubit.valid1 == true &&
                  //     //     loginCubit.valid2 == true
                  //     ) {
                  //   loginCubit.userLogin(
                  //     email: emailController.text,
                  //     password: passwordController.text,
                  //   );
                  //   Navigator.pushNamed(
                  //       context, AppRoutes.navigationPageRoute);
                  // } else {
                  //   Navigator.pushNamed(
                  //       context, AppRoutes.registerPageRoute);
                  // }
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Homepage()
                        // detectionScreen()
                        // HomeScreen()
                        ),
                  );
                },
                text: "Login",
                // textColor: loginCubit.valid1 & loginCubit.valid2 == false
                //     ? AppColor.secFont
                //     : AppColor.white,
                textColor: AppColor.white,
                fontSize: 16,
                radius: 1000,
                background: AppColor.primaryColor
                //  loginCubit.valid1 & loginCubit.valid2 == false
                //     ? AppColor.buttonColor
                //     : AppColor.primaryColor,
                ),
            SizedBox(height: 2.h),
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
                SizedBox(width: 2.5.w),
                DefaultText(
                  text: "Or Sign up With Account",
                  fontSize: 14,
                  color: AppColor.secFont,
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(width: 2.5.w),
                Expanded(
                  child: Divider(
                    color: AppColor.buttonColor,
                    thickness: 1,
                    indent: 5,
                  ),
                ),
              ],
            ),
            SizedBox(height: 3.2.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Image.asset(
                    "assets/Button1.png",
                    width: 40.w,
                  ),
                ),
                SizedBox(width: 1.8.w),
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
