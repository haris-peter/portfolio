// Created by: Haris Josin Peter, Created at: 05-03-2024 11:45 pm
import 'dart:html' as html;

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_portfolio/constants/text_styles.dart';
import 'package:my_flutter_portfolio/ui/pages/intro.dart';
import 'package:my_flutter_portfolio/utils/screen/screen_util.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../constants/strings.dart';
import '../utils/hover/custom_cursor.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSmallScreen = false;

  @override
  Widget build(BuildContext context) {
    return ResponsiveFrameworkBuilder(
      child: Material(
        color: const Color(0xFF1a1a1a),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: LayoutBuilder(
            builder: (context, constraints) {
              return Stack(
                children: <Widget>[
                  _buildBackground(),
                  _buildBody(context, constraints),
                  _buildMadeWith(
                      alignment: ResponsiveWrapper.of(context).isDesktop ? Alignment.bottomLeft : Alignment.topRight),
                  ResponsiveWrapper.of(context).isDesktop ? _buildSocialButtons() : const SizedBox.shrink(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildBackground() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        _buildVerticalDivider(),
        _buildVerticalDivider(),
        _buildVerticalDivider(),
        _buildVerticalDivider(),
        _buildVerticalDivider(),
      ],
    );
  }

  Widget _buildVerticalDivider() {
    return Container(
      width: 2,
      height: double.maxFinite,
      color: Colors.black26,
      child: const VerticalDivider(
        color: Colors.black26,
      ),
    );
  }

  //-----------------------------------------------------------------------------------------------------------------------
  Widget _buildBody(BuildContext context, BoxConstraints constraints) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ConstrainedBox(
            constraints: BoxConstraints(minWidth: constraints.maxWidth, minHeight: constraints.minHeight),
            child: _buildScreen(context),
          )
        ],
      ),
    );
  }

  Widget _buildScreen(BuildContext context) {
    Widget child;
    if (ResponsiveWrapper.of(context).isDesktop) {
      child = _buildLargeScreen(context);
    } else if (ResponsiveWrapper.of(context).isTablet) {
      child = _buildMediumScreen(context);
    } else {
      child = _buildSmallScreen(context);
    }
    return child;
  }

  Widget _buildLargeScreen(BuildContext context) {
    return const IntrinsicHeight(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
              child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[Expanded(flex: 1, child: IntroWidget())],
          ))
        ],
      ),
    );
  }

  Widget _buildMediumScreen(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(bottom: 50.0),
      child: IntrinsicHeight(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            IntroWidget(),
          ],
        ),
      ),
    );
  }

  Widget _buildSmallScreen(BuildContext context) {
    return IntrinsicHeight(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const IntroWidget(),
          _buildSocialButtons(
            axis: Axis.horizontal,
            quarterTurns: 4,
            alignment: Alignment.center,
          ),
        ],
      ),
    );
  }

  Widget _buildMadeWith({Alignment alignment = Alignment.bottomLeft}) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 50.0,
        left: (MediaQuery.of(context).size.width * 0.02),
      ),
      child: Align(
        alignment: alignment,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          color: const Color(0xFF1e1e1e),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              RotatedBox(
                quarterTurns: 3,
                child: AnimatedTextKit(
                  animatedTexts: [
                    FlickerAnimatedText(
                      Strings.in_flutter,
                      textStyle: TextStyles.strikeThrough,
                    ),
                  ],
                  displayFullTextOnTap: true,
                  isRepeatingAnimation: true,
                  repeatForever: true,
                ),
              ),
              RotatedBox(
                quarterTurns: 3,
                child: AnimatedTextKit(
                  animatedTexts: [
                    FlickerAnimatedText(
                      Strings.heart,
                      textStyle: TextStyles.strikeThrough,
                    ),
                  ],
                  repeatForever: true,
                ),
              ),
              RotatedBox(
                quarterTurns: 3,
                child: AnimatedTextKit(
                  animatedTexts: [
                    FlickerAnimatedText(
                      Strings.made_with,
                      textStyle: TextStyles.strikeThrough,
                    ),
                  ],
                  repeatForever: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButtons({
    int quarterTurns = 3,
    Axis axis = Axis.vertical,
    alignment = Alignment.centerRight,
  }) {
    return Align(
      alignment: alignment,
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        direction: axis,
        children: <Widget>[
          _buildMenuItem(quarterTurns, Strings.menu_github_link, Strings.menu_github),
          _buildMenuItem(quarterTurns, Strings.menu_linked_in_link, Strings.menu_linked_in),
          _buildMenuItem(quarterTurns, Strings.menu_instagram_link, Strings.menu_instagram),
        ],
      ),
    );
  }

  Widget _buildMenuItem(int quarterTurns, String link, String title) {
    return CustomCursor(
      cursorStyle: CustomCursor.pointer,
      child: RotatedBox(
        quarterTurns: quarterTurns,
        child: MaterialButton(
          hoverColor: Color(0xFF00bcd5),
          child: Text(
            title,
            style: TextStyles.menu_item,
          ),
          onPressed: () {
            html.window.open(link, title);
          },
        ),
      ),
    );
  }
}
