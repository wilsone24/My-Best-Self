import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    const buttonColor = Color(0xFF74B7BB);
    return Column(
      children: [
        const SizedBox(
          height: 400,
        ),
        const Text('Enter your name',
            style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.w500)),
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color.fromARGB(255, 242, 241, 241),
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              suffixIcon: const Icon(Icons.login, color: buttonColor),
              hintStyle: TextStyle(color: Colors.grey[400]),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                  borderSide: const BorderSide(color: Colors.red)),
              labelText: 'Input Name',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 115),
          child: SizedBox(
            width: double.infinity,
            child: FilledButton(
                onPressed: () {},
                style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(buttonColor)),
                child: const Padding(
                  padding: EdgeInsetsDirectional.symmetric(vertical: 9),
                  child: Text(
                    'Logins',
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
                  ),
                )),
          ),
        ),
      ],
    );
  }
}
