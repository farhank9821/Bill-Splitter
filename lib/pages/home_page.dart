import 'package:bill_splitter/utils/dialogue_box.dart';
import 'package:flutter/material.dart';
import '../utils/amount_calc_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();

  final List data = [
    "Farhan Khan",
    "Zoya Khan",
  ];

  void onSave() {
    setState(() {
      data.add(_controller.text);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  void createTask() {
    showDialog(
      context: context,
      builder: ((context) {
        return DialogBox(
          controller: _controller,
          onSave: onSave,
          onCancel: () => Navigator.of(context).pop(),
        );
      }),
    );
  }

  void deleteTask(int index) {
    setState(() {
      data.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF6ECCAF),
      appBar: AppBar(
        backgroundColor: Color(0xFF344D67),
        elevation: 0,
        title: const Text(
          'Bill Splitter',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createTask,
        child: const Icon(Icons.add),
        backgroundColor: Colors.orange[900],
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: ((context, index) {
          return AmountCalc(
            name: data[index],
            deleteFunction: (contest) => deleteTask(index),
          );
        }),
      ),
    );
  }
}
