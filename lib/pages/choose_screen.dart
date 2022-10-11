import 'package:borhanudiincollege/pages/addmission_form.dart';
import 'package:flutter/material.dart';

class ChooseScreen extends StatefulWidget {
  ChooseScreen({Key? key}) : super(key: key);

  @override
  State<ChooseScreen> createState() => _ChooseScreenState();
}

class _ChooseScreenState extends State<ChooseScreen> {
  List<String> pageTitle = [
    "Honurs",
    "Professional",
    "Degree",
    "Master's / MAS / Ad./ MBA / M.phil/ Ph.D/ PGD"
  ];
  List<Widget> pageview1 = [
    SizedBox(
      height: 500,
      child: ListView(
        children: [
          Container(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Text('Honours'),
            ),
            width: 200,
            alignment: Alignment.center,
            decoration:
                BoxDecoration(border: Border.all(color: Colors.blueAccent)),
          ),
        ],
      ),
    ),
    SizedBox(
      height: 500,
      child: ListView(
        children: [
          Container(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Text('Honours Professional'),
            ),
            width: 200,
            alignment: Alignment.center,
            decoration:
                BoxDecoration(border: Border.all(color: Colors.blueAccent)),
          ),
        ],
      ),
    ),
    SizedBox(
      height: 500,
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Text('Degree Pass'),
              ),
              width: 200,
              alignment: Alignment.center,
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.blueAccent)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Text('Degree Private'),
              ),
              width: 200,
              alignment: Alignment.center,
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.blueAccent)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Text('Private Certificate Course'),
              ),
              width: 200,
              alignment: Alignment.center,
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.blueAccent)),
            ),
          ),
        ],
      ),
    ),
    SizedBox(
      height: 500,
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Text('Master\s Professional'),
              ),
              width: 200,
              alignment: Alignment.center,
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.blueAccent)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Text('Master\s Reg. '),
              ),
              width: 200,
              alignment: Alignment.center,
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.blueAccent)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Text('Master\'s Preli Private'),
              ),
              width: 200,
              alignment: Alignment.center,
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.blueAccent)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Text('On Campus MBA & MAS'),
              ),
              width: 200,
              alignment: Alignment.center,
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.blueAccent)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Text('On Campus M.Phil'),
              ),
              width: 200,
              alignment: Alignment.center,
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.blueAccent)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Text('On Campus Ph.D'),
              ),
              width: 200,
              alignment: Alignment.center,
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.blueAccent)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Text('Master\'s Preli'),
              ),
              width: 200,
              alignment: Alignment.center,
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.blueAccent)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Text('M.phil Leading Ph.D'),
              ),
              width: 200,
              alignment: Alignment.center,
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.blueAccent)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Text('Master\'s Private'),
              ),
              width: 200,
              alignment: Alignment.center,
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.blueAccent)),
            ),
          ),
        ],
      ),
    ),
  ];
  int pageViewIndex = 0;

  // Try single controller.
  PageController? controller;
  // Try multiple controller.
  List<PageController>? controllers;
  @override
  void initState() {
    controller = PageController(initialPage: 0); // pageview0 and pageview1
    controllers = [];
    controllers!.add(PageController(initialPage: 0)); // pageview0
    controllers!.add(PageController(initialPage: 0));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text('Choose Level'),
        ),
        body: SafeArea(
            child: Column(children: [
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: pageTitle.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      pageViewIndex = index;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.blueAccent)),
                      height: 50,
                      width: 100,
                      child: Text(pageTitle[index]),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          InkWell(onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) =>AddmissionFormScreen(title: pageTitle[pageViewIndex]) ,));
          },child: pageview1[pageViewIndex])
        ])));
  }
}
