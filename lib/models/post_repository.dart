// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:sonanceep_sns/constants/strings.dart';
// import 'package:sonanceep_sns/domain/firestore_user/firestore_user.dart';
// import 'package:sonanceep_sns/domain/post/post.dart';
// import 'package:sonanceep_sns/models/main_model.dart';

// final postRepositlyProvider = ChangeNotifierProvider(
//   (ref) => PostRepositly(),
// );

// class PostRepositly extends ChangeNotifier {

//   Future<void> createPost({required MainModel mainModel, required BuildContext context}) async {
//     final Timestamp now = Timestamp.now();
//     final DocumentSnapshot<Map<String,dynamic>> currentUserDoc = mainModel.currentUserDoc;
//     final FirestoreUser firestoreUser = mainModel.firestoreUser;
//     final String activeUid = currentUserDoc.id;
//     final Post post = Post(
//       createdAt: now,
//       hashTags: [],
//       imageURL: imageURL,
//       videoURL: videoURL,
//       thumbnailURL: thumbnailURL,
//       likeCount: 0,
//       text: text,
//       textLanguageCode: '',
//       textNegativeScore: 0,
//       textPositiveScore: 0,
//       textSentiment: '',
//       commentCount: 0,
//       postId: postId,
//       reportCount: 0,
//       muteCount: 0,
//       uid: activeUid,
//       userImageURL: firestoreUser.userImageURL,
//       userName: firestoreUser.userName,
//       userNameLanguageCode: firestoreUser.userNameLanguageCode,
//       userNameNegativeScore: firestoreUser.userNameNegativeScore,
//       userNamePositiveScore: firestoreUser.userNamePositiveScore,
//       userNameSentiment: firestoreUser.userNameSentiment,
//       updatedAt: now,
//     );
//     await currentUserDoc.reference.collection('posts').doc(postId).set(post.toJson());  // main_model.dartで最初に取得したcurrentUserDocの下に投稿を作成する
//     // await voids.showFlutterToast(msg: createdPostMsg);
//     text = '';
//     postId = returnUuidV4();
//     resetURL();
//     Navigator.pop(context);  //ひとつ前のページに戻る
//   }

//   Future<Post> getPostById({required String id})async{
//     DocumentSnapshot<Map<String, dynamic>> doc = await FirebaseFirestore.instance.collection('users').doc(currentUser.uid).collection("posts").doc(id).get();
//     if(!doc.exists){
//     //   エラー投げる
//     }
//     return Post.fromJson(doc.data()!);
//   }
// }