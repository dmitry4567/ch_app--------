import 'package:LockStore/cart/desktop/cartdialog_widget.dart';
import 'package:LockStore/cart/mobile/cartdialog_widget.dart';
import 'package:LockStore/category/category_widget.dart';
import 'package:LockStore/flutter_flow/nav/nav.dart';
import 'package:LockStore/home/home_widget.dart';
import 'package:LockStore/home/model.dart';
import 'package:LockStore/layout/adaptive.dart';
import 'package:LockStore/product/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({
    Key? key,
    required this.initialPage,
    this.params,
  }) : super(key: key);

  final String initialPage;
  final FFParameters? params;

  @override
  State<NavBarWidget> createState() => NavBarPageState();
}

class NavBarPageState extends State<NavBarWidget> {
  late Widget _currentPageName;

  Map<String, Widget> _tabs = {
    'Home': HomePage(),
    'Category': CategoryPage(),
  };

  @override
  void initState() {
    super.initState();
    _currentPageName = const HomePage();
  }

  void changePage(int value, Product product) {
    setState(() {
      _currentPageName = ProductPage(productId: product.id.toString());
    });
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final isDesktop = isDisplayDesktop(context);
    // final currentIndex = _tabs.keys.toList().indexOf(_currentPageName);

    return Scaffold(
      key: _key,
      appBar: !isDesktop
          ? AppBar(
              backgroundColor: Colors.white,
              leading: GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.menu,
                  size: 30,
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(
                    right: 16,
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                          width: 32, height: 32, "assets/icons/heart.svg"),
                      const SizedBox(
                        width: 24,
                      ),
                      IconButton(
                        onPressed: () {
                          _showSimpleDialog(context, isDesktop);
                        },
                        icon: SvgPicture.asset(
                            width: 32, height: 32, "assets/icons/shop.svg"),
                      )
                    ],
                  ),
                ),
              ],
            )
          : null,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          _currentPageName,
          isDesktop
              ? Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 82,
                    color: Colors.white,
                    child: Stack(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 100),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              _currentPageName =
                                                  const HomePage();
                                            });
                                          },
                                          child: SvgPicture.asset(
                                            width: 50,
                                            height: 42,
                                            "assets/icons/logo.svg",
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 100,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              _currentPageName =
                                                  const HomePage();
                                            });
                                          },
                                          child: const Text(
                                            "Главная",
                                            style: TextStyle(
                                                color: Color(0xff161C24),
                                                fontSize: 18,
                                                fontFamily: "SF",
                                                fontWeight: FontWeight.w300),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 32,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              _currentPageName =
                                                  const CategoryPage();
                                            });
                                          },
                                          child: const Text(
                                            "Каталог",
                                            style: TextStyle(
                                                color: Color(0xff161C24),
                                                fontSize: 18,
                                                fontFamily: "SF",
                                                fontWeight: FontWeight.w300),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 32,
                                        ),
                                        const Text(
                                          "Оптовая продажа",
                                          style: TextStyle(
                                              color: Color(0xff161C24),
                                              fontSize: 18,
                                              fontFamily: "SF",
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ],
                                    ),

                                    Row(
                                      children: [
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                              width: 20,
                                              height: 20,
                                              "assets/icons/phone.svg",
                                            ),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            const Text(
                                              "+7 (966) 55 88 499",
                                              style: TextStyle(
                                                  color: Color(0xff454F5B),
                                                  fontSize: 16,
                                                  fontFamily: "SF",
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 30,
                                        ),
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                _showSimpleDialog(
                                                    context, isDesktop);
                                              },
                                              child: SvgPicture.asset(
                                                  width: 32,
                                                  height: 32,
                                                  "assets/icons/heart.svg"),
                                            ),
                                            const SizedBox(
                                              width: 24,
                                            ),
                                            InkWell(
                                              onTap: () async {
                                                final prefs =
                                                    await SharedPreferences
                                                        .getInstance();

                                                setState(() {
                                                  prefs.clear();

                                                  context.push("/signIn");
                                                });
                                              },
                                              child: SvgPicture.asset(
                                                  width: 32,
                                                  height: 32,
                                                  "assets/icons/shop.svg"),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )

                                    // GestureDetector(
                                    //   onTap: () {
                                    //     setState(() {
                                    //       _currentPageName = _tabs.keys.toList()[0];
                                    //     });
                                    //   },
                                    //   child: Container(
                                    //     width: 50,
                                    //     height: 30,
                                    //     color: Colors.white,
                                    //     child: const Text(
                                    //       "fsefs1",
                                    //       style: TextStyle(color: Colors.black),
                                    //     ),
                                    //   ),
                                    // ),
                                    // GestureDetector(
                                    //   onTap: () {
                                    //     setState(() {
                                    //       _currentPageName = _tabs.keys.toList()[1];
                                    //     });
                                    //   },
                                    //   child: Container(
                                    //     width: 50,
                                    //     height: 30,
                                    //     color: Colors.white,
                                    //     child: const Text(
                                    //       "fsefs2",
                                    //       style: TextStyle(color: Colors.black),
                                    //     ),
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Divider(
                            height: 0,
                            indent: 0,
                            thickness: 1,
                            color: Colors.grey.shade300,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}

void _showSimpleDialog(context, bool isDesktop) {
  showDialog(
    context: context,
    builder: (dialogContext) {
      return isDesktop ? const CartDialogDesktop() : const CartDialogMobile();
    },
  );
}
