import 'package:flutter/material.dart';
import 'package:getx_from_scratch/theme/style_theme.dart';

class ExamplePage extends StatefulWidget {
  ExamplePage({Key? key}) : super(key: key);

  @override
  _ExamplePageState createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Página de Exemplo"),
      ),
      body: Container(
        color: StyleTheme.primaryColor,
      ),
    );
  }
}
