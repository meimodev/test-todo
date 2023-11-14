import 'package:flutter/material.dart';

class SwitchDoneWidget extends StatefulWidget {
  const SwitchDoneWidget({
    super.key,
    required this.value,
    required this.onChangeValue,
  });

  final bool value;
  final void Function(bool value) onChangeValue;

  @override
  State<SwitchDoneWidget> createState() => _SwitchDoneWidgetState();
}

class _SwitchDoneWidgetState extends State<SwitchDoneWidget> {
  bool value = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      value = widget.value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        setState(() {
          value = !value;
        });
        widget.onChangeValue(value);
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Icon(
              widget.value ? Icons.check : Icons.remove,
            ),
            Text(
              widget.value ? "done" : "not done",
            ),
          ],
        ),
      ),
    );
  }
}
