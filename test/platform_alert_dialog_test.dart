import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:platform_alert_dialog/platform_alert_dialog.dart';

void main() {
  testWidgets(
    'PlatformAlertDialog has a title and a content',
    (WidgetTester tester) async {
      var title, content;
      await tester.pumpWidget(MaterialApp(
        home: PlatformAlertDialog(
          title: title = Text('Title'),
          content: content = Text('Content'),
        ),
      ));

      expect(find.byWidget(title), findsOneWidget);
      expect(find.byWidget(content), findsOneWidget);
    },
  );
  testWidgets(
    'PlatformDialogAction has a child',
    (WidgetTester tester) async {
      var child;
      await tester.pumpWidget(MaterialApp(
        home: PlatformDialogAction(
          child: child = Text('Child'),
          onPressed: null,
        ),
      ));

      expect(find.byWidget(child), findsOneWidget);
    },
  );
  testWidgets(
    'PlatformDialogAction is tappable',
    (WidgetTester tester) async {
      var tapped = false;
      await tester.pumpWidget(MaterialApp(
        home: PlatformDialogAction(
          child: Text('Child'),
          onPressed: () {
            tapped = true;
          },
        ),
      ));

      // should work since tests are performed in an Android "sandbox"
      await tester.tap(find.byType(FlatButton).first);

      expect(tapped, equals(true));
    },
  );
  testWidgets(
    'PlatformAlertDialog change style in Android',
    (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: PlatformAlertDialog(
          title: Text('Title'),
          actions: <Widget>[
            PlatformDialogAction(
              child: Text('Child'),
              onPressed: null,
            ),
          ],
        ),
        theme: ThemeData(
          platform: TargetPlatform.android,
        ),
      ));

      expect(find.byType(AlertDialog), findsOneWidget);
      expect(find.byType(FlatButton), findsOneWidget);
    },
  );
  testWidgets(
    'PlatformAlertDialog change style in iOS',
    (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: PlatformAlertDialog(
          title: Text('Title'),
          actions: <Widget>[
            PlatformDialogAction(
              child: Text('Child'),
              onPressed: null,
            ),
          ],
        ),
        theme: ThemeData(
          platform: TargetPlatform.iOS,
        ),
      ));

      expect(find.byType(CupertinoAlertDialog), findsOneWidget);
      expect(find.byType(CupertinoDialogAction), findsOneWidget);
    },
  );
}
