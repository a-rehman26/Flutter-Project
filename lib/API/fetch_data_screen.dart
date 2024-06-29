import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tts09b/API/api_services.dart';

import '../List and Grid UI/reuseable_widgets.dart';

class FetchMovieData extends StatefulWidget {
  const FetchMovieData({super.key});

  @override
  State<FetchMovieData> createState() => _FetchMovieDataState();
}

class _FetchMovieDataState extends State<FetchMovieData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: ApiServices.getMovieData(),
          builder: (context, snapshot) {

            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(),);
            }

            if(snapshot.hasData){

              Map map = jsonDecode(snapshot.data);

              List myData = map["tv_shows"];

              return ListView.builder(
                itemCount: myData.length,
                itemBuilder: (context, index) {
                  return ListContainer(
                    productName: myData[index]["name"],
                    productCate: myData[index]["network"],
                    productImage: myData[index]["image_thumbnail_path"],
                    productAvail: myData[index]["status"],
                    productPrice: myData[index]["start_date"],
                  );
                },);
            }

            if(snapshot.hasError){
              return Center(child: Icon(Icons.error,color: Colors.red,),);
            }


            return Container();
          },),
    );
  }
}
