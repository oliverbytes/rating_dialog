library rating_dialog;

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingDialog extends StatefulWidget {
  /// The dialog's title
  final Text title;

  /// The dialog's message/description text
  final Text? message;

  /// The top image used for the dialog to be displayed
  final Widget? image;

  /// The rating bar (star icon & glow) color
  final Color starColor;

  /// The size of the star
  final double starSize;

  /// Disables the cancel button and forces the user to leave a rating
  final bool force;

  /// Show or hide the close button
  final bool showCloseButton;

  /// The initial rating of the rating bar
  final double initialRating;

  /// Display comment input area
  final bool enableComment;

  /// The comment's TextField hint text
  final String commentHint;

  /// The submit button's label/text
  final String submitButtonText;

  /// The submit button's label/text
  final TextStyle submitButtonTextStyle;

  /// Returns a RatingDialogResponse with user's rating and comment values
  final Function(RatingDialogResponse) onSubmitted;

  /// called when user cancels/closes the dialog
  final Function? onCancelled;

  const RatingDialog({
    required this.title,
    this.message,
    this.image,
    required this.submitButtonText,
    this.submitButtonTextStyle = const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 17,
    ),
    required this.onSubmitted,
    this.starColor = Colors.amber,
    this.starSize = 40.0,
    this.onCancelled,
    this.showCloseButton = true,
    this.force = false,
    this.initialRating = 0,
    this.enableComment = true,
    this.commentHint = 'Tell us your comments',
  });

  @override
  State<RatingDialog> createState() => _RatingDialogState();
}

class _RatingDialogState extends State<RatingDialog> {
  final _commentController = TextEditingController();
  RatingDialogResponse? _response;

  @override
  void initState() {
    super.initState();
    _response = RatingDialogResponse(rating: widget.initialRating);
  }

  @override
  Widget build(BuildContext context) {
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
                widget.image != null
                    ? Padding(
                        child: widget.image,
                        padding: const EdgeInsets.only(top: 25, bottom: 25),
                      )
                    : Container(),
                widget.title,
                const SizedBox(height: 15),
                widget.message ?? Container(),
                const SizedBox(height: 10),
                Center(
                  child: RatingBar.builder(
                    initialRating: widget.initialRating,
                    glowColor: widget.starColor,
                    minRating: 0,
                    itemSize: widget.starSize,
                    direction: Axis.horizontal,
                    allowHalfRating: false,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    onRatingUpdate: (rating) {
                      setState(() {
                        _response!.rating = rating;
                      });
                    },
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: widget.starColor,
                    ),
                  ),
                ),
                widget.enableComment
                    ? TextField(
                        controller: _commentController,
                        textAlign: TextAlign.center,
                        textInputAction: TextInputAction.newline,
                        minLines: 1,
                        maxLines: 5,
                        decoration: InputDecoration(
                          hintText: widget.commentHint,
                        ),
                      )
                    : const SizedBox(height: 15),
                ElevatedButton(
                  child: Text(
                    widget.submitButtonText,
                    style: widget.submitButtonTextStyle,
                  ),
                  onPressed: _response!.rating == 0
                      ? null
                      : () {
                          if (!widget.force) Navigator.pop(context);
                          _response!.comment = _commentController.text;
                          widget.onSubmitted.call(_response!);
                        },
                ),
              ],
            ),
          ),
        ),
        if (!widget.force &&
            widget.onCancelled != null &&
            widget.showCloseButton) ...[
          IconButton(
            icon: const Icon(Icons.close, size: 18),
            onPressed: () {
              Navigator.pop(context);
              widget.onCancelled!.call();
            },
          )
        ]
      ],
    );

    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      titlePadding: EdgeInsets.zero,
      scrollable: true,
      title: _content,
    );
  }
}

class RatingDialogResponse {
  /// The user's comment response
  String comment;

  /// The user's rating response
  double rating;

  RatingDialogResponse({this.rating = 0.0, this.comment = ''});
}
