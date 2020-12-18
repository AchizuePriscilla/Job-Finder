import 'package:flutter/material.dart';
import 'package:sca_ui/config.dart';

class CustomTile extends StatelessWidget {
  final bool isBlack;
  final String title, desc, pay, location;

  const CustomTile({
    Key key,
    this.isBlack = true,
    this.pay,
    this.title,
    this.desc,
    this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
          width: 320,
          margin: EdgeInsets.symmetric(horizontal: 8),
          child: Container(
            decoration: BoxDecoration(
              color: isBlack ? Colors.black : Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 3),
                  spreadRadius: 2,
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 7,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.all_inclusive,
                          size: SizeConfig.imageSizeMultiplier * 8.0,
                          color: Colors.deepOrangeAccent[400],
                        ),
                      ),
                      Spacer(),
                      RaisedButton(
                        onPressed: null,
                        disabledColor: Colors.black87,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          "Full-time",
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'opensans'),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Text(
                          'Tokopedia',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: SizeConfig.widthMultiplier * 4.8,
                              fontFamily: 'opensans'),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Text(
                          title ?? '',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: SizeConfig.widthMultiplier * 4.8,
                              fontFamily: 'opensans'),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Row(
                        children: [
                          Text(
                            pay ?? '',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: SizeConfig.widthMultiplier * 4.8,
                                fontFamily: 'opensans'),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Spacer(),
                          Text(
                            location ?? '',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: SizeConfig.widthMultiplier * 4.8,
                              fontFamily: 'opensans',
                            ),
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
