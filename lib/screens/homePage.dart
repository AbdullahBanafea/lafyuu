import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:lafyuu/model/categorey_response.dart';
import 'package:lafyuu/model/home_response.dart';
import 'package:lafyuu/repository/home_repositary.dart';
import 'package:lafyuu/screens/FavoritesScreen.dart';
import 'package:lafyuu/screens/productDetail.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
    Categoty('bikini', 'assets/icons/bikini.svg')
  ];
  final List<Categoty> productsList = [
    Categoty(
        'FS - QUILTED MAXI CROS...', 'assets/flashSaleImages/image 46.png'),
    Categoty('FS - Nike Air Max 270 React...',
        'assets/flashSaleImages/image 47.png'),
    Categoty(
        'FS - QUILTED MAXI CROS...', 'assets/flashSaleImages/image 48.png'),
    Categoty('FS - Nike Air Max 270 React...',
        'assets/flashSaleImages/image 49.png'),
    Categoty('FS - Nike Air Max 270 React...',
        'assets/flashSaleImages/image 52.png'),
    Categoty(
        'FS - QUILTED MAXI CROS...', 'assets/flashSaleImages/image 53.png'),
    Categoty('FS - Nike Air Max 270 React...',
        'assets/flashSaleImages/image 54.png'),
    Categoty('FS - Nike Air Max 270 React...',
        'assets/flashSaleImages/image 55.png'),
  ];

  late Future<CategoryModel> categories = HomeRepository().getCategorys();
  late Future<HomeModel> products = HomeRepository().getHome();

  @override
  void initState() {
    super.initState();
    categories = HomeRepository().getCategorys();
    products = HomeRepository().getHome();
  }

  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.sizeOf(context).width;
    final heightScreen = MediaQuery.sizeOf(context).height;
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
                  IconButton(
                    onPressed: () {
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Favorite())
                      );
                    },
                    icon: Icon(Icons.favorite_border_outlined,
                        color: Colors.grey, size: 32),
                  ),
                  Icon(Icons.notifications_none_outlined,
                      color: Colors.grey, size: 32),
                ],
              ),

              //images Slider
              slideBar(),
              SizedBox(height: 15),
              //dots of the slider
              indicator(),
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
                    width: widthScreen * 0.25,
                  ),
                  Text(
                    'More Category',
                    style: TextStyle(
                        color: Color(0xff40BFFF),
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 15),

              //Icons slider
              listOfCategories(),

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
              listOfFlashSales(),
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
              listOfFlashSales(),
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
                      width: 250,
                      height: 85,
                      child: Text(
                        'Recomended Product',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
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

              // gridView builder
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: gridViewProducts(),
              )
            ],
          ),
        ],
      ),
    );
  }

  FutureBuilder<HomeModel> gridViewProducts() {
    return FutureBuilder(
                future: products,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return SizedBox();
                  }
                  if (snapshot.hasData) {
                    final List<Product> product =
                        snapshot.data!.data.products;
                    return GridView.builder(
                        gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisExtent: 310,
                                crossAxisSpacing: 7),
                        physics:
                            NeverScrollableScrollPhysics(), // to disable GridView's scrolling
                        shrinkWrap: true, // You won't see infinite size error
                        itemCount: product.length,
                        itemBuilder: (BuildContext context, int index) {
                          return buildGridView(product[index], index);
                        });
                  }
                  return SizedBox();
                },
              );
  }

  FutureBuilder<HomeModel> slideBar() {
    return FutureBuilder(
      future: products,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SizedBox();
        }
        if (snapshot.hasError) {
          return const Text('there is an error try again!');
        }
        if (snapshot.hasData) {
          final List<Banners> banners = snapshot.data!.data.banners;
          return CarouselSlider.builder(
            carouselController: controller,
            itemCount: banners.length,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              final banner = banners[index];

              return buildBanner(banner, index);
            },
            options: CarouselOptions(
                height: 220,
                autoPlay: true,
                viewportFraction: 1,
                onPageChanged: (index, reason) =>
                    setState(() => activeIndex = index)),
          );
        }
        return SizedBox();
      },
    );
  }

  FutureBuilder<HomeModel> indicator() {
    return FutureBuilder(
      future: products,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SizedBox();
        }
        if (snapshot.hasData) {
          final List<Banners> banners = snapshot.data!.data.banners;
          return buildIndicator(banners);
        }
        return SizedBox();
      },
    );
  }

  FutureBuilder<CategoryModel> listOfCategories() {
    return FutureBuilder(
      future: categories,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SizedBox();
        }
        if (snapshot.hasError) {
          return const Text('there is an error try again!');
        }

        if (snapshot.hasData) {
          final CategoryModel categories = snapshot.data!;
          return SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.data.data.length,
                itemBuilder: (BuildContext context, int index) {
                  final category = categories.data.data[index];
                  return buildIcon(category, index);
                },
              ));
        }

        return SizedBox();
      },
    );
  }

  FutureBuilder<HomeModel> listOfFlashSales() {
    return FutureBuilder(
      future: products,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SizedBox();
        }
        if (snapshot.hasError) {
          return const Text('there is an error try again!');
        }

        if (snapshot.hasData) {
          final List<Product> products = snapshot.data!.data.products;
          return Container(
            height: 250,
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) {
                final product = products[index];
                return buildProducts(product, index);
              },
            ),
          );
        }
        return SizedBox();
      },
    );
  }

  Widget buildBanner(Banners banner, int index) => Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        alignment: Alignment.center,
        child: Image.network(
          banner.image,
          width: MediaQuery.of(context).size.width * 0.97,
          fit: BoxFit.cover,
        ),
      );

  Widget buildIndicator(List<Banners> banners) => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: banners.length,
        effect: JumpingDotEffect(
          dotHeight: 10,
          dotWidth: 10,
          activeDotColor: Color(0xff40BFFF),
          dotColor: Color(0xffEBF0FF),
        ),
        onDotClicked: animateToSlide,
      );

  void animateToSlide(int index) => controller.animateToPage(index);

  Widget buildIcon(Datum category, int index) => Padding(
        padding: const EdgeInsets.all(1.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Color(0xffEBF0FF)),
                  borderRadius: BorderRadius.circular(100)),
              child: CircleAvatar(
                radius: 37,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage(category.image),
                ),
              ),
            ),
            SizedBox(
              height: 7,
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.25,
              child: Text(category.name,
                  style: TextStyle(color: Color(0xff9098B1)),
                  textAlign: TextAlign.center),
            ),
          ],
        ),
      );

  Widget buildProducts(Product product, int index) => Padding(
        padding: const EdgeInsets.all(5.0),
        child: FittedBox(
          fit: BoxFit.fitHeight,
          child: Container(
            height: 270,
            width: 156,
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Color(0xffEBF0FF)),
                borderRadius: BorderRadius.circular(5)),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductDetail(product: product)),
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
                    height: 10,
                  ),
                  SizedBox(
                    height: 115,
                    width: 115,
                    child: Image.network(product.image),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Container(
                    child: Text(product.name,
                        maxLines: 1,
                        style: TextStyle(
                          color: Color(0xff223263),
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        )),
                  ),
                  SizedBox(
                    height: 9,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(product.price.toString(),
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
                      Text(product.oldPrice.toString(),
                          style: TextStyle(
                              color: Color(0xff9098B1),
                              fontSize: 12,
                              decoration: TextDecoration.lineThrough)),
                      SizedBox(
                        width: 7,
                      ),
                      Text(
                        '%${product.discount.toString()}',
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
        ),
      );

  Widget buildGridView(Product product, int index) => Padding(
        padding: const EdgeInsets.all(5.0),
        child: FittedBox(
          fit: BoxFit.fill,
          child: Container(
            height: 310,
            width: 145,
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Color(0xffEBF0FF)),
                borderRadius: BorderRadius.circular(5)),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductDetail(product: product)),
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
                        maxLines: 2,
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
                  SizedBox(height: 15),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text('\$${product.price}',
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
                      Text('\$${product.oldPrice}',
                          style: TextStyle(
                              color: Color(0xff9098B1),
                              fontSize: 12,
                              decoration: TextDecoration.lineThrough)),
                      SizedBox(
                        width: 7,
                      ),
                      Text(
                        '\$${product.discount}',
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
        ),
      );
}

class Categoty {
  final String name;
  final String image;

  Categoty(this.name, this.image);
}
