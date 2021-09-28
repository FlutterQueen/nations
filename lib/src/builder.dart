part of '../nations.dart';

/// * Root widget to rebuild your app when locale changes
class NationsRoot extends StatefulWidget {
  /// * you app widget
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
    /// dispose the listner
    Nations.dispose();
    // TODO :: log
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      // * to makes the rebuilded when locale changes
      key: UniqueKey(),

      /// to set the direction automaticly
      textDirection: textDirectionByLocale(Nations.locale),

      child: widget.child,
    );
  }
}
