import 'package:flutter/material.dart';

class Reload extends StatefulWidget {
  const Reload({super.key, required this.child});

  final Widget child;

  static void reloadApp(BuildContext context) {
    Future.microtask(() =>
        context.findAncestorStateOfType<_ReloadState>()?.reloadApp());
  }

  static void reloadPages(BuildContext context) {
    Future.microtask(() =>
        context.findAncestorStateOfType<_ReloadState>()?.reloadPages());
  }

  @override
  _ReloadState createState() => _ReloadState();
}

class _ReloadState extends State<Reload> {
  Key key = UniqueKey();

  void reloadApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  void reloadPages() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: Container(
        color: Colors.white,
        child: widget.child,
      ),
    );
  }
}
