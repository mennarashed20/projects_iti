
import 'package:flutter/material.dart';



class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 15.0, top:60),
              child: LoginHeader(),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 100,),
                      const TextFormFields(),
                      const SizedBox(
                        height: 10,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "forget password",
                            style: TextStyle(color: Colors.blue),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.indigo,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                            Colors.indigo, // Set the button color to indigo
                          ),
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't Have an Account ? ",
                              style: TextStyle(color: Colors.grey[700])),
                          const Text("Register Now",
                              style: TextStyle(color: Colors.blue)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}




class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Login',
          style: TextStyle(
              color: Colors.white, fontSize: 40, fontWeight: FontWeight.w900),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          "Enter a beautiful world",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 20,
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}




class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
        required this.hintText,
        this.prefixIcon,
        this.suffixIcon,
        this.obscureText});

  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
          color: Colors.grey[300], borderRadius: BorderRadius.circular(5)),
      child: Center(
        child: TextFormField(
          obscureText: obscureText ?? false,
          decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: prefixIcon,
              hintText: hintText,
              suffixIcon: suffixIcon ?? const SizedBox()),
        ),
      ),
    );
  }
}

class TextFormFields extends StatefulWidget {
  const TextFormFields({super.key});

  @override
  State<TextFormFields> createState() => _TextFormFieldsState();
}

class _TextFormFieldsState extends State<TextFormFields> {
  bool _obscureText = true;

  void _togglePasswordView() {
    setState(() {_obscureText = !_obscureText;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomTextFormField(
          hintText: "your email ",
          prefixIcon: Icon(Icons.email_outlined),
        ),
        const SizedBox(
          height: 20,
        ),
        CustomTextFormField(
          hintText: "your password",
          prefixIcon: const Icon(Icons.lock_open),
          obscureText: _obscureText,

        )
      ],
    );
  }
}