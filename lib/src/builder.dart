import 'package:flutter/material.dart';
import 'package:nations/nations.dart';

class NationsBuilder extends StatefulWidget {
  final WidgetBuilder builder;

  const NationsBuilder({Key? key, required this.builder}) : super(key: key);

  @override
  NationsBuilderState createState() => NationsBuilderState();
}

class NationsBuilderState extends State<NationsBuilder> {
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
      element.markNeedsBuild();
      element.visitChildren(rebuild);
    }

    (context as Element).visitChildren(rebuild);
  }
}
