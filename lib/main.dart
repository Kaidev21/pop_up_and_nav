import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Pop Up and Nav'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Color btnColor = Colors.greenAccent;
  Color appBarColor = Colors.lightBlueAccent;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: appBarColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             ElevatedButton(
                onPressed: () {
                  final alert = AlertDialog(
                    title: Text("Ma première alerte"),
                    content: Text("J'ai créé ma première alerte"),
                    actions: [
                      TextButton(
                          onPressed: (){
                            Navigator.of(context).pop();
                          },
                          child: Text("OK")
                      ),
                      TextButton(
                          onPressed: (){
                            Navigator.of(context).pop();
                            setState((){
                              appBarColor = (appBarColor == Colors.lightBlueAccent)
                                  ? Colors.lightGreenAccent : Colors.lightBlueAccent;
                            });
                          },
                          child: Text("Changer le AppBar")
                      )
                    ],
                  );
                  showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext ctx) {
                    return alert;
                      });
                },
                child: Text("Montrer une Alerte")
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: btnColor,
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(createSnack(text: "Snack Evolué"));
        },
        child: Icon(Icons.add),
      ),
    );
  }

  SnackBar createSnack({required String text}) {



    final content = Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(Icons.house),
        Text(text)
      ],
    );
    final snack = SnackBar(
        content: content,
      action: SnackBarAction(
        label: "Changer couleur btn",
        onPressed: () {
          setState((){
            btnColor = (btnColor == Colors.greenAccent) ? Colors.redAccent : Colors.greenAccent;
          });
        },
        textColor: Colors.red,
      ),
      backgroundColor: Colors.greenAccent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15)
      ),
      elevation: 8,
      behavior: SnackBarBehavior.floating,
    );
    return snack;
  }
}
