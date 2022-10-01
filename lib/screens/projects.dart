import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hovering/hovering.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utils/color.dart';
import '../utils/nav_menu.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';
import '../utils/router.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({Key? key}) : super(key: key);

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  final CarouselController _controller = CarouselController();

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
                  child: Icon(Icons.menu, color: Colors.white, size: _isMobile ? 35 : 40)),
            );
          },
          openBuilder: (context, action) {
            return NavMenu(
              action: action,
              routeName: projectsScreenRoute,
            );
          }),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 0),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 60),
                    alignment: _isDesktop ? Alignment.topLeft : Alignment.topCenter,
                    child: SelectableText.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'My ',
                            style: TextStyle(
                              fontSize: _isDesktop ? 80 : 60,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: 'Projects',
                            style: TextStyle(
                              fontSize: _isDesktop ? 80 : 60,
                              color: yellowColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: _isDesktop ? Alignment.topLeft : Alignment.topCenter,
                    child: SelectableText(
                      'I have worked on a number of projects, some of which are listed below.',
                      style: TextStyle(
                        fontSize: _isDesktop ? 24 : 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  projectCards()
                ],
              ),
            ),
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

  Widget projectCards() {
    bool _isTab = MediaQuery.of(context).size.width < 810 && MediaQuery.of(context).size.width > 420;
    bool _isMobile = MediaQuery.of(context).size.width < 600;
    bool _isDesktop = MediaQuery.of(context).size.width > 810;

    return GridView.count(
      crossAxisCount: _isDesktop
          ? 3
          : _isTab
              ? 2
              : _isMobile
                  ? 1
                  : 3,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      childAspectRatio: _isMobile
          ? 0.8
          : _isTab
              ? 0.8
              : 1.2,
      children: [
        // football vidz
        _buildProjectsCards([
          myImage('football_vidz/1.png'),
          myImage('football_vidz/2.png'),
          myImage('football_vidz/3.jpg'),
          myImage('football_vidz/4.png'),
          myImage('football_vidz/5.png'),
          myImage('football_vidz/6.png'),
        ],
            'Football Vidz',
            'A football video app that allows users to watch football highlights and get football live scores with the ability to create an account and save highlights for later. It was built with Flutter and Appwrite as the backend. It is currently available on the Play Store.',
            'https://play.google.com/store/apps/details?id=com.lds.football_vidz',
            isApp: true, isWeb: false),
        // fwoo demo store
        _buildProjectsCards([
          myImage('fwoo_demo_store/1.jpg'),
          myImage('fwoo_demo_store/2.jpg'),
          myImage('fwoo_demo_store/3.png'),
          myImage('fwoo_demo_store/4.png'),
          myImage('fwoo_demo_store/5.png'),
          myImage('fwoo_demo_store/6.png'),
          myImage('fwoo_demo_store/7.png'),
        ],
            'Fwoo Demo Store',
            'Fwoo Demo Store is a demo e-commerce app built with Flutter and uses WordPress WooCommerce as the backend. It is built for Android and iOS but currently available on the Play Store.',
            'https://play.google.com/store/apps/details?id=com.flutter.woocommerce',
            isWeb: false, isApp: true),
        // gibson school
        _buildProjectsCards([
          myImage('gibson_school/1.jpg'),
          myImage('gibson_school/2.png'),
          myImage('gibson_school/3.png'),
          myImage('gibson_school/4.png'),
        ],
            'Gibson School E-library',
            'An electronic library for Gibson Schools, Ikorodu containing lesson notes and teaching aids',
            'https://play.google.com/store/apps/details?id=com.lds.elibrary',
            isWeb: false, isApp: true),
        // afrihome depot
        _buildProjectsCards([
          'assets/afrihome/1.JPG',
          'assets/afrihome/2.JPG',
          'assets/afrihome/3.jfif',
          'assets/afrihome/4.jfif',
          'assets/afrihome/5.jfif',
          'assets/afrihome/6.jfif',
          'assets/afrihome/7.jfif',
          'assets/afrihome/8.jfif',
        ],
            'Afrihome Depot',
            'Afrihome Depot is an online one-stop centre that provides all Home or Office Interior, Exterior and Service solutions. It is a hub where builders, interior designers, construction stake-holders and every home or office owners alike can shop for goods or request services for the construction or enhancement of homes and work spaces.',
            'http://afrihomedepot.com/',
            isApp: true, isWeb: true),
        // bezalio
        _buildProjectsCards([
          'assets/bezalio/1.JPG',
          'assets/bezalio/2.JPG',
          'assets/bezalio/3.JPG',
          'assets/bezalio/4.JPG',
          'assets/bezalio/5.jfif',
          'assets/bezalio/6.jfif',
          'assets/bezalio/7.jfif',
          'assets/bezalio/8.jfif',
        ],
            'Bezalio Hub',
            'Bezalio Hub is a market place for products and home services with their primary market being the American and European States.',
            'https://bezaliohub.com/',
            isApp: true, isWeb: true),
        // borku
        _buildProjectsCards([
          'assets/borku/1.JPG',
          'assets/borku/2.jfif',
          'assets/borku/3.jfif',
          'assets/borku/4.jfif',
          'assets/borku/5.jfif',
          'assets/borku/6.jfif',
          'assets/borku/7.jfif',
          'assets/borku/8.jfif',
        ],
            'Borku Africa',
            'Borku Africa is an online marketplace for where all Africans in diaspora can buy and sell African products and services., ',
            'https://borkuafrica.com/',
            isApp: true, isWeb: true),
        // inaspace
        _buildProjectsCards(
            [
              'assets/inaspace/1.JPG',
              'assets/inaspace/2.JPG',
              'assets/inaspace/3.JPG',
              'assets/inaspace/4.JPG',
              'assets/inaspace/5.JPG',
            ],
            'Inaspace Design',
            '''Iná Space Design is an Interior Design firm in Lagos, Nigeria. We design and deliver high-end, exquisite interiors designs for our clients for their residences, offices, events, etc to suit lifestyle as well as other purposes.
We are also open for consultation, whereby we help you plan and make designs that are most suitable for your business and homes, thus facilitating comfort and customer attraction as the case may be.''',
            'https://inaspacedesign.com/',
            isApp: false,
            isWeb: true),
        // petonyx
        _buildProjectsCards(
            [
              'assets/petonyx/1.JPG',
              'assets/petonyx/2.JPG',
              'assets/petonyx/3.JPG',
              'assets/petonyx/4.JPG',
              'assets/petonyx/5.JPG',
            ],
            'Petonyx Educational Consult',
            '''Petonyx Educational Consult is an Organization established in 2018 with a mission to deliver exceptional International educational consulting services to students, parents and secondary schools.

We do this by giving a unique yet simple curriculum and modules of each examination, detailed explanation of each module and guide to passing examination , we teach using a comprehensive mark guide of each examination to ensure students pass their examination in just one sitting.''',
            'https://petonyx.com/',
            isApp: false,
            isWeb: true),
        // rightdeal
        _buildProjectsCards([
          'assets/rightdeal/1.JPG',
          'assets/rightdeal/2.JPG',
          'assets/rightdeal/3.JPG',
          'assets/rightdeal/4.JPG',
        ],
            'RightDeal Consulting',
            'RightDeal Consulting Limited is a firm that provides lots of services to see that small to large businesses grow and increase revenue. To this effect, we offer a wide range of services such as Business consulting, increasing customer base, brand and services promotion, market research, job recruiting, just to mention a few.',
            'https://rightdealconsulting.com/',
            isApp: false, isWeb: true),
      ],
    );
  }

  Widget _buildProjectsCards(List<String> images, String title, String desc, String url,
      {required bool isWeb, required bool isApp}) {
    bool _isMobile = MediaQuery.of(context).size.width < 600;
    return Column(
      children: [
        // image
        OpenContainer(
            transitionDuration: const Duration(seconds: 1),
            closedElevation: 0,
            closedColor: Colors.transparent,
            openColor: Colors.black,
            transitionType: ContainerTransitionType.fadeThrough,
            closedBuilder: (context, action) {
              return HoverAnimatedContainer(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                height: 200,
                width: 400,
                hoverHeight: 203,
                hoverWidth: 403,
                // hoverColor: yellowColor,
                duration: const Duration(milliseconds: 500),
                cursor: SystemMouseCursors.click,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                  image: DecorationImage(
                    image: AssetImage(images[0]),
                    fit: BoxFit.fill,
                  ),
                ),
                hoverDecoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(
                    color: yellowColor,
                    width: 2,
                  ),
                  image: DecorationImage(
                    image: AssetImage(images[0]),
                    fit: BoxFit.fill,
                  ),
                ),
                foregroundDecoration: const BoxDecoration(color: Colors.transparent),
                hoverForegroundDecoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                ),
              );
            },
            openBuilder: (context, action) {
              return Scaffold(
                backgroundColor: Colors.black,
                body: SingleChildScrollView(
                    child: Padding(
                  padding: EdgeInsets.all(_isMobile ? 5 : 30),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: _isMobile ? 25 : 0, right: _isMobile ? 25 : 0),
                        alignment: Alignment.topRight,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              action();
                            });
                          },
                          child: const Icon(Icons.close, color: Colors.white, size: 40),
                        ),
                      ),
                      const SizedBox(height: 100),
                      projectImages(images, context)
                    ],
                  ),
                )),
              );
            }),
        // title btn and description modal
        OpenContainer(
            transitionDuration: const Duration(seconds: 1),
            closedElevation: 0,
            closedColor: Colors.transparent,
            openColor: Colors.black,
            transitionType: ContainerTransitionType.fade,
            closedBuilder: (context, action) {
              return HoverAnimatedContainer(
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                height: 40,
                width: 400,
                color: Colors.grey,
                hoverColor: yellowColor,
                duration: const Duration(milliseconds: 200),
                cursor: SystemMouseCursors.click,
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(Icons.info, color: Colors.black, size: 25),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        title,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      getIcon(isWeb: isWeb, isApp: isApp)
                    ],
                  ),
                ),
              );
            },
            openBuilder: (context, action) {
              return Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage(images[0]),
                  fit: BoxFit.cover,
                )),
                child: Container(
                  color: Colors.black.withOpacity(0.93),
                  child: CupertinoAlertDialog(
                    title: Text(
                      'About $title',
                      style: GoogleFonts.kurale(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    content: Text(
                      desc,
                      style: GoogleFonts.kurale(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    actions: [
                      CupertinoDialogAction(
                        child: Text(
                          'Close',
                          style: GoogleFonts.kurale(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            action();
                          });
                        },
                      ),
                    ],
                  ),
                ),
              );
            }),
        // preview button
        OpenContainer(
            transitionDuration: const Duration(seconds: 1),
            closedElevation: 0,
            closedColor: Colors.transparent,
            openColor: Colors.black,
            transitionType: ContainerTransitionType.fade,
            closedBuilder: (context, action) {
              return HoverAnimatedContainer(
                margin: const EdgeInsets.only(bottom: 5, right: 5, left: 5),
                height: 40,
                width: 400,
                color: Colors.grey[700],
                hoverColor: yellowColor,
                duration: const Duration(milliseconds: 200),
                cursor: SystemMouseCursors.click,
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Icon(Icons.view_carousel_outlined, color: Colors.white, size: 25),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Preview',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            openBuilder: (context, action) {
              return Scaffold(
                backgroundColor: Colors.black,
                body: SingleChildScrollView(
                    child: Padding(
                  padding: EdgeInsets.all(_isMobile ? 5 : 30),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: _isMobile ? 25 : 0, right: _isMobile ? 25 : 0),
                        alignment: Alignment.topRight,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              action();
                            });
                          },
                          child: const Icon(Icons.close, color: Colors.white, size: 40),
                        ),
                      ),
                      const SizedBox(height: 100),
                      projectImages(images, context)
                    ],
                  ),
                )),
              );
            }),
        // redirect
        InkWell(
          onTap: () async {
            if (url.length < 3) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
                  'Sorry, this site is currently offline!!!',
                  style: GoogleFonts.kurale(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                backgroundColor: Colors.red,
              ));
            } else {
              if (!await launch(url)) throw 'Could not launch $url';
            }
          },
          child: HoverAnimatedContainer(
            height: 40,
            width: 400,
            color: Colors.black,
            hoverColor: yellowColor,
            duration: const Duration(milliseconds: 200),
            cursor: SystemMouseCursors.click,
            margin: const EdgeInsets.symmetric(horizontal: 5),
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(Icons.web, color: Colors.white, size: 25),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    !isWeb ? 'View App on Store Listing' : 'Visit site',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget projectImages(List<String> images, BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 600;
    return Row(
      children: [
        Container(
            width: isMobile ? 25 : 50,
            margin: const EdgeInsets.only(right: 5),
            child: Center(
              child: InkWell(
                onTap: () {
                  _controller.previousPage();
                },
                child: const Icon(Icons.arrow_back_ios, color: Colors.white),
              ),
            )),
        Expanded(
          child: CarouselSlider.builder(
            itemCount: images.length,
            itemBuilder: (
              context,
              index,
              // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
              Null,
            ) {
              return InkWell(
                onTap: () {
                  final imageProvider = Image.asset(images[index]).image;
                  showImageViewer(context, imageProvider, onViewerDismissed: () {});
                },
                onDoubleTap: () {
                  final imageProvider = Image.asset(images[index]).image;
                  showImageViewer(context, imageProvider, onViewerDismissed: () {});
                },
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(images[index]),
                      // fit: BoxFit.fill,
                    ),
                  ),
                ),
              );
            },
            options: CarouselOptions(
                height: isMobile ? 400 : null,
                autoPlay: false,
                // enlargeCenterPage: true,
                viewportFraction: 1,
                aspectRatio: 16 / 9),
            carouselController: _controller,
          ),
        ),
        Container(
            width: isMobile ? 25 : 50,
            margin: const EdgeInsets.only(left: 5),
            child: Center(
              child: InkWell(
                onTap: () {
                  _controller.nextPage();
                },
                child: const Icon(Icons.arrow_forward_ios, color: Colors.white),
              ),
            )),
      ],
    );
  }

  Widget getIcon({required bool isWeb, required bool isApp}) {
    return Row(
      children: [
        // web icon
        Visibility(visible: isWeb, child: projectIcon(Icons.code)),
        // space
        Visibility(
          visible: isWeb,
          child: const SizedBox(width: 5),
        ),
        // android icon
        Visibility(visible: isApp, child: projectIcon(Icons.android)),
        // space
        Visibility(
          visible: isApp,
          child: const SizedBox(width: 5),
        ),
        // ios icon
        Visibility(visible: isApp, child: projectIcon(Icons.apple)),
      ],
    );
  }

  Icon projectIcon(IconData icon) {
    return Icon(
      icon,
      color: Colors.black,
      size: 25,
    );
  }

  String myImage(String image) {
    if (kDebugMode) {
      return image;
    } else {
      return 'assets/$image';
    }
  }
}
