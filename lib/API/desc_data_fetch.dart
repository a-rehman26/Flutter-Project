import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tts09b/API/api_services.dart';


class DescriptionScreen extends StatefulWidget {
  const DescriptionScreen({super.key, required this.movieID});

  final int movieID;

  @override
  State<DescriptionScreen> createState() => _DescriptionScreenState();
}

class _DescriptionScreenState extends State<DescriptionScreen> {

  List colors = [Colors.black, Colors.pink, Colors.blue, Colors.green];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: ApiServices.getMovieDataDesc(widget.movieID),
          builder: (BuildContext context, snapshot) {
            if (snapshot.hasData) {

              Map map = jsonDecode(snapshot.data);
              List pictures = map["tvShow"]["pictures"];

              return Column(

                children: [

                  CarouselSlider(items: List.generate(pictures.length, (index) =>  Container(
                    width: double.infinity,
                    height: 200,
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        image: DecorationImage(image: NetworkImage(pictures[index])),
                        color: Colors.grey
                    ),
                  )), options: CarouselOptions(
                      autoPlay: true,
                      viewportFraction: 1,
                      autoPlayCurve: Curves.easeInOutCubic,
                      autoPlayInterval: Duration(seconds: 2)
                  ))

                ],

              );
            }

            if (snapshot.hasError) {
              return Icon(Icons.error_outline);
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }
            return Container();
          }),
    );
  }
}
