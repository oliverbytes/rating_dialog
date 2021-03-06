import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:rating_dialog/rating_dialog.dart';

class _ExampleScreenState extends State<ExampleScreen> {
  // actual store listing review & rating
  void _rateAndReviewApp() async {
    final _inAppReview = InAppReview.instance;

    if (await _inAppReview.isAvailable()) {
      print('request actual review from store');
      _inAppReview.requestReview();
    } else {
      print('open actual store listing');
      // TODO: use your own store ids
      _inAppReview.openStoreListing(
        appStoreId: '<your app store id>',
        microsoftStoreId: '<your microsoft store id>',
      );
    }
  }

  // show the rating dialog
  void _showRatingDialog() {
    final _dialog = RatingDialog(
      // your app's name?
      title: 'Rating Dialog',
      // encourage your user to leave a high rating?
      message:
          'Tap a star to set your rating. Add more description here if you want.',
      // your app's logo?
      image: const FlutterLogo(size: 100),
      submitButton: 'Submit',
      onCancelled: () => print('cancelled'),
      onSubmitted: (response) {
        print('rating: ${response.rating}, comment: ${response.comment}');

        // TODO: add your own logic
        if (response.rating < 3.0) {
          // send their comments to your email or anywhere you wish
          // ask the user to contact you instead of leaving a bad review
        } else {
          _rateAndReviewApp();
        }
      },
    );

    // show the dialog
    showDialog(
      context: context,
      barrierDismissible: true, // set to false if you want to force a rating
      builder: (context) => _dialog,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rating Dialog Example')),
      body: Container(
        child: Center(
          child: ElevatedButton(
            child: const Text('Show Rating Dialog'),
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
