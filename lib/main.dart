import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterapp/circularphotoprogress.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Circlular Photo Progress Bar"),
      ),
      body: Center(
        child: ProgressCard(),
      ),
    );
  }
}
class ProgressCard extends StatefulWidget {
  @override
  _ProgressCardState createState() => _ProgressCardState();
}
class _ProgressCardState extends State<ProgressCard> {
  double progressPercent = 0;

  @override
  Widget build(BuildContext context) {
    Color foreground = Colors.red;

    if (progressPercent >= 0.8) {
      foreground = Colors.green;
    } else if (progressPercent >= 0.4) {
      foreground = Colors.orange;
    }

    Color background = foreground.withOpacity(0.2);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 200,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              child: CircleProgressBar(
                backgroundColor: background,
                foregroundColor: foreground,
                value: this.progressPercent,
              ),
              onTap: () {
                final updated = ((this.progressPercent + 0.1).clamp(0.0, 1.0) *
                    100);
                setState(() {
                  this.progressPercent = updated.round() / 100;
                });
                Fluttertoast.showToast(
                    msg: "Single Tap Pressed",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM
                );
              },
              onDoubleTap: () {
                final updated = ((this.progressPercent - 0.1).clamp(0.0, 1.0) *
                    100);
                setState(() {
                  this.progressPercent = updated.round() / 100;
                });
                Fluttertoast.showToast(
                    msg: "Double Tap Pressed",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM
                );
              },

            ),
          ),
        ),
        Text("${this.progressPercent * 10}",
            style: TextStyle(
                color: foreground,
                fontWeight: FontWeight.bold,
                fontSize: 20)),
        Text("Single Tap to increase Count",
            style: TextStyle(
                color: Colors.grey[800],
                fontWeight: FontWeight.bold,
                height: 2,
                fontSize: 20)),
        Text("Double Tap to decrease Count",
            style: TextStyle(
                color: Colors.grey[800],
                fontWeight: FontWeight.bold,
                height: 2,
                fontSize: 20))
      ],
    );
  }
}
