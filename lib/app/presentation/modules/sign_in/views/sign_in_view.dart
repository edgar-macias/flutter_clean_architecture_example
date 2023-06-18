import 'package:flutter/material.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  String _username = '', _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onChanged: (text) {
                    setState(() {
                      _username = text.trim().toLowerCase();
                    });
                  },
                  decoration: const InputDecoration(hintText: 'username'),
                  validator: (text) {
                    text = text?.trim().toLowerCase() ?? '';
                    if (text.isEmpty) {
                      return 'Invalid username';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onChanged: (text) {
                    setState(() {
                      _password = text.replaceAll(' ', '').toLowerCase();
                    });
                  },
                  decoration: const InputDecoration(hintText: 'password'),
                  validator: (text) {
                    text = text?.replaceAll(' ', '').toLowerCase() ?? '';
                    if (text.length < 4) {
                      return 'Invalid password';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 20),
                Builder(builder: (context) {
                  return MaterialButton(
                    onPressed: () {
                      final isValid = Form.of(context).validate();
                      if (isValid) {}
                    },
                    color: Colors.blue,
                    disabledColor: Colors.blueGrey,
                    child: const Text('Sign in'),
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
