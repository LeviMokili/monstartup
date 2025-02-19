import 'package:flutter/material.dart';
import 'package:startup/resources/styles/button.dart';
class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const Icon(Icons.navigate_before_rounded),
      ),

      body: ListView(
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(right: 280),
            child: Image.asset('assets/logo.png', height: 40),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 60,left: 20,top: 10),
            child: Text('Informations sûr et faible des écoles et université de votre choix', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),),
          ),
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                        validator: (val) => val!.isEmpty ? 'Invalid Name' : null,
                        decoration:  InputDecoration(
                          filled: true,
                          fillColor: const Color(0xFFF8FAFB),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset('assets/user.png', width: 20, height: 20),
                          ),
                          labelText: 'Name',
                          contentPadding: const EdgeInsets.all(10),
                          border: const OutlineInputBorder(
                              borderSide:
                              BorderSide(width: 1, color: Colors.white)),
                        )),

                    const SizedBox(height: 20,),
                    TextFormField(
                        validator: (val) => val!.isEmpty ? 'Invalid Name' : null,
                        decoration:  InputDecoration(
                          filled: true,
                          fillColor: const Color(0xFFF8FAFB),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset('assets/user.png', width: 20, height: 20),
                          ),
                          labelText: 'Numero de telephone',
                          contentPadding: const EdgeInsets.all(10),
                          border: const OutlineInputBorder(
                              borderSide:
                              BorderSide(width: 1, color: Colors.white)),
                        )),

                    const SizedBox(height: 20,),

                    TextFormField(
                        validator: (val) => val!.isEmpty ? 'Invalid Name' : null,
                        decoration:  InputDecoration(
                          filled: true,
                          fillColor: Color(0xFFF8FAFB),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset('assets/password.png', width: 20, height: 20),
                          ),
                          labelText: 'Mot de passe',
                          contentPadding: const EdgeInsets.all(10),
                          border: const OutlineInputBorder(
                              borderSide:
                              BorderSide(width: 1, color: Colors.white)),
                        )),

                    const SizedBox(height: 30,),
                    ElevatedButton(
                        style: buttonPrimary,
                        onPressed: (){

                        },
                        child: const Text('Connectez vous', style: TextStyle(color: Colors.white),)
                    ),

                    const SizedBox(height: 10,),

                  ],
                )
            ),
          )


        ],
      ),
    );

  }
}
