// flutter
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sonanceep_sns/constants/enums.dart';
import 'package:sonanceep_sns/constants/strings.dart';
import 'package:sonanceep_sns/details/rounded_button.dart';
import 'package:sonanceep_sns/details/rounded_text_field.dart';
import 'package:sonanceep_sns/models/create_post_model.dart';
import 'package:sonanceep_sns/models/main_model.dart';
import 'package:sonanceep_sns/constants/voids.dart' as voids;

class CreatePostPage extends ConsumerWidget {
  const CreatePostPage({
    super.key,
    required this.mainModel,
  });

  final MainModel mainModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final CreatePostModel createPostModel = ref.watch(createPostProvider);
    final TextEditingController textEditingController = TextEditingController(text: createPostModel.text);

    final UrlFormatType? urlFormatType = createPostModel.urlFormatType;

    return Scaffold(
      appBar: AppBar(
        title: const Text(createText),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            createPostModel.backPage();
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //画像・ TODO 動画
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: InkWell(
                child: createPostModel.imageCroppedFile != null && createPostModel.videoCroppedFile != null && urlFormatType == UrlFormatType.thumbnail
                ? const Text('動画とサムネイルの貼り付け完了！！') : 
                createPostModel.imageCroppedFile != null && urlFormatType == UrlFormatType.image
                ? const Text('画像の貼り付け完了！！') : 
                createPostModel.videoCroppedFile != null && urlFormatType == UrlFormatType.video
                ? const Text('動画の貼り付け完了！！サムネイルを貼り付けよう') 
                : const Text('画像、動画を貼り付けよう！'),
                // ClipRRect(
                //   child: Image.file(createPostModel.croppedFile!,),
                // ),
                // onTap: ()async => await createPostModel.onImageTapped(),
                onTap: () => voids.showPopup(
                  context: context,
                  builder: (BuildContext innerContext) => CupertinoActionSheet(
                    actions: [
                      // 画像
                      CupertinoActionSheetAction(
                        isDestructiveAction: true,
                        onPressed: () async {
                          Navigator.pop(innerContext);
                          await createPostModel.onImageTapped();
                        },
                        child: const Text(pastingImageText),
                      ),
                      // 動画
                      CupertinoActionSheetAction(
                        isDestructiveAction: true,
                        onPressed: () async {
                          Navigator.pop(innerContext);
                          await createPostModel.onVideoTapped(uid: mainModel.currentUserDoc.id);
                        },
                        child: const Text(pastingVideoText),
                      ),
                      // サムネイル
                      urlFormatType == UrlFormatType.video ? 
                      CupertinoActionSheetAction(
                        isDestructiveAction: true,
                        onPressed: () async {
                          Navigator.pop(innerContext);
                          await createPostModel.onThumbnailTapped();
                        },
                        child: const Text(pastingThumbnailText),
                      ) : const SizedBox(),
                      // アップロードした画像、動画を取り消し
                      urlFormatType != UrlFormatType.text ? 
                      CupertinoActionSheetAction(
                        isDestructiveAction: true,
                        onPressed: () {
                          Navigator.pop(innerContext);
                          createPostModel.uploadCancelTapped();
                        },
                        child: const Text(uploadCancelText),
                      ) : const SizedBox(),
                      CupertinoActionSheetAction(
                        onPressed: () => Navigator.pop(innerContext),
                        child: const Text(backText),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            createPostModel.displayImage(),
            //テキスト
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32.0),
              child: RoundedTextField(
                keyboardType: TextInputType.name,
                onChanged: (value) => createPostModel.text = value,
                controller: textEditingController,
                borderColor: Colors.black,
                shadowColor: Colors.red.withOpacity(0.3),
                hintText: createPostText,
              ),
            ),
            //投稿する
            Padding(
              padding: const EdgeInsets.all(16.0),
                child: Center(
                child: RoundedButton(
                  onPressed: () async => await createPostModel.showPost(context: context, mainModel: mainModel),
                  widthRate: 0.85,
                  color: Colors.green,
                  text: createPostText,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}