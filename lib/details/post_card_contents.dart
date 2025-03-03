import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:sonanceep_sns/constants/enums.dart';
import 'package:sonanceep_sns/constants/others.dart';
import 'package:sonanceep_sns/constants/strings.dart';
import 'package:sonanceep_sns/constants/voids.dart';
import 'package:sonanceep_sns/domain/post/post.dart';
// constants
import 'package:sonanceep_sns/constants/routes.dart' as routes;
import 'package:sonanceep_sns/models/main_model.dart';
import 'package:sonanceep_sns/models/posts_model.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class PostCardContants extends StatelessWidget {
  const PostCardContants({
    super.key,
    required this.mainModel,
    required this.length,
    required this.post,
    required this.text,
    required this.videoPlayerController,
  });

  final MainModel mainModel;
  final double length;
  final Post post;
  final String text;
  final VideoPlayerController? videoPlayerController;

  @override
  Widget build(BuildContext context) {

    final String attachedURL;
    UrlFormatType? urlFormatType;

    if(post.imageURL.isNotEmpty) {
      attachedURL = post.imageURL;
      urlFormatType = UrlFormatType.image;
    } else if(post.videoURL.isNotEmpty) {
      attachedURL = post.videoURL;
      urlFormatType = UrlFormatType.video;
    } else if(post.thumbnailURL.isNotEmpty) {
      attachedURL = post.thumbnailURL;
      urlFormatType = UrlFormatType.thumbnail;
    } else {
      attachedURL = '';
      urlFormatType = null;
    }

    VideoPlayerController? vPlayerController = VideoPlayerController.networkUrl(Uri.parse(attachedURL));

    //与えられたattachedURLがある時には添える
    return attachedURL.isNotEmpty ? 
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: urlFormatType == UrlFormatType.video && attachedURL.contains(".mp4") ? // mp4形式か確認
          // AspectRatio(  //動画を表示
          //   aspectRatio: 3 / 2,
          //   child: Chewie(controller: videoPlayerSettings(attachedURL: attachedURL, videoPlayerController: videoPlayerController)),
          // )
          VisibilityDetector(
            key: ValueKey(attachedURL),
            onVisibilityChanged: (VisibilityInfo info) async {
              // showFlutterToast(msg: videoPlayerController!.value.isInitialized.toString());
              // mainModel.setOrDisposeVideoPlayerController(mainModel: mainModel, visibleFraction: info.visibleFraction, attachedURL: attachedURL);
              // showFlutterToast(msg: videoPlayerController.value.isInitialized.toString());

              if(info.visibleFraction < 1 && vPlayerController != null) {
                await vPlayerController!.pause();
                await vPlayerController!.dispose();
                vPlayerController = null;
              }
            },
            child: AspectRatio(  //動画を表示
              aspectRatio: 3 / 2,
              child: Chewie(controller: videoPlayerSettings(imageURL: attachedURL, videoPlayerController: vPlayerController)),
              // vPlayerController.value.isInitialized
              //   ? Chewie(controller: videoPlayerSettings(attachedURL: attachedURL, videoPlayerController: vPlayerController))
              //   : Center(
              //     child: CircularProgressIndicator(),
              //   ),
            )
          )
          : urlFormatType == UrlFormatType.image && attachedURL.contains(".jpg") ?
          //画像を表示
          InkWell(
            onTap: () => routes.toPostFocusPage(context: context, post: post),
            child: Container(
              alignment: Alignment.center,
              child: 
              Image.network(
                attachedURL,
                width: length,
                // height: length,
                fit: BoxFit.cover, // 画像のアスペクト比を保ちつつサイズに収める
              ),
            ),
          ) : const Center(child: Text(failedToGetContentsText),)
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
          child: Text(text, style: const TextStyle(fontSize: 24.0),),
        ),
      ],
    ) : Container(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
        child: Text(text, style: const TextStyle(fontSize: 24.0),),
      ),
    );
  }
}