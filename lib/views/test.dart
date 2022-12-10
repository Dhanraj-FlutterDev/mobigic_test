import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobigic_test/views/grid_screen.dart';

class Test extends StatefulWidget {
  Test({Key? key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  TextEditingController rowController = TextEditingController();
  TextEditingController columnController = TextEditingController();
  TextEditingController alphabetController = TextEditingController();
  FocusNode focusNodeOne = FocusNode();
  FocusNode focusNodeTwo = FocusNode();
  FocusNode focusNodeThree = FocusNode();

  showToast(text) {
    return Fluttertoast.showToast(msg: text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: rowController,
              keyboardType: TextInputType.number,
              focusNode: focusNodeOne,
              onFieldSubmitted: (value) {
                FocusScope.of(context).requestFocus(focusNodeTwo);
              },
              decoration: InputDecoration(
                hintText: 'Enter Number of Row',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: columnController,
              focusNode: focusNodeTwo,
              keyboardType: TextInputType.number,
              onFieldSubmitted: (value) {
                setState(() {});
                FocusScope.of(context).requestFocus(focusNodeThree);
              },
              decoration: InputDecoration(
                hintText: 'Enter Number of Colunm',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            rowController.text.isNotEmpty && columnController.text.isNotEmpty
                ? TextFormField(
                    controller: alphabetController,
                    focusNode: focusNodeThree,
                    keyboardType: TextInputType.name,
                    maxLength: int.parse(rowController.text) *
                        int.parse(columnController.text),
                    decoration: InputDecoration(
                      hintText:
                          'Enter Alphabets of Lenght ${int.parse(rowController.text) * int.parse(columnController.text)}',
                    ),
                  )
                : const SizedBox(),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    if (rowController.text.isEmpty) {
                      showToast('Please add number of rows');
                    } else if (columnController.text.isEmpty) {
                      showToast('Please add number of columns');
                    } else if (alphabetController.text.isEmpty) {
                      showToast('Please add characters');
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GridScreen(
                                    row: int.parse(rowController.text),
                                    col: int.parse(columnController.text),
                                    alphabest: alphabetController.text,
                                  )));
                    }
                  },
                  child: const Text('Create Grid')),
            )
          ],
        ),
      ),
    );
  }
}
