// flutter
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sonanceep_sns/domain/comment/comment.dart';
import 'package:sonanceep_sns/domain/firestore_user/firestore_user.dart';
import 'package:sonanceep_sns/domain/post/post.dart';
// pages
import 'package:sonanceep_sns/main.dart';
import 'package:sonanceep_sns/models/auth/account_model.dart';
import 'package:sonanceep_sns/views/account_page.dart';
import 'package:sonanceep_sns/views/admin_page.dart';
import 'package:sonanceep_sns/views/album_registration_page.dart';
import 'package:sonanceep_sns/views/artists/artist_registration_page.dart';
import 'package:sonanceep_sns/views/artists/artist_search_page.dart';
import 'package:sonanceep_sns/views/auth/reauthentication_page.dart';
import 'package:sonanceep_sns/views/auth/update_email_page.dart';
import 'package:sonanceep_sns/views/auth/update_password_page.dart';
import 'package:sonanceep_sns/views/auth/verify_email_page.dart';
import 'package:sonanceep_sns/views/auth/verify_password_reset_page.dart';
import 'package:sonanceep_sns/views/comments/comments_page.dart';
import 'package:sonanceep_sns/views/create_post_page.dart';
import 'package:sonanceep_sns/views/daw_mobile/daw_mobile_page.dart';
import 'package:sonanceep_sns/views/edit_profile_page.dart';
import 'package:sonanceep_sns/views/finished_page.dart';
import 'package:sonanceep_sns/views/main/passive_user_profile_page.dart';
import 'package:sonanceep_sns/views/message/message_page.dart';
import 'package:sonanceep_sns/views/mute_comments_page.dart';
import 'package:sonanceep_sns/views/mute_posts_page.dart';
import 'package:sonanceep_sns/views/mute_replies_page.dart';
import 'package:sonanceep_sns/views/mute_users_page.dart';
import 'package:sonanceep_sns/views/one_shot_page.dart';
import 'package:sonanceep_sns/views/posts/post_focus_page.dart';
import 'package:sonanceep_sns/views/replies/replies_page.dart';
import 'package:sonanceep_sns/views/signup_page.dart';
import 'package:sonanceep_sns/views/login_page.dart';
// model
import 'package:sonanceep_sns/models/main_model.dart';
import 'package:sonanceep_sns/views/songs/song_profile_page.dart';
import 'package:sonanceep_sns/views/songs/song_registration_page.dart';

//ページ遷移
void toMyApp({ required BuildContext context }) => Navigator.push(context, MaterialPageRoute(builder: (context) => const MyApp()));

void toSignupPage({ required BuildContext context }) => Navigator.push(context, MaterialPageRoute(builder: (context) => const SignupPage()));

void toLoginPage({ required BuildContext context }) => Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));

void toVerifyEmailPage({ required BuildContext context }) => Navigator.push(context, MaterialPageRoute(builder: (context) => const VerifyEmailPage()));

void toFinishedPage({ required BuildContext context, required String msg }) => Navigator.push(context, MaterialPageRoute(builder: (context) => FinishedPage(msg: msg,)));

void toAccountPage({ required BuildContext context, required MainModel mainModel }) => Navigator.push(context, MaterialPageRoute(builder: (context) => AccountPage(mainModel: mainModel,)));

void toPassiveUserProfilePage({ required BuildContext context, required DocumentSnapshot<Map<String,dynamic>> passiveUserDoc, required MainModel mainModel}) => Navigator.push(context, MaterialPageRoute(builder: (context) => PassiveUserProfilePage(passiveUserDoc: passiveUserDoc, mainModel: mainModel,)));

void toAdminPage({ required BuildContext context, required MainModel mainModel }) => Navigator.push(context, MaterialPageRoute(builder: (context) => AdminPage(mainModel: mainModel)));

void toSongProfilePage({
  required BuildContext context,
  required MainModel mainModel,
  required DocumentSnapshot<Map<String, dynamic>> songDoc,
  required int imageValue,
}) => Navigator.push(context, MaterialPageRoute(builder: (context) => SongProfilePage(mainModel: mainModel, songDoc: songDoc, imageValue: imageValue)));

void toCreatePostPage({ required BuildContext context, required MainModel mainModel }) => Navigator.push(context, MaterialPageRoute(builder: (context) => CreatePostPage(mainModel: mainModel,)));

void toPostFocusPage({ required BuildContext context, required Post post }) => Navigator.push(context, MaterialPageRoute(builder: (context) => PostFocusPage(post: post,)));

void toCommentsPage({
  required BuildContext context,
  required Post post,
  required DocumentSnapshot<Map<String,dynamic>> postDoc,
  required MainModel mainModel,
}) => Navigator.push(context, MaterialPageRoute(builder: (context) => CommentsPage(
  post: post,
  postDoc: postDoc,
  mainModel: mainModel,
)));

void toRepliesPage({
  required BuildContext context,
  required Comment comment,
  required DocumentSnapshot<Map<String,dynamic>> commentDoc,
  required MainModel mainModel,
}) => Navigator.push(context, MaterialPageRoute(builder: (context) => RepliesPage(
  comment: comment,
  commentDoc: commentDoc,
  mainModel: mainModel
)));

void toEditProfilePage({ required BuildContext context, required MainModel mainModel }) => Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfilePage(mainModel: mainModel)));

void toMessagePage({ required BuildContext context, required MainModel mainModel, required FirestoreUser passiveUser }) => Navigator.push(context, MaterialPageRoute(builder: (context) => MessagePage(mainModel: mainModel, passiveUser: passiveUser,)));

void toMuteUsersPage({ required BuildContext context, required MainModel mainModel }) => Navigator.push(context, MaterialPageRoute(builder: (context) => MuteUsersPage(mainModel: mainModel)));

void toMuteCommentsPage({ required BuildContext context, required MainModel mainModel }) => Navigator.push(context, MaterialPageRoute(builder: (context) => MuteCommentsPage(mainModel: mainModel)));

void toMutePostsPage({ required BuildContext context, required MainModel mainModel }) => Navigator.push(context, MaterialPageRoute(builder: (context) => MutePostsPage(mainModel: mainModel)));

void toMuteRepliesPage({ required BuildContext context, required MainModel mainModel }) => Navigator.push(context, MaterialPageRoute(builder: (context) => MuteRepliesPage(mainModel: mainModel)));

void toReauthenticationPage({ required BuildContext context, required AccountModel accountModel, required FirestoreUser firestoreUser }) => Navigator.push(context, MaterialPageRoute(builder: (context) => ReauthenticationPage(accountModel: accountModel, firestoreUser: firestoreUser,)));

void toUpdatePasswordPage({ required BuildContext context }) => Navigator.push(context, MaterialPageRoute(builder: (context) => const UpdatePasswordPage()));

void toUpdateEmailPage({ required BuildContext context }) => Navigator.push(context, MaterialPageRoute(builder: (context) => const UpdateEmailPage()));

void toVerifyPasswordResetPage({ required BuildContext context }) => Navigator.push(context, MaterialPageRoute(builder: (context) => const VerifyPasswordResetPage()));

void toOneShotPage({ required BuildContext context }) => Navigator.push(context, MaterialPageRoute(builder: (context) => const OneShotPage()));

void toDawMobilePage({
  required BuildContext context,
  required MainModel mainModel,
  required DocumentSnapshot<Map<String, dynamic>> songDoc,
}) => Navigator.push(context, MaterialPageRoute(builder: (context) => DawMobilePage(
  mainModel: mainModel,
  songDoc: songDoc,
), fullscreenDialog: true,));




//管理者権限ページ遷移
void toArtistRegistrationPage({ required BuildContext context }) => Navigator.push(context, MaterialPageRoute(builder: (context) => const ArtistRegistrationPage()));

void toAlbumRegistrationPage({ required BuildContext context, required DocumentSnapshot<Map<String,dynamic>> artistDoc }) => Navigator.push(context, MaterialPageRoute(builder: (context) => AlbumRegistrationPage(artistDoc: artistDoc)));

void toSongRegistrationPage({
  required BuildContext context,
  required DocumentSnapshot<Map<String,dynamic>> artistDoc,
  required List<Map<String, bool>> albumIdAndBoolList,
}) => Navigator.push(context, MaterialPageRoute(builder: (context) => SongRegistrationPage(artistDoc: artistDoc, albumIdAndBoolList: albumIdAndBoolList)));

void toArtistSearchPage({ required BuildContext context, required MainModel mainModel }) => Navigator.push(context, MaterialPageRoute(builder: (context) => ArtistSearchPage(mainModel: mainModel)));