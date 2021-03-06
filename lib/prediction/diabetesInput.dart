import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

// diabetesInput.dart: Defines a Stateful widget which takes numerical values of diabetes test and
// get diabetes risk result. Sends the numerical data given by user through HTTP POST request to REST API Endpoint.

class DiabetesInput extends StatefulWidget {
  @override
  _DiabetesInputState createState() => _DiabetesInputState();
}

class _DiabetesInputState extends State<DiabetesInput> {
  late int pregnancies, glucose, bloodPressure, skinThickness, insulin, bmi, age;
  late double diabetesPedgreeFuncion;
  String url = "http://192.168.1.3:5000/predict"; // This is local ip of the network on which flask server is running
  int show = -1;
  @override
  void initState() {
    pregnancies = 0;
    glucose = 121;
    bloodPressure = 69;
    skinThickness = 20;
    insulin = 0;
    bmi = 32;
    age = 35;
    diabetesPedgreeFuncion = 0.47;
  }

  void getPredictions(
      int pregnancies,
      int glucose,
      int bloodPressure,
      int skinThickness,
      int insulin,
      int bmi,
      int age,
      double diabetesPedgreeFuncion) async {
    var response = await http.post(Uri.parse(url), body: {
      "disease": "diabetes",
      "pregnancies": "$pregnancies",
      "glucose": "$glucose",
      "blood pressure": "$bloodPressure",
      "skin thickness": "$skinThickness",
      "insulin": "$insulin",
      "BMI": "$bmi",
      "diabetes pedegree function": "$diabetesPedgreeFuncion",
      "age": "$age",
    });
    setState(() {
      show = jsonDecode(response.body)['prediction'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Diabetes Test Resutls")),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  "Enter following parameters",
                  textAlign: TextAlign.left,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Pregnancies",
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(8.0),
                      borderSide: new BorderSide(),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      pregnancies = int.parse(value);
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Glucose",
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(8.0),
                      borderSide: new BorderSide(),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      glucose = int.parse(value);
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Blood Pressure",
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(8.0),
                      borderSide: new BorderSide(),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      bloodPressure = int.parse(value);
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Skin Thickness",
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(8.0),
                      borderSide: new BorderSide(),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      skinThickness = int.parse(value);
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Insulin",
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(8.0),
                      borderSide: new BorderSide(),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      insulin = int.parse(value);
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "BMI",
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(8.0),
                      borderSide: new BorderSide(),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      bmi = int.parse(value);
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "DiabetesPedegree Function",
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(8.0),
                      borderSide: new BorderSide(),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      diabetesPedgreeFuncion = double.parse(value);
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Age",
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(8.0),
                      borderSide: new BorderSide(),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      age = int.parse(value);
                    });
                  },
                ),
              ),
              show == 1
                  ? Card(
                      child: ListTile(
                        subtitle: Text("High Risk",
                            style: TextStyle(
                                fontSize: 22.5,
                                fontWeight: FontWeight.w500,
                                color: Colors.red)),
                        title: Text("Your Diabetes Risk",
                            style: TextStyle(
                              fontSize: 17.5,
                              fontWeight: FontWeight.w500,
                            )),
                      ),
                    )
                  : show == 0
                      ? Card(
                          child: ListTile(
                            subtitle: Text("Low Risk",
                                style: TextStyle(
                                    fontSize: 22.5,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.green)),
                            title: Text("Your Diabetes Risk",
                                style: TextStyle(
                                  fontSize: 17.5,
                                  fontWeight: FontWeight.w500,
                                )),
                          ),
                        )
                      : Card(
                          child: ListTile(
                            subtitle: Text("Not Tested",
                                style: TextStyle(
                                    fontSize: 22.5,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey)),
                            title: Text("Your Diabetes Risk",
                                style: TextStyle(
                                  fontSize: 17.5,
                                  fontWeight: FontWeight.w500,
                                )),
                          ),
                        ),
              SizedBox(height: 100)
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: FaIcon(FontAwesomeIcons.bookMedical),
        label: Text("Get Results"),
        onPressed: () {
          // pregnancies = pregnancies ?? 0;
          // glucose = glucose ?? 121;
          // bloodPressure = bloodPressure ?? 69;
          // skinThickness = skinThickness ?? 20;
          // insulin = insulin ?? 0;
          // bmi = bmi ?? 32;
          // diabetesPedgreeFuncion = diabetesPedgreeFuncion ?? 0.47;
          // age = age ?? 35;
          pregnancies = pregnancies ;
          glucose = glucose;
          bloodPressure = bloodPressure ;
          skinThickness = skinThickness;
          insulin = insulin;
          bmi = bmi ;
          diabetesPedgreeFuncion = diabetesPedgreeFuncion ;
          age = age;
          getPredictions(pregnancies, glucose, bloodPressure, skinThickness,
              insulin, bmi, age, diabetesPedgreeFuncion);
          print(
              "$pregnancies, $glucose, $bloodPressure, $skinThickness, $insulin, $bmi, $age, $diabetesPedgreeFuncion");
        },
      ),
    );
  }
}
