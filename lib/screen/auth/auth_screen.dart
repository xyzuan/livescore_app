import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:livescore/constant/colors.dart';
import 'package:livescore/constant/fonts.dart';
import 'package:livescore/screen/auth/auth_controller.dart';
import 'package:livescore/widgets/text_fields.dart';

bool rememberMe = false;

class AuthPage extends GetView<AuthController> {
  AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: CustomColor.mainBackground,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset("assets/images/illustrations/auth_ill.png"),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 77, 90, 18),
              child: Column(
                children: [
                  Text(
                    'Discover all about sport',
                    style: TextStyle(
                      fontFamily: AppFonts().primaryFont,
                      fontSize: 40,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Text(
                    "Search millions of jobs and get the inside scoop on companies Wait for what? Lets get start it!",
                    style: TextStyle(
                        fontFamily: AppFonts().primaryFont,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF65656B)),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 45,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
              child: Row(
                children: [
                  SizedBox(
                    width: 199,
                    height: 63,
                    child: ElevatedButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          backgroundColor: const Color(0xFF222232),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(42.0)),
                          ),
                          builder: (context) {
                            return SingleChildScrollView(
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(24, 18, 24, 24),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 18, 0, 8),
                                        child: Text(
                                          'Sign in',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: AppFonts().primaryFont,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 28,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 18, 0, 0),
                                        child: AppTextField(
                                            controller:
                                                controller.emailController,
                                            text: 'Email',
                                            icon: IconlyLight.message,
                                            color: Color(0xFF181829)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 18, 0, 0),
                                        child: AppTextField(
                                            controller:
                                                controller.passwordController,
                                            text: 'Password',
                                            icon: IconlyLight.password,
                                            color: Color(0xFF181829)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 18, 18, 18),
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: Text('Forgot Password',
                                              style: TextStyle(
                                                  fontFamily:
                                                      AppFonts().primaryFont,
                                                  color: Colors.white)),
                                        ),
                                      ),
                                      ElevatedButton.icon(
                                        icon: const Icon(Icons.facebook),
                                        label: const Text(""),
                                        onPressed: () {
                                          controller.signInWithFacebook();
                                        },
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(32.0),
                                          ),
                                        ),
                                      ),
                                      ElevatedButton.icon(
                                        icon: Image.network(
                                          'https://upload.wikimedia.org/wikipedia/commons/5/57/X_logo_2023_%28white%29.png', // Ganti dengan URL gambar Twitter Anda
                                          height:
                                              24.0, // Sesuaikan ukuran gambar
                                          width: 24.0,
                                          color: Colors
                                              .white, // Sesuaikan warna gambar
                                        ),
                                        label:
                                            const Text(""),
                                        onPressed: () {
                                          controller.signInWithTwitter();
                                        },
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors
                                              .blue, // Sesuaikan warna tombol
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(32.0),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            8, 18, 8, 0),
                                        child: SizedBox(
                                          width: double.infinity,
                                          child: ElevatedButton(
                                            onPressed:
                                                controller.isLoading.value
                                                    ? null
                                                    : () {
                                                        controller.loginUser(
                                                          controller
                                                              .emailController
                                                              .text,
                                                          controller
                                                              .passwordController
                                                              .text,
                                                        );
                                                      },
                                            style: ElevatedButton.styleFrom(
                                              padding: const EdgeInsets.all(20),
                                              backgroundColor:
                                                  const Color(0xFF246BFD),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                              ),
                                            ),
                                            child: controller.isLoading.value
                                                ? CircularProgressIndicator()
                                                : Text(
                                                    'Sign in',
                                                    style: TextStyle(
                                                      fontFamily: AppFonts()
                                                          .primaryFont,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                          ),
                                        ),
                                      )
                                    ]),
                              ),
                            );
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        backgroundColor: const Color(0xFF246BFD),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Text(
                        'Sign in',
                        style: TextStyle(
                          fontFamily: AppFonts().primaryFont,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(39, 0, 0, 0),
                    child: GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          backgroundColor: const Color(0xFF222232),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(42.0)),
                          ),
                          builder: (context) {
                            return SingleChildScrollView(
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(24, 18, 24, 24),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 18, 0, 8),
                                        child: Text(
                                          'Sign up',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: AppFonts().primaryFont,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 28,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 18, 0, 0),
                                        child: AppTextField(
                                            controller:
                                                controller.emailController,
                                            text: 'Email',
                                            icon: IconlyLight.message,
                                            color: Color(0xFF181829)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 18, 0, 0),
                                        child: AppTextField(
                                            controller:
                                                controller.passwordController,
                                            text: 'Password',
                                            icon: IconlyLight.password,
                                            color: Color(0xFF181829)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            8, 18, 8, 0),
                                        child: SizedBox(
                                          width: double.infinity,
                                          child: ElevatedButton(
                                            onPressed:
                                                controller.isLoading.value
                                                    ? null
                                                    : () {
                                                        controller.registerUser(
                                                          controller
                                                              .emailController
                                                              .text,
                                                          controller
                                                              .passwordController
                                                              .text,
                                                        );
                                                      },
                                            style: ElevatedButton.styleFrom(
                                              padding: const EdgeInsets.all(20),
                                              backgroundColor:
                                                  const Color(0xFF246BFD),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                              ),
                                            ),
                                            child: controller.isLoading.value
                                                ? CircularProgressIndicator()
                                                : Text(
                                                    'Sign up',
                                                    style: TextStyle(
                                                      fontFamily: AppFonts()
                                                          .primaryFont,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                          ),
                                        ),
                                      )
                                    ]),
                              ),
                            );
                          },
                        );
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Color(0xFFC4C4C4),
                          fontSize: 18,
                          fontFamily: 'Source Sans Pro',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        )
      ]),
    );
  }
}
