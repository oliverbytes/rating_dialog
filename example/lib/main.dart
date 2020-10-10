import 'package:flutter/material.dart';
import 'package:rating_dialog/rating_dialog.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rating Dialog Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ExampleScreen(),
    );
  }
}

class _ExampleScreenState extends State<ExampleScreen> {
  void _showRatingDialog() {
    // We use the built in showDialog function to show our Rating Dialog
    var commentw;
    showDialog(
        context: context,
        barrierDismissible: true, // set to false if you want to force a rating
        builder: (context) {
          return RatingDialog(
            icon: const FlutterLogo(
              size: 100,
            ), // set your own image/icon widget
            title: "The Rating Dialog",
            description:
                "Tap a star to set your rating. Add more description here if you want.",
            submitButton: "SUBMIT",
            alternativeButton: "Contact us instead?", // optional
            // positiveComment: "We are so happy to hear :)", // optional
            // negativeComment: "We're sad to hear :(", // optional
            accentColor: Colors.blue, // optional
            onSubmitPressed: (int rating) {
              print("onSubmitPressed: rating = $rating");
              // TODO: open the app's page on Google Play / Apple App Store
            },
            // onAlternativePressed: () {
            //   print("onAlternativePressed: do something");
            //   // TODO: maybe you want the user to contact you instead of rating a bad review
            // },
            onCommentPressed: (value) {
              commentw = value;
              print(commentw);
            },
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rating Dialog Example"),
      ),
      body: Container(
        child: Center(
          child: RaisedButton(
            child: Text("Show Rating Dialog"),
            onPressed: _showRatingDialog,
          ),
        ),
      ),
    );
  }
}

class ExampleScreen extends StatefulWidget {
  ExampleScreen();

  @override
  _ExampleScreenState createState() => new _ExampleScreenState();
}
