// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:borhanudiincollege/pages/const.dart';
import 'package:borhanudiincollege/pages/home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class AddmissionFormScreen extends StatefulWidget {
  String title;
  AddmissionFormScreen({super.key, required this.title});

  @override
  State<AddmissionFormScreen> createState() => _AddmissionFormScreenState();
}

class _AddmissionFormScreenState extends State<AddmissionFormScreen> {
  TextEditingController sscRoll = TextEditingController();
  TextEditingController sscReg = TextEditingController();
  TextEditingController studentNameE = TextEditingController();
  TextEditingController studentNameB = TextEditingController();
  TextEditingController fatherE = TextEditingController();
  TextEditingController fatherB = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();

  TextEditingController motherE = TextEditingController();
  TextEditingController motherB = TextEditingController();
  TextEditingController fatherpesha = TextEditingController();
  TextEditingController motherPesha = TextEditingController();

  TextEditingController presentAddress = TextEditingController();
  TextEditingController permanentAddress = TextEditingController();
  TextEditingController localGurdian = TextEditingController();
  TextEditingController fatherMobile = TextEditingController();
  TextEditingController motherMobile = TextEditingController();

  TextEditingController fatherincome = TextEditingController();
  TextEditingController motherincome = TextEditingController();
  TextEditingController dhormo = TextEditingController();
  TextEditingController shomproday = TextEditingController();
  TextEditingController dob = TextEditingController();

  TextEditingController birthplace = TextEditingController();
  TextEditingController nationality = TextEditingController();
  TextEditingController married = TextEditingController();

  TextEditingController hscBoard = TextEditingController();
  TextEditingController hscPoint = TextEditingController();
  TextEditingController hscclasss = TextEditingController();
  TextEditingController hscpassingYear = TextEditingController();
  TextEditingController hscRoll = TextEditingController();
  TextEditingController hscReg = TextEditingController();
  TextEditingController hscSession = TextEditingController();

  FocusNode phoneNumberFocusNode = FocusNode();
  String sscBoardSelected = 'Select SSC Board';
  int sscPassingYearselected = 0;
  int hscBoardSelected = 0;
  int divisionSelected = 0,
      disctrictSelected1 = 0,
      selectedCollege = 0,
      subjectIndex = 0;
  int disctrictSelected = 0;
  int hscPassingYearselected = 0;
  File? imagePath;
  List selectedSub = [];
  String? dobText;
  List<String> sscBoard = [
    'Barisal',
    'Chittagong',
    'Cumilla',
    'Dhaka',
    'Dinajpur',
    'Jessore',
    'Mymensingh',
    'Rajshahi',
    'Sylhet',
    'Madrasah',
    'BTEB',
    'Bou'
  ];
  List<String> disctrict = [
    'Barguna District',
    'Barisal District',
    'Bhola District',
    'Jhalokati District',
    'Patuakhali District',
    'Pirojpur District',
    'Bandarban District',
    'Brahmanbaria District',
    'Chandpur District',
    'Chittagong District',
    'Comilla District',
    'Cox\'s Bazar District',
    'Feni District',
    'Khagrachhari District',
    'Lakshmipur District',
    'Noakhali District',
    'Rangamati District',
    'Dhaka District',
    'Faridpur District',
    'Gazipur District',
    'Gopalganj District',
    'Jamalpur District',
    'Kishoreganj District',
    'Madaripur District',
    'Manikganj District',
    'Munshiganj District',
    'Mymensingh District',
    'Narayanganj District',
    'Narsingdi District',
    'Netrakona District',
    'Rajbari District',
    'Shariatpur District',
    'Sherpur District',
    'Tangail District',
    'Bagerhat District',
    'Chuadanga District',
    'Jessore District',
    'Jhenaidah District',
    'Khulna District',
    'Kushtia District',
    'Magura District',
    'Meherpur District',
    'Narail District',
    'Satkhira District',
    'Bogura District',
    'Joypurhat District',
    'Naogaon District',
    'Natore District',
    'Nawabganj District',
    'Pabna District',
    'Rajshahi District',
    'Sirajganj District',
    'Dinajpur District',
    'Gaibandha District',
    'Kurigram District',
    'Lalmonirhat District',
    'Nilphamari District',
    'Panchagarh District',
    'Rangpur District',
    'Thakurgaon District',
    'Habiganj District',
    'Moulvibazar District',
    'Sunamganj District',
    'Sylhet District'
  ];
  List<String> subjectList = [
    'Select From Here',
    '1001-BANGLA',
    '1101-ENGLISH',
    '1601-ISLAMIC HISTORY AND CULTURE',
    '1901-POLITICAL SCIENCE',
    '2101-SOCIAL WORK',
    '2201-ECONOMICS',
    '2301-MARKETING',
    '2401-FINANCE',
    '2501-ACCOUNTING',
    '2601-MANAGEMENT',
    '3401-PSYCHOLOGY',
    '4001-ANTHROPOLOGY',
    '4401-ENVIRONMENTAL SCIENCE'
  ];
  List<String> CollegeList = [
    'Sheikh Borhan Uddin Post Graduate College',
    'A K M Rahmat Ullah College ',
    'Abujar Gifari College ',
    'Adamzee Cantonment College ',
    'Alhaj Mockbul Hossain University College ',
    'Begum Badrunnessa Govt. Mohila Colllege ',
    'Central Womens’ College',
    'College of Fashion Technology & Management',
    'Dania College',
    'Dhaka City College',
    'Dhaka College ',
    'Dhaka Commerce College',
    'Dhaka Mohanagar Mohila College',
    'Dhaka Women College '
  ];
  List<String> division = [
    'Barishal',
    'Chattogram',
    'Dhaka',
    'Khulna',
    'Mymensingh',
    'Rajshahi',
    'Rangpur',
    'Sylhet'
  ];
  List<String> passingYear = ['2017', '2018', '2019', '2020', '2021'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      backgroundColor: Colors.greenAccent,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: PageView(
          children: [
            Column(children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Image.asset(
                  "assets/images/Shaikh_Burhanuddin_Post_Graduate_College_logo.jpeg",
                  width: 1000.h,
                  height: 500.w,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'SSC',
                  style: TextStyle(
                      color: Color(0xFF0070BB),
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              fullrows(
                textInputType: TextInputType.text,
                hints: "Roll",
                textEditingController: sscRoll,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Roll is Required';
                  }
                },
                title: 'Roll',
              ),
              fullrows(
                textInputType: TextInputType.text,
                hints: "Reg",
                textEditingController: sscReg,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return "Reg is Required";
                  }
                },
                title: 'Reg',
              ),
              SizedBox(
                height: 10,
              ),
              titleWidget(text: 'Ssc Board'),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xFF0070BB),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(5)),
                  height: 50,
                  child: DropdownButton(
                    hint: Text(sscBoardSelected),
                    menuMaxHeight: 200,
                    alignment: AlignmentDirectional.centerEnd,
                    isExpanded: true,
                    items: sscBoard
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        sscBoardSelected = value!;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              titleWidget(text: 'Passing Year'),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xFF0070BB),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(5)),
                  height: 50,
                  child: DropdownButton(
                    hint: Text(passingYear[sscPassingYearselected]),
                    menuMaxHeight: 200,
                    alignment: AlignmentDirectional.centerEnd,
                    isExpanded: true,
                    items: passingYear
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        sscPassingYearselected = passingYear
                            .indexWhere((element) => element == value);
                      });
                    },
                  ),
                ),
              )
            ]),

//hsc

            SizedBox(
              height: 500,
              child: Column(children: [
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Image.asset(
                    "assets/images/Shaikh_Burhanuddin_Post_Graduate_College_logo.jpeg",
                    width: 1000.h,
                    height: 500.w,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'HSC',
                    style: TextStyle(
                        color: Color(0xFF0070BB),
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                fullrows(
                  textInputType: TextInputType.text,
                  hints: "Roll",
                  textEditingController: hscRoll,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Roll is Required';
                    }
                  },
                  title: 'Roll',
                ),
                fullrows(
                  textInputType: TextInputType.text,
                  hints: "Reg",
                  textEditingController: hscReg,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return "Reg is Required";
                    }
                  },
                  title: 'Reg',
                ),
                SizedBox(
                  height: 10,
                ),
                titleWidget(text: 'Hsc Board'),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xFF0070BB),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(5)),
                    height: 50,
                    child: DropdownButton(
                      hint: Text(sscBoard[hscBoardSelected]),
                      menuMaxHeight: 200,
                      alignment: AlignmentDirectional.centerEnd,
                      isExpanded: true,
                      items: sscBoard
                          .map(
                              (e) => DropdownMenuItem(value: e, child: Text(e)))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          hscBoardSelected = sscBoard
                              .indexWhere((element) => element == value);
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                titleWidget(text: 'Passing Year'),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xFF0070BB),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(5)),
                    height: 50,
                    child: DropdownButton(
                      hint: Text(passingYear[hscPassingYearselected]),
                      menuMaxHeight: 200,
                      alignment: AlignmentDirectional.centerEnd,
                      isExpanded: true,
                      items: passingYear
                          .map(
                              (e) => DropdownMenuItem(value: e, child: Text(e)))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          hscPassingYearselected = passingYear
                              .indexWhere((element) => element == value);
                        });
                      },
                    ),
                  ),
                )
              ]),
            ),

//personal Information
            ListView(
              children: [
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Image.asset(
                    "assets/images/Shaikh_Burhanuddin_Post_Graduate_College_logo.jpeg",
                    width: 1000.h,
                    height: 500.w,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Personal Information',
                    style: TextStyle(
                        color: Color(0xFF0070BB),
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                fullrows(
                  textInputType: TextInputType.text,
                  hints: "Enter Your Name In English",
                  textEditingController: studentNameE,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return "Name is required";
                    }
                  },
                  title: 'Name (In English)',
                ),
                fullrows(
                  textInputType: TextInputType.text,
                  hints: "Enter Your Name In Bangla",
                  textEditingController: studentNameB,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return "Name is required";
                    }
                  },
                  title: 'Name (In Bangla)',
                ),
                SizedBox(
                  height: 10,
                ),
                titleWidget(text: 'Date Of Birth'),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: GestureDetector(
                    onTap: () {
                      DatePicker.showPicker(
                        context,
                        onChanged: (time) {
                          setState(() {
                            dobText = DateFormat('yyyy-MM-dd').format(time);
                          });
                        },
                      );
                    },
                    child: Container(
                        alignment: Alignment.center,
                        child: dobText != null
                            ? Text(dobText!)
                            : Text('choose Date'),
                        height: 40,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Color(0xFF0070BB), width: 2.0))),
                  ),
                ),
                fullrows(
                  textInputType: TextInputType.text,
                  hints: "Enter Your Father's Name In English",
                  textEditingController: fatherE,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return "Father's Name is required";
                    }
                  },
                  title: 'Father\'s Name (In English)',
                ),
                fullrows(
                  textInputType: TextInputType.text,
                  hints: "Enter Your Father's Name In Bangla",
                  textEditingController: fatherB,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return "Name is required";
                    }
                  },
                  title: 'Father\'s Name (In Bangla)',
                ),
                fullrows(
                  textInputType: TextInputType.text,
                  hints: "Enter Your Father's Occupation",
                  textEditingController: fatherpesha,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return "Ocuupation is required";
                    }
                  },
                  title: 'Father\'s Occupation',
                ),
                fullrows(
                  textInputType: TextInputType.number,
                  hints: "Father's Phone Number",
                  textEditingController: fatherMobile,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return "Father's Mobile is required";
                    }
                  },
                  title: 'Father\'s  Mobile Number',
                ),
                fullrows(
                  textInputType: TextInputType.number,
                  hints: "Father's Income",
                  textEditingController: fatherincome,
                  validator: (String? value) {},
                  title: 'Father\'s  Income (Yearly)',
                ),
                fullrows(
                  textInputType: TextInputType.text,
                  hints: "Enter Your Mother's Name In English",
                  textEditingController: motherE,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return "Mother's Name is required";
                    }
                  },
                  title: 'Mother\'s Name (In English)',
                ),
                fullrows(
                  textInputType: TextInputType.text,
                  hints: "Enter Your Mother's Name In Bangla",
                  textEditingController: motherB,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return "Mother's Name is required";
                    }
                  },
                  title: 'Mother\'s  Name (In Bangla)',
                ),
                fullrows(
                  textInputType: TextInputType.text,
                  hints: "Enter Your Mother's  Occupation",
                  textEditingController: motherPesha,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return "Ocuupation is required";
                    }
                  },
                  title: 'Mother\'s Occupation',
                ),
                fullrows(
                  textInputType: TextInputType.number,
                  hints: "Mother's Phone Number",
                  textEditingController: motherMobile,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return "Mother's Mobile is required";
                    }
                  },
                  title: 'Mother\'s  Mobile Number',
                ),
                fullrows(
                  textInputType: TextInputType.number,
                  hints: "Mother's Income",
                  textEditingController: motherincome,
                  validator: (String? value) {},
                  title: 'Mother\'s  Income (Yearly)',
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
            ListView(
              children: [
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Image.asset(
                    "assets/images/Shaikh_Burhanuddin_Post_Graduate_College_logo.jpeg",
                    width: 1000.h,
                    height: 500.w,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Select College & Course',
                    style: TextStyle(
                        color: Color(0xFF0070BB),
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                titleWidget(text: 'Select Division'),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xFF0070BB),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(5)),
                    height: 50,
                    child: DropdownButton(
                      hint: Text(division[divisionSelected]),
                      menuMaxHeight: 200,
                      alignment: AlignmentDirectional.centerEnd,
                      isExpanded: true,
                      items: division
                          .map(
                              (e) => DropdownMenuItem(value: e, child: Text(e)))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          divisionSelected = division
                              .indexWhere((element) => element == value);
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                titleWidget(text: 'Select District'),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xFF0070BB),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(5)),
                    height: 50,
                    child: DropdownButton(
                      hint: Text(disctrict[disctrictSelected1]),
                      menuMaxHeight: 200,
                      alignment: AlignmentDirectional.centerEnd,
                      isExpanded: true,
                      items: disctrict
                          .map(
                              (e) => DropdownMenuItem(value: e, child: Text(e)))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          disctrictSelected1 = disctrict
                              .indexWhere((element) => element == value);
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                titleWidget(text: 'Select Desired College'),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xFF0070BB),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(5)),
                    height: 50,
                    child: DropdownButton(
                      hint: Text(CollegeList[selectedCollege]),
                      menuMaxHeight: 200,
                      alignment: AlignmentDirectional.centerEnd,
                      isExpanded: true,
                      items: CollegeList.map(
                              (e) => DropdownMenuItem(value: e, child: Text(e)))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedCollege = CollegeList.indexWhere(
                              (element) => element == value);
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                titleWidget(text: 'Choose Subject'),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xFF0070BB),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(5)),
                    height: 50,
                    child: DropdownButton(
                      hint: Text(subjectList[subjectIndex]),
                      menuMaxHeight: 200,
                      alignment: AlignmentDirectional.centerEnd,
                      isExpanded: true,
                      items: subjectList
                          .map(
                              (e) => DropdownMenuItem(value: e, child: Text(e)))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          if (selectedSub.contains(value)) {
                          } else {
                            if (selectedSub.length > 7) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Already Excited ')));
                            }
                            selectedSub.add(value);
                          }
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: selectedSub.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(selectedSub[index]),
                      );
                    },
                  ),
                )
              ],
            ),

            ListView(children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Image.asset(
                  "assets/images/Shaikh_Burhanuddin_Post_Graduate_College_logo.jpeg",
                  width: 1000.h,
                  height: 500.w,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Select College & Course',
                  style: TextStyle(
                      color: Color(0xFF0070BB),
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              titleWidget(text: 'Select Image'),
              imagePath == null
                  ? Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: AssetImage('assets/images/pl.jpg')),
                      ),
                    )
                  : Container(
                      height: 200,
                      width: 200,
                      child: Image.file(imagePath!),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () async {
                  final _picker = ImagePicker();

                  final XFile? pickedImage =
                      await _picker.pickImage(source: ImageSource.gallery);
                  setState(() {
                    if (pickedImage != null) {
                      setState(() {
                        imagePath = File(pickedImage.path);
                      });
                    }
                  });
                },
                child: Icon(
                  Icons.camera,
                  size: 40,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              fullrows(
                textInputType: TextInputType.text,
                hints: "Email",
                textEditingController: email,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return "Email is Required";
                  }
                },
                title: 'Email',
              ),
              SizedBox(
                height: 10,
              ),
              fullrows(
                textInputType: TextInputType.number,
                hints: "Phone Number",
                textEditingController: phoneNumber,
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return "PhoneNumber is Required";
                  }
                },
                title: 'Phone Number',
              ),
              ElevatedButton(
                  onPressed: () async {
                    final docUser =
                        FirebaseFirestore.instance.collection('users').doc();
                    var response = await docUser.set({
                      'Personal Info': {
                        'Name in Enlish': studentNameE.text,
                        'Name In Bangla': studentNameB.text,
                        'Father Name In English': fatherE.text,
                        'Father Name In Bangla': fatherB.text,
                        'Father Mobile Number': fatherMobile.text,
                        'Father Occupession': fatherpesha.text,
                        'Father Income': fatherincome.text,
                        'Mother Name In English': motherE.text,
                        'Mother Name In Bangla': motherB.text,
                        'Mother Mobile Number': motherMobile.text,
                        'Mother Occupession': motherPesha.text,
                        'Mother Income': motherincome.text,
                        'Email': email.text,
                        'phone Number': phoneNumber.text,
                        'Present Address': presentAddress.text,
                        'Permanent Address': permanentAddress.text,
                        'Local Gurdian Name': localGurdian.text,
                        'Religion': dhormo.text,
                        'ethics': shomproday.text,
                        'Date Of Birth': dobText!,
                        'Birth Place': birthplace.text,
                        'Nationality': nationality.text,
                        'Maritial Status': married.text,
                        'image': imagePath.toString()
                      },
                      'ssc': {
                        'SSC Roll': sscRoll.text,
                        'SSC Reg': sscReg.text,
                        'Board': sscBoardSelected,
                        'passing Year': passingYear[sscPassingYearselected],
                      },
                      'HSC': {
                        'HSC Roll': hscRoll.text,
                        'HSC Reg': hscReg.text,
                        'Board': sscBoard[hscBoardSelected],
                        'passing Year': passingYear[hscPassingYearselected],
                      },
                      'College & Subject': {
                        'Division': division[divisionSelected],
                        'District': disctrict[disctrictSelected1],
                        'College': CollegeList[selectedCollege],
                        'Subject': selectedSub,
                      }
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Saved Successfully')));

                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ));
                  },
                  child: Text('Submit'))
            ])
          ],
        ),
      )),
    );
  }
}

class fullrows extends StatefulWidget {
  String title, hints;
  final String? Function(String?)? validator;
  TextEditingController textEditingController;
  TextInputType textInputType;

  fullrows(
      {Key? key,
      required this.title,
      required this.textInputType,
      required this.hints,
      required this.validator,
      required this.textEditingController});

  @override
  State<fullrows> createState() => _fullrowsState();
}

class _fullrowsState extends State<fullrows> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        titleWidget(text: widget.title),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TextFormField(
            controller: widget.textEditingController,
            textAlign: TextAlign.center,
            keyboardType: widget.textInputType,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 14.0, horizontal: 10),
              hintStyle: const TextStyle(),
              hintText: widget.hints,
              fillColor: const Color(0xFF0070BB),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide:
                    const BorderSide(color: Color(0xFF0070BB), width: 4.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: const BorderSide(
                  color: Color(0xFF0070BB),
                  width: 2.0,
                ),
              ),
            ),
            //validator: widget.validator
            //onSaved: onsaved,
          ),
        ),
      ],
    );
  }
}

class titleWidget extends StatelessWidget {
  String text;
  titleWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
