import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
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
              String movieName = map["tvShow"]["name"];
              String movieNetwork = map["tvShow"]["network"];
              String movieStatus = map["tvShow"]["status"];
              String movieThumbnail = map["tvShow"]["image_thumbnail_path"];
              String movieRating = map["tvShow"]["rating"];
              double mrate = double.parse(movieRating) / 2;

              return Column(

                children: [

                 Stack(
                   children: [
                     Container(
                       width: double.infinity,
                       height: 280,
                     ),

                     CarouselSlider(items: List.generate(pictures.length, (index) =>  Container(
                       width: double.infinity,
                       height: 200,
                       margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                       decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(14),
                           image: DecorationImage(
                               fit: BoxFit.cover,
                               image: NetworkImage(pictures[index])),
                           color: Colors.grey
                       ),
                     )), options: CarouselOptions(
                         autoPlay: true,
                         viewportFraction: 1,
                         autoPlayCurve: Curves.easeInOutCubic,
                         autoPlayInterval: Duration(seconds: 2)
                     )),

                     Positioned(
                       left: 20,
                       top: 100,
                       child: Container(
                         width: 120,
                         height: 160,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(14),
                           color: Colors.grey.shade300,
                           image: DecorationImage(
                               fit: BoxFit.cover,
                               image: NetworkImage(movieThumbnail))
                         ),
                       ),
                     ),
                     
                     Positioned(
                         left: 145,
                         top: 190,
                         child: Text(movieName, style: TextStyle(fontWeight: FontWeight.w800,fontSize: 18),)),

                     Positioned(
                         left: 145,
                         top: 210,
                         child: Text(movieNetwork, style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14),)),

                     Positioned(
                         left: 145,
                         top: 230,
                         child: RatingBarIndicator(
                           rating: mrate,
                           itemBuilder: (context, index) => Icon(
                             Icons.star,
                             color: Colors.amber,
                           ),
                           itemCount: 5,
                           itemSize: 14.0,
                           direction: Axis.horizontal,
                         ),),

                     Positioned(
                         left: 145,
                         top: 250,
                         child: Text("$mrate / 5", style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14),)),
                   ],
                 ),


                  Container(
                    padding: EdgeInsets.all(4.0),
                    child: Text("${map["tvShow"]["description"]}"),
                  )


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
