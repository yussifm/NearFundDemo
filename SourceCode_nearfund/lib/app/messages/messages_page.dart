import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../DummyData/Contacts.dart';

class MessagePage extends StatefulWidget {
  MessagePage({Key? key}) : super(key: key);

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  List contacts = allContacts;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             
              const Text(
                "Chats",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                    fontSize: 20.0),
              ),
              IconButton(
                  onPressed: () {},
                  icon: FaIcon(
                    FontAwesomeIcons.ellipsisH,
                    color: Colors.amber[800],
                    size: 20.0,
                  ))
            ],
          ),
          const Divider(
            thickness: 1.5,
          ),
          Expanded(
              child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: const BorderRadius.all(Radius.circular(40.0)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        offset: const Offset(3.0, 4.0),
                        blurRadius: 5.0,
                        spreadRadius: 0.5,
                      ),
                      const BoxShadow(
                        color: Colors.white,
                        offset: Offset(-4.0, -4.0),
                        blurRadius: 5.0,
                        spreadRadius: 0.5,
                      ),
                    ],
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: Icon(Icons.mic),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: contacts.length,
                  itemBuilder: (context, index) {
                    String name = contacts[index]['name'];
                    String message = contacts[index]['message'];
                    String timeM = contacts[index]['time'];
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 9,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              child: Container(
                            width: 70.0,
                            height: 70.0,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade600,
                                  offset: const Offset(4.0, 7.0),
                                  blurRadius: 10.0,
                                  spreadRadius: 0.5,
                                ),
                                const BoxShadow(
                                  color: Colors.white,
                                  offset: Offset(-4.0, -4.0),
                                  blurRadius: 15.0,
                                  spreadRadius: 1.0,
                                )
                              ],
                            ),
                            child: Center(child: Text(name[0].toUpperCase())),
                          )),
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(
                                  child: ListTile(
                                    title: Text(name),
                                    subtitle: Text(message),
                                    trailing: Text(timeM),
                                  ),
                                ),
                                const Expanded(
                                  child: Divider(
                                    thickness: 1.4,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          )),
        ],
      ),
    ));
  }
}
