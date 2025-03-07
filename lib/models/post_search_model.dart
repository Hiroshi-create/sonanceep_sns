// flutter
import 'package:flutter/material.dart';
// package
import 'package:algolia/algolia.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// domain
// constants
import 'package:sonanceep_sns/constants/algolia_application.dart';
import 'package:sonanceep_sns/constants/bools.dart';

final postSearchProvider = ChangeNotifierProvider(
  ((ref) => PostSearchModel()
));
class PostSearchModel extends ChangeNotifier {
  String searchTerm = '';
  // DocumentSnapshotではない  なぜならCloudFirestoreではないから
  // .startAfterDocument、.endBeforeDocumentを使用しない
  List<Map<String,dynamic>> postMaps = [];

  Future<void> operation({required List<String> muteUids, required List<String> mutePostIds}) async {
    if(searchTerm.isNotEmpty) {
      final Algolia algolia = Application.algolia;
      final AlgoliaQuery query = algolia.instance.index('posts').query(searchTerm);
      final AlgoliaQuerySnapshot snap = await query.getObjects();  //ここでデータを取得している  (非同期処理をしているのでそう予想が立てられる)
      final List<AlgoliaObjectSnapshot> results = snap.hits;
      postMaps.removeWhere((element) => true);  //中身を全部削除
      for(final result in results) {
        final map = result.data;
        if(isValidUser(muteUids: muteUids, map: map) && isValidPost(mutePostIds: mutePostIds, map: map) && !postMaps.contains(map)) postMaps.add(map);
      }
      notifyListeners();
    }
  }
}