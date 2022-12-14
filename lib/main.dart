import 'package:flutter/material.dart';
import 'second_screen.dart';

void main() {
  runApp(const MyApp());
}

class FlashCard {
  String text = "";
  String answer = "";

  FlashCard(String text, String answer) {
    this.text = text;
    this.answer = answer;
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  List<FlashCard> card = <FlashCard>[
    FlashCard("Text 1", "Answer 1"),
    FlashCard("Text 2", "Answer 2"),
    FlashCard("Text 3", "Answer 3"),
    FlashCard("Text 4", "Answer 4"),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void addItemToList() {
    setState(() {
      String text = "Text " + card.length.toString();
      String answer = "Answer " + card.length.toString();
      card.insert(card.length, FlashCard(text, answer));
    });
  }

  void removeItemFromList(int index) {
    setState(() {
      card.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text("Flashcards",
              style: TextStyle(color: Colors.white, fontSize: 30)),
          toolbarHeight: 70,
          toolbarOpacity: 1,
          elevation: 4.00,
          backgroundColor: Colors.purpleAccent,
        ),
        body: GridView.builder(
          itemCount: card.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (context, index) {
            return Card(
              color: Colors.pinkAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Column(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return const SecondPage(title: 'SecondPage');
                          }));
                    },
                    child: Container(
                        padding:
                        const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(0.0, 8.0, 8.0, 8.0),
                              child: Text(
                                card.elementAt(index).text,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0.0, 5.0, 8.0, 8.0),
                              child: Text(
                                card.elementAt(index).answer,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      0.0, 5.0, 8.0, 0.0),
                                  child: IconButton(
                                    icon: const Icon(Icons.delete,
                                        color: Colors.white, size: 40.0),
                                    tooltip: 'Delete',
                                    onPressed: () {
                                      removeItemFromList(index);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )),
                  ),
                ],
              ),
            );
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.dataset_outlined),
              label: 'Cards',
              backgroundColor: Colors.red,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.handshake_outlined),
              label: 'Practice',
              backgroundColor: Colors.green,
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          onPressed: () {
            addItemToList();
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}