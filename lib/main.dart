import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

const kGoogleApiKey = /*<KEY>*/;

void main() => runApp(
      MaterialApp(home: MyApp()),
    );

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyApp();
  }
}

class _MyApp extends State<MyApp> {
  final myController = TextEditingController();
  final myController1 = TextEditingController();
  final myController2 = TextEditingController();
  final tester = TextEditingController();
  final origin =TextEditingController();

  int choice = 0;

  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: GestureDetector(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage("https://i.stack.imgur.com/0ASXA.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: ListView(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Divider(
                      color: Colors.transparent,
                      height: 20.0,
                    ),
                    Text(
                      "Gasoline Price Estimator",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                    Divider(
                      color: Colors.transparent,
                      height: 16.0,
                    ),
                    Card(
                      color: Colors.white70,
                      elevation: 8.0,
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            PlacesAutocompleteField(
                              inputDecoration: InputDecoration(
                                  alignLabelWithHint: true,
                                  contentPadding: EdgeInsets.fromLTRB(
                                      16.0, 16.0, 16.0, 16.0)),
                              trailing: Icon(Icons.search),
                              apiKey: kGoogleApiKey,
                              controller: origin,
                              hint: "Please enter your origin",
                            ),
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.transparent,
                      height: 8.0,
                    ),
                    Card(
                      color: Colors.white70,
                      elevation: 8.0,
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            PlacesAutocompleteField(
                              inputDecoration: InputDecoration(
                                  alignLabelWithHint: true,
                                  contentPadding: EdgeInsets.fromLTRB(
                                      16.0, 16.0, 16.0, 16.0)),
                              trailing: Icon(Icons.search),
                              apiKey: kGoogleApiKey,
                              controller: tester,
                              hint: "Please enter your destination",
                            ),
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.transparent,
                      height: 8.0,
                    ),
                    Text("Or"),
                    Divider(
                      color: Colors.transparent,
                      height: 8.0,
                    ),
                    Card(
                      color: Colors.white70,
                      elevation: 8.0,
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            Divider(
                              color: Colors.transparent,
                              height: 12.0,
                            ),
                            Container(
                              child: Text(
                                "How many miles away is the destination?: ",
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              padding: EdgeInsets.only(
                                  left: 18.0,
                                  top: 0.0,
                                  right: 18.0,
                                  bottom: 0.0),
                            ),
                            Container(
                              child: TextField(
                                controller: myController,
                                keyboardType: TextInputType.numberWithOptions(
                                  decimal: true,
                                  signed: false,
                                ),
                                textInputAction: TextInputAction.continueAction,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(12.0),
                                ),
                                textAlign: TextAlign.center,
                                cursorColor: Colors.purple,
                                keyboardAppearance: Brightness.dark,
                              ),
                              margin: EdgeInsets.only(
                                  left: 28.0,
                                  top: 0.0,
                                  right: 28.0,
                                  bottom: 0.0),
                            ),
                            Divider(
                              color: Colors.transparent,
                              height: 12.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.transparent,
                      height: 8.0,
                    ),
                    Card(
                      color: Colors.white70,
                      elevation: 8.0,
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            Divider(
                              color: Colors.transparent,
                              height: 12.0,
                            ),
                            Container(
                              child: Text(
                                "What does your car average? (Skip if you don't know): ",
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              padding: EdgeInsets.only(
                                  left: 18.0,
                                  top: 0.0,
                                  right: 18.0,
                                  bottom: 0.0),
                            ),
                            Container(
                              child: TextField(
                                controller: myController1,
                                keyboardType: TextInputType.numberWithOptions(
                                  decimal: true,
                                  signed: false,
                                ),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(12.0),
                                ),
                                textAlign: TextAlign.center,
                                cursorColor: Colors.purple,
                                keyboardAppearance: Brightness.dark,
                              ),
                              margin: EdgeInsets.only(
                                  left: 28.0,
                                  top: 0.0,
                                  right: 28.0,
                                  bottom: 0.0),
                            ),
                            Divider(
                              color: Colors.transparent,
                              height: 12.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.transparent,
                      height: 8.0,
                    ),
                    Card(
                      color: Colors.white70,
                      elevation: 8.0,
                      child: Center(
                        child: Column(
                          children: <Widget>[
                            Divider(
                              color: Colors.transparent,
                              height: 12.0,
                            ),
                            Container(
                              child: Text(
                                "What is the cost of gasoline per gallon? (Skip if you don't know): ",
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              padding: EdgeInsets.only(
                                  left: 18.0,
                                  top: 0.0,
                                  right: 18.0,
                                  bottom: 0.0),
                            ),
                            Container(
                              child: TextField(
                                controller: myController2,
                                keyboardType: TextInputType.numberWithOptions(
                                  decimal: true,
                                  signed: false,
                                ),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(12.0),
                                ),
                                textAlign: TextAlign.center,
                                cursorColor: Colors.purple,
                                keyboardAppearance: Brightness.dark,
                              ),
                              margin: EdgeInsets.only(
                                  left: 28.0,
                                  top: 0.0,
                                  right: 28.0,
                                  bottom: 0.0),
                            ),
                            Divider(
                              color: Colors.transparent,
                              height: 12.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      color: Colors.transparent,
                      height: 12.0,
                    ),
                    RadioListTile(
                      title: Text("One Way Trip"),
                      groupValue: choice,
                      value: 0,
                      onChanged: (value) {
                        setState(() {
                          choice = value;
                        });
                      },
                      activeColor: Colors.indigo[900],
                      secondary: Icon(Icons.arrow_forward),
                    ),
                    RadioListTile(
                      title: Text("Two Way Trip"),
                      groupValue: choice,
                      value: 1,
                      onChanged: (value) {
                        setState(() {
                          choice = value;
                        });
                      },
                      activeColor: Colors.indigo[900],
                      secondary: Icon(Icons.repeat),
                    ),
                    Divider(
                      color: Colors.transparent,
                      height: 12.0,
                    ),
                    RaisedButton(
                      onPressed: () {
                        compute(context, choice, myController, myController1,
                                myController2, convert(tester.text), convert(origin.text))
                            .then(
                          (value) => showDialog(
                                context: context,
                                builder: (context) {
                                  return alert(value);
                                },
                              ),
                        );
                      },
                      color: Colors.white24,
                      highlightElevation: 0.0,
                      elevation: 0.0,
                      child: Text("Submit"),
                    ),
                  ],
                ),
              ],
            ),
            padding: EdgeInsets.all(8.0),
          ),
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
        ),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
    );
  }
}

String convert(String str) {
  List<String> token = str.split(" ");
  String fin = "";
  for (int i = 0; i < token.length; i++) {
    if (i != 0)
      fin = fin + "+" + token.elementAt(i);
    else
      fin = token.elementAt(i);
  }
  List<String> token2 = fin.split(",+");
  String fin2 = "";
  for (int i = 0; i < token2.length; i++) {
    if (i != 0)
      fin2 = fin2 + "+" + token2.elementAt(i);
    else
      fin2 = token2.elementAt(i);
  }
  return fin2;
}

Widget alert(double total) {
  return AlertDialog(
    title: Text(
      "Total Price for Gasoline is",
      textAlign: TextAlign.center,
    ),
    titlePadding: EdgeInsets.all(18.0),
    contentPadding: EdgeInsets.all(18.0),
    content: Text(
      "\$" + total.toStringAsFixed(2),
      textAlign: TextAlign.center,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 58.0,
      ),
    ),
  );
}

Future<double> compute(
    BuildContext context,
    int choice,
    TextEditingController myController,
    TextEditingController myController1,
    TextEditingController myController2,
    String destination, String origin) async {
  double miles = 0;
  double total = 0;

  Maps map = await getData(origin, destination);

  if (map.status == 'OK') {
    miles = map.rows[0].elements[0].distance.value / 1609.34;
  } else {
    miles = double.parse(myController.text);
  }
  double average = 0;
  try {
    average = double.parse(myController1.text);
  } catch (Exception) {
    average = 23.6;
  }
  total = miles / average;
  double cost = 0;
  try {
    cost = double.parse(myController2.text);
  } catch (Exception) {
    cost = 2.62;
  }
  total = total * cost;
  if (choice == 1) total *= 2;
  return total;
}

Future<Maps> getData(String origin, String destination) async {
  final response = await http.get(
      'https://maps.googleapis.com/maps/api/distancematrix/json?origins=${origin}&destinations=${destination}&units=imperial&key=AIzaSyCPSnTtP8qqFwqjJeup1Ot7Qby_-MVar50');
  return mapsFromJson(response.body);
}

Maps mapsFromJson(String str) {
  final jsonData = json.decode(str);
  return Maps.fromJson(jsonData);
}

String mapsToJson(Maps data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class Maps {
  List<String> destinationAddresses;
  List<String> originAddresses;
  List<Row> rows;
  String status;

  Maps({
    this.destinationAddresses,
    this.originAddresses,
    this.rows,
    this.status,
  });

  factory Maps.fromJson(Map<String, dynamic> json) => new Maps(
        destinationAddresses:
            new List<String>.from(json["destination_addresses"].map((x) => x)),
        originAddresses:
            new List<String>.from(json["origin_addresses"].map((x) => x)),
        rows: new List<Row>.from(json["rows"].map((x) => Row.fromJson(x))),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "destination_addresses":
            new List<dynamic>.from(destinationAddresses.map((x) => x)),
        "origin_addresses":
            new List<dynamic>.from(originAddresses.map((x) => x)),
        "rows": new List<dynamic>.from(rows.map((x) => x.toJson())),
        "status": status,
      };
}

class Row {
  List<Element> elements;

  Row({
    this.elements,
  });

  factory Row.fromJson(Map<String, dynamic> json) => new Row(
        elements: new List<Element>.from(
            json["elements"].map((x) => Element.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "elements": new List<dynamic>.from(elements.map((x) => x.toJson())),
      };
}

class Element {
  Distance distance;
  Distance duration;
  String status;

  Element({
    this.distance,
    this.duration,
    this.status,
  });

  factory Element.fromJson(Map<String, dynamic> json) => new Element(
        distance: Distance.fromJson(json["distance"]),
        duration: Distance.fromJson(json["duration"]),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "distance": distance.toJson(),
        "duration": duration.toJson(),
        "status": status,
      };
}

class Distance {
  String text;
  int value;

  Distance({
    this.text,
    this.value,
  });

  factory Distance.fromJson(Map<String, dynamic> json) => new Distance(
        text: json["text"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "value": value,
      };
}

Widget wait(context) {
  return Center(
    child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(Colors.red[700]),
    ),
  );
}
