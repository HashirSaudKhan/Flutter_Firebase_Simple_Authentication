import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_ui/Providers/loadingcircleprovider.dart';
import 'package:flutter_firebase_ui/components/roundbutton.dart';
import 'package:flutter_firebase_ui/utils/utils.dart';
import 'package:provider/provider.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  final databaseref = FirebaseDatabase.instance.ref('Post');
  final postController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        centerTitle: true,
        title: const Text('Add Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: postController,
              maxLines: 4,
              decoration: const InputDecoration(
                  hintText: "What's on your mind ?",
                  border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 30,
            ),
            Consumer<LoadingCircleProvider>(
                builder: (context, loadingcircle, child) {
              return RoundButton(
                  title: 'Add',
                  onTap: () {
                    loadingcircle.loading = true;
                    databaseref
                        .child(DateTime.now().millisecondsSinceEpoch.toString())
                        .set({
                      'id': DateTime.now().millisecondsSinceEpoch.toString(),
                      'title': postController.text.toString()
                    }).then((value) {
                      loadingcircle.loading = false;
                      Utils.toastmsg(context, 'Added');
                    }).onError((error, stackTrace) {
                      loadingcircle.loading = false;
                      Utils.toastmsg(context, error.toString());
                    });
                  });
            }),
          ],
        ),
      ),
    );
  }
}
