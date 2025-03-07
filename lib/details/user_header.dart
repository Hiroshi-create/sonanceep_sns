// flutter
import 'package:flutter/material.dart';
import 'package:sonanceep_sns/constants/doubles.dart';
import 'package:sonanceep_sns/details/user_button.dart';
// components
import 'package:sonanceep_sns/details/user_image.dart';
import 'package:sonanceep_sns/domain/firestore_user/firestore_user.dart';
import 'package:sonanceep_sns/models/main_model.dart';

class UserHeader extends StatelessWidget {
  const UserHeader({
    super.key,
    required this.mainModel,
    required this.firestoreUser,
    required this.onTap,
  });

  final MainModel mainModel;
  final FirestoreUser firestoreUser;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.2,  //画面の高さ * 0.3
      // height: (screenWidth < screenHight ? screenHight : screenWidth) * userHeaderHightMagnification,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 24.0),
            child: Row(
              children: [
                //ユーザーアイコン
                Padding(
                  padding: const EdgeInsets.only(top: 12.0, right: 8.0),
                  child: UserImage(userImageURL: firestoreUser.userImageURL, length: 48.0),
                ),
                //ユーザーネーム
                Text(firestoreUser.userName, style: const TextStyle(fontSize: 40.0),),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('フォロー${firestoreUser.followingCount.toString()}', style: const TextStyle(fontSize: 16.0),),
              Text(
                'フォロワー${firestoreUser.followerCount.toString()}',
                style: const TextStyle(fontSize: 16.0),
              ),
              InkWell(
                onTap: onTap,
                child: const Icon(Icons.menu),
              ),
            ],
          ),
          UserButton(mainModel: mainModel, passiveUser: firestoreUser),
        ],
      ),
    );
  }
}