// ignore_for_file: unused_local_variable
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kings/utils/color.dart';
import 'package:kings/utils/nav_menu.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utils/router.dart';
import '/utils/extensions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    bool _isTab = MediaQuery.of(context).size.width < 810 && MediaQuery.of(context).size.width > 420;
    bool _isMobile = MediaQuery.of(context).size.width < 600;
    bool _isDesktop = MediaQuery.of(context).size.width > 810;

    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.pushNamed(context, aboutScreenRoute);
      //   },
      // ),
      body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/background.jpg'),
            fit: BoxFit.cover,
          )),
          child: Container(
              color: Colors.black.withOpacity(0.6),
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: _isMobile ? 15 : 40),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    OpenContainer(
                        transitionDuration: const Duration(seconds: 1),
                        closedElevation: 0,
                        closedColor: Colors.transparent,
                        openColor: Colors.black,
                        transitionType: ContainerTransitionType.fade,
                        tappable: false,
                        closedBuilder: (context, action) {
                          return Align(
                            alignment: Alignment.topRight,
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
                            routeName: homeScreenRoute,
                          );
                        }),
                    Container(
                      margin: EdgeInsets.only(top: 40, left: _isMobile ? 5 : 15),
                      alignment: Alignment.centerLeft,
                      child: RichText(
                        text: TextSpan(
                          text: 'Samuel',
                          style: GoogleFonts.kurale(
                              fontSize: _isMobile ? 30 : 80, color: Colors.white, fontWeight: FontWeight.w500),
                          children: [
                            TextSpan(
                              text: ' Kings',
                              style: GoogleFonts.kurale(
                                  fontSize: _isMobile ? 30 : 80, color: yellowColor, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ).showCursorOnHover,
                    ),
                    Container(
                      color: Colors.black.withOpacity(0.2),
                      padding: const EdgeInsets.only(top: 10, left: 15, bottom: 10),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '''
* Website Developer
* Mobile App Developer (Android, iOS)
* Desktop App Developer (Windows, Linux, MacOS)
* Software Engineer''',
                        style: TextStyle(
                          fontSize: _isMobile ? 14 : 24,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: 10,
                      ),
                      color: Colors.black.withOpacity(0.2),
                      padding: const EdgeInsets.only(top: 10, left: 15, bottom: 10),
                      alignment: Alignment.centerLeft,
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Programming Skills & Languages',
                                style: TextStyle(
                                  fontSize: _isMobile ? 18 : 24,
                                  color: yellowColor,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.left),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Flutter | Wordpress | HTML | CSS | JavaScript | React | Python',
                              style: TextStyle(
                                fontSize: _isMobile ? 18 : 24,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: 30,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          _imageIconButton('assets/facebook.png', 'https://web.facebook.com/SamuelKings.tech'),
                          _imageIconButton('assets/twitter.png', 'https://twitter.com/apstkingssamuel'),
                          _imageIconButton(
                              'assets/linkedin.png', 'https://www.linkedin.com/in/samuel-kings-3a46971b0/'),
                          _imageIconButton('assets/github.png', 'https://github.com/Kings-Samuel'),
                        ],
                      ),
                    )
                  ],
                ),
              ))),
    );
  }

  Widget _imageIconButton(String image, String url) {
    return InkWell(
      onTap: () async {
        if (!await launch(url)) throw 'Could not launch $url';
      },
      child: AnimatedContainer(
          duration: const Duration(seconds: 1),
          child: Image.asset(
            image,
            height: 35,
            width: 35,
          ),
          margin: const EdgeInsets.only(right: 13)),
    ).showCursorOnHover.moveUpOnHover;
  }
}
