// flutter
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sonanceep_sns/constants/doubles.dart';
import 'package:sonanceep_sns/constants/strings.dart';
import 'package:sonanceep_sns/constants/voids.dart' as voids;
import 'package:sonanceep_sns/details/create_button.dart';
import 'package:sonanceep_sns/details/song_image.dart';
// components
import 'package:sonanceep_sns/domain/firestore_song/firestore_song.dart';
import 'package:sonanceep_sns/models/main_model.dart';

class SongHeader extends ConsumerWidget {
  const SongHeader({
    super.key,
    required this.mainModel,
    required this.songDoc,
    required this.imageValue,
    required this.onTap,
  });

  final MainModel mainModel;
  final DocumentSnapshot<Map<String,dynamic>> songDoc;
  final int imageValue;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final screenSize = MediaQuery.of(context).size;
    final screenHight = screenSize.height;
    final screenWidth = screenSize.width;

    final FirestoreSong firestoreSong = FirestoreSong.fromJson(songDoc.data()!);

    return SizedBox(
      height: (screenWidth < screenHight ? screenHight : screenWidth) * soungHeaderHightMagnification,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 56.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: SongImage(songImageURL: firestoreSong.songImageURL[imageValue], length: 48.0),
                ),
                Expanded(child: Text(firestoreSong.songName, style: const TextStyle(fontSize: 24.0), overflow: TextOverflow.ellipsis, maxLines: 1,)),
              ],
            ),
          ),
          CreateButton(
            mainModel: mainModel,
            songDoc: songDoc,
            text: createPostDefaultSoundText,
          ),
        ]
      ),
    );
  }
}