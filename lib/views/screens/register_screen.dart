
import 'package:flutter/material.dart';
import 'package:sca_ui/models/user.dart';
import 'package:sca_ui/routes/route_names.dart';
import 'package:sca_ui/viewmodels/registerscreen_viewmodel.dart';
import 'package:stacked/stacked.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldState>();

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _phonenumber = TextEditingController();
  TextEditingController _firstname = TextEditingController();
  TextEditingController _lastname = TextEditingController();
  bool hidePass = true;
  bool loading = false;

  String error = "";

  Animation animation, delayedAnimation, muchDelayedAnimation;
  AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController =
        AnimationController(duration: Duration(seconds: 3), vsync: this);

    animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        curve: Curves.fastOutSlowIn, parent: animationController));
    delayedAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        curve: Interval(
          0.5,
          1.0,
          curve: Curves.fastOutSlowIn,
        ),
        parent: animationController));
    muchDelayedAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        curve: Interval(
          0.8,
          1.0,
          curve: Curves.fastOutSlowIn,
        ),
        parent: animationController));
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    animationController.forward();
    return AnimatedBuilder(
        animation: animationController,
        builder: (BuildContext context, Widget child) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              brightness: Brightness.light,
              backgroundColor: Colors.transparent,
              elevation: 0,
              bottomOpacity: 0,
//        leading:
//        title:
              flexibleSpace: Padding(
                padding: const EdgeInsets.only(top: 50.0, left: 20),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, RouteNames.registerScreen);
                      },
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: "Already have an account? ",
                            style: TextStyle(color: Colors.black),
                          ),
                          TextSpan(
                            text: "Click here",
                            style: TextStyle(
                                color: Colors.black,
                                decoration: TextDecoration.underline),
                          ),
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            body: Stack(
              children: <Widget>[
                Transform(
                  transform: Matrix4.translationValues(
                      muchDelayedAnimation.value * width, 0.0, 0.0),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 28.0, bottom: 100),
                      child: Icon(
                        Icons.ac_unit,
                        color: Colors.black,
                        size: 13,
                      ),
                    ),
                  ),
                ),
                Transform(
                  transform: Matrix4.translationValues(
                      animation.value * width, 0.0, 0.0),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 48.0),
                      child: Icon(
                        Icons.ac_unit,
                        color: Colors.black,
                        size: 15,
                      ),
                    ),
                  ),
                ),
                Transform(
                  transform: Matrix4.translationValues(
                      muchDelayedAnimation.value * width, 0.0, 0.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 18.0),
                      child: Icon(
                        Icons.adjust,
                        color: Colors.black,
                        size: 12,
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, bottom: 10),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Transform(
                              transform: Matrix4.translationValues(
                                  animation.value * width, 0.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Text("Hello\nDearest,",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Transform(
                              transform: Matrix4.translationValues(
                                  muchDelayedAnimation.value * width, 0.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, right: 50, top: 10),
                                child: Text(
                                  "We want you to provide a little information about you and your business below, to use this ",
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.7),
                                      fontSize: 15),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                              const EdgeInsets.only(left: 20.0, right: 20),
                              child: Transform(
                                transform: Matrix4.translationValues(
                                    delayedAnimation.value * width, 0.0, 0.0),
                                child: Form(
                                  key: _formKey,
                                  child: Column(
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 4.0),
                                              child: Theme(
                                                data: Theme.of(context)
                                                    .copyWith(
                                                    primaryColor:
                                                    Colors.black),
                                                child: TextFormField(
                                                  controller: _lastname,
                                                  validator: (value) {
                                                    if (value.isEmpty) {
                                                      return "The name field cannot be empty";
                                                    }
                                                    return null;
                                                  },
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                  decoration: InputDecoration(
                                                    enabledBorder:
                                                    UnderlineInputBorder(
                                                        borderSide:
                                                        BorderSide(
                                                            color: Colors
                                                                .black)),
                                                    labelText: 'LAST NAME',
                                                    labelStyle: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 4.0),
                                              child: Theme(
                                                data: Theme.of(context)
                                                    .copyWith(
                                                    primaryColor:
                                                    Colors.black),
                                                child: TextFormField(
                                                  controller: _firstname,
                                                  validator: (value) {
                                                    if (value.isEmpty) {
                                                      return "The name field cannot be empty";
                                                    }
                                                    return null;
                                                  },
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                  decoration: InputDecoration(
                                                    enabledBorder:
                                                    UnderlineInputBorder(
                                                        borderSide:
                                                        BorderSide(
                                                            color: Colors
                                                                .black)),
                                                    labelText: 'FIRST NAME',
                                                    labelStyle: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.black),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding:
                                        EdgeInsets.fromLTRB(0, 10, 0, 0),
                                        child: Theme(
                                          data: Theme.of(context).copyWith(
                                              primaryColor: Colors.black),
                                          child: TextFormField(
                                            controller: _email,
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                Pattern pattern =
                                                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                                RegExp regex =
                                                new RegExp(pattern);
                                                if (!regex.hasMatch(value))
                                                  return 'Please make sure your email address is valid';
                                                else
                                                  return null;
                                              }
                                            },
                                            style:
                                            TextStyle(color: Colors.black),
                                            decoration: InputDecoration(
                                              enabledBorder:
                                              UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.black)),
                                              labelText: 'EMAIL',
                                              labelStyle: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                        EdgeInsets.fromLTRB(0, 10, 0, 0),
                                        child: Theme(
                                          data: Theme.of(context).copyWith(
                                              primaryColor: Colors.black),
                                          child: TextFormField(
                                            controller: _phonenumber,
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                return "The name field cannot be empty";
                                              }
                                              return null;
                                            },
                                            style:
                                            TextStyle(color: Colors.black),
                                            decoration: InputDecoration(
                                              enabledBorder:
                                              UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.black)),
                                              labelText: 'PHONE NUMBER',
                                              labelStyle: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                        EdgeInsets.fromLTRB(0, 10, 0, 0),
                                        child: Theme(
                                          data: Theme.of(context).copyWith(
                                              primaryColor: Colors.black),
                                          child: TextFormField(
                                            controller: _password,
                                            obscureText: true,
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                return "The password field cannot be empty";
                                              } else if (value.length < 6) {
                                                return "the password has to be at least 6 characters long";
                                              }
                                              return null;
                                            },
                                            style: TextStyle(
                                              color: Colors.black,
                                            ),
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              enabledBorder:
                                              UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.black)),
                                              labelText: 'PASSWORD',
                                              labelStyle: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                        EdgeInsets.fromLTRB(0, 10, 0, 0),
                                        child: Theme(
                                          data: Theme.of(context).copyWith(
                                              primaryColor: Colors.black),
                                          child: TextFormField(
                                            obscureText: true,
                                            validator: (value) {
                                              if (value.isEmpty) {
                                                return "The password field cannot be empty";
                                              } else if (value.length < 6) {
                                                return "the password has to be at least 6 characters long";
                                              }
                                              return null;
                                            },
                                            style: TextStyle(
                                              color: Colors.black,
                                            ),
                                            decoration: InputDecoration(
                                              enabledBorder:
                                              UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.black)),
                                              labelText: 'CONFIRM PASSWORD',
                                              labelStyle: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
//          ),
                            ),
                          ]),
                    ),
                  ],
                ),
              ],
            ),
            bottomNavigationBar: Transform(
              transform: Matrix4.translationValues(
                  muchDelayedAnimation.value * width, 0.0, 0.0),
              child: BottomAppBar(
                color: Colors.white,
                elevation: 0,
//        child: Transform(
//          transform: Matrix4.translationValues(muchDelayedAnimation.value * width, 0.0, 0.0),
                child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
//                    InkWell(
//                      onTap: () {
//                        widget.toggleView();
//                      },
                          Row(
                            children: <Widget>[
                              Checkbox(
                                value: true,
                                onChanged: null,
                              ),
                              RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                    text: "I have read & agreed to the ",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 8),
                                  ),
                                  TextSpan(
                                    text: "terms and conditions",
                                    style: TextStyle(
                                        color: Colors.black,
                                        decoration: TextDecoration.underline,
                                        fontSize: 8),
                                  ),
                                ]),
                              ),
                            ],
                          ),

//                    ),
//              Text("boo", style: TextStyle(color: Colors.white),),
                          ViewModelBuilder<RegisterScreenViewModel>.reactive(
                            viewModelBuilder: () => RegisterScreenViewModel(),
                            builder: (_, model, __) =>
                                Material(
                                  borderRadius: BorderRadius.circular(30.0),
                                  color: Colors.deepOrangeAccent[400],
                                  elevation: 0.0,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: InkWell(
                                  onTap: () async {
                                    if (_formKey.currentState.validate()) {
                                      await model.SignUpWithEmailAndPassword(
                                        users: Users(
                                          password: _password.text,
                                          email: _email.text,
                                          firstname: _firstname.text,
                                          lastname: _lastname.text,
                                          phonenumber: _phonenumber.text,
                                        ),
                                        context: context,
                                      );
                                    }
                                  },
                                      child: model.busy
                                          ? CircularProgressIndicator(
                                        backgroundColor: Colors.white,
                                      )
                                      : Icon(
                                        Icons.arrow_forward,
                                        size: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                            ),
                          )
                        ])),
//        ),
              ),
            ),
          );
        });
  }
}

//  final _auth = FirebaseAuth.instance;
//  String email;
//  String password;
//  var currentItem = 'Recruiter';
//  @override
//  Widget build(BuildContext context) {
//    return ViewModelBuilder<RegisterScreenViewModel>.reactive(
//        builder: (context, model, child) => SafeArea(
//              child: Scaffold(
//                backgroundColor: Color(0xff564569),
//                body: Padding(
//                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
//                  child: Column(
//                    mainAxisAlignment: MainAxisAlignment.center,
//                    children: [
//                      Container(
//                        alignment: Alignment.center,
//                        height: SizeConfig.safeBlockVertical * 20,
//                        child: Text(
//                          'Job\nFinder',
//                          textAlign: TextAlign.center,
//                          style: TextStyle(
//                              color: Colors.white,
//                              fontSize: SizeConfig.safeBlockHorizontal * 11,
//                              fontWeight: FontWeight.bold),
//                        ),
//                      ),
//                      SizedBox(
//                        height: SizeConfig.safeBlockVertical * 5,
//                      ),
//                      TextField(
//                          keyboardType: TextInputType.emailAddress,
//                          textAlign: TextAlign.center,
//                          onChanged: (value) {
//                            email = value;
//                          },
//                          decoration: ktextFieldDecoration.copyWith(
//                              hintText: 'Enter your Email')),
//                      SizedBox(
//                        height: SizeConfig.safeBlockVertical * 1,
//                      ),
//                      TextField(
//                          obscureText: true,
//                          textAlign: TextAlign.center,
//                          onChanged: (value) {
//                            password = value;
//                          },
//                          decoration: ktextFieldDecoration.copyWith(
//                            hintText: 'Enter your Password',
//                          )),
//                      SizedBox(
//                        height: SizeConfig.safeBlockVertical * 1,
//                      ),
//                      ClipRRect(
//                        borderRadius: BorderRadius.all(Radius.circular(32)),
//                        child: Container(
//                          padding:
//                              EdgeInsets.symmetric(horizontal: 47, vertical: 0),
//                          decoration: BoxDecoration(color: Colors.white),
//                          child: DropdownButton<String>(
//                            items: model.userTypeList
//                                .map(
//                                  (String dropDownItem) =>
//                                      DropdownMenuItem<String>(
//                                    value: dropDownItem,
//                                    child: Text(dropDownItem),
//                                  ),
//                                )
//                                .toList(),
//                            onChanged: (String valueSelected) {
//                              setState(() {
//                                currentItem = valueSelected;
//                              });
//                            },
//                            hint: Text(
//                              'Recruiter or Job Seeker?',
//                              style: TextStyle(fontSize: 15.4),
//                            ),
//                          ),
//                        ),
//                      ),
//                      SizedBox(
//                        height: SizeConfig.safeBlockVertical * 2.5,
//                      ),
//                      CustomButton(
//                        height: SizeConfig.safeBlockVertical * 12,
//                        text: 'Register',
//                        onPressed: () async {
//                          try {
//                            final newUser =
//                                await _auth.createUserWithEmailAndPassword(
//                                    email: email, password: password);
//                            setState(() {
//                              CircularProgressIndicator();
//                            });
//                            if (newUser != null) {
//                              Navigator.pushNamed(
//                                  context, RouteNames.loginScreen);
//                            }
//                          } catch (e) {
//                            print(e);
//                          }
//                        },
//                        buttonColor: Colors.deepPurple[300],
//                        textColor: Colors.white,
//                      ),
//                    ],
//                  ),
//                ),
//              ),
//            ),
//        viewModelBuilder: () => RegisterScreenViewModel());
//  }
//}
