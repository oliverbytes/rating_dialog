library rating_dialog;

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingDialog extends StatelessWidget {
  /// The dialog's title
  final String title;

  /// The dialog's message/description text
  final String? message;

  /// The top image used for the dialog to be displayed
  final Widget? image;

  /// The rating bar (star icon & glow) color
  final Color ratingColor;

  /// Disables the cancel button and forces the user to leave a rating
  final bool force;

  /// The initial rating of the rating bar
  final int initialRating;

  /// Display comment input area
  final bool enableComment;

  /// The comment's TextField hint text
  final String commentHint;

  /// The submit button's label/text
  final String submitButton;

  /// Returns a RatingDialogResponse with user's rating and comment values
  final Function(RatingDialogResponse) onSubmitted;

  /// called when user cancels/closes the dialog
  final Function? onCancelled;

  const RatingDialog({
    required this.title,
    this.message,
    this.image,
    required this.submitButton,
    required this.onSubmitted,
    this.ratingColor = Colors.amber,
    this.onCancelled,
    this.force = false,
    this.initialRating = 1,
    this.enableComment = true,
    this.commentHint = 'Tell us your comments',
  });

  @override
  Widget build(BuildContext context) {
    final _commentController = TextEditingController();
    final _response = RatingDialogResponse(rating: initialRating);

    final _content = Stack(
      alignment: Alignment.topRight,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(25, 30, 25, 5),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                image != null
                    ? Padding(
                        child: image,
                        padding: const EdgeInsets.only(top: 25, bottom: 25),
                      )
                    : Container(),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),
                message != null
                    ? Text(
                        message!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 15),
                      )
                    : Container(),
                const SizedBox(height: 10),
                Center(
                  child: RatingBar.builder(
                    initialRating: initialRating.toDouble(),
                    glowColor: ratingColor,
                    minRating: 1.0,
                    direction: Axis.horizontal,
                    allowHalfRating: false,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    onRatingUpdate: (rating) =>
                        _response.rating = rating.toInt(),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: ratingColor,
                    ),
                  ),
                ),
                enableComment
                    ? TextField(
                        controller: _commentController,
                        textAlign: TextAlign.center,
                        textInputAction: TextInputAction.newline,
                        minLines: 1,
                        maxLines: 5,
                        decoration: InputDecoration(
                          hintText: commentHint,
                        ),
                      )
                    : const SizedBox(height: 15),
                TextButton(
                  child: Text(
                    submitButton,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  onPressed: () {
                    if (!force) Navigator.pop(context);
                    _response.comment = _commentController.text;
                    onSubmitted.call(_response);
                  },
                ),
              ],
            ),
          ),
        ),
        if (!force && onCancelled != null) ...[
          IconButton(
            icon: const Icon(Icons.close, size: 18),
            onPressed: () {
              Navigator.pop(context);
              onCancelled!.call();
            },
          )
        ]
      ],
    );

    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      titlePadding: EdgeInsets.zero,
      scrollable: true,
      title: _content,
    );
  }
}

class RatingDialogResponse {
  /// The user's comment response
  String comment = '';

  /// The user's rating response
  int rating;

  RatingDialogResponse({this.rating = 1});
}
