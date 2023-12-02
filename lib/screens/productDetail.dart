import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:lafyuu/model/home_response.dart';
import 'package:lafyuu/provider/favoriter_provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:provider/provider.dart';

class ProductDetail extends StatefulWidget {
  ProductDetail({
    required this.product,
    super.key
  });
  final Product product;

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  final controller = CarouselController();
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavoriteProvider>(context);
    return Scaffold(
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios, size: 24)),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.product.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Color(0xff223263),
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    ),
                  ),
                ),
              ),
              Icon(Icons.search_outlined, size: 24),
              Icon(Icons.more_vert_rounded, size: 24),
            ],
          ),

          SizedBox(height: 10),

          Container(
            child: CarouselSlider.builder(
              carouselController: controller,
              itemCount: widget.product.images.length,
              itemBuilder:
                  (BuildContext context, int index, int realIndex) {
                final products = widget.product.images;

                return buildSlider(products, index);
              },
              options: CarouselOptions(
                  height: 220,
                  autoPlay: true,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    return setState(() => activeIndex = index);
                  }),
            ),
          ),
          SizedBox(height: 10),
          Center(child: bulidIndicator()),
          SizedBox(height: 15),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Text(
                    widget.product.name,
                    style: TextStyle(
                      color: Color(0xff223263),
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                ),
              )
              ),
              IconButton(
                  onPressed: (){
                    setState(() {
                      provider.addRemoveFav(widget.product);
                    });
                  },
                  icon: provider.isExist(widget.product)?
                  Icon(Icons.favorite, size: 27, color: Colors.redAccent,):
                  Icon(Icons.favorite_border_outlined, size: 27)),
            ],
          ),
          SizedBox(height: 20),
          
          Text('Details:', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15, color: Color(0xff223263)),),
          SizedBox(height: 10,),

          Text(widget.product.description, style: TextStyle(fontSize: 10, color: Colors.grey),),


        ],
      ),
    );
  }

  Widget buildSlider(List<String> products, int index) => Container(
    margin: EdgeInsets.symmetric(horizontal: 5),
    alignment: Alignment.center,
    child: Image.network(
      products[index],
      fit: BoxFit.contain,
    ),
  );

  Widget bulidIndicator() => AnimatedSmoothIndicator(
    activeIndex: activeIndex,
    count: widget.product.images.length,
    effect: const JumpingDotEffect(
      dotHeight: 10,
      dotWidth: 10,
      activeDotColor: Color(0xff40BFFF),
      dotColor: Color(0xffEBF0FF),
    ),
    onDotClicked: animateToSlide,
  );

  void animateToSlide(int index) => controller.animateToPage(index);


}















  // @override
  // void initState() {
  //   super.initState();
  //   products = HomeRepository().getHome();
  // }


//
//   FutureBuilder<HomeModel> indicator() {
//     return FutureBuilder(
//       future: products,
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return SizedBox();
//         }
//         if (snapshot.hasData){
//           final List<Banners> banners = snapshot.data!.data.banners;
//           return buildIndicator(banners);
//         }
//         return SizedBox();
//       },
//     );
//   }
//
//
//   Widget buildIndicator(List<Banners> banners) => AnimatedSmoothIndicator(
//     activeIndex: activeIndex,
//     count: banners.length,
//     effect: JumpingDotEffect(
//       dotHeight: 10,
//       dotWidth: 10,
//       activeDotColor: Color(0xff40BFFF),
//       dotColor: Color(0xffEBF0FF),
//     ),
//     onDotClicked: animateToSlide,
//   );
//
//   void animateToSlide(int index) => controller.animateToPage(index);
// }
//
//
//   FutureBuilder<HomeModel> slideBar() {
//     return FutureBuilder(
//       future: products,
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return SizedBox();
//         }
//         if (snapshot.hasError) {
//           return const Text('there is an error try again!');
//         }
//         if (snapshot.hasData){
//           final List<Banners> banners = snapshot.data!.data.banners;
//           return CarouselSlider.builder(
//             carouselController: controller,
//             itemCount: banners.length,
//             itemBuilder:
//                 (BuildContext context, int index, int realIndex) {
//               final banner = banners[index];
//
//               return buildBanner(banner,index);
//             },
//             options: CarouselOptions(
//                 height: 220,
//                 autoPlay: true,
//                 viewportFraction: 1,
//                 onPageChanged: (index, reason) =>
//                     setState(() => activeIndex = index)),
//           );
//         }
//         return SizedBox();
//       },
//     );
//   }
//
//   FutureBuilder<HomeModel> indicator() {
//     return FutureBuilder(
//       future: products,
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return SizedBox();
//         }
//         if (snapshot.hasData){
//           final List<Banners> banners = snapshot.data!.data.banners;
//           return buildIndicator(banners);
//         }
//         return SizedBox();
//       },
//     );
//   }
//
//   Widget buildBanner(Banners banner, int index) => Container(
//     margin: EdgeInsets.symmetric(horizontal: 5),
//     alignment: Alignment.center,
//     child: Image.network(
//       banner.image,
//       width: MediaQuery.of(context).size.width * 0.97,
//       fit: BoxFit.cover,
//     ),
//   );
//
//   Widget buildIndicator(List<Banners> banners) => AnimatedSmoothIndicator(
//     activeIndex: activeIndex,
//     count: banners.length,
//     effect: JumpingDotEffect(
//       dotHeight: 10,
//       dotWidth: 10,
//       activeDotColor: Color(0xff40BFFF),
//       dotColor: Color(0xffEBF0FF),
//     ),
//     onDotClicked: animateToSlide,
//   );
//
//   void animateToSlide(int index) => controller.animateToPage(index);
