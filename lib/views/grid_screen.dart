import 'package:flutter/material.dart';
import 'package:mobigic_test/views/test.dart';

class GridScreen extends StatefulWidget {
  final int row;
  final int col;
  final String alphabest;

  GridScreen(
      {Key? key, required this.row, required this.col, required this.alphabest})
      : super(key: key);

  @override
  _GridScreenState createState() => _GridScreenState();
}

class _GridScreenState extends State<GridScreen> {
  List<List> list = [];
  List characters = [];
  List matchcharacters = [];
  TextEditingController wordSearchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState

    characters = widget.alphabest.split('');
    // list = List.generate(
    //     widget.row, (index) => List.generate(widget.col, (j) => characters),
    //     growable: false);

    super.initState();
  }

  bool check = false;

  searchWord() {
    if (widget.alphabest.contains(wordSearchController.text)) {
      print('found');
      check = true;
      setState(() {});
    } else {
      print('try again');
      check = false;
      setState(() {});
    }
  }

  findUsingLoop(String text, List list) {
    for (String s in list) {
      if (s.contains(text)) {
        matchcharacters.add(s);
      }
    }
    // if (list.toString().toLowerCase().contains(text)) {
    //   matchcharacters.add(list);
    // }
    print('sssss $matchcharacters');
    return matchcharacters;
  }

  @override
  Widget build(BuildContext context) {
    // print('list lenght is ${list.length} ');
    // print('list is ${list} ');
    print('characters are ${characters}');
    return Scaffold(
        appBar: AppBar(
          title: const Text('Grid Screen'),
          automaticallyImplyLeading: false,
          actions: [
            Center(
              child: InkWell(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => Test()),
                      (route) => false);
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Reset',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(child: _buildGridBody()));
  }

  Widget _buildGridBody() {
    return Column(children: <Widget>[
      GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: const EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: widget.row,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10),
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
                // color: characters[index] == matchcharacters[index]
                //     ? Colors.yellow
                //     : Colors.white,
                border: Border.all(color: Colors.black, width: 0.5)),
            child: Center(
              child: Text(
                '${characters[index]}',
                style: const TextStyle(fontSize: 25),
              ),
            ),
          );
        },
        itemCount: characters.length,
      ),
      const SizedBox(
        height: 20,
      ),
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: TextFormField(
          controller: wordSearchController,
          decoration: const InputDecoration(hintText: 'Enter Text'),
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      Center(
        child: ElevatedButton(
            onPressed: () {
              // searchWord();
              findUsingLoop(wordSearchController.text, characters);
            },
            child: const Text('Find')),
      )
    ]);
  }
}
