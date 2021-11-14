import 'package:flutter/material.dart';

import '../../nations.dart';

/// * Root widget to rebuild your app when locale changes
class NationsRoot extends StatefulWidget {
  /// * ###  your Root app widget
  final Widget child;

  const NationsRoot({required this.child, Key? key}) : super(key: key);

  @override
  _NationsRootState createState() => _NationsRootState();
}

class _NationsRootState extends State<NationsRoot> {
  @override
  void initState() {
    Nations.addListener(() {
      if (mounted) setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => SizedBox(
        key: Key(Nations.locale.toString()),
        child: widget.child,
      );
}
