import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const String _title = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  //กำหนดเป็นFalseก่อนกด
  bool isLoadng = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Loading Test',
                  style: TextStyle(
                      color: Color(0xFF3B4C7A),
                      fontWeight: FontWeight.w700,
                      fontSize: 24),
                )),

            ///ปุ่มbuttonที่โหลดเวลากด
            Container(padding: const EdgeInsets.only(top: 32.0)),
            ElevatedButton(
              child: isLoadng
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LoadingAnimationWidget.discreteCircle(
                            color: Colors.white, size: 20),
                        const SizedBox(width: 24),
                        Text('Loging in...'),
                      ],
                    )
                  : Text('Sign In'),
              onPressed: () async {
                if (isLoadng) return;
                setState(() => isLoadng = true);
                await Future.delayed(Duration(seconds: 5));
                setState(() => isLoadng = false);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0xFF5771DF)),
                minimumSize: MaterialStateProperty.all(const Size(332, 55)),
              ),
            ),
          ],
        ));
  }
}
