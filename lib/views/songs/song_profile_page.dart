// flutter
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// packages
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sonanceep_sns/constants/colors.dart';
import 'package:sonanceep_sns/constants/doubles.dart';
// constants
import 'package:sonanceep_sns/constants/strings.dart';
import 'package:sonanceep_sns/details/song_header.dart';
import 'package:sonanceep_sns/details/song_image.dart';
import 'package:sonanceep_sns/domain/firestore_song/firestore_song.dart';
// components
// models
import 'package:sonanceep_sns/models/main_model.dart';

class SongProfilePage extends HookConsumerWidget {
  const SongProfilePage({
    super.key,
    required this.mainModel,
    required this.songDoc,
    required this.imageValue,
  });

  final MainModel mainModel;
  final DocumentSnapshot<Map<String,dynamic>> songDoc;
  final int imageValue;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final FirestoreSong firestoreSong = FirestoreSong.fromJson(songDoc.data()!);
    // final RefreshController refreshController = RefreshController();
    // final SongProfileModel songProfileModel = ref.watch(songProfileProvider);
    // final postDocs = songProfileModel.postDocs;

    // useEffect(() {
    //   return refreshController.dispose;
    // }, []);
 
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Padding(
            //   padding: const EdgeInsets.only(top: 4.0, right: 8.0),
            //   child: SongImage(songImageURL: firestoreSong.songImageURL[imageValue], length: 40.0),
            // ),
            Expanded(child: Text(firestoreSong.songName, style: const TextStyle(fontSize: 24.0), overflow: TextOverflow.ellipsis, maxLines: 1,)),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: SongHeader(mainModel: mainModel, songDoc: songDoc, imageValue: imageValue, onTap: () {}),
            ),
            const Divider(color: dividerColor, height: dividerHeightAndThickness, thickness: dividerHeightAndThickness),
            //PassiveUserProfilePageを参照する
          ],
        ),
      )
    );
  }
}