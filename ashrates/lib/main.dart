import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ashrates/constants.dart';
import 'package:ashrates/widgets/counter.dart';
import 'package:ashrates/widgets/my_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid 19',
      theme: ThemeData(
          scaffoldBackgroundColor: kBackgroundColor,
          fontFamily: "Poppins",
          textTheme: TextTheme(
            // ignore: deprecated_member_use
            body1: TextStyle(color: kBodyTextColor),
          )),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String newValue= '5th Day Kuri';




  final controller = ScrollController();
  double offset = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(onScroll);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  void onScroll() {
    setState(() {
      offset = (controller.hasClients) ? controller.offset : 0;
    });
  }






  @override
  Widget build(BuildContext context) {
    var i=0;
    if(newValue == '7th Day Kuri')
      {
        i=1;
      }

    return Scaffold(

      body: StreamBuilder(
        stream: Firestore.instance.collection('Kuri').snapshots() ,
        builder: (context,snapshot){
          return Scaffold(
            body: SingleChildScrollView(
              controller: controller,
              child: Column(
                children: <Widget>[
                  MyHeader(
                    image: "assets/icons/bank_note.svg",
                    textTop: "We Built This ",
                    textBottom: "Bank For You.",
                    offset: offset,
                  ),
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
                        SvgPicture.asset("assets/icons/cald.svg"),
                        SizedBox(width: 20),
                        Expanded(
                          child: DropdownButton(
                            isExpanded: true,
                            underline: SizedBox(),
                            icon: SvgPicture.asset("assets/icons/dropdown.svg"),
                            value: newValue,
                            items: [
                              '5th Day Kuri',
                              '7th Day Kuri',
                              '9th Day Kuri',
                              '11th Day Kuri',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (String changedValue) {
                              newValue=changedValue;
                              setState(() {
                                // ignore: unnecessary_statements
                                newValue;
                                print(newValue);
                              });





                            },
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Money to Be Paid\n",
                                    style: kTitleTextstyle,
                                  ),
                                  TextSpan(
                                    text: "Newest update Augest 20",
                                    style: TextStyle(
                                      color: kTextLightColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                          ],
                        ),
                        SizedBox(height: 20),
                        Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 4),
                                blurRadius: 30,
                                color: kShadowColor,
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Counter(
                                color: kInfectedColor,
                                number:snapshot.data.documents[i].data['no'],
                                title: "Prized No",
                              ),


                              Counter(
                                color: kRecovercolor,
                                number: snapshot.data.documents[i]['am1'],
                                title: "Instalemnt Amt",
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Auctioned Amount",
                              style: kTitleTextstyle,
                            ),

                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          padding: EdgeInsets.all(20),
                          height: 178,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 10),
                                blurRadius: 30,
                                color: kShadowColor,
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Counter(
                                color: kInfectedColor,
                                number: snapshot.data.documents[i]['am2'],
                                title: "May",
                              ),

                              Counter(
                                color: kRecovercolor,
                                number: snapshot.data.documents[i]['am3'],
                                title: "July",
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Auctioned Amount",
                              style: kTitleTextstyle,
                            ),

                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          padding: EdgeInsets.all(20),
                          height: 178,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 10),
                                blurRadius: 30,
                                color: kShadowColor,
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Counter(
                                color: kInfectedColor,
                                number: snapshot.data.documents[i]['am2'],
                                title: "May",
                              ),

                              Counter(
                                color: kRecovercolor,
                                number: snapshot.data.documents[i]['am3'],
                                title: "July",
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Auctioned Amount",
                              style: kTitleTextstyle,
                            ),

                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          padding: EdgeInsets.all(20),
                          height: 178,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 10),
                                blurRadius: 30,
                                color: kShadowColor,
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Counter(
                                color: kInfectedColor,
                                number: snapshot.data.documents[i]['am2'],
                                title: "May",
                              ),

                              Counter(
                                color: kRecovercolor,
                                number: snapshot.data.documents[i]['am3'],
                                title: "July",
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          );

        },
      ),
    );
  }
}
