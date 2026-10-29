import 'package:flutter/widgets.dart';

/// Lays [children] out in rows of [columns], each row as tall as its
/// tallest child, so cards line up whatever the text length.
class EqualHeightGrid extends StatelessWidget {
  const EqualHeightGrid({
    super.key,
    required this.columns,
    required this.children,
    this.gap = 16,
  });

  final int columns;
  final double gap;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final rows = <Widget>[];
    for (var start = 0; start < children.length; start += columns) {
      final cells = <Widget>[];
      for (var i = start; i < start + columns; i++) {
        if (i > start) cells.add(SizedBox(width: gap));
        cells.add(
          Expanded(child: i < children.length ? children[i] : const SizedBox()),
        );
      }
      if (start > 0) rows.add(SizedBox(height: gap));
      rows.add(
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: cells,
          ),
        ),
      );
    }
    return Column(children: rows);
  }
}
