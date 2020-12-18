import 'package:flutter/material.dart';

import '../config.dart';

class CustomCard extends StatelessWidget {
  final String jobTitle;

  const CustomCard({Key key, this.jobTitle}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey, width: 0.5)
      ),
      child: ListTile(
          onTap: () {},
          enabled: true,
          leading: CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(
              Icons.all_inclusive,
              size: SizeConfig.imageSizeMultiplier * 8.0,
              color: Colors.deepOrangeAccent[400],
            ),
          ),
          title: Text(
            'Tokopefia',
            style: TextStyle(color: Colors.grey, fontFamily: 'opensans'),
          ),
          subtitle: Text(
            jobTitle ?? '',
            style:
            TextStyle(color: Colors.black,
                fontWeight: FontWeight.w600,
                fontFamily: 'worksans',
                fontSize: 12),
          ),
          trailing: Icon(
            Icons.title,
            color: Colors.black,
          )),
    );
  }
}
