## [2.0.2] - October 19, 2021
* **Breaking Changes** 
`title` & `message` parameter has been changed from type `String` to `Text`,
`initialRating` parameter has been changed from type `int` to `double`
`submitButton` parameter has been renamed to `submitButtonText`
`ratingColor` parameter has been renamed to `starColor`
default `initialRating` value to `0.0`

* New! `starSize` parameter to set the size of the star
* New! `submitButtonTextStyle` parameter to set your custom text style for the submit button
* Improved! Changed from `StatelessWidget` to `StatefulWidget`
* Improved! `Submit Button` is automatically disabled when rating is `0`

## [2.0.1] - June 17, 2021
set initial `rating` value via constructor
new `enableComment` parameter to enable/disable comment area
improved `message` and `image` are now optional

## [2.0.0] - March 6, 2021
* **Breaking Changes** 
`description` parameter is renamed to `message`,
`icon` is renamed to `image`,
`onSubmitPressed` is renamed to `onSubmitted`,
`accentColor` is renamed to `ratingColor`,
removed `alternativeButton`,
removed `positiveComment`,
removed `negativeComment`,
removed `onAlternativePressed`,
new `onCancelled` callback function,
new `force` parameter to force users to leave a rating,
new `commentHint` parameter for comment text field hiint

* Added! support for `null safety`
* Improved! rating bar using `flutter_rating_bar` https://pub.dev/packages/flutter_rating_bar
* Added! documentations
* Migrated! example android project to `v2 embedding`
* Added! `macos & web` targets for example
* Fixed! example project's package path warning
* Improved! example project with actual app store review/rating
* Thanks to these contributors: https://github.com/davidAg9, https://github.com/kszczek, https://github.com/chan27-2

## [1.0.0] - March 22, 2019
* Initial Release