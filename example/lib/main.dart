import 'package:flutter/material.dart';
import 'package:platform_alert_dialog/platform_alert_dialog.dart';

void main() => runApp(HomePage());

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TargetPlatform _selection;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Platform Alert Dialog Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        platform: _selection ?? Theme.of(context).platform,
      ),
      home: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Platform Alert Dialog'),
              actions: <Widget>[
                PopupMenuButton<TargetPlatform>(
                  icon: Icon(Icons.style),
                  onSelected: (TargetPlatform result) {
                    setState(() {
                      _selection = result;
                    });
                  },
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<TargetPlatform>>[
                    PopupMenuItem<TargetPlatform>(
                      value: TargetPlatform.android,
                      child: Text(
                        'Android',
                        style: TextStyle(
                          fontWeight: Theme.of(context).platform ==
                                  TargetPlatform.android
                              ? FontWeight.bold
                              : null,
                        ),
                      ),
                    ),
                    PopupMenuItem<TargetPlatform>(
                      value: TargetPlatform.fuchsia,
                      child: Text(
                        'Fuchsia',
                        style: TextStyle(
                          fontWeight: Theme.of(context).platform ==
                                  TargetPlatform.fuchsia
                              ? FontWeight.bold
                              : null,
                        ),
                      ),
                    ),
                    PopupMenuItem<TargetPlatform>(
                      value: TargetPlatform.iOS,
                      child: Text(
                        'iOS',
                        style: TextStyle(
                          fontWeight:
                              Theme.of(context).platform == TargetPlatform.iOS
                                  ? FontWeight.bold
                                  : null,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            body: Center(
                child: RaisedButton(
              child: Text('Show Dialog'),
              onPressed: () {
                showDialog<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return PlatformAlertDialog(
                      title: Text('Rewind and remember'),
                      content: SingleChildScrollView(
                        child: ListBody(
                          children: <Widget>[
                            Text('You will never be satisfied.'),
                            Text('You\’re like me. I’m never satisfied.'),
                          ],
                        ),
                      ),
                      actions: <Widget>[
                        PlatformDialogAction(
                          child: Text('Cancel'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        PlatformDialogAction(
                          child: Text('Regret'),
                          actionType: ActionType.Preferred,
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            )),
          );
        },
      ),
    );
  }
}
