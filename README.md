# rating_dialog

A beautiful and customizable Rating Dialog package for Flutter! Supports all platforms that flutter supports!

![](https://github.com/nemoryoliver/rating_dialog/blob/master/demo.gif)

### Import the rating_dialog package
To use the rating_dialog plugin, follow the [plugin installation instructions](https://pub.dartlang.org/packages/rating_dialog#pub-pkg-tab-installing).

### Use the package

Add the following import to your Dart code:
```dart
import 'package:rating_dialog/rating_dialog.dart';
```

We use the flutter's showDialog function to show our Rating Dialog
``` dart
    final _dialog = RatingDialog(
      initialRating: 1.0,
      // your app's name?
      title: Text(
        'Rating Dialog',
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      // encourage your user to leave a high rating?
      message: Text(
        'Tap a star to set your rating. Add more description here if you want.',
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 15),
      ),
      // your app's logo?
      image: const FlutterLogo(size: 100),
      submitButtonText: 'Submit',
      commentHint: 'Set your custom comment hint',
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
```

## Example

See the [example application](https://github.com/nemoryoliver/rating_dialog/tree/master/example) source
for a complete sample app using the rating_dialog package.

## Issues and feedback

Please file [issues](https://github.com/nemoryoliver/rating_dialog/issues/new)
to send feedback or report a bug. Thank you!