// flutter

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// components
import 'package:sonanceep_sns/details/rounded_button.dart';
// constants
import 'package:sonanceep_sns/constants/strings.dart';
import 'package:sonanceep_sns/constants/voids.dart' as voids;
import 'package:sonanceep_sns/constants/routes.dart' as routes;
import 'package:sonanceep_sns/models/daw_mobile/daw_mobile_model.dart';
// model
import 'package:sonanceep_sns/models/main_model.dart';
import 'package:sonanceep_sns/models/one_shot_model.dart';

class CreateButton extends ConsumerWidget {
  const CreateButton({
    super.key,
    required this.mainModel,
    required this.songDoc,
    required this.text,
  });

  final MainModel mainModel;
  final DocumentSnapshot<Map<String,dynamic>> songDoc;
  final String text;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final DawMobileModel dawMobileModel = ref.watch(dawMobileProvider);
    final OneShotModel oneShotModel = ref.watch(oneShotProvider);

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: RoundedButton(
        widthRate: 0.85,
        color: Colors.purple,
        text: text,
        onPressed: () =>  voids.showPopup(
          context: context,
          builder: (BuildContext innerContext) => CupertinoActionSheet(
            actions: [
              // 一発撮り
              CupertinoActionSheetAction(
                isDestructiveAction: true,
                onPressed: () async {
                  routes.toOneShotPage(context: context);
                  await oneShotModel.initializeCamera(context: context, songDoc: songDoc);
                },
                child: const Text(createPostOneShotText),
              ),
              // 撮影後に編集を行う
              CupertinoActionSheetAction(
                isDestructiveAction: true,
                onPressed: () async {},
                child: const Text(createPostEditAfterShooting),
              ),
              // 編集のみ
              CupertinoActionSheetAction(
                isDestructiveAction: true,
                onPressed: () async {
                  routes.toDawMobilePage(context: context, mainModel: mainModel, songDoc: songDoc);
                  await dawMobileModel.init(context: context, songDoc: songDoc);
                },
                child: const Text(createPostToEditText),
              ),
              CupertinoActionSheetAction(
                onPressed: () => Navigator.pop(innerContext),
                child: const Text(backText),
              ),
            ],
          ),
        ),
      ),
    );
  }
}