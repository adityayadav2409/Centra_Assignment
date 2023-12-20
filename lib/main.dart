// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:my_app/home.dart';
//import 'package:my_app/lib/ui_screen.dart';

void main() {
  runApp(const Login()); //method dec
}

class Login extends StatelessWidget {
  //class myapp
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Assignment',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Assignment'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(40),
        alignment: Alignment.center,
        child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/centrajob.png"),
                const SizedBox(height: 40),
                const Text("Log In With",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5)),
                      child: Image.asset("assets/images/google.png"),
                    ),
                    const SizedBox(width: 15),
                    Container(
                      height: 60,
                      width: 60,
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5)),
                      child: Image.asset("assets/images/facebook.png"),
                    ),
                    const SizedBox(width: 15),
                    Container(
                      height: 60,
                      width: 60,
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5)),
                      child: Image.asset("assets/images/apple.png"),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 3,
                      height: 1,
                      color: Colors.grey,
                    ),
                    Text(" OR ", style: TextStyle(color: Colors.grey.shade700)),
                    Container(
                      width: MediaQuery.of(context).size.width / 3,
                      height: 1,
                      color: Colors.grey,
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextFormField(
                          controller: phoneController,
                          keyboardType: TextInputType.number,
                          maxLength: 10,
                          decoration: InputDecoration(
                              hintText: "Enter Phone No.",
                              filled: true,
                              fillColor: Colors.lightBlue.shade100,
                              prefixIcon: const Icon(Icons.call_outlined),
                              contentPadding: const EdgeInsets.all(20),
                              errorStyle: TextStyle(color: Colors.red.shade900),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(5))),
                          validator: (value) {
                            if (value!.length != 10) {
                              return "Please enter Phone number";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        const Text("optional*"),
                        const SizedBox(height: 3),
                        TextFormField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              hintText: "Enter Email address",
                              filled: true,
                              fillColor: Colors.lightBlue.shade100,
                              prefixIcon: const Icon(Icons.email_outlined),
                              contentPadding: const EdgeInsets.all(20),
                              errorStyle: TextStyle(color: Colors.red.shade900),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(5))),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter Email address";
                            }
                            return null;
                          },
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        debugPrint("Login Successfully");
                      }
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return const HomeScreen();
                          },
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(250, 40)),
                    child: const Text("Login ", style: TextStyle(fontSize: 16)))
              ],
            )),
      ),
    );
  }
}
