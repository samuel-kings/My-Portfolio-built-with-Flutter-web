import 'package:animations/animations.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kings/utils/color.dart';
import 'package:kings/utils/extensions.dart';
import '../routing/consts.dart';
import '../utils/nav_menu.dart';

class PricingScreen extends StatefulWidget {
  const PricingScreen({Key? key}) : super(key: key);

  @override
  State<PricingScreen> createState() => _PricingScreenState();
}

class _PricingScreenState extends State<PricingScreen> {
  @override
  Widget build(BuildContext context) {
    bool _isMobile = MediaQuery.of(context).size.width < 600;
    bool _isDesktop = MediaQuery.of(context).size.width > 810; 
    return Scaffold(
      backgroundColor: Colors.grey[900],
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: OpenContainer(
          transitionDuration: const Duration(seconds: 1),
          closedElevation: 0,
          closedColor: Colors.transparent,
          openColor: Colors.black,
          transitionType: ContainerTransitionType.fade,
          tappable: false,
          closedBuilder: (context, action) {
            return Container(
              margin: const EdgeInsets.only(right: 40, top: 40),
              // alignment: Alignment.topRight,
              child: InkWell(
                  onTap: () {
                    action();
                  },
                  child: Icon(Icons.menu,
                      color: Colors.white, size: _isMobile ? 35 : 40)),
            );
          },
          openBuilder: (context, action) {
            return NavMenu(
              action: action,
              routeName: pricingScreenRoute,
            );
          }),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 60, left: 40),
                  alignment: Alignment.topLeft,
                  child: SelectableText(
                    'Pricing',
                    style: TextStyle(
                      fontSize: _isDesktop ? 50 : 40,
                      color: yellowColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 20, left: 40),
                  alignment: Alignment.topLeft,
                  child: RichText(
                    text: TextSpan(
                      text:
                          'I offer a variety of pricing options for our services. Please',
                      style: GoogleFonts.kurale(
                        fontSize: _isDesktop ? 20 : 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                      children: [
                        TextSpan(
                          text: ' contact me',
                          style: GoogleFonts.kurale(
                            fontSize: _isDesktop  ? 20 : 15,
                            color: yellowColor,
                            fontWeight: FontWeight.w500,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(context, contactScreenRoute);
                            },
                        ),
                        TextSpan(
                          text:
                              ' for more information, custom quote, or other project types not included here',
                          style: GoogleFonts.kurale(
                            fontSize: _isDesktop ? 20 : 15,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                //biz site
                Center(
                    child: Text(
                  'Business Website',
                  style: TextStyle(
                    fontSize: _isDesktop ? 28 : 20,
                    color: yellowColor,
                    fontWeight: FontWeight.w500,
                  ),
                )),
                const SizedBox(height: 10),
                priceWidget([
                  buildPricingCard('wordpress', 'WORDPRESS', '80', '''
✔️ Built with Wordpress
✔️ 5 pages
✔️ Blog page with sidebar [optional]
✔️ Customizable theme
✔️ SEO optimized

Project Duration: 1-2  weeks
Tech Support: 2 weeks
'''),
                  buildPricingCard('programming', 'FULLY CODED', '110', '''
✔️ Fully coded site
✔️ 5 pages
✔️ Blog page with sidebar [optional]
✔️ Customizable theme
✔️ SEO optimized

Project Duration: 1-2  weeks
Tech Support: 2 weeks
'''),
                ]),
                const SizedBox(height: 30),

                //ecommerce
                Center(
                    child: Text(
                  'E-commerce',
                  style: TextStyle(
                    fontSize: _isDesktop ? 28 : 20,
                    color: yellowColor,
                    fontWeight: FontWeight.w500,
                  ),
                )),
                const SizedBox(height: 10),
                priceWidget([
                  buildPricingCard('woocommerce', 'WOOCOMMERCE', '150', '''
✔️ Built with Wordpress WooCommerce
✔️ Admin dashboard
✔️ Blog page with sidebar [optional]
✔️ SEO optimized

Project Duration: 3  weeks
Tech Support: 1 month
'''),
                  buildPricingCard(
                      'woo_apps', 'WOOCOMMERCE + MOBILE APPS', '750', '''
✔️ Website built with Wordpress WooCommerce
✔️ Android + iOS apps
✔️ Admin app
✔️ Delivery app[optional]

Project Duration: 2 months
Tech Support: 2 months
'''),
                  buildPricingCard(
                      'shopping', 'CODED ECOMMERCE SITE', '220', '''
✔️ Website fully built with code
✔️ Admin app
✔️ Delivery system[optional]

Project Duration: 2 months
Tech Support: 1 month
'''),
                  buildPricingCard('code_apps', 'SITE + MOBILE APPS', '870', '''
✔️ Website fully built with codes
✔️ Android + iOS apps
✔️ Admin app
✔️ Delivery app[optional]

Project Duration: 2 months
Tech Support: 1 month
'''),
                ]),
                const SizedBox(height: 30),

                //ecommerce marketplace
                Center(
                    child: Text(
                  'E-commerce Multivendor Marketplace',
                  style: TextStyle(
                    fontSize: _isDesktop ? 28 : 20,
                    color: yellowColor,
                    fontWeight: FontWeight.w500,
                  ),
                )),
                const SizedBox(height: 10),
                priceWidget([
                  buildPricingCard('shopping', 'WEBSITE', '400', '''
✔️ Website fully built with codes
✔️ Admin dashboard
✔️ Blog page with sidebar [optional]
✔️ Vendor dashboard
✔️ Delivery system[optional]
✔️ SEO optimized

Project Duration: 2 months
Tech Support: 2 months
'''),
                  buildPricingCard(
                      'code_apps', 'WEBSITE + MOBILE APPS', '1500', '''
✔️ Website fully built with codes
✔️ Customers app [Android + iOS]
✔️ Admin app
✔️ Vendor app [Android + iOS]
✔️ Delivery app[optional]
✔️ SEO optimized

Project Duration: 3 months
Tech Support: 2 months
'''),
                ]),
                const SizedBox(height: 30),
              ],
            ),
            //footer
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width,
              color: Colors.black,
              child: Center(
                child: Text(
                  '© 2022 Samuel Kings',
                  style: TextStyle(
                    fontSize: _isDesktop ? 20 : 15,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget priceWidget(List<Widget> cardList) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 580,
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(
            dragDevices: {
              PointerDeviceKind.touch,
              PointerDeviceKind.mouse,
            },
          ),
          child: Scrollbar(
            scrollbarOrientation: ScrollbarOrientation.bottom,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              children: cardList,
            ),
          ),
        ));
  }

  Widget buildPricingCard(
      String image, String title, String price, String description) {
    bool isDesktop = MediaQuery.of(context).size.width > 810;
    return Container(
        alignment: Alignment.center,
        padding:
            const EdgeInsets.only(left: 5.0, right: 5, top: 50, bottom: 10),
        margin: const EdgeInsets.only(right: 20, bottom: 20),
        height: 520,
        width: isDesktop ? 380 : 300,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          // boxShadow: const [
          //   BoxShadow(
          //     color: Colors.grey,
          //     spreadRadius: 3,
          //     blurRadius: 3,
          //     offset: Offset(0, 3), // changes position of shadow
          //   ),
          // ],
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Image.asset(
            'assets/pricing_icons/$image.png',
            height: 70,
          ),
          const SizedBox(height: 20),
          Center(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: Text(
              '\$$price',
              style: GoogleFonts.montserrat(
                fontSize: 40,
                color: yellowColor,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 30),
          Center(
              child: Text(
            description,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          )),
        ])).moveUpOnHover.showCursorOnHover;
  }
}
