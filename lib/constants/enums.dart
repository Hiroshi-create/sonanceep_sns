enum ReauthenticationState { initialValue, updatePassword, updateEmail, deleteUser }

enum SortState { byLikeUidCount, byNewestFirst, byOldestfirst }
// Stringにしたい
enum TokenType { following, likePost, likeComment, likeReply, muteUser, muteComment, mutePost, muteReply, mistake }

enum UrlFormatType { image, video, thumbnail, text }

//引数にTokenType.followingを入れるとStringの"following"がreturnされます
String returnTokenTypeString({ required TokenType tokenType }) => tokenType.toString().substring(10);  // tokenType. の時の長さが10

String followingTokenTypeString = returnTokenTypeString(tokenType: TokenType.following);

String likePostTokenTypeString = returnTokenTypeString(tokenType: TokenType.likePost);

String likeCommentTokenTypeString = returnTokenTypeString(tokenType: TokenType.likeComment);

String likeReplyTokenTypeString = returnTokenTypeString(tokenType: TokenType.likeReply);

String muteUserTokenTypeString = returnTokenTypeString(tokenType: TokenType.muteUser);

String muteCommentTokenTypeString = returnTokenTypeString(tokenType: TokenType.muteComment);

String mutePostTokenTypeString = returnTokenTypeString(tokenType: TokenType.mutePost);

String muteReplyTokenTypeString = returnTokenTypeString(tokenType: TokenType.muteReply);

TokenType mapToTokenType({ required Map<String,dynamic> tokenMap }) {
  final String tokenTypeString = tokenMap['tokenType'];  // tokenのデータを取得してそのtokenTypeのStringを得る
  if(tokenTypeString == followingTokenTypeString) {  //得たStringがfollowingかlikePostかを判定
    return TokenType.following;
  } else if(tokenTypeString == likePostTokenTypeString) {
    return TokenType.likePost;
  } else if(tokenTypeString == likeCommentTokenTypeString) {
    return TokenType.likeComment;
  } else if(tokenTypeString == likeReplyTokenTypeString) {  // tokenMap["tokenType"] == "likeReply" だったら
    return TokenType.likeReply;
  } else if(tokenTypeString == muteUserTokenTypeString) {
    return TokenType.muteUser;
  } else if(tokenTypeString == muteCommentTokenTypeString) {
    return TokenType.muteComment;
  } else if(tokenTypeString == mutePostTokenTypeString) {
    return TokenType.mutePost;
  } else if(tokenTypeString == muteReplyTokenTypeString) {
    return TokenType.muteReply;
  } else {
    return TokenType.mistake;
  }
}