import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tts09b/API/api_services.dart';
import 'package:tts09b/API/desc_data_fetch.dart';

import '../List and Grid UI/reuseable_widgets.dart';

class FetchMovieData extends StatefulWidget {
  const FetchMovieData({super.key});

  @override
  State<FetchMovieData> createState() => _FetchMovieDataState();
}

class _FetchMovieDataState extends State<FetchMovieData> {


  int pageNumber = 1;

  void increment(){
    setState(() {
      pageNumber = pageNumber + 1;
    });
  }

  void decrement(){
    if (pageNumber>1) {
      setState(() {
        pageNumber = pageNumber - 1;
      });
    }  else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Already on First Page")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        leading: IconButton(onPressed: (){
          decrement();
        }, icon: Icon(Icons.chevron_left)),

        title: Text("$pageNumber"),

        centerTitle: true,

        actions: [
          IconButton(onPressed: (){
            increment();
          }, icon: Icon(Icons.chevron_right)),

          SizedBox(width: 10,)
        ],
      ),

      body: FutureBuilder(
          future: ApiServices.getMovieData(pageNumber),
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
                  return GestureDetector(
                    onTap: (){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Movie ID: ${myData[index]["id"]}")));
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DescriptionScreen(movieID: myData[index]["id"]),));
                    },
                    child: ListContainer(
                      productName: myData[index]["name"],
                      productCate: myData[index]["network"],
                      productImage: myData[index]["image_thumbnail_path"],
                      productAvail: myData[index]["status"],
                      productPrice: myData[index]["start_date"],
                    ),
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
