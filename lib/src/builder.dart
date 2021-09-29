import 'dart:developer';

import 'package:flutter/material.dart';

import '../nations.dart';

/// * Root widget to rebuild your app when locale changes
class NationsRoot extends StatefulWidget {
  /// * ###  your Root app widget
  final Widget child;

  const NationsRoot({
    required this.child,
    Key? key,
  }) : super(key: key);

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
  void dispose() {
    /// Dispose the listener
    Nations.dispose();
    log('Nations dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      // * to makes the app rebuilds when locale changes
      key: UniqueKey(),

      /// to set the direction automatically
      textDirection: textDirectionByLocale(Nations.locale),

      child: widget.child,
    );
  }
}
