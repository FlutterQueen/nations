import 'package:flutter/material.dart';
import 'package:nations/nations.dart';

/// rebuilds your app when locale changes
class NationsBuilder extends StatefulWidget {
  /// rebuilds your app when locale changes
  const NationsBuilder({
    Key? key,
    required this.builder,
  }) : super(key: key);

  /// takes a context and return your root app
  final WidgetBuilder builder;
  @override
  _NationsBuilderState createState() => _NationsBuilderState();
}

class _NationsBuilderState extends State<NationsBuilder> {
  @override
  Widget build(BuildContext context) {
    _forceRebuild(context);

    return widget.builder(context);
  }

  @override
  void initState() {
    Nations.addListener(() {
      _forceRebuild(context);
    });
    super.initState();
  }

  void _forceRebuild(BuildContext context) {
    void rebuild(Element element) {
      if (element.debugDoingBuild || element.dirty) return;
      element
        ..markNeedsBuild()
        ..visitChildren(rebuild);
    }

    (context as Element).visitChildren(rebuild);
  }
}
