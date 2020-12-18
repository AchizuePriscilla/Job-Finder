import 'package:flutter/material.dart';
import 'package:sca_ui/routes/route_names.dart';
import 'package:stacked/stacked.dart';
import 'package:sca_ui/viewmodels/loginscreen_viewmodel.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldState>();

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

//  String _email;
//  String _password;
//  bool loading = false;
//  bool _autoValidate = false;
//  String email = "";
//  String password = "";
//  String error = "";
//  String errorMsg = "";
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
//    final user = Provider.of<UserProvider>(context);
    animationController.forward();
    String quotes =
        "My business always bores me to death; I prefer other people's";
//    FlutterStatusbarcolor.setStatusBarColor(appBlack);
    return AnimatedBuilder(
        animation: animationController,
        builder: (BuildContext context, Widget child) {
          return Scaffold(
            backgroundColor: Color(0XFF1b1e23),
            appBar: AppBar(
              brightness: Brightness.dark,
              bottomOpacity: 0,
              backgroundColor: Colors.transparent,
              elevation: 0,
              flexibleSpace: Padding(
                padding: const EdgeInsets.all(28.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 28.0, top: 50),
                      child: Icon(
                        Icons.ac_unit,
                        color: Colors.white,
                        size: 13,
                      ),
                    ),
//              Padding(
//                padding: const EdgeInsets.only(bottom: 28.0, left: 30),
//                child: Icon(Icons.blur_circular, color: Colors.white, size: 13,),
//              ),
                    Padding(
                      padding: const EdgeInsets.only(top: 48.0),
                      child: Icon(
                        Icons.ac_unit,
                        color: Colors.white,
                        size: 8,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 18.0),
                      child: Icon(
                        Icons.adjust,
                        color: Colors.white,
                        size: 8,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            body: Container(
//        height: double.infinity,
//        width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFF1b1e23),
              ),
              child: Stack(
                children: <Widget>[
                  ListView(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Center(
                            child: Text(
                              "Job Finder",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'reenie',
                                  letterSpacing: 3,
                                  fontSize: 30),
                            ),
                          ),
                          Transform(
                            transform: Matrix4.translationValues(
                                delayedAnimation.value * width, 0.0, 0.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 28.0, top: 50),
                                  child: Icon(
                                    Icons.ac_unit,
                                    color: Colors.white,
                                    size: 13,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 28.0, left: 30),
                                  child: Icon(
                                    Icons.blur_circular,
                                    color: Colors.white,
                                    size: 13,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 48.0),
                                  child: Icon(
                                    Icons.ac_unit,
                                    color: Colors.white,
                                    size: 8,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 18.0),
                                  child: Icon(
                                    Icons.adjust,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Transform(
                        transform: Matrix4.translationValues(
                            animation.value * width, 0.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Text(
                            "Hello,",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Stack(
                        children: <Widget>[
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 18.0),
                              child: Icon(
                                Icons.adjust,
                                color: Colors.white,
                                size: 8,
                              ),
                            ),
                          ),
                          Transform(
                            transform: Matrix4.translationValues(
                                animation.value * width, 0.0, 0.0),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: Text(
                                "lets find you \nyour next job,",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Transform(
                        transform: Matrix4.translationValues(
                            animation.value * width, 0.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 12.0, right: 12, top: 10),
                          child: Text(
                            "${quotes}\n",
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.7),
                                fontSize: 15),
                          ),
                        ),
                      ),
                      Transform(
                        transform: Matrix4.translationValues(
                            delayedAnimation.value * width, 0.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0, right: 20),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                                  child: Theme(
                                    data: Theme.of(context)
                                        .copyWith(primaryColor: Colors.white),
                                    child: TextFormField(
                                      controller: _email,
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          Pattern pattern =
                                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                          RegExp regex = new RegExp(pattern);
                                          if (!regex.hasMatch(value))
                                            return 'Please make sure your email address is valid';
                                          else
                                            return null;
                                        }
                                      },

//                                   },
                                      style: TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                        enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.white)),
                                        labelText: 'Email',
                                        labelStyle: TextStyle(
                                            fontSize: 15, color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                                Theme(
                                  data: Theme.of(context)
                                      .copyWith(primaryColor: Colors.white),
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
                                      color: Colors.white,
                                    ),
                                    decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white)),
                                      labelText: 'Password',
                                      labelStyle: TextStyle(
                                          fontSize: 15, color: Colors.white),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Transform(
                        transform: Matrix4.translationValues(
                            animation.value * width, 0.0, 0.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 20.0, top: 20),
                              child: Text("Forgot Password",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white)),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            bottomNavigationBar: BottomAppBar(
              color: Color(0xFF1b1e23),
              child: Transform(
                transform: Matrix4.translationValues(
                    muchDelayedAnimation.value * width, 0.0, 0.0),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
//                              widget.toggleView();
                        Navigator.pushNamed(context, RouteNames.registerScreen);
                        },
                        child: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                              text: "If you dont have an account,\n",
                              style: TextStyle(color: Colors.white),
                            ),
                            TextSpan(
                              text: "Sign up",
                              style: TextStyle(
                                  color: Colors.white,
                                  decoration: TextDecoration.underline),
                            ),
                          ]),
                        ),
                      ),
//              Text("boo", style: TextStyle(color: Colors.white),),
                      ViewModelBuilder<LoginScreenViewModel>.reactive(
                        viewModelBuilder: () => LoginScreenViewModel(),
                        builder: (_, m, __) => Material(
                          borderRadius: BorderRadius.circular(30.0),
                          color: Colors.deepOrangeAccent[400],
                          elevation: 0.0,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: InkWell(
                              onTap: () async {
                                if (_formKey.currentState.validate()) {
                                  await m.login(
                                    context: context,
                                    email: _email.text.trim(),
                                    password: _password.text.trim(),
                                  );
                                }
                              },
                              child: m.busy
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
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}

//}
//  String email;
//  String password;
//  final _auth = FirebaseAuth.instance;
//
//  @override
//  Widget build(BuildContext context) {
//    return ViewModelBuilder<LoginScreenViewModel>.reactive(
//        builder: (context, model, child) => SafeArea(
//              child: Scaffold(
//                backgroundColor: Color(0xff564569),
//                body: Padding(
//                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
//                  child: Column(
//                    mainAxisAlignment: MainAxisAlignment.center,
//                    crossAxisAlignment: CrossAxisAlignment.center,
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
//                          onChanged: (value) {
//                            email = value;
//                          },
//                          decoration: ktextFieldDecoration.copyWith(
//                              hintText: 'Enter your Email')),
//                      SizedBox(
//                        height: SizeConfig.safeBlockVertical * 1,
//                      ),
//                      TextField(
//                          onChanged: (value) {
//                            password = value;
//                          },
//                          decoration: ktextFieldDecoration.copyWith(
//                              hintText: 'Enter your Password')),
//                      SizedBox(
//                        height: SizeConfig.safeBlockVertical * 2.5,
//                      ),
//                      CustomButton(
//                        height: SizeConfig.safeBlockVertical * 12,
//                        text: 'Login',
//                        onPressed: () async {
//                          try {
//                            final loggedInUser =
//                                await _auth.signInWithEmailAndPassword(
//                                    email: email, password: password);
//                            if (loggedInUser != null) {
//                              Navigator.pushNamed(
//                                  context, RouteNames.descriptionScreen);
//                            }
//                          } catch (e) {
//                            print(e);
//                          }
//                        },
//                        buttonColor: Colors.deepPurple[300],
//                        textColor: Colors.white,
//                      )
//                    ],
//                  ),
//                ),
//              ),
//            ),
//        viewModelBuilder: () => LoginScreenViewModel());
//  }
//}
