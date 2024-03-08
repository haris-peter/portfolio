// Created by: Haris Josin Peter, Created at: 07-03-2024 11:09 am

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_portfolio/utils/screen/screen_util.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../constants/strings.dart';
import '../../constants/text_styles.dart';
import '../../widgets/circle.dart';

class IntroWidget extends StatefulWidget {
  const IntroWidget({super.key});

  @override
  State<IntroWidget> createState() => _IntroWidgetState();
}

class _IntroWidgetState extends State<IntroWidget> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveFrameworkBuilder(
      child: _buildBody(context),
    );
    //  return ResponsiveFrameworkBuilder(
    //      builder:(context,sizingInformation)
    //        Widget child,
//
    //      if (sizingInformation.isLargeScreen) {
    //    child = _buildLargeScreenContent(context);
    //  } else if (sizingInformation.isMediumScreen) {
    //  child = _buildMediumScreenContent(context);
    //  } else if (sizingInformation.isSmallScreen) {
    //  child = _buildSmallScreenContent(context);
    //  }
    //  );
  }

  Widget _buildBody(BuildContext context) {
    Widget child;
    if (ResponsiveWrapper.of(context).isDesktop) {
      child = _buildLargeScreenContent(context);
    } else if (ResponsiveWrapper.of(context).isTablet) {
      child = _buildMediumScreenContent(context);
    } else {
      child = _buildSmallScreenContent(context);
    }
    return child;
  }

  Widget _buildLargeScreenContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        ResponsiveWrapper.of(context).isDesktop ? _buildDesign() : const SizedBox.shrink(),
        _buildAppBar(context),
        Positioned(
          right: MediaQuery.of(context).size.width * 0.12,
          top: MediaQuery.of(context).size.width * 0.06,
          child: const CircleWidget(
            width: 60,
            height: 60,
            outerRadius: 25.0,
            innerRadius: 8.0,
            circleColor: Color(0xFF0098a6),
          ),
        ),
        Positioned(
          left: MediaQuery.of(context).size.width * 0.29,
          top: MediaQuery.of(context).size.width * 0.15,
          child: const CircleWidget(
            width: 40,
            height: 40,
            outerRadius: 15.0,
            innerRadius: 4.0,
            circleColor: Color(0xFF00bcd5),
          ),
        ),
        Positioned(
          left: MediaQuery.of(context).size.width * 0.37,
          bottom: MediaQuery.of(context).size.width * 0.10,
          child: const CircleWidget(
            width: 50,
            height: 50,
            outerRadius: 20.0,
            innerRadius: 4.0,
            circleColor: Color(0xFFb2ebf2),
          ),
        ),
        Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 120.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    const SizedBox(width: 30.0),
                    const CircleWidget(
                      width: 60,
                      height: 60,
                      outerRadius: 25.0,
                      innerRadius: 8.0,
                      circleColor: Color(0xFF0098a6),
                    ),
                    const SizedBox(width: 40.0),
                    _buildAboutMe(fontSize: MediaQuery.of(context).size.width * 0.015),
                  ],
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.30),
              Padding(
                padding: const EdgeInsets.only(bottom: 50.0),
                child: _buildHello(fontSize: MediaQuery.of(context).size.width * 0.12),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildMediumScreenContent(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          _buildAppBar(context),
          Positioned(
            left: MediaQuery.of(context).size.width * 0.75,
            top: MediaQuery.of(context).size.width * 0.20,
            child: const CircleWidget(
              width: 60,
              height: 60,
              outerRadius: 25.0,
              innerRadius: 8.0,
              circleColor: Color(0xFF0098a6),
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * 0.57,
            top: MediaQuery.of(context).size.width * 0.65,
            child: const CircleWidget(
              width: 40,
              height: 40,
              outerRadius: 15.0,
              innerRadius: 4.0,
              circleColor: Color(0xFF00bcd5),
            ),
          ),
          Positioned(
            right: MediaQuery.of(context).size.width * 0.30,
            top: MediaQuery.of(context).size.width * 1.0,
            child: const CircleWidget(
              width: 50,
              height: 50,
              outerRadius: 20.0,
              innerRadius: 4.0,
              circleColor: Color(0xFFb2ebf2),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.20,
              //            left: MediaQuery.of(context).size.height * 0.10,
            ),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _buildHello(fontSize: MediaQuery.of(context).size.width * 0.23),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  _buildAboutMe(
                    quarterTurns: 4,
                    fontSize: MediaQuery.of(context).size.width * 0.030,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSmallScreenContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        _buildAppBar(context),
        // Positioned(
        //   left: MediaQuery.of(context).size.width * 0.3,
        //   top: MediaQuery.of(context).size.width * 0.30,
        //   child: const CircleWidget(
        //     width: 60,
        //     height: 60,
        //     outerRadius: 25.0,
        //     innerRadius: 8.0,
        //     circleColor: Color(0xFF0098a6),
        //   ),
        // ),
        Positioned(
          left: MediaQuery.of(context).size.width * 0.65,
          top: MediaQuery.of(context).size.width * 0.65,
          child: const CircleWidget(
            width: 40,
            height: 40,
            outerRadius: 15.0,
            innerRadius: 4.0,
            circleColor: Color(0xFF00bcd5),
          ),
        ),
        Positioned(
          right: MediaQuery.of(context).size.width * 0.25,
          top: MediaQuery.of(context).size.width * 1.2,
          child: const CircleWidget(
            width: 50,
            height: 50,
            outerRadius: 20.0,
            innerRadius: 4.0,
            circleColor: Color(0xFFb2ebf2),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(child: _buildHello(fontSize: MediaQuery.of(context).size.width * 0.23)),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  Center(
                    child: _buildAboutMe(
                      quarterTurns: 4,
                      fontSize: MediaQuery.of(context).size.width * 0.035,
                    ),
                  ),
                ],
              ),
              // SizedBox(height: MediaQuery.of(context).size.height * 0.10),
              // _buildGhost(),
              // SizedBox(height: MediaQuery.of(context).size.height * 0.10),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildDesign() {
    return Center(
      child: Text(
        Strings.design,
        style: TextStyles.heading.copyWith(
          fontSize: MediaQuery.of(context).size.width * 0.27,
          height: MediaQuery.of(context).size.height * 0.0015,
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width < 600 ? 50.0 : 80.0,
        vertical: MediaQuery.of(context).size.height < 800 ? 5.0 : 10.0,
      ),
      child: AppBar(
        titleSpacing: 0.0,
        title: Row(
          children: <Widget>[
            Text(
              Strings.portfolio,
              style: TextStyles.logo,
            ),
            _buildGhost()
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
    );
  }

  Widget _buildGhost() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          'assets/images/ghost_anim.gif',
          width: 70, //MediaQuery.of(context).size.width * 0.05, // Desired width
          height: 70, // MediaQuery.of(context).size.width * 0.05, // Desired height
        )
      ],
    );
  }

  Widget _buildHello({required double fontSize}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RichText(
          text: TextSpan(
            text: Strings.hello,
            style: TextStyles.sub_heading.copyWith(fontSize: fontSize),
            children: <TextSpan>[
              TextSpan(
                text: '.',
                style: TextStyles.sub_heading.copyWith(
                  fontSize: fontSize,
                  color: const Color(0xFFff5353),
                ),
              ),
              TextSpan(
                text: Strings.i_am_Haris,
                style: TextStyles.sub_heading.copyWith(
                  fontSize: fontSize,
                ),
              )
            ],
          ),
        ),
        AnimatedTextKit(
          animatedTexts: [
            TyperAnimatedText(
              'Haris',
              textStyle: TextStyles.sub_heading.copyWith(
                fontSize: fontSize,
              ),
            ),
            TyperAnimatedText(
              'Josin',
              textStyle: TextStyles.sub_heading.copyWith(
                fontSize: fontSize,
              ),
            ),
            TyperAnimatedText(
              'Peter',
              textStyle: TextStyles.sub_heading.copyWith(
                fontSize: fontSize,
              ),
            ),
            TyperAnimatedText(
              '...',
              textStyle: TextStyles.sub_heading.copyWith(
                fontSize: fontSize,
              ),
            ),
          ],
          isRepeatingAnimation: true,
          displayFullTextOnTap: true,
          repeatForever: true,
        )
      ],
    );
  }

  Widget _buildAboutMe({int quarterTurns = 3, required double fontSize}) {
    return RotatedBox(
      quarterTurns: quarterTurns,
      child: Text(
        Strings.mobile_dev,
        style: TextStyles.body.copyWith(
          fontSize: fontSize,
        ),
      ),
    );
  }
}
