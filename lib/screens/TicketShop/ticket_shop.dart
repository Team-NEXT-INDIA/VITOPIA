import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:vitopia/screens/ShoppingPage/Components/ticket_card.dart';
import 'package:vitopia/screens/TicketShop/Ticket_view.dart';

import '../../backend/api_services/ApiService.dart';
import '../../customs/colors.dart';
import '../InformationPage/mentioncolor.dart';
import '../ShoppingPage/Data/product_data_class.dart';

class TicketShop extends StatefulWidget {
  const TicketShop({super.key});

  @override
  _TicketShopState createState() => _TicketShopState();
}

class _TicketShopState extends State<TicketShop>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  final GlobalKey<AnimatedListState> _animatedListKey =
      GlobalKey<AnimatedListState>();
  bool _isLoading = false;
  bool isSorted = false;
  List<Product> _products = [];
  String? _error;
  String _sortBy = 'price_asc';
  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
    _loadProducts();
  }

  _loadProducts() async {
    setState(() {
      _isLoading = true;
    });
    ApiService api = ApiService();
    try {
      List<Product> products = await api.getTickets();
      setState(() {
        _products = products;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  var colorizeTextStyle = TextStyle(
    fontFamily: 'Monument Extended',
    color: const Color(0xffFFFFFF),
    fontSize: 29.sp,
    fontWeight: FontWeight.bold,
  );
  var colorizeColors = [
    const Color(0xffffffff),
    const Color(0xffcccccc),
    const Color(0xffd3d3d3),
    const Color(0xff7c7c7c),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,

        // floatingActionButton: FloatingActionButton(
        //   onPressed: _loadProducts,
        //   child: const Icon(Icons.refresh),
        // ),
        body: NestedScrollView(
          physics: const NeverScrollableScrollPhysics(),
          headerSliverBuilder: (BuildContext context, bool innerBoxScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 170.h,
                stretch: true,
                automaticallyImplyLeading: false,
                flexibleSpace: FlexibleSpaceBar(
                  background: Align(
                    child: Container(
                      foregroundDecoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.black,
                            Colors.transparent,
                          ],
                          end: Alignment.topCenter,
                          begin: Alignment.bottomCenter,
                          stops: [0, 0.7],
                        ),
                      ),
                      child: CachedNetworkImage(
                        imageUrl: "https://wallpaper.dog/large/20497496.jpg",
                        width: double.infinity,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Shimmer(
                          child: Container(
                            width: double.infinity,
                            color: Colors.black87,
                          ),
                        ),
                        errorWidget: (context, url, error) => Container(
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(0),
                          ),
                          height: 140.h,
                          width: 135.h,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Failed To Load Image",
                                  style: GoogleFonts.montserrat(
                                    color: primaryText,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                pinned: true,
                backgroundColor: mscaffoldBackground,
                surfaceTintColor: const Color(0xff37016b),
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(72.h),
                  child: Padding(
                    padding: EdgeInsets.only(top: 17.h),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: FadeIn(
                            child: AnimatedTextKit(
                              totalRepeatCount: 1000,
                              animatedTexts: [
                                ColorizeAnimatedText(
                                  'GRAB YOUR TICKETS',
                                  textStyle: colorizeTextStyle,
                                  textAlign: TextAlign.center,
                                  colors: colorizeColors,
                                ),
                              ],
                              isRepeatingAnimation: true,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ];
          },
          body: _isLoading
              ? const Center(child: CircularProgressIndicator())
              : _error != null
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/net_error.png",
                            width: 200.w,
                          ),
                          Text(
                            "Oopssss...",
                            style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            _error!,
                            style: GoogleFonts.montserrat(
                              color: Colors.red,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    )
                  : RefreshIndicator(
                      onRefresh: () async {
                        Future.delayed(const Duration(seconds: 1000));
                        setState(() {
                          Future.delayed(const Duration(seconds: 1000));
                          _isLoading = true;
                        });
                        ApiService api = ApiService();
                        try {
                          List<Product> products = await api.getTickets();
                          setState(() {
                            Future.delayed(const Duration(seconds: 1000));
                            _products = products;
                            _isLoading = false;
                          });
                        } catch (e) {
                          setState(() {
                            Future.delayed(const Duration(seconds: 1000));
                            _error = e.toString();
                            _isLoading = false;
                          });
                        }
                      },
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: 18.h,
                                top: 20.h,
                                right: 18.h,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Tickets",
                                    style: TextStyle(
                                      fontFamily: 'Monument Extended',
                                      color: const Color(0xffFFFFFF),
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.filter_list,
                                        color: isSorted
                                            ? Colors.blue
                                            : Colors.grey),
                                    onPressed: () {
                                      buildShowModalBottomSheet(context);
                                    },
                                  ),
                                ],
                              ),
                            ),
                            AnimationLimiter(
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: _products.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return AnimationConfiguration.staggeredList(
                                    position: index,
                                    duration: const Duration(milliseconds: 375),
                                    child: ScaleAnimation(
                                      child: FadeInAnimation(
                                        child: TicketCard(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                CupertinoPageRoute(
                                                    builder: (context) =>
                                                        Ticket_view(
                                                          product: Product(
                                                            id: _products[index]
                                                                .id,
                                                            name:
                                                                _products[index]
                                                                    .name,
                                                            sub_category:
                                                                _products[index]
                                                                    .sub_category,
                                                            description:
                                                                _products[index]
                                                                    .description,
                                                            price:
                                                                _products[index]
                                                                    .price,
                                                            image:
                                                                _products[index]
                                                                    .image,
                                                            sku:
                                                                _products[index]
                                                                    .sku,
                                                          ),
                                                        )));
                                          },
                                          productName:
                                              _products[index].name ?? "",
                                          productPrice:
                                              _products[index].price.toString(),
                                          image: _products[index].image ?? "",
                                          sub_category:
                                              _products[index].sub_category ??
                                                  "",
                                          description:
                                              _products[index].description ??
                                                  "",
                                          SKU: _products[index].sku ?? "",
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _products.isEmpty
                                    ? Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Lost in Moon',
                                              style: TextStyle(
                                                fontFamily: 'Monument Extended',
                                                color: Colors.white,
                                                fontSize: 17.sp,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                            Text(
                                              'No Tickets Found',
                                              style: TextStyle(
                                                fontFamily: 'Monument Extended',
                                                color: const Color(0xFFB4B4B4),
                                                fontSize: 9.sp,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : Text(
                                        "End of Products",
                                        style: TextStyle(
                                          fontFamily: 'Monument Extended',
                                          color: const Color(0xFFB4B4B4),
                                          fontSize: 9.sp,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                              ],
                            ),
                            SizedBox(
                              height: 20.h,
                            )
                          ],
                        ),
                      ),
                    ),
        ));
  }

  Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: const Color(0xdf2f2f2f),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: const Icon(
                  FontAwesomeIcons.sortAmountUp,
                  color: Colors.white,
                ),
                title: Text(
                  "Price Low To High",
                  style: GoogleFonts.montserrat(
                    color: const Color(0xffFFFFFF),
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () {
                  isSorted = !isSorted;
                  _products.sort(
                      (a, b) => (a.price as num).compareTo(b.price as num));
                  _animatedListKey.currentState?.setState(() {});
                  setState(() {});
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(
                  FontAwesomeIcons.sortAmountDown,
                  color: Colors.white,
                ),
                title: Text(
                  "Price High To Low",
                  style: GoogleFonts.montserrat(
                    color: const Color(0xffFFFFFF),
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () {
                  isSorted = !isSorted;
                  _products.sort(
                      (a, b) => (b.price as num).compareTo(a.price as num));
                  _animatedListKey.currentState?.setState(() {});
                  setState(() {});
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _sortProducts() {
    if (_sortBy == 'price_asc') {
      _products.sort((a, b) => (a.price as num).compareTo(b.price as num));
    } else if (_sortBy == 'price_desc') {
      _products.sort((a, b) => (b.price as num).compareTo(a.price as num));
    }
    _animatedListKey.currentState?.setState(() {});
    setState(() {});
  }
}
