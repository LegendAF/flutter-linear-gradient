import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

Widget _gradientTransform({
  required double degrees,
  required double width,
  required double height,
  bool visuallyCorrect = false,
}) {
  return Column(
    children: [
      Container(
        margin: const EdgeInsets.only(bottom: 4, top: 4),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(99)),
        ),
        child: Icon(
          visuallyCorrect ? Icons.check_circle : Icons.cancel,
          color: visuallyCorrect ? Colors.green : Colors.red,
        ),
      ),
      Container(
        alignment: Alignment.center,
        width: width,
        height: height,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.blue,
            width: 1,
          ),
          gradient: LinearGradient(
            colors: const [
              Colors.black,
              Colors.white,
            ],
            transform: GradientRotation((degrees) * (pi / 180)),
          ),
        ),
      )
    ],
  );
}

Widget _gradientAlign({
  required AlignmentGeometry begin,
  required AlignmentGeometry end,
  required double width,
  required double height,
  bool visuallyCorrect = true,
}) {
  return Column(
    children: [
      Container(
        margin: const EdgeInsets.only(bottom: 4, top: 4),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(99)),
        ),
        child: Icon(
          visuallyCorrect ? Icons.check_circle : Icons.cancel,
          color: visuallyCorrect ? Colors.green : Colors.red,
        ),
      ),
      Container(
        alignment: Alignment.center,
        width: width,
        height: height,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.blue,
            width: 1,
          ),
          gradient: LinearGradient(
            colors: const [
              Colors.black,
              Colors.white,
            ],
            begin: begin,
            end: end,
          ),
        ),
      ),
    ],
  );
}

Widget section({
  required String title,
  required List<Widget> transforms,
  required List<Widget> aligns,
}) {
  return Container(
    padding: const EdgeInsets.all(8),
    margin: const EdgeInsets.only(bottom: 16),
    color: Colors.grey,
    child: Column(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Text('Using Transform', textAlign: TextAlign.center),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: transforms,
        ),
        const SizedBox(height: 8),
        const Text('Using Alignment', textAlign: TextAlign.center),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: aligns,
        ),
      ],
    ),
  );
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Broken Linear Gradients'),
      ),
      body: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            // 0 Degrees
            section(
              title: '0 Degrees',
              transforms: [
                _gradientTransform(
                  degrees: 0,
                  width: 50,
                  height: 50,
                  visuallyCorrect: true,
                ),
                const SizedBox(width: 16),
                _gradientTransform(
                  degrees: 0,
                  width: 25,
                  height: 50,
                  visuallyCorrect: true,
                ),
                const SizedBox(width: 16),
                _gradientTransform(
                  degrees: 0,
                  width: 100,
                  height: 50,
                  visuallyCorrect: true,
                ),
              ],
              aligns: [
                _gradientAlign(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  width: 50,
                  height: 50,
                  visuallyCorrect: true,
                ),
                const SizedBox(width: 16),
                _gradientAlign(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  width: 25,
                  height: 50,
                  visuallyCorrect: true,
                ),
                const SizedBox(width: 16),
                _gradientAlign(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  width: 100,
                  height: 50,
                  visuallyCorrect: true,
                ),
              ],
            ),
            // 45 Degrees
            section(
              title: '45 Degrees',
              transforms: [
                _gradientTransform(
                  degrees: 45,
                  width: 50,
                  height: 50,
                  visuallyCorrect: false,
                ),
                const SizedBox(width: 16),
                _gradientTransform(
                  degrees: 45,
                  width: 25,
                  height: 50,
                  visuallyCorrect: false,
                ),
                const SizedBox(width: 16),
                _gradientTransform(
                  degrees: 45,
                  width: 100,
                  height: 50,
                  visuallyCorrect: true,
                ),
              ],
              aligns: [
                _gradientAlign(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  width: 50,
                  height: 50,
                  visuallyCorrect: true,
                ),
                const SizedBox(width: 16),
                _gradientAlign(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  width: 25,
                  height: 50,
                  visuallyCorrect: true,
                ),
                const SizedBox(width: 16),
                _gradientAlign(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  width: 100,
                  height: 50,
                  visuallyCorrect: true,
                ),
              ],
            ),
            section(
              title: '90 Degrees',
              transforms: [
                _gradientTransform(
                  degrees: 90,
                  width: 50,
                  height: 50,
                  visuallyCorrect: true,
                ),
                const SizedBox(width: 16),
                _gradientTransform(
                  degrees: 90,
                  width: 25,
                  height: 50,
                  visuallyCorrect: false,
                ),
                const SizedBox(width: 16),
                _gradientTransform(
                  degrees: 90,
                  width: 100,
                  height: 50,
                  visuallyCorrect: false,
                ),
              ],
              aligns: [
                _gradientAlign(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  width: 50,
                  height: 50,
                  visuallyCorrect: true,
                ),
                const SizedBox(width: 16),
                _gradientAlign(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  width: 25,
                  height: 50,
                  visuallyCorrect: true,
                ),
                const SizedBox(width: 16),
                _gradientAlign(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  width: 100,
                  height: 50,
                  visuallyCorrect: true,
                ),
              ],
            ),
            section(
              title: '180 Degrees',
              transforms: [
                _gradientTransform(
                  degrees: 180,
                  width: 50,
                  height: 50,
                  visuallyCorrect: true,
                ),
                const SizedBox(width: 16),
                _gradientTransform(
                  degrees: 180,
                  width: 25,
                  height: 50,
                  visuallyCorrect: true,
                ),
                const SizedBox(width: 16),
                _gradientTransform(
                  degrees: 180,
                  width: 100,
                  height: 50,
                  visuallyCorrect: true,
                ),
              ],
              aligns: [
                _gradientAlign(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  width: 50,
                  height: 50,
                  visuallyCorrect: true,
                ),
                const SizedBox(width: 16),
                _gradientAlign(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  width: 25,
                  height: 50,
                  visuallyCorrect: true,
                ),
                const SizedBox(width: 16),
                _gradientAlign(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  width: 100,
                  height: 50,
                  visuallyCorrect: true,
                ),
              ],
            ),
            section(
              title: '270 Degrees',
              transforms: [
                _gradientTransform(
                  degrees: 270,
                  width: 50,
                  height: 50,
                  visuallyCorrect: true,
                ),
                const SizedBox(width: 16),
                _gradientTransform(
                  degrees: 270,
                  width: 25,
                  height: 50,
                  visuallyCorrect: false,
                ),
                const SizedBox(width: 16),
                _gradientTransform(
                  degrees: 270,
                  width: 100,
                  height: 50,
                  visuallyCorrect: false,
                ),
              ],
              aligns: [
                _gradientAlign(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  width: 50,
                  height: 50,
                  visuallyCorrect: true,
                ),
                const SizedBox(width: 16),
                _gradientAlign(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  width: 25,
                  height: 50,
                  visuallyCorrect: true,
                ),
                const SizedBox(width: 16),
                _gradientAlign(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  width: 100,
                  height: 50,
                  visuallyCorrect: true,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
