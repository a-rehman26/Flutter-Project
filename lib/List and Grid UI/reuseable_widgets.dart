import 'package:flutter/material.dart';

class ListContainer extends StatelessWidget {
  const ListContainer({
    super.key,
    required this.productName,
    required this.productImage,
    required this.productCate,
    required this.productPrice,
    required this.productAvail,
  });

  final String productImage;
  final String productName;
  final String productCate;
  final String productPrice;
  final String productAvail;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 140,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade600,
              spreadRadius: 1,
              blurRadius: 8
            )
          ],
          borderRadius: BorderRadius.circular(14)
      ),
      child: Row(
        children: [

          Container(
            width: 100,
            height: 120,
            margin: const EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: Colors.grey.shade600,
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(productImage))
            ),
          ),

          const SizedBox(
            width: 8,
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(productName),
              Text(productCate),
              Text("\$ $productPrice"),
              Text(productAvail, style: TextStyle(
                color: productAvail == "Available" ? Colors.green : Colors.red
              ),),
            ],
          )

        ],
      ),
    );
  }
}

class GridContainer extends StatelessWidget {
  const GridContainer({
    super.key,
    required this.pImage,
    required this.pName,
    required this.pCategory,
    required this.pPrice,
    required this.pAvail,
  });

  final String pImage;
  final String pName;
  final String pCategory;
  final String pPrice;
  final String pAvail;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 260,
      padding: EdgeInsets.symmetric(horizontal: 6,vertical: 6),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade600,
                spreadRadius: 1,
                blurRadius: 8
            )
          ],
          color: Colors.white
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // Image Container
          Container(
            width: 180,
            height: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: Colors.grey,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(pImage))
            ),
          ),

          Text(pName),
          Text(pCategory),
          Text(pPrice),
          Text(pAvail)

        ],
      ),
    );
  }
}

