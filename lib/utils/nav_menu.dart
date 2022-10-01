import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import 'package:kings/utils/color.dart';
import 'package:kings/utils/router.dart';
import 'package:routemaster/routemaster.dart';

class NavMenu extends StatefulWidget {
  const NavMenu({Key? key, required this.action, required this.routeName})
      : super(key: key);
  final Function action;
  final String routeName;

  @override
  State<NavMenu> createState() => _NavMenuState();
}

class _NavMenuState extends State<NavMenu> {
  @override
  Widget build(BuildContext context) {
    bool _isTab = MediaQuery.of(context).size.width < 810 &&
        MediaQuery.of(context).size.width > 420;
    bool _isMobile = MediaQuery.of(context).size.width < 600;
    bool _isDesktop = MediaQuery.of(context).size.width > 810;

    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage(_isMobile
            ? 'assets/mobile_screenshot.png'
            : _isTab
                ? 'assets/tab_screenshot.png'
                : 'assets/desktop_screenshot.png'),
      )),
      child: Container(
        padding: const EdgeInsets.all(40),
        color: Colors.black.withOpacity(0.9),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      widget.action();
                    });
                  },
                  child: Icon(Icons.close,
                      color: Colors.white, size: _isMobile ? 35 : 40),
                ),
              ),
              SizedBox(height: _isMobile ? 20 : 100),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (_isDesktop)
                    Container(
                      margin: const EdgeInsets.only(right: 200),
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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (!_isDesktop)
                        Container(
                          margin: const EdgeInsets.only(bottom: 30),
                          alignment: Alignment.center,
                          width: 130,
                          height: 130,
                          decoration: BoxDecoration(
                              image: const DecorationImage(
                                  image: AssetImage('assets/samuel-kings.png'),
                                  fit: BoxFit.fill),
                              shape: BoxShape.circle,
                              border: Border.all(color: yellowColor, width: 3)),
                        ),
                      _menu('home', homeScreenRoute),
                      _menu('about me', aboutScreenRoute),
                      _menu('my projects', projectsScreenRoute),
                      _menu('pricing', pricingScreenRoute),
                      _menu('contact me', contactScreenRoute),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _menu(String _name, String _route) {
    bool _isMobile = MediaQuery.of(context).size.width < 600;
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: HoverCrossFadeWidget(
        firstChild: TextButton(
          onPressed: (() {
            widget.action();
            Routemaster.of(context).push(_route);
          }),
          child: Text(_name.toUpperCase(),
              style: TextStyle(
                fontSize: _isMobile ? 20 : 30,
                color: widget.routeName == _route ? yellowColor : Colors.white,
                fontWeight: FontWeight.w500,
              )),
        ),
        secondChild: TextButton(
          onPressed: (() {
            widget.action();
            Routemaster.of(context).push(_route);
          }),
          child: Text(_name.toUpperCase(),
              style: TextStyle(
                fontSize: _isMobile ? 20 : 30,
                color: yellowColor,
                fontWeight: FontWeight.w500,
              )),
        ),
        duration: const Duration(milliseconds: 10),
        reverseDuration: const Duration(milliseconds: 10),
        firstCurve: Curves.elasticIn,
        secondCurve: Curves.elasticOut,
        sizeCurve: Curves.elasticInOut,
      ),
    );
  }
}
