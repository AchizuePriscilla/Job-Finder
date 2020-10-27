import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class CustomCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: Colors.grey, width: 1)),
        child: ListTile(
            onTap: () {},
            enabled: true,
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://www.clipartmax.com/png/middle/131-1319720_cute-avatars-artist.png"),
            ),
            title: Text(
              'Google',
              style: TextStyle(color: Colors.grey),
            ),
            subtitle: Text(
              'Sr Product Designer',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            trailing: Icon(
              LineIcons.ellipsis_h,
              color: Colors.black,
            )),
      ),
    );
  }
}
