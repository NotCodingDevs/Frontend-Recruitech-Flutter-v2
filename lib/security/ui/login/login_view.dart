import 'package:flutter/material.dart';
import 'package:frontend_recruitech_flutter_v2/recruitment/ui/home/home_view.dart';
import 'package:frontend_recruitech_flutter_v2/shared/ui/widgets/body_medium.dart';
import 'package:frontend_recruitech_flutter_v2/shared/ui/widgets/title_large.dart';
import 'package:page_transition/page_transition.dart';

import '../../../shared/ui/theme/text_styles.dart';
import '../../../shared/utils/validator.dart';
import '../../data/remote/models/user.dart';
import '../../data/remote/services/auth_service.dart';
import '../register/register_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController? emailController;
  TextEditingController? passwordController;

  AuthService? _authService;
  bool _hidePassword = true;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();

    _authService = AuthService();
  }

  Future<void> loginUsers() async {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Sign in...'),
        ),
      );

      User res = await _authService?.loginUser(
          emailController!.text, passwordController!.text);

      if (context.mounted) ScaffoldMessenger.of(context).hideCurrentSnackBar();

      if (res.id > 0) {
        if (context.mounted) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => HomeView(
                  user: res,
                ),
              ),
              (route) => false);
        }
      } else {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('ta mal mano u.u'),
            ),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.asset(
                      "assets/images/login_welcome.png",
                      height: size.height * 0.35,
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    TitleLarge(text: "Sign In"),
                    BodyMedium(
                        text: "Entra mano entra que la chamba te espera"),
                    const SizedBox(
                      height: 16.0,
                    ),
                    TextFormField(
                      controller: emailController,
                      validator: (value) =>
                          Validator.validateEmailS(value ?? ""),
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Email",
                        hintStyle: CustomTextStyle.inputPlaceHolder,
                        prefixIcon: Icon(Icons.email),
                        filled: true,
                        fillColor: Color(0xFFF8FAFB),
                        prefixIconColor: Color(0xFF8D8D8D),
                        contentPadding: EdgeInsets.symmetric(vertical: 16.0),
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    TextFormField(
                      controller: passwordController,
                      validator: (value) =>
                          Validator.validatePassword(value ?? ""),
                      obscureText: _hidePassword,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Password",
                        hintStyle: CustomTextStyle.inputPlaceHolder,
                        filled: true,
                        fillColor: const Color(0xFFF8FAFB),
                        prefixIcon: const Icon(Icons.lock),
                        prefixIconColor: const Color(0xFF8D8D8D),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _hidePassword = !_hidePassword;
                            });
                          },
                          child: Icon(
                            _hidePassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                        suffixIconColor: Color(0xFF8D8D8D),
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 16.0),
                      ),
                      cursorColor: Colors.indigo,
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: loginUsers,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2F4897),
                          padding: const EdgeInsets.symmetric(vertical: 18.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: const Text(
                          "Sign in",
                          style: CustomTextStyle.buttonText,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 24.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account?",
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF8D8D8D),
                            fontSize: 16.0,
                          ),
                        ),
                        const SizedBox(
                          width: 8.0,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              PageTransition(
                                type: PageTransitionType.rightToLeft,
                                alignment: Alignment.bottomCenter,
                                reverseDuration: const Duration(
                                  milliseconds: 300,
                                ),
                                duration: const Duration(
                                  milliseconds: 300,
                                ),
                                child: const RegisterView(),
                              ),
                            );
                          },
                          child: const Text(
                            "Sign up",
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF2F4897),
                              fontSize: 16.0,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
