// flutter
import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// package
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sonanceep_sns/constants/strings.dart';
import 'package:sonanceep_sns/constants/voids.dart';
import 'package:sonanceep_sns/domain/post/post.dart';
import 'package:sonanceep_sns/models/main_model.dart';

final deletePostProvider = ChangeNotifierProvider(
  ((ref) => DeletePostModel()
));

class DeletePostModel extends ChangeNotifier {

  Future<void> deletePost({required MainModel mainModel, required DocumentSnapshot<Map<String, dynamic>> postDoc}) async {
    final DocumentReference<Map<String, dynamic>> postDocRef = postDoc.reference;
    // // image等を削除
    // final storageReference = FirebaseStorage.instance.refFromURL(postDoc.get('imageURL'));
    // await storageReference.delete();

    // サブコレクションを削除
    QuerySnapshot subcollections = await postDocRef.collection('postLikes').get();
    // サブコレクション内のすべてのドキュメントを削除
    for(final doc in subcollections.docs) {
      await doc.reference.delete();
    }
    // 投稿をいいねした人のリスト等を削除

    // 投稿を削除する
    await postDocRef.delete();
    showFlutterToast(msg: "投稿を削除");
  }




  void showDeletePostDialog({
    required BuildContext context,
    required MainModel mainModel,
    required DocumentSnapshot<Map<String, dynamic>> postDoc,
    // required List<DocumentSnapshot<Map<String,dynamic>>> docs,
  }) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext innerContext) => CupertinoAlertDialog(
        // title: const Text('投稿を削除する'),
        content: const Text(deletePostMsg),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () => Navigator.pop(innerContext),
            child: const Text(noText),
          ),
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () async {
              Navigator.pop(innerContext);
              await deletePost(mainModel: mainModel, postDoc: postDoc);
            },
            child: const Text(yesText),
          ),
        ],
      ),
    );
  }
}