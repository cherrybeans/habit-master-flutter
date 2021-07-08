import 'package:flutter/material.dart';

import 'colors.dart';
import 'login.page.dart';

final bottomAppBar = (BuildContext context) => BottomAppBar(
      child: Row(
        children: [
          IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    barrierColor: Colors.black.withOpacity(0.5),
                    builder: (BuildContext context) {
                      return bottomSheet(context);
                    });
              }),
          Spacer(),
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
    );

final bottomSheet = (BuildContext context) => Container(
      color: Colors.black.withOpacity(0.5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          SizedBox(
              height: (56 * 3).toDouble(),
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.0),
                      topRight: Radius.circular(16.0),
                    ),
                    color: Theme.of(context).bottomAppBarColor,
                  ),
                  child: Stack(
                    alignment: Alignment(0, 0),
                    children: <Widget>[
                      Positioned(
                        child: ListView(
                          physics: NeverScrollableScrollPhysics(),
                          children: <Widget>[
                            ListTile(
                              title: Text(
                                "Login",
                              ),
                              leading: Icon(Icons.inbox, color: kHabitBrown900),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          LoginPage()),
                                );
                              },
                            ),
                            ListTile(
                              leading:
                                  Icon(Icons.all_inbox, color: kHabitBrown900),
                              title: Text(
                                'All habits',
                              ),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                            ListTile(
                              leading: Icon(Icons.center_focus_strong,
                                  color: kHabitBrown900),
                              title: Text('Focused'),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ))),
          Container(
            height: 10,
            color: kHabitPink100,
          )
        ],
      ),
    );
