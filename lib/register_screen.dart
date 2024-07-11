import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  bool isHide = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [

            SizedBox(
              height: 20,
            ),

            TextFormField(
              decoration: const InputDecoration(
                label: Text("Enter Your Name"),
                border: OutlineInputBorder(),
                hintText: "John Doe",
                prefixIcon: Icon(Icons.person),
                // prefix: Icon(Icons.person)
              ),
            ),

            SizedBox(
              height: 10,
            ),

            TextFormField(
              decoration: const InputDecoration(
                label: Text("Enter Your Email"),
                border: OutlineInputBorder(),
                hintText: "john@gmail.com",
                prefixIcon: Icon(Icons.email),
                // prefix: Icon(Icons.person)
              ),
            ),

            SizedBox(
              height: 10,
            ),

            TextFormField(
              obscureText: isHide,
              obscuringCharacter: "-",
              decoration: InputDecoration(
                label: Text("Enter Your Password"),
                border: OutlineInputBorder(),
                hintText: "J**9##",
                prefixIcon: Icon(Icons.key),
                suffix: IconButton(onPressed: (){
                  setState(() {
                    isHide = ! isHide ;
                  });
                }, icon: Icon(Icons.remove_red_eye))
                // prefix: Icon(Icons.person)
              ),
            ),

            SizedBox(
              height: 10,
            ),
            
            ElevatedButton(onPressed: (){}, child: Text("Register"))

          ],
        ),
      ),
    );
  }
}
