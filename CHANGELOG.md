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