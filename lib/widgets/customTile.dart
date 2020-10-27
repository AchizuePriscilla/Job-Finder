import 'package:flutter/material.dart';

class CustomTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image(
              image: NetworkImage(
                  "https://i.pinimg.com/564x/86/c2/6f/86c26fee4b8b0b72680841db06325006.jpg"),
              fit: BoxFit.fill,
              width: 200,
            ),
          ),
          Container(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  width: 200,
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://www.clipartmax.com/png/middle/131-1319720_cute-avatars-artist.png"),
                      ),
                      Spacer(),
                      RaisedButton(
                        onPressed: null,
                        disabledColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          "Full-time",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tokopedia',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      Text(
                        'Sr Product Designer',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Text(
                              '\$5k/mo',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                            Spacer(),
                            Text(
                              'Jakarta, Indonesia',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
