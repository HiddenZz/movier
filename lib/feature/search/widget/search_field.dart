import 'package:flutter/material.dart';

class SearchField extends StatefulWidget {
  const SearchField({super.key, this.textController, this.focusNode, this.enabled = true});
  final bool enabled;
  final TextEditingController? textController;
  final FocusNode? focusNode;

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) => DecoratedBox(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(24),
      boxShadow: [BoxShadow(color: Color(0xff2E3230).withValues(alpha: .2), blurRadius: 2, offset: Offset(0, 1))],
    ),
    child: TextField(
      enabled: widget.enabled,
      controller: widget.textController,
      focusNode: widget.focusNode,
      decoration: InputDecoration(filled: true, prefixIcon: Icon(Icons.search), contentPadding: EdgeInsets.all(16)),
    ),
  );
}
