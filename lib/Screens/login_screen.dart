import 'package:firebase_auth/firebase_auth.dart';
import 'package:flight_booking/Screens/BottomBar/bottom_bar.dart';
import 'package:flight_booking/Screens/signup_screen.dart';
import 'package:flight_booking/Services/auth_service.dart';
import 'package:flight_booking/Widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:page_transition/page_transition.dart';
import '../Constants/utils.dart';
import '../main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final AuthService authService = AuthService();
  final _formKey = GlobalKey<FormState>();
  late List<User> users = [];
  final _auth = FirebaseAuth.instance;
  bool isSecurePassword = true;
  bool isSigning = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void signIn() async {
    setState(() {
      isSigning = true;
    });
    String email = emailController.text;
    String password = passwordController.text;
    if (email.isEmpty || password.isEmpty) {
      return;
    }
    User? user = await authService.signInWithEmail(context, email, password, Color(0xff81194c));
    if (user != null) {
      Navigator.pushReplacement(
          context,
          PageTransition(
              child: BottomBar(),
              type: PageTransitionType.rightToLeftPop,
              childCurrent: LoginScreen(
                
              )));
      setState(() {
        isSigning = false;
      });
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

  forgotPassword() {
    if (emailController.text.isEmpty || !emailController.text.contains('@')) {
      showSnackBar(context, 'Enter a valid email',
          Color(0xff81194c));
    }
    try {
      _auth.sendPasswordResetEmail(email: emailController.text);
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.code,
          Color(0xff81194c));
    }
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: SizedBox(
                          height: mq.height * .4,
                          width: double.infinity,
                          child: Image.asset(
                            'images/balloons.png',
                            fit: BoxFit.cover,
                          )),
                    ),
                    const Positioned(
                        top: 20,
                        left: 20,
                        child: Text(
                          "Login to go where you live",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 28),
                        ))
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: const Text(
                  "Welcome Back",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: const Text(
                  "Enter details to setup your account back",
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
                            controller: emailController,
                            validator: (email) => email != null &&
                                    email.contains('@gmail.com') &&
                                    email.isNotEmpty
                                ? null
                                : "Enter a valid email",
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
                            controller: passwordController,
                            obscureText: isSecurePassword,
                            validator: (pass) => pass != null && pass.length > 6
                                ? null
                                : "Enter password with more than 6 letters",
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
                    ],
                  )),
              Container(
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextButton(
                      onPressed: forgotPassword,
                      child: const Text(
                        "Forgot Password?",
                        style:
                            TextStyle(fontSize: 16, color: Color(0xff81194c)),
                      ))),
              Padding(
                padding: const EdgeInsets.all(16),
                child: CustomButton(
                    onTap: () {
                      if(_formKey.currentState!.validate()){
                        _formKey.currentState!.save();
                        signIn();
                      }
                    },
                    child: Text('Log in', style: TextStyle(color: Colors.white, fontSize: 16),)),
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
                      style: TextStyle(
                          color: Color(0xff81194c)),
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
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const SignUpScreen()));
                },
                child: Container(
                  alignment: Alignment.center,
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: "Don't have an account? ",
                          style:
                              TextStyle(color: Colors.grey[500], fontSize: 16)),
                      const TextSpan(
                          text: "Sign Up",
                          style: TextStyle(
                              color: Color(0xff81194c), fontSize: 16)),
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
}
