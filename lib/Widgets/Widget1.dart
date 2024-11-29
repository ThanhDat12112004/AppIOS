
import 'package:flutter/material.dart';

class myWidget extends StatelessWidget {
  final bool loading;
  const myWidget(this.loading, {super.key});
  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return const Text('StalessWidget');
    }
  }
}

//----------------
class myWidget2 extends StatefulWidget {
  final bool loading;
  const myWidget2(this.loading, {super.key});
  @override
  State<StatefulWidget> createState() {
    return _myWidget2State();
  }
}

class _myWidget2State extends State<myWidget2> {
  late bool _localLoading;
  @override
  void initState() {
    _localLoading = widget.loading;
  }

  @override
  Widget build(BuildContext context) {
    return _localLoading
        ? const CircularProgressIndicator()
        : FloatingActionButton(
            onPressed: onClick,
            child: const Icon(Icons.accessible_sharp),
          );
  }

  void onClick() {
    setState(() {
      _localLoading = true;
    });
  }
}
