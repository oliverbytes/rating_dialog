# rating_dialog

A beautiful and customizable Star Rating Dialog package for Flutter

![](https://github.com/nemoryoliver/rating_dialog/blob/master/images/1.gif)

![](https://github.com/nemoryoliver/rating_dialog/blob/master/images/2.gif)

### Import the rating_dialog package
To use the rating_dialog plugin, follow the [plugin installation instructions](https://pub.dartlang.org/packages/rating_dialog#pub-pkg-tab-installing).

### Use the package

Add the following import to your Dart code:
```dart
import 'package:rating_dialog/rating_dialog.dart';
```

We use the built in showDialog function to show our Rating Dialog
``` dart
showDialog(
    context: context,
    barrierDismissible: true, // set to false if you want to force a rating
    builder: (context) {
        return RatingDialog(
        icon: const FlutterLogo(
            size: 100,
            colors: Colors.red), // set your own image/icon widget
        title: "The Rating Dialog",
        description:
            "Tap a star to set your rating. Add more description here if you want.",
        submitButton: "SUBMIT",
        alternativeButton: "Contact us instead?", // optional
        positiveComment: "We are so happy to hear :)", // optional
        negativeComment: "We're sad to hear :(", // optional
        accentColor: Colors.red, // optional
        onSubmitPressed: (int rating) {
            print("onSubmitPressed: rating = $rating");
            // TODO: open the app's page on Google Play / Apple App Store
        },
        onAlternativePressed: () {
            print("onAlternativePressed: do something");
            // TODO: maybe you want the user to contact you instead of rating a bad review
        },
        );
    });
```

## Example

See the [example application](https://github.com/nemoryoliver/rating_dialog/example) source
for a complete sample app using the rating_dialog package.

## Issues and feedback

Please file [issues](https://github.com/nemoryoliver/rating_dialog/issues/new)
to send feedback or report a bug. Thank you!