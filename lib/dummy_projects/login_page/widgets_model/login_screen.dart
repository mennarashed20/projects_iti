import 'package:flutter/material.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
 body: SingleChildScrollView(
      child: Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height,
            maxWidth:MediaQuery.of(context).size.width,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors:[
              Colors.blue.shade800,
              Colors.blue.shade600,
            ] ,
            begin: Alignment.topLeft,
            end: Alignment.centerRight,
          )

        ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 36.0,horizontal: 24.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Login",style: TextStyle(
                            color: Colors.white,
                            fontSize: 46.0,
                          fontWeight: FontWeight.w800

                          ) ),
                              SizedBox(height: 10.0,),

                          Text(
                              "Enter to a beautiful world",style: TextStyle(
                              color: Colors.white,
                              fontSize: 22.0,
                              fontWeight: FontWeight.w300

                          ) ),
                        ],

                      ),
                    ),


                  ),
                      Expanded(
                            flex: 5,child: Container(
                        width: double.infinity,decoration: BoxDecoration(
                        color: Colors.white,borderRadius: BorderRadius.only(topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),

                      )),

                          child:Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TextField(
                                   keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide: BorderSide.none,

                                    ),
                                    filled: true,
                                    fillColor: Color(0xFFe7edeb),
                                    hintText: "Email",
                                    prefixIcon: Icon(Icons.email,color: Colors.grey[600],)
                                  ),
                                ),
                                SizedBox(height: 20.0,),
                                TextField(
                                  keyboardType: TextInputType.visiblePassword,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8.0),
                                        borderSide: BorderSide.none,

                                      ),
                                      filled: true,
                                      fillColor: Color(0xFFe7edeb),
                                      hintText: "your password",
                                      prefixIcon: Icon(Icons.email,color: Colors.grey[600],)
                                  ),

                                ),
                                SizedBox(height: 20.0,),
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "forget password?",
                                      style: TextStyle(color: Colors.blue),
                                    )
                                  ],
                                ),
                                SizedBox(height: 50.0,),


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
                              ],

                            ),
                          ),



                      ),)
                ],

              ),
      ),


 ),



    );
  }
}
