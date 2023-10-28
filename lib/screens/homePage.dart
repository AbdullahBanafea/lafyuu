import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = CarouselController();
  int activeIndex = 0;
  final assetImages = [
    'assets/images/Promotion Image.png',
    'assets/images/Promotion Image.png',
    'assets/images/Promotion Image.png',
    'assets/images/Promotion Image.png',
    'assets/images/Promotion Image.png',
  ];
  final List<Categoty> icons = [
    Categoty('shirt', 'assets/icons/shirt.svg'),
    Categoty('dress', 'assets/icons/dress.svg'),
    Categoty('Man Work Equipment', 'assets/icons/man bag.svg'),
    Categoty('woman bag', 'assets/icons/woman bag.svg'),
    Categoty('man shoes', 'assets/icons/man shoes.svg'),
    Categoty('woman shoes', 'assets/icons/woman shoes.svg'),
    Categoty('man pants', 'assets/icons/man pants.svg'),
    Categoty('woman pants', 'assets/icons/woman pants.svg'),
    Categoty('skirt', 'assets/icons/skirt.svg'),
    Categoty('T-shirt', 'assets/icons/Tshirt.svg'),
    Categoty('woman T-shirt', 'assets/icons/woman tshirt.svg'),
    Categoty('man underwear', 'assets/icons/man underwear.svg'),
    Categoty('bikini', 'assets/icons/bikini.svg'),
  ];

  final List<Categoty> products = [
    Categoty('FS - QUILTED MAXI CROS...', 'assets/flashSaleImages/image 46.png'),
    Categoty('FS - Nike Air Max 270 React...', 'assets/flashSaleImages/image 47.png'),
    Categoty('FS - QUILTED MAXI CROS...', 'assets/flashSaleImages/image 48.png'),
    Categoty('FS - Nike Air Max 270 React...', 'assets/flashSaleImages/image 49.png'),
    Categoty('FS - Nike Air Max 270 React...', 'assets/flashSaleImages/image 52.png'),
    Categoty('FS - QUILTED MAXI CROS...', 'assets/flashSaleImages/image 53.png'),
    Categoty('FS - Nike Air Max 270 React...', 'assets/flashSaleImages/image 54.png'),
    Categoty('FS - Nike Air Max 270 React...', 'assets/flashSaleImages/image 55.png'),
  ];


  @override
  Widget build(BuildContext context) {
    return Center(
              child: ListView(
            children: [
              Column(
                children: [
                  //Search bar & 2 icons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        margin: EdgeInsets.only(top: 20, bottom: 10),
                        child: TextField(
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(
                                        width: 1, color: Color(0xffEBF0FF))),
                                prefixIcon: Icon(Icons.search_outlined,
                                    color: Color(0xff6dceff)),
                                label: (Text(
                                  'Search Product',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xff9098B1),
                                      fontWeight: FontWeight.w400),
                                )))),
                      ),
                      Icon(Icons.favorite_border_outlined,
                          color: Color(0xffbbbdcc), size: 32),
                      Icon(Icons.notifications_none_outlined,
                          color: Color(0xffbbbdcc), size: 32),
                    ],
                  ),
                  //images Slider
                  Container(
                    child: CarouselSlider.builder(
                      carouselController: controller,
                      itemCount: 5,
                      itemBuilder:
                          (BuildContext context, int index, int realIndex) {
                        final assetImage = assetImages[index];

                        return buildImage(assetImage, index);
                      },
                      options: CarouselOptions(
                          height: 220,
                          autoPlay: true,
                          viewportFraction: 1,
                          onPageChanged: (index, reason) =>
                              setState(() => activeIndex = index)),
                    ),
                  ),
                  SizedBox(height: 15),
                  //dots of the slider
                  bulidIndicator(),
                  SizedBox(height: 15),
                  //Category & See More Link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Category',
                        style: TextStyle(
                            color: Color(0xff223263),
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.37,
                      ),
                      Text(
                        'More Category Link',
                        style: TextStyle(
                            color: Color(0xff40BFFF),
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  //Icons slider
                  SizedBox(
                    height: 122,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: icons.length,
                      itemBuilder: (BuildContext context, int index) {
                        return buildIcon(icons[index].name, icons[index].image);
                      },
                    ),
                  ),
                  SizedBox(height: 15),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Flash Sale',
                        style: TextStyle(
                            color: Color(0xff223263),
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.37,
                      ),
                      Text(
                        'See More',
                        style: TextStyle(
                            color: Color(0xff40BFFF),
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  //Flash Sale
                  Container(
                    height: 250,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: products.length,
                      itemBuilder: (BuildContext context, int index) {
                        return buildFlashSale(products[index].name, products[index].image);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Mega Sale',
                        style: TextStyle(
                            color: Color(0xff223263),
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.37,
                      ),
                      Text(
                        'See More',
                        style: TextStyle(
                            color: Color(0xff40BFFF),
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  //Mega Sale
                  Container(
                    height: 250,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: products.length,
                      itemBuilder: (BuildContext context, int index) {
                        return buildFlashSale(products[index].name, products[index].image);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Stack(
                    children: [
                      Container(
                        width: 382,
                        height: 206,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.amber),
                        child: Image.asset(
                          'assets/images/shoes2.png',
                          width: MediaQuery.of(context).size.width * 0.92,
                          height: 206,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Positioned(
                        child: SizedBox(
                          width: 172,
                          height: 72,
                          child: Text(
                            'Recomended Product',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 29,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        top: 40,
                        left: 30,
                      ),
                      Positioned(
                        child: SizedBox(
                          height: 22,
                          child: Text(
                            'We recommend the best for you',
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        ),
                        bottom: 40,
                        left: 30,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),

                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 310,
                          crossAxisSpacing: 7),
                      physics:
                          NeverScrollableScrollPhysics(), // to disable GridView's scrolling
                      shrinkWrap: true, // You won't see infinite size error
                      itemCount: products.length,
                      itemBuilder: (BuildContext context, int index) {
                        return buildGridView(products[index].name, products[index].image);
                      },
                    ),
                  )
                ],
              ),
            ],
          ),
    );
  }

  Widget buildImage(String assetImage, int index) => Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        alignment: Alignment.center,
        child: Stack(
          children: [
            Image.asset(
              assetImage,
              width: MediaQuery.of(context).size.width * 0.97,
              fit: BoxFit.cover,
            ),
            Positioned(
              child: SizedBox(
                width: 280,
                child: Text(
                  'Super Flash Sale 50% off',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 33,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.justify,
                ),
              ),
              top: 37,
              left: 30,
            ),
            Positioned(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)),
                    width: 45,
                    height: 45,
                    alignment: Alignment.center,
                    child: Text(
                      '08',
                      style: TextStyle(
                          color: Color(0xff223263),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(':',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)),
                    width: 45,
                    height: 45,
                    alignment: Alignment.center,
                    child: Text(
                      '34',
                      style: TextStyle(
                          color: Color(0xff223263),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(':',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)),
                    width: 45,
                    height: 45,
                    alignment: Alignment.center,
                    child: Text(
                      '52',
                      style: TextStyle(
                          color: Color(0xff223263),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              top: 145,
              left: 30,
              width: MediaQuery.of(context).size.width * 0.4,
            ),
          ],
        ),
      );

  Widget bulidIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: assetImages.length,
        effect: JumpingDotEffect(
          dotHeight: 10,
          dotWidth: 10,
          activeDotColor: Color(0xff40BFFF),
          dotColor: Color(0xffEBF0FF),
        ),
        onDotClicked: animateToSlide,
      );

  void animateToSlide(int index) => controller.animateToPage(index);

  Widget buildIcon(String name, String image) => Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Color(0xffEBF0FF)),
                  borderRadius: BorderRadius.circular(100)),
              child: CircleAvatar(
                radius: 35,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: SvgPicture.asset(
                      image,
                      height: 24,
                      width: 24,
                    )),
              ),
            ),
            SizedBox(
              height: 7,
            ),
            Text(name,
                style: TextStyle(color: Color(0xff9098B1)),textAlign: TextAlign.justify),
          ],
        ),
      );

  Widget buildFlashSale(String name, String image) => Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          height: 238,
          width: 145,
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: Color(0xffEBF0FF)),
              borderRadius: BorderRadius.circular(5)),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              fixedSize: Size(MediaQuery.of(context).size.width,
                  MediaQuery.of(context).size.height),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 115,
                  width: 115,
                  child: Image.asset(image),
                ),
                SizedBox(
                  height: 7,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(name,
                      style: TextStyle(
                          color: Color(0xff223263),
                          fontWeight: FontWeight.bold,
                          fontSize: 14)),
                ),
                SizedBox(
                  height: 9,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text('\$299,43',
                      style: TextStyle(
                          color: Color(0xff40BFFF),
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                      textAlign: TextAlign.justify),
                ),
                SizedBox(
                  height: 9,
                ),
                Row(
                  children: [
                    Text('\$534,33',
                        style: TextStyle(
                            color: Color(0xff9098B1),
                            fontSize: 12,
                            decoration: TextDecoration.lineThrough)),
                    SizedBox(
                      width: 7,
                    ),
                    Text(
                      '\$24% off',
                      style: TextStyle(
                          color: Color(0xffFB7181),
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );

  Widget buildMegaSale(String name, String image) => Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          height: 238,
          width: 145,
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: Color(0xffEBF0FF)),
              borderRadius: BorderRadius.circular(5)),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              fixedSize: Size(MediaQuery.of(context).size.width,
                  MediaQuery.of(context).size.height),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 115,
                  width: 115,
                  child: Image.asset(image),
                ),
                SizedBox(
                  height: 7,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(name,
                      style: TextStyle(
                          color: Color(0xff223263),
                          fontWeight: FontWeight.bold,
                          fontSize: 14)),
                ),
                SizedBox(
                  height: 9,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text('\$299,43',
                      style: TextStyle(
                          color: Color(0xff40BFFF),
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                      textAlign: TextAlign.justify),
                ),
                SizedBox(
                  height: 9,
                ),
                Row(
                  children: [
                    Text('\$534,33',
                        style: TextStyle(
                            color: Color(0xff9098B1),
                            fontSize: 12,
                            decoration: TextDecoration.lineThrough)),
                    SizedBox(
                      width: 7,
                    ),
                    Text(
                      '\$24% off',
                      style: TextStyle(
                          color: Color(0xffFB7181),
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );

  Widget buildGridView(String name, String image) => Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          height: 238,
          width: 145,
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: Color(0xffEBF0FF)),
              borderRadius: BorderRadius.circular(5)),
          child: ElevatedButton(
            onPressed: () {},
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
                SizedBox(
                  height: 140,
                  width: 140,
                  child: Image.asset(image),
                ),
                SizedBox(
                  height: 7,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(name,
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
                SizedBox(height: 15),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text('\$299,43',
                      style: TextStyle(
                          color: Color(0xff40BFFF),
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                      textAlign: TextAlign.justify),
                ),
                SizedBox(
                  height: 9,
                ),
                Row(
                  children: [
                    Text('\$534,33',
                        style: TextStyle(
                            color: Color(0xff9098B1),
                            fontSize: 12,
                            decoration: TextDecoration.lineThrough)),
                    SizedBox(
                      width: 7,
                    ),
                    Text(
                      '\$24% off',
                      style: TextStyle(
                          color: Color(0xffFB7181),
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
}


class Categoty {
  final String name;
  final String image;

  Categoty(this.name, this.image);
}