import 'package:flutter/material.dart';
import 'package:testtodo/models/todo.dart';
import 'package:testtodo/screens/add_edit_screen/switch_done_widget.dart';
import 'package:testtodo/utils/utils.dart';

class AddEditScreen extends StatefulWidget {
  const AddEditScreen({super.key, this.todo});

  final Todo? todo;

  @override
  State<AddEditScreen> createState() => _AddEditScreenState();
}

class _AddEditScreenState extends State<AddEditScreen> {
  final tec = TextEditingController();

  Todo? todo;

  @override
  void initState() {
    super.initState();
    todo = widget.todo;
  }

  @override
  void dispose() {
    tec.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final adding = widget.todo == null;
    final done = !adding && widget.todo!.done;

    return Scaffold(
      body: Column(
        children: [
          Text(widget.todo != null ? "Adding" : "Editing"),
          const SizedBox(height: 20),
          TextField(
            controller: tec,
            decoration: const InputDecoration(hintText: "Todo"),
            onChanged: onChangedTextValue,
          ),
          const SizedBox(height: 20),
          SwitchDoneWidget(
            value: done,
            onChangeValue: (bool value) {
              setState(() {
                todo = Todo(
                  id: todo?.id ?? '',
                  title: todo?.title ?? '',
                  done: done,
                );
              });
            },
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildButton(
                  icon: Icons.add,
                  backgroundColor: Colors.black,
                  onPressed: () => onPressedButtons(operation: Operations.add),
                ),
                _buildButton(
                  icon: Icons.delete,
                  backgroundColor: Colors.red,
                  onPressed: () =>
                      onPressedButtons(operation: Operations.delete),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton({
    required IconData icon,
    required Color backgroundColor,
    required void Function() onPressed,
  }) =>
      InkWell(
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            color: backgroundColor,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Icon(icon),
          ),
        ),
      );

  void onChangedTextValue(String value) {}

  void onPressedButtons({required Operations operation}) {

  }
}
