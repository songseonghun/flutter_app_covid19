import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutterappcovid19/constants.dart';
import 'package:flutterappcovid19/info_screen.dart';
import 'package:flutterappcovid19/widgets/counter.dart';
import 'package:flutterappcovid19/widgets/my_header.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid 19',
      theme: ThemeData(
          scaffoldBackgroundColor: kBackgroundColor,
          fontFamily: "Poppins",
          textTheme: TextTheme(
            body1: TextStyle(color: kBodyTextColor),
          )),
      home: HomeScreen(),
       //home: InfoScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          MyHeader(image:'assets/icons/Drcorona.svg',
          textTop: 'All you need',
          textBottom: 'is stay at home.',),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              border: Border.all(
                color: Color(0xFFE5E5E5),
              ),
            ),
            child: Row(
              children: <Widget>[
                SvgPicture.asset('assets/icons/maps-and-flags.svg'),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: DropdownButton(
                    isExpanded: true,
                    underline: SizedBox(),
                    icon: SvgPicture.asset('assets/icons/dropdown.svg'),
                    value: 'Indonesia',
                    items: ['Indonesia', 'Bangladesh', 'United States', 'Korea']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {},
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(text: "Case Update\n", style: kTitleTextStyle),
                        TextSpan(
                            text: "Newest update March 30",
                            style: TextStyle(
                              color: kTextLightColor,
                            ))
                      ]),
                    ),
                    Spacer(),
                    Text(
                      "See Details",
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: kShadowColor,
                        offset: Offset(0, 4),
                        blurRadius: 30,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Counter(
                          number: 1046,
                          title: 'infected',
                          color: kInfectedColor),
                      Counter(number: 87, title: 'Deaths', color: kDeatchColor),
                      Counter(
                          number: 46, title: 'Recovered', color: kRecoverColor),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Spread of Virus',
                      style: kTitleTextStyle,
                    ),
                    Text(
                      'See details',
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.all(20),
                  height: 178,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: kShadowColor,
                        blurRadius: 30,
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Image.asset(
                    'assets/images/map.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
