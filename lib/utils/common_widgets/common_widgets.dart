library common_widgets;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


Widget exitDialogWidget(context) {
  return SimpleDialog(
    contentPadding: EdgeInsets.zero,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
    children: <Widget>[
      Container(
        height: 240.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Padding(
            //   padding: const EdgeInsets.all(15.0),
            //   child: Text(
            //     'Are you sure you want to exit?',
            //     style: Theme.of(context)
            //         .textTheme
            //         .headline5!
            //         .copyWith(color: Theme.of(context).primaryColor),
            //   ),
            // ),
            Center(
              child: Padding(
                padding: EdgeInsets.all(25.0),
                child: Center(
                  child: Text(
                    'Are you sure you want to exit?',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  icon: Icon(Icons.close, size: 32),
                ),
                IconButton(
                  onPressed: () {
                    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                  },
                  icon: Icon(
                    Icons.check,
                    size: 32,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ],
  );
}



