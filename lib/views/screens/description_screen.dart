import 'package:flutter/material.dart';
import 'package:sca_ui/widgets/customImageContainer.dart';
import 'package:sca_ui/widgets/customTile.dart';
import 'package:sca_ui/widgets/customCard.dart';

class DescriptionScreen extends StatefulWidget {
  @override
  _DescriptionScreenState createState() => _DescriptionScreenState();
}

class _DescriptionScreenState extends State<DescriptionScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            leading: Icon(
              Icons.menu_rounded,
              size: 45,
              color: Colors.grey,
            ),
            backgroundColor: Colors.white,
            actions: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 8, right: 10, top: 8, bottom: 8),
                child: CustomImageContainer(
                    height: 5,
                    width: 45,
                    url:
                        "https://avatars0.githubusercontent.com/u/54294245?s=400&u=9ac420a96bc73e4acc57de024388f6f2162b449a&v=4"),
              )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Discover \nThe Perfect Job',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                TextField(
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.fromLTRB(20, 2, 16, 2),
                    suffixIcon: Icon(
                      Icons.search,
                      size: 30,
                    ),
                    hintText: 'Search job or position...',
                    hintStyle: TextStyle(fontSize: 15),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 0.8,
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  height: 150,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return CustomTile();
                    },
                    itemCount: 4,
                  ),
                ),
                Spacer(),
                Text(
                  'Jobs You\'ve applied for',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Container(
                  height: 150,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return CustomCard();
                    },
                    itemCount: 4,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
