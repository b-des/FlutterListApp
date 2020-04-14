import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterlistapp/constants/font_family.dart';
import 'package:flutterlistapp/constants/strings.dart';
import 'package:flutterlistapp/models/post/post.dart';

import 'general_button.dart';

class CarouselItem extends StatelessWidget {
  Post post;

  CarouselItem(this.post);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ClipRRect(
                child: Stack(
                  children: <Widget>[
                    CachedNetworkImage(
                      imageUrl: post.imageUrl,
                      placeholder: (context, url) => LinearProgressIndicator(),
                      errorWidget: (context, url, error) => Image(
                        image: AssetImage(
                            'assets/images/placeholder_vertical.png'),
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 200,
                        decoration: new BoxDecoration(
                            color: Color.fromRGBO(87, 0, 97, 68),
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    post.title,
                                    style: TextStyle(
                                        fontFamily: FontFamily.futura,
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  Text(
                                    post.date,
                                    style: TextStyle(
                                        fontFamily: FontFamily.futuraLightC,
                                        fontSize: 23,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 100,
                              decoration: new BoxDecoration(
                                  color: Color.fromRGBO(201, 0, 140, 68),
                                  borderRadius: BorderRadius.all(Radius.circular(10))),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  _pointsWidget(post.startPoints, 'assets/images/start_point_bg.png', 0),
                                  _pointsWidget(post.checkPoints, 'assets/images/check_points_bg.png', 6),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 27, 0, 0),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GeneralButton('Let\'s run', () => {}),
                  GeneralButton('More information', () => {}),
                ],
              ),
            )
          ],
        ));
  }

  Widget _pointsWidget(int points, String icon, double left) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Stack(
          children: <Widget>[
            Image(
              image: AssetImage(icon),
              height: 53,
            ),
            Positioned(
              left: left,
              top: 5,
              child: SizedBox(
                width: 45,
                height: 40,
                child: Text(points.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: FontFamily.futuraDemi,
                        color: Colors.white,
                        fontSize: 30,
                        letterSpacing: -2)),
              ),
            )
          ],
          alignment: AlignmentDirectional.center,
        ),
        Text(
          Strings.startPoints,
          style: TextStyle(
              color: Colors.white,
              fontSize: 11,
              fontFamily: FontFamily.futuraLightC),
        )
      ],
    );
  }
}
