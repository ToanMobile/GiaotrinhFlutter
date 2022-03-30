import 'package:flutter/material.dart';

class StateLessWidgetDemo extends StatelessWidget {
  const StateLessWidgetDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class StateFullWidget extends StatefulWidget {
  const StateFullWidget({Key? key}) : super(key: key);

  @override
  State<StateFullWidget> createState() => _StateFullWidgetState();
}

class _StateFullWidgetState extends State<StateFullWidget> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
