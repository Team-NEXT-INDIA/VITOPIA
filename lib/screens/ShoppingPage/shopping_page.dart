import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import '../../backend/api_services/ApiService.dart';
import '../../customs/colors.dart';
import '../InformationPage/mentioncolor.dart';
import 'Components/product_card.dart';
import 'Data/product_data_class.dart';

class ShoppingPage extends StatefulWidget {
  @override
  _ShoppingPageState createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
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
    _loadProducts();
  }

  _loadProducts() async {
    setState(() {
      _isLoading = true;
    });
    ApiService api = ApiService();
    try {
      List<Product> products = await api.getProducts();
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
                expandedHeight: 190,
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
                        imageUrl:
                            "https://i.im.ge/2023/01/24/sKSaN6.jacob-nizierski-V0hohwot0oM-unsplash.jpg",
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
                          height: 140.h,
                          width: 135.h,
                        ),
                      ),
                    ),
                  ),
                ),
                pinned: true,
                backgroundColor: mscaffoldBackground,
                surfaceTintColor: const Color(0xff37016b),
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(60.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: FadeIn(
                        child: AnimatedTextKit(
                          totalRepeatCount: 1000,
                          animatedTexts: [
                            ColorizeAnimatedText(
                              'VITOPIA EXCLUSIVE',
                              textStyle: colorizeTextStyle,
                              textAlign: TextAlign.center,
                              colors: colorizeColors,
                            ),
                            ColorizeAnimatedText(
                              'MERCHANDISE',
                              textStyle: colorizeTextStyle,
                              textAlign: TextAlign.center,
                              colors: colorizeColors,
                            ),
                          ],
                          isRepeatingAnimation: true,
                        ),
                      ),
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
                          List<Product> products = await api.getProducts();
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
                                    "Products",
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
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15.h),
                              child: AnimationLimiter(
                                child: StaggeredGridView.countBuilder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  crossAxisCount: 2,
                                  itemCount: _products.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return AnimationConfiguration.staggeredGrid(
                                      position: index,
                                      duration:
                                          const Duration(milliseconds: 375),
                                      columnCount: _products.length,
                                      child: ScaleAnimation(
                                        child: FadeInAnimation(
                                          child: ProductCard(
                                            productName:
                                                _products[index].name ?? "",
                                            productPrice: _products[index]
                                                .price
                                                .toString(),
                                            image: _products[index].image ?? "",
                                            sub_category:
                                                _products[index].sub_category ??
                                                    "",
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  staggeredTileBuilder: (int index) =>
                                      StaggeredTile.count(
                                          1, index.isEven ? 1.8 : 1.9),
                                  mainAxisSpacing: 10.0,
                                  crossAxisSpacing: 4.0,
                                ),
                              ),
                            ),
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
                      (a, b) => (a.price as num).compareTo(b.price as num));
                  _animatedListKey.currentState?.setState(() {});
                  setState(() {});
                  Navigator.pop(context);
                },
              ),
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
