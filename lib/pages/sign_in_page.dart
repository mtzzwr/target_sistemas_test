import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:target_sistemas_test/pages/information_capture_page.dart';
import 'package:target_sistemas_test/stores/sign_in/sign_in_store.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/styles.dart';
import '../utils/constants.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final store = SignInStore();

  void _launchUrl() async {
    final uri = Uri.parse(Constants.privacyPolicyUrl);
    launchUrl(uri);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Styles.darkerBackgroundColor,
            Styles.lighterBackgroundColor,
          ],
        ),
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 26),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Usuário',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 48,
                      child: TextField(
                        onChanged: (value) => store.setUser(value),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(20),
                        ],
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 1),
                          filled: true,
                          prefixIcon: Icon(Icons.person),
                          fillColor: Colors.white,
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Senha',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 48,
                      child: TextField(
                        onChanged: (value) => store.setPassword(value),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(20),
                          FilteringTextInputFormatter.allow(
                            RegExp("[0-9a-zA-Z]"),
                          ),
                        ],
                        obscureText: true,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 1),
                          filled: true,
                          prefixIcon: Icon(Icons.lock),
                          fillColor: Colors.white,
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    signInButton,
                    const SizedBox(
                      height: 80,
                    ),
                    GestureDetector(
                      onTap: () => _launchUrl(),
                      child: const Center(
                        child: Text(
                          'Política de privacidade',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  showSnackbar(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    );
  }

  Widget get signInButton => Center(
        child: GestureDetector(
          onTap: () async {
            if (store.isSignInFormValid) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (_) => const InformationCapturePage(),
                ),
                (route) => false,
              );
            }

            if (!store.isSignInFormValid) {
              showSnackbar('Preencha os campos corretamente');
            }

            if (store.password.length < 2) {
              showSnackbar('A senha deve conter pelo menos 2 caracteres');
            }

            if (store.user.endsWith(' ')) {
              showSnackbar(
                'Os campos não podem terminar com um espaço no final',
              );
            }
          },
          child: Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: 140,
              height: 42,
              decoration: BoxDecoration(
                color: Styles.buttonColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(
                child: Text(
                  'Entrar',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}
