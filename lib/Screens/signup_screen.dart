import 'package:firebase_auth/firebase_auth.dart';
import 'package:flight_booking/Screens/BottomBar/bottom_bar.dart';
import 'package:flight_booking/Screens/login_screen.dart';
import 'package:flight_booking/Services/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:page_transition/page_transition.dart';

import '../main.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final AuthService authService = AuthService();
  bool isSecurePassword = true;
  bool isSecureConfirmPassword = true;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void signUp() async {
    const Center(
      child: CircularProgressIndicator(),
    );
    String name = nameController.text;
    String email = emailController.text;
    String password = passwordController.text;
    String confirmPassword = confirmPasswordController.text;
    if (name.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      return;
    }
    if (password != confirmPassword) {
      return;
    }
    User? user = await authService.signUpWithEmail(context,name,  email, password, Color(0xff81194c));
    if (user != null) {
      Navigator.pushReplacement(
          context,
          PageTransition(
              child: const BottomBar(),
              type: PageTransitionType.rightToLeftPop,
              childCurrent: const SignUpScreen(

              )));
      Navigator.pop(context);
    }
  }

  googleSignIn() {
    signInWithGoogle().then((user) {
      Navigator.pushReplacement(
          context,
          PageTransition(
              child: const BottomBar(),
              type: PageTransitionType.rightToLeftPop,
              childCurrent: SignUpScreen(

              )));
    });
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
    await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: const Text(
                  "Welcome User",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: const Text(
                  "Enter details to create your account",
                  style: TextStyle(fontSize: 18, color: Colors.black54),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 3),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color(0xffcccbd0), width: 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextFormField(
                            controller: nameController,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              suffixIcon: Icon(
                                Icons.person_outlined,
                                size: 30,
                                color: Color(0xff81194c),
                              ),
                              hintText: "Name",
                              hintStyle: TextStyle(color: Color(0xffcccbd0)),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 3),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color(0xffcccbd0), width: 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextFormField(
                            controller: emailController,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              suffixIcon: Icon(
                                Icons.mail_outline,
                                size: 30,
                                color: Color(0xff81194c),
                              ),
                              hintText: "Email id",
                              hintStyle: TextStyle(color: Color(0xffcccbd0)),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.all(16),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 3),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color(0xffcccbd0), width: 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextFormField(
                            controller: passwordController,
                            obscureText: isSecurePassword,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              suffixIcon: togglePassword(),
                              hintText: "Password",
                              hintStyle:
                              const TextStyle(color: Color(0xffcccbd0)),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.only(left: 16, right: 16, top: 16),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 3),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color(0xffcccbd0), width: 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextFormField(
                            controller: confirmPasswordController,
                            obscureText: isSecureConfirmPassword,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              suffixIcon: toggleConfirmPassword(),
                              hintText: "Confirm Password",
                              hintStyle:
                              const TextStyle(color: Color(0xffcccbd0)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.all(16),
                child: InkWell(
                  onTap: signUp,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        gradient: const LinearGradient(
                            colors: [Color(0xff81194c), Color(0xffd92880)],
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft
                        )
                    ),
                    child: const Text("Sign Up", style: TextStyle(color: Colors.white, fontSize: 16),),
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Container(
                  alignment: Alignment.center,
                  child: const Text(
                    'OR',
                    style: TextStyle(fontSize: 16),
                  )),
              const SizedBox(
                height: 24,
              ),
              GestureDetector(
                onTap: googleSignIn,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Continue with Google',
                      style: TextStyle(color: Color(0xff81194c)),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Image.asset(
                      'images/google.png',
                      scale: 20,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 28,
              ),
              GestureDetector(
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> const LoginScreen()));
                },
                child: Container(
                  alignment: Alignment.center,
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(text: "Already have an account? ", style: TextStyle(color: Colors.grey[500], fontSize: 16)),
                      const TextSpan(
                          text: "Log in", style: TextStyle(color: Color(0xff81194c), fontSize: 16)),
                    ]),
                  ),
                ),
              ),
              SizedBox(height: mq.height*.03,)
            ],
          ),
        ),
      ),
    );
  }

  Widget togglePassword() {
    return IconButton(
        onPressed: () {
          setState(() {
            isSecurePassword = !isSecurePassword;
          });
        },
        icon: isSecurePassword
            ? const Icon(CupertinoIcons.eye,
            size: 30,
            color: Color(0xff81194c)
        )
            : const Icon(CupertinoIcons.eye_slash,
            size: 30,
            color: Color(0xff81194c)
        ));
  }
  Widget toggleConfirmPassword() {
    return IconButton(
        onPressed: () {
          setState(() {
            isSecureConfirmPassword = !isSecureConfirmPassword;
          });
        },
        icon: isSecureConfirmPassword
            ? const Icon(CupertinoIcons.eye,
            size: 30,
            color: Color(0xff81194c)
        )
            : const Icon(CupertinoIcons.eye_slash,
            size: 30,
            color: Color(0xff81194c)
        ));
  }
}
