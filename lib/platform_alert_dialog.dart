import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Platform Alert Dialog
///
/// Alert dialog that adapt its style to the current platform, for
/// [TargetPlatform.android], [TargetPlatform.fuchsia] it's used [AlertDialog]
/// and for [TargetPlatform.iOS] it's used [CupertinoAlertDialog].
///
/// A standard dialog is import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//
///// Platform Alert Dialog
/////
///// Alert dialog that adapt its style to the current platform, for
///// [TargetPlatform.android], [TargetPlatform.fuchsia] it's used [AlertDialog]
///// and for [TargetPlatform.iOS] it's used [CupertinoAlertDialog].
/////
///// A standard dialog is composed by a (required) [title], a [content] and a
///// list of [actions].
/////
///// ```dart
///// PlatformAlertDialog(
/////   title: Text('Interrupt the session?'),
/////   content: Text('The session will be counted as not completed.'),
/////   actions: [
/////     PlatformDialogAction(
/////       child: Text('Cancel'),
/////       onPressed: () {...},
/////     ),
/////     // danger action
/////     PlatformDialogAction(
/////       child: Text('Interrupt'),
/////       onPressed: () {...},
/////     ),
/////   ]
///// )
///// ```
//class PlatformAlertDialog extends StatelessWidget {
//  const PlatformAlertDialog({
//    Key key,
//    @required this.title,
//    this.content,
//    this.actions,
//  }) : super(key: key);
//
//  /// The title of the dialog.
//  ///
//  /// Usually a [Text], can be a long sentence.
//  final Widget title;
//
//  /// The content of the dialog.
//  ///
//  /// Complex widgets, like inputs, have to adapts their style to the current
//  /// platform.
//  final Widget content;
//
//  /// The actions of the dialog.
//  ///
//  /// Usually a list of [PlatformDialogAction].
//  final List<Widget> actions;
//
//  Widget build(BuildContext context) {
//    switch (Theme.of(context).platform) {
//      case TargetPlatform.android:
//      case TargetPlatform.fuchsia:
//        return AlertDialog(
//          title: title,
//          content: SingleChildScrollView(
//            child: content,
//          ),
//          actions: actions,
//        );
//      case TargetPlatform.macOS:
//      case TargetPlatform.iOS:
//        return CupertinoAlertDialog(
//          title: title,
//          content: SingleChildScrollView(
//            child: content,
//          ),
//          actions: actions,
//        );
//    }
//    // unreachable
//    return null;
//  }
//}
//
///// Type of Dialog Actions.
/////
///// Multiple types are available, each one indicate to the user the consequence
///// of his action. Changing the type imply the style change of the action button
///// in the dialog.
//enum ActionType {
//  /// Default style, it's a simple [PlatformDialogAction]. There is no need to
//  /// manually specify this type since it's the default one.
//  Default,
//
//  /// It's the action suggested to be the _preferred_ one, the user is
//  /// encouraged to press this button.
//  Preferred,
//
//  /// Indicate to the user that the action linked it's dangerous and imply the
//  /// destruction of an object.
//  Destructive,
//}
//
///// Platform Dialog Action
/////
///// Dialog actions that adapt its style to the current platform, usually used in
///// combination with [PlatformAlertDialog].
/////
///// An action could be _default_, to indicate it's the preferred choice, or
///// _destructive_, to indicate that cannot be reversed or that will destroy
///// something.
/////
///// ```dart
///// PlatformDialogAction(
/////   child: Text('delete'),
/////   actionType: ActionType.Destructive,
/////   onPressed: () {
/////     // destructive action here
/////   },
///// );
///// ```
//class PlatformDialogAction extends StatelessWidget {
//  const PlatformDialogAction({
//    Key key,
//    @required this.child,
//    @required this.onPressed,
//    this.actionType: ActionType.Default,
//  }) : super(key: key);
//
//  /// The content of the action.
//  ///
//  /// Usually a [Text].
//  final Widget child;
//
//  /// The callback called when the button is pressed or activated.
//  final VoidCallback onPressed;
//
//  /// The type of this action, usually [ActionType.Default].
//  final ActionType actionType;
//
//  Widget build(BuildContext context) {
//    switch (Theme.of(context).platform) {
//      case TargetPlatform.android:
//      case TargetPlatform.fuchsia:
//        switch (actionType) {
//          case ActionType.Default:
//            return FlatButton(
//              child: child,
//              onPressed: onPressed,
//            );
//          case ActionType.Preferred:
//            return FlatButton(
//              child: child,
//              onPressed: onPressed,
//              color: Theme.of(context).accentColor,
//              colorBrightness: Theme.of(context).accentColorBrightness,
//              textColor: Colors.white,
//            );
//          case ActionType.Destructive:
//            return FlatButton(
//              child: child,
//              onPressed: onPressed,
//              color: Theme.of(context).errorColor,
//              textColor: Colors.white,
//            );
//        }
//        break;
//      case TargetPlatform.macOS:
//      case TargetPlatform.iOS:
//        switch (actionType) {
//          case ActionType.Default:
//            return CupertinoDialogAction(
//              child: child,
//              onPressed: onPressed,
//            );
//          case ActionType.Preferred:
//            return CupertinoDialogAction(
//              child: child,
//              onPressed: onPressed,
//              isDefaultAction: true,
//            );
//          case ActionType.Destructive:
//            return CupertinoDialogAction(
//              child: child,
//              onPressed: onPressed,
//              isDestructiveAction: true,
//            );
//        }
//    }
//    // unreachable
//    return null;
//  }
//} by a (required) [title], a [content] and a
/// list of [actions].
///
/// ```dart
/// PlatformAlertDialog(
///   title: Text('Interrupt the session?'),
///   content: Text('The session will be counted as not completed.'),
///   actions: [
///     PlatformDialogAction(
///       child: Text('Cancel'),
///       onPressed: () {...},
///     ),
///     // danger action
///     PlatformDialogAction(
///       child: Text('Interrupt'),
///       onPressed: () {...},
///     ),
///   ]
/// )
/// ```
class PlatformAlertDialog extends StatelessWidget {
  const PlatformAlertDialog({
    Key key,
    @required this.title,
    this.content,
    this.actions,
  }) : super(key: key);

  /// The title of the dialog.
  ///
  /// Usually a [Text], can be a long sentence.
  final Widget title;

  /// The content of the dialog.
  ///
  /// Complex widgets, like inputs, have to adapts their style to the current
  /// platform.
  final Widget content;

  /// The actions of the dialog.
  ///
  /// Usually a list of [PlatformDialogAction].
  final List<Widget> actions;

  Widget build(BuildContext context) {
    switch (Theme.of(context).platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        return AlertDialog(
          title: title,
          content: SingleChildScrollView(
            child: content,
          ),
          actions: actions,
        );
      case TargetPlatform.iOS:
        return CupertinoAlertDialog(
          title: title,
          content: SingleChildScrollView(
            child: content,
          ),
          actions: actions,
        );
    }
    // unreachable
    return null;
  }
}

/// Type of Dialog Actions.
///
/// Multiple types are available, each one indicate to the user the consequence
/// of his action. Changing the type imply the style change of the action button
/// in the dialog.
enum ActionType {
  /// Default style, it's a simple [PlatformDialogAction]. There is no need to
  /// manually specify this type since it's the default one.
  Default,

  /// It's the action suggested to be the _preferred_ one, the user is
  /// encouraged to press this button.
  Preferred,

  /// Indicate to the user that the action linked it's dangerous and imply the
  /// destruction of an object.
  Destructive,
}

/// Platform Dialog Action
///
/// Dialog actions that adapt its style to the current platform, usually used in
/// combination with [PlatformAlertDialog].
///
/// An action could be _default_, to indicate it's the preferred choice, or
/// _destructive_, to indicate that cannot be reversed or that will destroy
/// something.
///
/// ```dart
/// PlatformDialogAction(
///   child: Text('delete'),
///   actionType: ActionType.Destructive,
///   onPressed: () {
///     // destructive action here
///   },
/// );
/// ```
class PlatformDialogAction extends StatelessWidget {
  const PlatformDialogAction({
    Key key,
    @required this.child,
    @required this.onPressed,
    this.actionType: ActionType.Default,
  }) : super(key: key);

  /// The content of the action.
  ///
  /// Usually a [Text].
  final Widget child;

  /// The callback called when the button is pressed or activated.
  final VoidCallback onPressed;

  /// The type of this action, usually [ActionType.Default].
  final ActionType actionType;

  Widget build(BuildContext context) {
    switch (Theme.of(context).platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        switch (actionType) {
          case ActionType.Default:
            return FlatButton(
              child: child,
              onPressed: onPressed,
            );
          case ActionType.Preferred:
            return FlatButton(
              child: child,
              onPressed: onPressed,
              color: Theme.of(context).accentColor,
              colorBrightness: Theme.of(context).accentColorBrightness,
              textColor: Colors.white,
            );
          case ActionType.Destructive:
            return FlatButton(
              child: child,
              onPressed: onPressed,
              color: Theme.of(context).errorColor,
              textColor: Colors.white,
            );
        }
        break;
      case TargetPlatform.iOS:
        switch (actionType) {
          case ActionType.Default:
            return CupertinoDialogAction(
              child: child,
              onPressed: onPressed,
            );
          case ActionType.Preferred:
            return CupertinoDialogAction(
              child: child,
              onPressed: onPressed,
              isDefaultAction: true,
            );
          case ActionType.Destructive:
            return CupertinoDialogAction(
              child: child,
              onPressed: onPressed,
              isDestructiveAction: true,
            );
        }
    }
    // unreachable
    return null;
  }
}
