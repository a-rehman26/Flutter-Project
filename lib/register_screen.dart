import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  bool isHide = true;

  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  void userRegister()async{
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email.text, password: password.text);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Register Successful")));
    }
    on FirebaseAuthException catch(ex){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(ex.code.toString())));
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    name.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: formKey,
          child: Column(
            children: [

              const SizedBox(
                height: 20,
              ),

              TextFormField(
                controller: name,
                validator: (val){
                  if(val == null || val.isEmpty || val == " "){
                    return "Name is Required";
                  }
                },
                inputFormatters: [
                  LengthLimitingTextInputFormatter(20)
                ],
                maxLength: 20,
                decoration: const InputDecoration(
                  label: Text("Enter Your Name"),
                  border: OutlineInputBorder(),
                  hintText: "John Doe",
                  prefixIcon: Icon(Icons.person),
                  // prefix: Icon(Icons.person)
                ),
              ),

              const SizedBox(
                height: 10,
              ),

              TextFormField(
                controller: email,
                validator: (val){
                  if(val == null || val.isEmpty || val == " "){
                    return "Email is Required";
                  }
                },
                decoration: const InputDecoration(
                  label: Text("Enter Your Email"),
                  border: OutlineInputBorder(),
                  hintText: "john@gmail.com",
                  prefixIcon: Icon(Icons.email),
                  // prefix: Icon(Icons.person)
                ),
              ),

              const SizedBox(
                height: 10,
              ),

              TextFormField(
                controller: password,
                obscureText: isHide, // ->  true
                validator: (val){
                  if(val == null || val.isEmpty || val == " "){
                    return "Password is Required";
                  }
                  // if(val.length < 8){
                  //   return "Password Length must be greater than 8 digits";
                  // }
                },
                obscuringCharacter: "-",
                decoration: InputDecoration(
                  label: const Text("Enter Your Password"),
                  border: const OutlineInputBorder(),
                  hintText: "J**9##",
                  prefixIcon: const Icon(Icons.key),
                  suffix: IconButton(onPressed: (){
                    setState(() {
                      isHide = ! isHide ;
                    });
                  }, icon: isHide ?  const Icon(Icons.remove_red_eye) : const Icon(Icons.panorama_fish_eye))
                  // prefix: Icon(Icons.person)
                ),
              ),

              const SizedBox(
                height: 10,
              ),

              ElevatedButton(onPressed: (){

                if(formKey.currentState!.validate()){


                  userRegister();

                  debugPrint(name.text);
                  debugPrint(email.text);
                  debugPrint(password.text);
                  name.clear();
                  email.clear();
                  password.clear();
                }


              }, child: const Text("Register"))

            ],
          ),
        ),
      ),
    );
  }
}
