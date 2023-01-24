import 'package:flutter/material.dart';
import 'package:neuroute_prescreen/Providers/form_manager.dart';
import 'package:neuroute_prescreen/components/registration.dart';
import 'package:provider/provider.dart';
import 'components/history.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:universal_html/html.dart' as html;


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => FormManager(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Homepage(),
      ),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        left: false,
        right: false,
        top: true,
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Header(),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 50,
                      height: 1,
                      color: Colors.grey.withOpacity(0.7),
                    ),
                    Text(
                      "Dr. Stephens waiting room ",
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    Container(
                      width: 50,
                      height: 1,
                      color: Colors.grey.withOpacity(0.7),
                    )
                  ],
                ),
                CheckDetails(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Header extends StatefulWidget {
  const Header({Key? key}) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  bool empowerToggle = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            ClipRect(
              child: Align(
                  heightFactor: 0.8,
                  alignment: Alignment.topCenter,
                  child: Image.asset('assets/depression.png')),
            ),
            Container(
              padding: EdgeInsets.all(15),
              width: double.infinity,
              child: Column(
                children: [
                  Text(
                    "Empower Programme",
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "For mild to moderate depression",
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
              color: const Color(0xff224258).withOpacity(0.7),
              height: 90,
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
              border:
              Border.symmetric(vertical: BorderSide(color: Colors.grey))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    empowerToggle = !empowerToggle;
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        "Read about Empower",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Container(
                        decoration: BoxDecoration(
                            color: Color(0xff00C7A8),
                            borderRadius: BorderRadius.circular(4)),
                        child: empowerToggle
                            ? const Icon(
                          Icons.keyboard_arrow_down,
                          size: 24,
                          color: Color(0xff114F45),
                        )
                            : const Icon(
                          Icons.keyboard_arrow_right,
                          size: 24,
                          color: Color(0xff114F45),
                        ))
                  ],
                ),
              ),
              Visibility(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20,),
                    Text(
                        "Empower is a pioneering research study evaluating the use of an investigational at-home treatment option for moderate to severe depression. Participate from the comfort of your own home to receive a free headset over ten weeks and receive up to \$300."),
                  ],
                ),
                visible: empowerToggle,
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
          child: GestureDetector(
            onTap: () {
              html.window.open(
                'https://calendly.com/flowempower/getstarted?month=2022-12',
                'Calendly',
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text("Talk to us", style: TextStyle(fontSize: 16)),
                ),
                Icon(
                  Icons.people,
                  size: 24,
                  color: Colors.grey[600],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CheckDetails extends StatefulWidget {
  const CheckDetails({Key? key}) : super(key: key);

  @override
  State<CheckDetails> createState() => _CheckDetailsState();
}

class _CheckDetailsState extends State<CheckDetails> {
  bool isChecked = false;

  Widget detailRow(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: [
          Icon(
            Icons.check,
            size: 20,
            color: Color(0xff00C7A8),
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            text,
            style: TextStyle(fontSize: 16, color: Colors.grey[800]),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              "Check this is right for you",
              style: TextStyle(fontSize: 20, color: Colors.grey[800]),
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Divider(
            thickness: 1,
            indent: 0,
            endIndent: 0,
            color: Colors.grey.withOpacity(0.5),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                detailRow("I'm over 18"),
                detailRow("I have moderate depression"),
                detailRow("I live in London"),
              ],
            ),
          ),
          Divider(
            thickness: 1,
            indent: 0,
            endIndent: 0,
            color: Colors.grey.withOpacity(0.5),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 4),
            child: Row(
              children: [
                Checkbox(
                    fillColor:
                    MaterialStateProperty.all<Color>(Color(0xff00C7A8)),
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    }),
                SizedBox(
                  width: 12,
                ),
                Text(
                  "I confirm the above is accurate",
                  style: TextStyle(fontSize: 16, color: Colors.grey[800]),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 1,
            indent: 0,
            endIndent: 0,
            color: Colors.grey.withOpacity(0.5),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  showMaterialModalBottomSheet(
                  animationCurve: Curves.easeOutCubic,
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (context) =>
                    //   Padding(
                    // padding: MediaQuery.of(context).viewInsets,
                    // child:

                    SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    controller: ModalScrollController.of(context),
                    child: Container(
                    // height: MediaQuery.of(context).size.height - 200,
                    child: HistoryForm(),
                    decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))),
                    ),
                    )
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Medical history",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    backgroundColor: Color(0xff5D6569)),
              )),
          SizedBox(
            height: 12,
          ),
          Container(
            // padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets),
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  showMaterialModalBottomSheet(
                    animationCurve: Curves.easeOutCubic,
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (context) =>
                        // Padding(
                          // padding: MediaQuery.of(context).viewInsets,
                          // child:
                    SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            controller: ModalScrollController.of(context),
                            child: Container(
                              // height: MediaQuery
                              //     .of(context)
                              //     .size
                              //     .height - 70,
                              child: RegistrationForm(),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))),
                            ),
                          ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Finish sign up",
                      style: TextStyle(color: Colors.white)),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xff5D6569),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                ),
              )),
        ],
      ),
    );
  }
}
