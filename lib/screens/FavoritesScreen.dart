import 'package:flutter/material.dart';
import 'package:lafyuu/provider/favoriter_provider.dart';
import 'package:lafyuu/screens/productDetail.dart';
import 'package:provider/provider.dart';

class Favorite extends StatefulWidget {
  const Favorite({
    super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavoriteProvider>(context);
    final products = provider.products;
    return Scaffold(
      body: ListView(
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios, size: 24)),
              SizedBox(width: 5,),
              Text(
                'Favorite Products',
                style: TextStyle(
                    color: Color(0xff223263),
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          GridView.builder(
              gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 310,
                  crossAxisSpacing: 7),
              physics:
              NeverScrollableScrollPhysics(), // to disable GridView's scrolling
              shrinkWrap: true, // You won't see infinite size error
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) {
                final product = products[index];

                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    height: 310,
                    width: 135,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Color(0xffEBF0FF)),
                        borderRadius: BorderRadius.circular(5)),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => ProductDetail(product: product,))
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        fixedSize: Size(MediaQuery.of(context).size.width,
                            MediaQuery.of(context).size.height),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          FittedBox(
                            fit: BoxFit.cover,
                            child: SizedBox(
                              height: 140,
                              width: 140,
                              child: Image.network(product.image),
                            ),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(product.name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Color(0xff223263),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                                textAlign: TextAlign.justify),
                          ),
                          SizedBox(
                            height: 9,
                          ),
                          Row(
                            children: [
                              Icon(Icons.star, color: Color(0xffFFC833), size: 17),
                              Icon(Icons.star, color: Color(0xffFFC833), size: 17),
                              Icon(Icons.star, color: Color(0xffFFC833), size: 17),
                              Icon(Icons.star, color: Color(0xffFFC833), size: 17),
                              Icon(Icons.star, color: Color(0xffEBF0FF), size: 17)
                            ],
                          ),
                          SizedBox(height: 10),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text('\$${product.price}',
                                style: TextStyle(
                                    color: Color(0xff40BFFF),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13),
                                textAlign: TextAlign.justify),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text('\$${product.oldPrice}',
                                      style: TextStyle(
                                          color: Color(0xff9098B1),
                                          fontSize:11,
                                          decoration: TextDecoration.lineThrough)),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  Text(
                                    '\$${product.discount}',
                                    style: TextStyle(
                                        color: Color(0xffFB7181),
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              SizedBox(width: 5),
                              IconButton(onPressed: () {
                                setState(() {
                                  provider.addRemoveFav(product);
                                });
                              }, icon: Icon(Icons.restore_from_trash_outlined, color: Colors.grey, size: 30,))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ],
      )
    );
  }
}


  // FutureBuilder<Product> gridViewProducts() {
  //   return FutureBuilder(
  //     future: products,
  //     builder: (context, snapshot) {
  //       if (snapshot.connectionState == ConnectionState.waiting) {
  //         return SizedBox();
  //       }
  //       if (snapshot.hasData) {
  //         List<Product> product =
  //             snapshot.data!.data.products;
  //         return GridView.builder(
  //             gridDelegate:
  //             SliverGridDelegateWithFixedCrossAxisCount(
  //                 crossAxisCount: 2,
  //                 mainAxisExtent: 310,
  //                 crossAxisSpacing: 7),
  //             physics:
  //             NeverScrollableScrollPhysics(), // to disable GridView's scrolling
  //             shrinkWrap: true, // You won't see infinite size error
  //             itemCount: product.length,
  //             itemBuilder: (BuildContext context, int index) {
  //               return buildGridView(product[index], index);
  //             });
  //       }
  //       return SizedBox();
  //     },
  //   );
  // },

  // Widget buildGridView(Product product, int index) => Padding(
  //   padding: const EdgeInsets.all(5.0),
  //   child: Container(
  //     height: 238,
  //     width: 145,
  //     decoration: BoxDecoration(
  //         border: Border.all(width: 1, color: Color(0xffEBF0FF)),
  //         borderRadius: BorderRadius.circular(5)),
  //     child: ElevatedButton(
  //       onPressed: () {},
  //       style: ElevatedButton.styleFrom(
  //         backgroundColor: Colors.white,
  //         fixedSize: Size(MediaQuery.of(context).size.width,
  //             MediaQuery.of(context).size.height),
  //       ),
  //       child: Column(
  //         children: [
  //           SizedBox(
  //             height: 15,
  //           ),
  //           SizedBox(
  //             height: 140,
  //             width: 140,
  //             child: Image.asset(product.image),
  //           ),
  //           SizedBox(
  //             height: 7,
  //           ),
  //           Container(
  //             alignment: Alignment.centerLeft,
  //             child: Text(product.name,
  //                 style: TextStyle(
  //                     color: Color(0xff223263),
  //                     fontWeight: FontWeight.bold,
  //                     fontSize: 14),
  //                 textAlign: TextAlign.justify),
  //           ),
  //           SizedBox(
  //             height: 9,
  //           ),
  //           Row(
  //             children: [
  //               Icon(Icons.star, color: Color(0xffFFC833), size: 17),
  //               Icon(Icons.star, color: Color(0xffFFC833), size: 17),
  //               Icon(Icons.star, color: Color(0xffFFC833), size: 17),
  //               Icon(Icons.star, color: Color(0xffFFC833), size: 17),
  //               Icon(Icons.star, color: Color(0xffEBF0FF), size: 17)
  //             ],
  //           ),
  //           SizedBox(height: 15),
  //           Container(
  //             alignment: Alignment.centerLeft,
  //             child: Text('\$${product.price}',
  //                 style: TextStyle(
  //                     color: Color(0xff40BFFF),
  //                     fontWeight: FontWeight.bold,
  //                     fontSize: 14),
  //                 textAlign: TextAlign.justify),
  //           ),
  //           SizedBox(
  //             height: 9,
  //           ),
  //           Row(
  //             children: [
  //               Text('\$${product.oldPrice}',
  //                   style: TextStyle(
  //                       color: Color(0xff9098B1),
  //                       fontSize: 12,
  //                       decoration: TextDecoration.lineThrough)),
  //               SizedBox(
  //                 width: 7,
  //               ),
  //               Text(
  //                 '\$${product.discount}',
  //                 style: TextStyle(
  //                     color: Color(0xffFB7181),
  //                     fontSize: 12,
  //                     fontWeight: FontWeight.bold),
  //               ),
  //             ],
  //           )
  //         ],
  //       ),
  //     ),
  //   ),
  // );
