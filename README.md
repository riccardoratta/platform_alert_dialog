# Platform Alert Dialog

Flutter plugin for build alert dialogs adapted to the current platform.

```dart
PlatformAlertDialog(
  title: Text('Interrupt the session?'),
  content: Text('The session will be counted as not completed.'),
  actions: [
    PlatformDialogAction(
      child: Text('Cancel'),
      onPressed: () {...},
    ),
    // danger action
    PlatformDialogAction(
      child: Text('Interrupt'),
      onPressed: () {...},
    ),
  ]
)
```