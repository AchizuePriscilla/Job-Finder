import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sca_ui/models/jobs.dart';
import 'package:sca_ui/viewmodels/base_model.dart';
import 'package:sca_ui/views/screens/job_application_screen.dart';
import 'package:sca_ui/widgets/customTile.dart';
import 'package:sca_ui/widgets/customCard.dart';
import 'package:sca_ui/config.dart';
import 'package:stacked/stacked.dart';

import 'add_jobs_screen.dart';

class DescriptionScreen extends StatefulWidget {
  @override
  _DescriptionScreenState createState() => _DescriptionScreenState();
}

class _DescriptionScreenState extends State<DescriptionScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrangeAccent[400],
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => AddJobscreen(),
            ),
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
//      appBar: AppBar(
//        elevation: 0,
//        leading: Icon(
//          Icons.all_inclusive,
//          size: SizeConfig.imageSizeMultiplier * 9.3,
//          color: Colors.deepOrangeAccent[400],
//        ),
//        backgroundColor: Colors.white,
//        actions: [
//          Padding(
//            padding: const EdgeInsets.only(right: 8.0),
//            child: CircleAvatar(
//              radius: 25,
//              backgroundImage: NetworkImage(
//                "https://avatars0.githubusercontent.com/u/54294245?s=400&u=9ac420a96bc73e4acc57de024388f6f2162b449a&v=4",
//              ),
//            ),
//          ),
//        ],
//      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: SafeArea(
          child: Column(
            children: [
              Icon(
                Icons.all_inclusive,
                size: SizeConfig.imageSizeMultiplier * 9.3,
                color: Colors.deepOrangeAccent[400],
              ),
              Expanded(
                child: NestedScrollView(
                  physics: const ScrollPhysics(
                    parent: PageScrollPhysics(),
                  ),
                  headerSliverBuilder: (_, isScrolled) {
                    return <Widget>[
                      SliverList(
                        delegate: SliverChildListDelegate([
                          SizedBox(
                            height: 1.2 * SizeConfig.heightMultiplier,
                          ),
                          Text(
                            'Discover \nThe Perfect Job',
                            style: TextStyle(
                                fontSize: 4.8 * SizeConfig.textMultiplier,
                                fontWeight: FontWeight.bold,
                                height: 1.5,
                                fontFamily: 'opensans'),
                          ),
                          SizedBox(
                            height: 2.4 * SizeConfig.heightMultiplier,
                          ),
                          SizedBox(
                            height: 4.8 * SizeConfig.heightMultiplier,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 1.2 * SizeConfig.heightMultiplier),
                            child: Text(
                              'Jobs for you:',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'worksans'),
                            ),
                          ),
                          SizedBox(
                            height: 1.2 * SizeConfig.heightMultiplier,
                          ),
                          Container(
                            height: SizeConfig.heightMultiplier * 25,
                            child: StreamBuilder<QuerySnapshot>(
                                stream: FirebaseFirestore.instance
                                    .collection('jobs')
                                    .snapshots(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    final jobList = snapshot.data.docs;
                                    if (jobList.isNotEmpty) {
                                      return ListView.builder(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            onTap: () {
                                              Navigator.of(context).push(
                                                MaterialPageRoute(
                                                  builder: (_) =>
                                                      JobApplicationScreen(
                                                    jobs: Jobs(
                                                      email: jobList[index]
                                                          ['email'],
                                                      jobLocation:
                                                          jobList[index]
                                                              ['jobLocation'],
                                                      jobResponsibilities: jobList[
                                                              index][
                                                          'jobResponsibilities'],
                                                      jobTitle: jobList[index]
                                                          ['jobTitle'],
                                                      pay: jobList[index]
                                                          ['pay'],
                                                      jobDescription: jobList[
                                                                  index][
                                                              'jobDescription'] ??
                                                          '',
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                            child: CustomTile(
                                              isBlack: true,
                                              title: jobList[index]['jobTitle'],
                                              desc: jobList[index]
                                                      ['jobDescription'] ??
                                                  '',
                                              location: jobList[index]
                                                  ['jobLocation'],
                                              pay: jobList[index]['pay'],
                                            ),
                                          );
                                        },
                                        itemCount: jobList.length,
                                      );
                                    } else {
                                      return Center(
                                        child: Text(
                                          'No jobs available yet',
                                          style: TextStyle(
                                            fontFamily: 'opensans',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      );
                                    }
                                  } else if (snapshot.hasError) {
                                    return const Center(
                                      child: Text('Oops! Something went wrong'),
                                    );
                                  } else {
                                    return const Center(
                                      child: CircularProgressIndicator(
                                        valueColor: AlwaysStoppedAnimation(
                                          Colors.deepOrangeAccent,
                                        ),
                                      ),
                                    );
                                  }
                                }),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                        ]),
                      )
                    ];
                  },
                  body: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Text(
                          'Jobs You\'ve applied for:',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 2.4 * SizeConfig.textMultiplier,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'worksans'),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: ViewModelBuilder<BaseModel>.reactive(
                          viewModelBuilder: () => BaseModel(),
                          builder: (_, model, __) =>
                              StreamBuilder<QuerySnapshot>(
                                  stream: FirebaseFirestore.instance
                                      .collection('jobs_applied')
                                      .doc(
                                          FirebaseAuth.instance.currentUser.uid)
                                      .collection('list')
                                      .snapshots(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      final jobList = snapshot.data.docs;
                                      if (jobList.isNotEmpty) {
                                        return ListView.builder(
                                          shrinkWrap: true,
                                          primary: true,
                                          physics: PageScrollPhysics(),
                                          itemBuilder: (context, index) {
                                            return CustomCard(jobTitle: jobList[index]['jobTitle'],);
                                          },
                                          itemCount: jobList.length,
                                        );
                                      } else {
                                        return Center(
                                          child: Text(
                                            'No job applied for yet',
                                            style: TextStyle(
                                              fontFamily: 'opensans',
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        );
                                      }
                                    } else if (snapshot.hasError) {
                                      return const Center(
                                        child: Text(
                                          'Oops! Something went wrong',
                                        ),
                                      );
                                    } else {
                                      return const Center(
                                        child: CircularProgressIndicator(
                                          valueColor: AlwaysStoppedAnimation(
                                            Colors.deepOrangeAccent,
                                          ),
                                        ),
                                      );
                                    }

//                              if (snapshot.hasData) {
//                                return ListView.builder(
//                                  shrinkWrap: true,
//                                  primary: true,
//                                  physics: PageScrollPhysics(),
//                                  itemBuilder: (context, index) {
//                                    return CustomCard();
//                                  },
//                                  itemCount: 4,
//                                );
//                              }
                                  }),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
