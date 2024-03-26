import 'package:flutter/material.dart';
import 'package:spices_admin/components/side_menu.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  RegExp emailRegex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');
  RegExp passwordRegex = RegExp(r'^[a-zA-Z\d]{8}$');
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFD9D9FF),
        appBar: AppBar(
          backgroundColor: Colors.white,
          title:  const Text('SPICE WORLD',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
          centerTitle: true,
        ),
        body:  Form(
          key: _formkey,
          child: Column(
            children: [
              const SizedBox(height: 40,),
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 400,
                  width: 500,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.zero,
                  ),
                  child:  Column(
                    children: [
                      const SizedBox(height: 50,),
                      const Align(
                        alignment : Alignment.center,
                        child: Text('Log In',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(50.0),
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _usernameController,
                              decoration:  const InputDecoration(
                                labelText: 'Username',
                                labelStyle: TextStyle(
                                    color: Colors.grey
                                ),
                                border: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black)
                                ),
                              ),
                              validator: (value){
                                if(value!.isEmpty){
                                  return 'please enter email';
                                }else if (!emailRegex.hasMatch(value)) {
                                  return 'please enter valid email';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              controller: _passwordController,
                              obscureText: true,
                              decoration:  const InputDecoration(
                                labelText: 'Password',
                                labelStyle: TextStyle(
                                    color: Colors.grey
                                ),
                                border: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black)
                                ),
                              ),
                              validator: (value){
                                if(value!.isEmpty){
                                  return 'please enter password';
                                }
                                else if(!passwordRegex.hasMatch(value)){
                                  return 'please enter minimum 8 characters';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            SizedBox(
                              height: 40,
                              width: 400,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black
                                ),
                                onPressed:(){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SideMenu()));
                                },
                                child: const Text('Login',style: TextStyle(color: Colors.white),),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}