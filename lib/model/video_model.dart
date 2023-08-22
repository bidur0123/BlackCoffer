import 'package:cloud_firestore/cloud_firestore.dart';

class Video{
  // String? userID;
  // String? userName;
  // String? userProfileImage;
  String? videoID;
  int? totalComments;
  int? totalShares;
  List? likesList;
  String? title;
  String? description;
  String? videoUrl;
  String? thumbnailUrl;
  int? publishedDateTime;

  Video({
    // this.userID,
    // this.userName,
    // this.userProfileImage,
    this.videoID,
    this.totalComments,
    this.totalShares,
    this.likesList,
    this.title,
    this.description,
    this.videoUrl,
    this.thumbnailUrl,
    this.publishedDateTime,
});

  Map<String , dynamic> toJson() =>
      {
        // "userID":userID,
        // "userName":userName,
        // "userProfileImage" : userProfileImage,
        "videoID": videoID,
        "totalComments" : totalComments,
        "totalShares" : totalShares,
        "likesList" : likesList,
        "title" : title,
        "description" : description,
        "videoUrl" : videoUrl,
        "thumbnailUrl" : thumbnailUrl,
        "publishedDateTime" : publishedDateTime
      };
  static Video fromDocumentSnapshot(DocumentSnapshot snapshot)
  {
    var docSnapshot = snapshot.data() as Map<String , dynamic>;
    return Video(
      // userID : docSnapshot["userID"],
      // userName : docSnapshot["userName"],
      // userProfileImage : docSnapshot["userProfileImage"],
      videoID : docSnapshot["videoID"],
      totalComments : docSnapshot["totalComments"],
      totalShares : docSnapshot["totalShares"],
      likesList : docSnapshot["likesList"],
      title : docSnapshot["title"],
      description : docSnapshot["description"],
      videoUrl : docSnapshot["videoUrl"],
      thumbnailUrl : docSnapshot["thumbnailUrl"],
      publishedDateTime : docSnapshot["publishedDateTime"],
    );
  }
}