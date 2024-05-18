import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_ui/screens/login_screen.dart';
import 'package:flutter_firebase_ui/screens/posts/addposts.dart';
import 'package:flutter_firebase_ui/utils/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
// create firebase database reference
  final ref = FirebaseDatabase.instance.ref('Post');

// search filter controller
  final searchFilter = TextEditingController();

// Update controller
  final editcontroller = TextEditingController();

// user sign out
  Future<void> signUserOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.yellow[200],
        title: const Text('Welcome to home screen buddy'),
        actions: [
          IconButton(
              onPressed: () {
                signUserOut().then((value) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                }).onError((error, stackTrace) {
                  debugPrint(error.toString());
                  Utils.toastmsg(context, error.toString());
                });
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextFormField(
              controller: searchFilter,
              decoration: const InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (String value) {
                setState(() {});
              },
            ),
            Expanded(
                child: FirebaseAnimatedList(
              query: ref,
              itemBuilder: (context, snapshot, animation, index) {
                final title = snapshot.child('title').value.toString();
                if (searchFilter.text.isEmpty) {
                  return ListTile(
                      title: Text(snapshot.child('title').value.toString()),
                      subtitle: Text(snapshot.child('id').value.toString()),
                      trailing: PopupMenuButton(
                        icon: const Icon(Icons.more_vert),
                        itemBuilder: ((context) => [
                              PopupMenuItem(
                                  onTap: () {
                                    showMyDialog(title,
                                        snapshot.child('id').value.toString());
                                  },
                                  child: const ListTile(
                                    leading: Icon(Icons.edit),
                                    title: Text('update'),
                                  )),
                              PopupMenuItem(
                                  onTap: () {
                                    ref
                                        .child(snapshot
                                            .child('id')
                                            .value
                                            .toString())
                                        .remove();
                                  },
                                  child: const ListTile(
                                    leading: Icon(Icons.delete),
                                    title: Text('Delete'),
                                  ))
                            ]),
                      ));
                } else if (title
                    .toLowerCase()
                    .contains(searchFilter.text.toLowerCase())) {
                  return ListTile(
                      title: Text(snapshot.child('title').value.toString()),
                      subtitle: Text(snapshot.child('id').value.toString()));
                } else {
                  return Container();
                }
              },
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddPostScreen()));
                  },
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> showMyDialog(String title, String id) async {
    editcontroller.text = title;
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Update'),
            content: TextField(
              controller: editcontroller,
              decoration: const InputDecoration(
                hintText: 'Edit',
                border: OutlineInputBorder(),
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel')),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    ref.child(id).update({
                      'title': editcontroller.text.toLowerCase()
                    }).then((value) {
                      Utils.toastmsg(context, 'updated');
                    }).onError((error, stackTrace) {
                      Utils.toastmsg(context, error.toString());
                    });
                  },
                  child: const Text('Update'))
            ],
          );
        });
  }
}
