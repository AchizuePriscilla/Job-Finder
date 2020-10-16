import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:http/http.dart';
import 'package:sca_ui/viewmodels/homescreen_viewmodel.dart';

class HomeScren extends StatefulWidget {
  @override
  _HomeScrenState createState() => _HomeScrenState();
}

class _HomeScrenState extends State<HomeScren> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeScreenViewModel>.reactive(
        onModelReady: (model) => model.loadPhoto(),
        builder: (context, model, child) => Scaffold(
              body: SafeArea(
                child: Scaffold(
                  backgroundColor: Colors.white38,
                  body: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 180,
                          height: 180,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                              ),
                            ],
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(30),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(model.imageLink),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Text(
                          'Get The Job That You Dream Of',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xff564569),
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        Text(
                          'Just some random text. Mind\'s foggy, can\'t come up with something meaningful',
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(color: Color(0xff818181), fontSize: 18),
                        ),
                        SizedBox(
                          height: 60,
                        ),
                        MaterialButton(
                          onPressed: () {},
                          height: 75,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          elevation: 30,
                          textColor: Colors.white,
                          color: Color(0xff564569),
                          child: Text(
                            'Start',
                            style: TextStyle(fontSize: 20),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
        viewModelBuilder: () => HomeScreenViewModel());
  }
}

// Container(
//                         width: double.infinity,
//                         height: 550,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           color: Colors.grey,
//                           image: DecorationImage(
//                             fit: BoxFit.cover,
//                             image: NetworkImage(model.imageLink),
//                           ),
//                         ),
//                       ),
