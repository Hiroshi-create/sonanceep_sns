// flutter
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
// packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
// constants
import 'package:sonanceep_sns/constants/strings.dart';
import 'package:sonanceep_sns/constants/voids.dart' as voids;
// components
import 'package:sonanceep_sns/details/rounded_button.dart';
import 'package:sonanceep_sns/details/user_image.dart';
import 'package:sonanceep_sns/views/refresh_screen.dart';
// domain
import 'package:sonanceep_sns/domain/post/post.dart';
// model
import 'package:sonanceep_sns/models/main_model.dart';
import 'package:sonanceep_sns/models/mute_Posts_model.dart';

class MutePostsPage extends ConsumerWidget {
  const MutePostsPage({
    super.key,
    required this.mainModel,
  });

  final MainModel mainModel;
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final MutePostsModel mutePostsModel = ref.watch(mutePostsProvider);
    final mutePostDocs = mutePostsModel.mutePostDocs;
  
    return Scaffold(
      appBar: AppBar(
        title: const Text(mutePostsPageTitle),
      ),
      body: mutePostsModel.showMutePosts ? 
      RefreshScreen(
        onRefresh: () async => await mutePostsModel.onRefresh(mainModel: mainModel),
        onLoading: () async => await mutePostsModel.onLoading(),
        refreshController: mutePostsModel.refreshController,
        child: ListView.builder(
          itemCount: mutePostDocs.length,
          itemBuilder: (BuildContext context, int index) {
            final mutePostDoc = mutePostDocs[index];
            final Post mutePost = Post.fromJson(mutePostDoc.data()!);
            return ListTile(
              leading: UserImage(length: 60, userImageURL: mutePost.userImageURL,),
              title: Text(mutePost.text),
              onTap: () => voids.showPopup(
                context: context,
                builder: (BuildContext innerContext) => CupertinoActionSheet(
                  actions: [
                    CupertinoActionSheetAction(
                      isDestructiveAction: true,
                      onPressed: () {
                        Navigator.pop(innerContext);
                        mutePostsModel.showUnMutePostDialog(context: context, mainModel: mainModel, postDoc: mutePostDoc, postDocs: mutePostDocs);
                      },
                      child: const Text(unMutePostText),
                    ),
                    CupertinoActionSheetAction(
                      onPressed: () => Navigator.pop(innerContext),
                      child: const Text(backText),
                    ),
                  ]
                )
              ),
            );
          }
        ),
      )
      : Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: RoundedButton(
              onPressed: () async => await mutePostsModel.getMutePosts(mainModel: mainModel),
              widthRate: 0.85,
              color: Colors.blue,
              text: showMutePostsText,
            ),
          )
        ],
      ),
    );
  }
}