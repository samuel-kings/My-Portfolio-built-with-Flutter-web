import 'package:animations/animations.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:kings/utils/color.dart';
import 'package:kings/utils/extensions.dart';
import 'package:url_launcher/url_launcher.dart';
import '../routing/consts.dart';
import '../utils/nav_menu.dart';

class AboutMeScreen extends StatefulWidget {
  const AboutMeScreen({Key? key}) : super(key: key);

  @override
  State<AboutMeScreen> createState() => _AboutMeScreenState();
}

class _AboutMeScreenState extends State<AboutMeScreen> {
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
                  routeName: aboutScreenRoute,
                );
              }),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 40.0, vertical: 0),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 60),
                    alignment:
                        _isDesktop ? Alignment.topLeft : Alignment.topCenter,
                    child: SelectableText.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'About ',
                            style: TextStyle(
                              fontSize: _isDesktop ? 80 : 60,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: 'Me',
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
                    alignment:
                        _isDesktop ? Alignment.topLeft : Alignment.topCenter,
                    child: SelectableText(
                      'Let me tell you a few things..',
                      style: TextStyle(
                        fontSize: _isDesktop ? 24 : 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (_isDesktop)
                        Container(
                          margin: const EdgeInsets.only(right: 50, left: 50),
                          alignment: Alignment.center,
                          width: 250,
                          height: 250,
                          decoration: BoxDecoration(
                              image: const DecorationImage(
                                  image: AssetImage('assets/samuel-kings.png'),
                                  fit: BoxFit.fill),
                              shape: BoxShape.circle,
                              border: Border.all(color: yellowColor, width: 3)),
                        ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (!_isDesktop)
                              Container(
                                margin:
                                    const EdgeInsets.only(top: 20, bottom: 15),
                                alignment: Alignment.center,
                                width: 200,
                                height: 200,
                                decoration: BoxDecoration(
                                    image: const DecorationImage(
                                        image: AssetImage('assets/samuel-kings.png'),
                                        fit: BoxFit.fill),
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: yellowColor, width: 3)),
                              ),
                            SelectableText(
                              'BIO',
                              style: TextStyle(
                                fontSize: _isDesktop ? 27 : 23,
                                color: yellowColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SelectableText(
                              '"I am a passionate computer scientist and programmer with the vision to greatly contribute to the growing tech and IT inclined community and developing our nation (and subsequently the world at large) through IT. I believe my skill set and vision could provide solution towards many of the problems the nation is faced with."',
                              style: TextStyle(
                                fontSize: _isDesktop ? 24 : 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  _isDesktop
                      ? Row(
                          children: [
                            _myCards(
                                'MetroLife Technologies',
                                'C.E.O, Founder',
                                'MetroLife Technologies is a new software developing company that produces various apps as a means to provide solutions to many issues that IT can solve first in Lagos State, then other parts of the country.',
                                'metrolifetech.com',
                                'https://metrolifetech.com/'),
                            _myCards(
                                'RightDeal Consulting Limited',
                                'Co-Founder | IT Manager | Full Stack Developer',
                                'RightDeal Consulting Limited is a firm that provides lots of services to see businesses grow and increase revenue. To this effect, we offer a wide range of services such as Business consulting, IT solutions, brand and services promotion, market research, job recruiting, just to mention a few.',
                                'rightdealconsulting.com',
                                'https://rightdealconsulting.com'),
                            _myCards(
                                'Bezalio Hub',
                                'IT Manager',
                                'Bezalio Hub is a market place for products and home services with their primary market being the American and European States.',
                                'bezaliohub.com',
                                'https://bezaliohub.com/'),
                          ],
                        )
                      : Column(
                          children: [
                            _myCards(
                                'MetroLife Technologies',
                                'C.E.O, Founder',
                                'MetroLife Technologies is a new software developing company that produces various apps as a means to provide solutions to many issues that IT can solve first in Lagos State, then other parts of the country.',
                                'metrolifetech.com',
                                'https://metrolifetech.com/'),
                            _myCards(
                                'RightDeal Consulting Limited',
                                'Co-Founder | IT Manager | Full Stack Developer',
                                'RightDeal Consulting Limited is a firm that provides lots of services to see businesses grow and increase revenue. To this effect, we offer a wide range of services such as Business consulting, IT solutions, brand and services promotion, market research, job recruiting, just to mention a few.',
                                'rightdealconsulting.com',
                                'https://rightdealconsulting.com'),
                            _myCards(
                                'Bezalio Hub',
                                'IT Manager',
                                'Bezalio Hub is a market place for products and home services with their primary market being the American and European States.',
                                'bezaliohub.com',
                                'https://bezaliohub.com/'),
                          ],
                        ),
                  const SizedBox(height: 50),
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

  Widget _myCards(String company, String position, String desc, String siteName,
      String url) {
    Color _color = Colors.white;
    bool _isDesktop = MediaQuery.of(context).size.width > 810;

    if (_isDesktop) {
      return Expanded(
        child: Container(
          height: 400,
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
          decoration: BoxDecoration(
            color: Colors.grey[800],
            border: const Border(
              bottom: BorderSide(color: yellowColor, width: 3),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: SelectableText(
                  company,
                  style: const TextStyle(
                    fontSize: 19,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: SelectableText(
                  position,
                  style: const TextStyle(
                    fontSize: 12,
                    color: yellowColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: SelectableText(
                  desc,
                  style: const TextStyle(
                    fontSize: 14.5,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SelectableText(
                    'For more details, visit ',
                    style: TextStyle(
                      fontSize: 14.5,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SelectableText.rich(TextSpan(
                    text: siteName,
                    style: TextStyle(
                      fontSize: 14.5,
                      color: _color,
                      fontWeight: FontWeight.w500,
                    ),
                    mouseCursor: MaterialStateMouseCursor.clickable,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () async {
                        if (kDebugMode) {
                          print('onTap');
                        }
                        if (!await launch(url)) throw 'Could not launch $url';
                      },
                  )).moveUpOnHover
                ],
              )
            ],
          ),
        ),
      );
    } else {
      return Container(
        height: 400,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
        decoration: BoxDecoration(
          color: Colors.grey[800],
          border: const Border(
            bottom: BorderSide(color: yellowColor, width: 3),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: SelectableText(
                company,
                style: const TextStyle(
                  fontSize: 19,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: SelectableText(
                position,
                style: const TextStyle(
                  fontSize: 12,
                  color: yellowColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: SelectableText(
                desc,
                style: const TextStyle(
                  fontSize: 14.5,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SelectableText(
                  'For more details, visit ',
                  style: TextStyle(
                    fontSize: 14.5,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SelectableText.rich(TextSpan(
                  text: siteName,
                  style: TextStyle(
                    fontSize: 14.5,
                    color: _color,
                    fontWeight: FontWeight.w500,
                  ),
                  mouseCursor: MaterialStateMouseCursor.clickable,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () async {
                      if (kDebugMode) {
                        print('onTap');
                      }
                      if (!await launch(url)) throw 'Could not launch $url';
                    },
                )).moveUpOnHover
              ],
            )
          ],
        ),
      );
    }
  }
}
