import 'package:flutter/material.dart';
import 'package:tts09b/API/desc_data_fetch.dart';
import 'package:tts09b/List%20and%20Grid%20UI/grid_screen.dart';
import 'package:tts09b/main_navbar.dart';

import 'API/fetch_data_screen.dart';
import 'List and Grid UI/list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FetchMovieData(),
    );
  }
}

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [

              const SizedBox(
                width: double.infinity,
                height: 240,
              ),

              Container(
                width: double.infinity,
                height: 160,
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(20)
                ),
              ),

              Positioned(
                left: 30,
                top: 110,
                child: CircleAvatar(
                  radius: 54,
                  backgroundColor: Colors.grey.shade800,
                ),
              ),

              const Positioned(
                  left: 140,
                  top: 170,
                  child: Text("John Doe",style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),))
            ],
          ),

          Container(
              margin: const EdgeInsets.only(left: 20),
              child: const Text("About", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),)),

          const ListTile(
            leading: Icon(Icons.edit),
            title: Text("Diploma Aptech Learning Pakistan"),
          ),

          const ListTile(
            leading: Icon(Icons.date_range),
            title: Text("Member Since, 2004"),
          ),

          Container(
              margin: const EdgeInsets.only(left: 20,top: 10),
              child: const Text("Friends", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),)),

          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    Column(
                      children: [
                        Container(
                          width: 100,
                          height: 140,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade400,
                              borderRadius: BorderRadius.circular(14)
                          ),
                        ),
                        const Text("Abdul Rehman")
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: 100,
                          height: 140,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade400,
                              borderRadius: BorderRadius.circular(14)
                          ),
                        ),
                        const Text("Abdul Rehman")
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: 100,
                          height: 140,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade400,
                              borderRadius: BorderRadius.circular(14)
                          ),
                        ),
                        const Text("Abdul Rehman")
                      ],
                    )

                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    Column(
                      children: [
                        Container(
                          width: 100,
                          height: 140,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade400,
                              borderRadius: BorderRadius.circular(14)
                          ),
                        ),
                        const Text("Abdul Rehman")
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: 100,
                          height: 140,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade400,
                              borderRadius: BorderRadius.circular(14)
                          ),
                        ),
                        const Text("Abdul Rehman")
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: 100,
                          height: 140,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade400,
                              borderRadius: BorderRadius.circular(14)
                          ),
                        ),
                        const Text("Abdul Rehman")
                      ],
                    )

                  ],
                ),
              ],
            )

          )
        ],
      ),
    );
  }
}


