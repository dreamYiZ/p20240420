import 'package:flutter/material.dart';

class FlowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('请假页面'),
      ),
      body: Center(
        child: Text(
          '这是请假页面',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
