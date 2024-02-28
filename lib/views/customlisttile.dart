import 'package:flutter/material.dart';

class CListView extends StatelessWidget {
  final String label;
  final VoidCallback action;
  final IconData? check;

  const CListView(
      {super.key, required this.label, required this.action, this.check});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(label),
      onTap: action,
      leading: Icon(check),
    );
  }
}
