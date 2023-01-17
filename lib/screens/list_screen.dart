import 'package:flutter/material.dart';

class ContentModel {
  final String name;
  final String position;

  ContentModel(this.name, this.position);
}

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<ContentModel> nameOfPerson = [];
  TextEditingController nameController = TextEditingController();

  void addNameToList(String name) {
    setState(() {
      nameOfPerson.add(ContentModel(name, 'position'));
    });
  }

  void showNameInput() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          children: [
            TextField(
              controller: nameController,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                confirmNameInput();
              },
              child: const Text('Finish'),
            )
          ],
        );
      },
    );
  }

  void confirmNameInput() {
    Widget continueButton = TextButton(
      onPressed: () {
        Navigator.pop(context);
        addNameToList(nameController.text);
        nameController.clear();
      },
      child: const Text('Continue'),
    );

    Widget cancelButton = TextButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: const Text('Cancel'),
    );

    AlertDialog alertDialog = AlertDialog(
      title: const Text('Alert Dialog'),
      content: const Text('Are you sure ?'),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    showDialog(
      context: context,
      builder: (context) {
        return alertDialog;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Screen'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showNameInput();
        },
      ),
      body: ListView.builder(
        itemCount: nameOfPerson.length,
        itemBuilder: (context, index) {
          final data = nameOfPerson[index];
          return Text(data.name);
        },
      ),
    );
  }
}
