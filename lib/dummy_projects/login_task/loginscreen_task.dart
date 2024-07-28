import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projects_iti/dummy_projects/login_task/email_extension.dart';


class DummyLoginScreen extends StatefulWidget {
  DummyLoginScreen({super.key});

  @override
  State<DummyLoginScreen> createState() => _DummyLoginScreenState();
}

class _DummyLoginScreenState extends State<DummyLoginScreen> {
  bool obscureText = true;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    print("Build");

    return Scaffold(
      backgroundColor: Colors.white,

      body: Padding(
        padding: const EdgeInsets.only(top: 100.0, right: 30, left: 30),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Account Login",
                  style: TextStyle(
                    color:  Colors.grey.shade800,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Image.asset(
                    "assets/icons/login_image.png",
                    height: 300,
                    fit:BoxFit.cover,

                   // width: 100,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

              /*  SizedBox(
                  height: 10,
                ),*/
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(12)),
                  child: TextFormField(

                    controller: _emailController,
                    validator: (value) {
                      if (!value!.emailValid) {
                        return "Email isn't valid";
                      }
                    },
                    decoration: InputDecoration(
                      label: Text("Email",style: TextStyle(color: Colors.grey.shade400)),
                      prefixIcon: Icon(Icons.email,color: Colors.grey[400]),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(12)),
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: obscureText,
                    validator: (value) {
                      if (value!.length < 10) {
                        return "Password should be more than 10 letters";
                      }
                    },
                    decoration: InputDecoration(
                        fillColor:  const Color(0xffe9ede7),
                      label: Text("Password",style: TextStyle(color: Colors.grey.shade400)),
                      prefixIcon: Icon(Icons.lock,color: Colors.grey[400]),
                      suffixIcon: InkWell(
                        onTap: () {
                          obscureText = !obscureText;
                          print("===========" + obscureText.toString());
                          setState(() {});
                        },
                        child: Icon(
                          obscureText
                              ? CupertinoIcons.eye
                              : CupertinoIcons.eye_slash,
                        ),
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Forget Password", style: TextStyle(color: Colors.grey.shade500)),
//
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      print("========= email is : " + _emailController.text);
                      print("========= password is : " +
                          _passwordController.text);
                    }
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 6, 87, 154),

                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
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
                    Text(
                      "Don\'t Have An Account ? ",
                      style: TextStyle(color: Colors.grey.shade800),
                    ),
                    TextButton(
                      onPressed: (){},
                      child: const Text('Reguster Now'),
                    )
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}