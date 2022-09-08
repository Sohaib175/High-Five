import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:high_five/AuthModule/View/Components/auth_input_field.dart';
import 'package:high_five/AuthModule/View/Components/loginbg.dart';
import 'package:high_five/AuthModule/ViewModel/auth_vm.dart';
import 'package:high_five/InboxModule/View/inbox_view.dart';
import 'package:high_five/Responsive/responsive.dart';
import 'package:high_five/utill/Constants/const_color.dart';

class LoginView extends StatelessWidget {
  LoginView({
    Key? key,
  }) : super(key: key);
  final AuthVM authVM = Get.put(AuthVM());
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: height,
          width: width,
          child: Obx(
            () => Stack(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: SizedBox(
                    height: 306.h,
                    width: 339.w,
                    child: CustomPaint(
                      painter: LoginBGTop(),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: SizedBox(
                    height: 230.h,
                    width: 236.w,
                    child: CustomPaint(
                      painter: LoginBGBottom(),
                    ),
                  ),
                ),

                ///--------------Google 3---------------///
                Positioned(
                  top: 80.h + 350.h + 50.h,
                  left: 1.w,
                  right: 1.w,
                  child: _buildGoogleSignUp(),
                ),

                // ///---------------Move To SignIn Btn 4----------------///
                Positioned(
                  top: 80.h,
                  left: 1.w,
                  right: 1.w,
                  child: Align(
                    child: authVM.isCreateNew.value
                        ? Container(
                            height: 50.h,
                            width: 390.w,
                            margin: const EdgeInsets.symmetric(horizontal: 120),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(10),
                              ),
                              color: ConstColors.primaryColor,
                              boxShadow: [
                                BoxShadow(
                                  color: ConstColors.onPrimaryColor
                                      .withOpacity(0.5),
                                  blurRadius: 5,
                                  spreadRadius: 1.5,
                                )
                              ],
                            ),
                            alignment: Alignment.bottomCenter,
                            padding: const EdgeInsets.only(bottom: 20),
                            child: TextButton(
                              onPressed: () {
                                authVM.isCreateNew.value = false;
                              },
                              child: Text(
                                "Sign In",
                                style: TextStyle(
                                  color: ConstColors.onPrimaryColor,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          )
                        : null,
                  ),
                ),

                ///---------------Create New Btn 2----------------///
                Positioned(
                  top: 80.h + 350.h,
                  left: 1.w,
                  right: 1.w,
                  child: Align(
                    child: !authVM.isCreateNew.value
                        ? Container(
                            height: 50.h,
                            width: 290.w,
                            margin: const EdgeInsets.symmetric(horizontal: 80),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.vertical(
                                bottom: Radius.circular(10),
                              ),
                              color: ConstColors.primaryColor,
                              boxShadow: [
                                BoxShadow(
                                  color: ConstColors.onPrimaryColor
                                      .withOpacity(0.5),
                                  blurRadius: 5,
                                  spreadRadius: 1.5,
                                )
                              ],
                            ),
                            alignment: Alignment.bottomCenter,
                            padding: const EdgeInsets.only(bottom: 20),
                            child: TextButton(
                              onPressed: () {
                                authVM.isCreateNew.value = true;
                              },
                              child: Text(
                                "Create Account",
                                style: TextStyle(
                                  color: ConstColors.onPrimaryColor,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          )
                        : null,
                  ),
                ),

                ///---------------Create Account Form 5----------------///
                Positioned(
                  top: 80.h + 50.h,
                  left: 1.w,
                  right: 1.w,
                  child: Align(
                    child: authVM.isCreateNew.value
                        ? _buildSignUpForm(width)
                        : null,
                  ),
                ),

                // ///-----------SignIn 1--------------///
                Positioned(
                  top: 80.h,
                  left: 1.w,
                  right: 1.w,
                  child: Align(
                    child: !authVM.isCreateNew.value
                        ? _buildSignInForm(width)
                        : null,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSignUpForm(double width) {
    return Container(
      height: 350.h,
      width: 390.w,
      margin: const EdgeInsets.symmetric(horizontal: 40),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ConstColors.primaryColor,
        boxShadow: [
          BoxShadow(
            color: ConstColors.onPrimaryColor.withOpacity(0.5),
            // offset: const Offset(5, 5),
            blurRadius: 5,
            spreadRadius: 1.5,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'SIGN UP',
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          const ResponsiveSizedBox.vertical(35),
          InputField(
            height: 50.h,
            width: width,
            inputType: TextInputType.visiblePassword,
            // textEditingController: TextEditingController(),
            labelText: 'Name',
          ),
          const ResponsiveSizedBox.vertical(20),
          InputField(
            height: 50.h,
            width: width,
            inputType: TextInputType.visiblePassword,
            // textEditingController: TextEditingController(),
            labelText: 'Email',
          ),
          const ResponsiveSizedBox.vertical(20),
          InputField(
            height: 45.h,
            width: width,
            isPassword: true,
            inputType: TextInputType.visiblePassword,
            // textEditingController: TextEditingController(),
            labelText: 'Password',
          ),
          const ResponsiveSizedBox.vertical(10),
          Expanded(
            child: Center(
              child: TextButton(
                onPressed: () {
                  Get.offAll(
                    () => ChatView(),
                    transition: Transition.rightToLeft,
                    duration: const Duration(
                      milliseconds: 300,
                    ),
                  );
                },
                child: Text(
                  'SignUp',
                  style: TextStyle(
                    color: ConstColors.onPrimaryColor,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSignInForm(double width) {
    return Container(
      height: 350.h,
      width: 390.w,
      margin: const EdgeInsets.symmetric(horizontal: 40),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ConstColors.primaryColor,
        boxShadow: [
          BoxShadow(
            color: ConstColors.onPrimaryColor.withOpacity(0.5),
            blurRadius: 5,
            spreadRadius: 1.5,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'SIGN IN',
            style: TextStyle(
              color: ConstColors.onPrimaryColor,
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          const ResponsiveSizedBox.vertical(35),
          InputField(
            height: 50.h,
            width: width,
            inputType: TextInputType.visiblePassword,
            textColor: ConstColors.onPrimaryColor,
            labelText: 'Email',
          ),
          const ResponsiveSizedBox.vertical(30),
          InputField(
            height: 50.h,
            width: width,
            isPassword: true,
            inputType: TextInputType.visiblePassword,
            textColor: ConstColors.onPrimaryColor,
            labelText: 'Password',
          ),
          const ResponsiveSizedBox.vertical(10),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Forget Passsword?',
                  style: TextStyle(
                    color: ConstColors.onPrimaryColor,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          const ResponsiveSizedBox.vertical(10),
          Expanded(
            child: Center(
              child: TextButton(
                onPressed: () {
                  Get.offAll(
                    () => ChatView(),
                    transition: Transition.rightToLeft,
                    duration: const Duration(
                      milliseconds: 300,
                    ),
                  );
                },
                child: Text(
                  'Let\'s Start',
                  style: TextStyle(
                    color: ConstColors.onPrimaryColor,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildGoogleSignUp() {
    return Container(
      height: 50.h,
      width: 190.w,
      margin: const EdgeInsets.symmetric(horizontal: 120),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(10),
        ),
        color: ConstColors.primaryColor,
        boxShadow: [
          BoxShadow(
            color: ConstColors.onPrimaryColor.withOpacity(0.5),
            blurRadius: 5,
            spreadRadius: 1.5,
          )
        ],
      ),
      child: InkWell(
        onTap: () async {
          // authVM.signOutGoogle;
          // await authVM.signInWithGoogle();
          // User? user =
          await authVM.signInWithGoogle();

          Get.off(
            () => ChatView(),
            transition: Transition.rightToLeft,
            duration: const Duration(
              milliseconds: 300,
            ),
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/google.png',
              height: 20.h,
              width: 20.h,
            ),
            const ResponsiveSizedBox.horizontal(20),
            Text(
              "Google",
              style: TextStyle(
                color: ConstColors.onPrimaryColor,
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
