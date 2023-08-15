import 'package:blackcoffer/global.dart';
import 'package:blackcoffer/screen/VideoUpload/video_model.dart';
import 'package:blackcoffer/screen/base_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:video_compress/video_compress.dart';

class UploadController extends GetxController
{
  compressVideoFile(String videoFilePath) async
   {
    final compressedVideoFilePath = await VideoCompress.compressVideo(videoFilePath , quality: VideoQuality.LowQuality);

    return compressedVideoFilePath!.file;
  }

  uploadCompressedVideoFileToFirebaseStorage(String videoID ,String videoFilePath ) async
  {
    UploadTask videoUploadTask = FirebaseStorage.instance.ref()
        .child("All Videos")
        .child(videoID)
        .putFile(await compressVideoFile(videoFilePath));

    TaskSnapshot snapshot = await videoUploadTask;

    String downloadUrlOfUploadedVideo =  await snapshot.ref.getDownloadURL();

    return downloadUrlOfUploadedVideo;
  }

  getThumbnailImage (String videoFilePath) async
  {
    final thumbnailImage = await VideoCompress.getFileThumbnail(videoFilePath);

    return thumbnailImage;
  }

  uploadThumbnailImageToFirebaseStorage(String videoID ,String videoFilePath ) async
  {
    UploadTask thumbnailUploadTask = FirebaseStorage.instance.ref()
        .child("All Thumbnails")
        .child(videoID)
        .putFile(await getThumbnailImage(videoFilePath));

    TaskSnapshot snapshot = await thumbnailUploadTask;

    String downloadUrlOfThumbnailImage =  await snapshot.ref.getDownloadURL();

    return downloadUrlOfThumbnailImage;
  }

  saveVideoInformationToFirestoreDatabase (String title , String description ,String videoFilePath , BuildContext context ) async
  {
    try
    {
      // that will give current user info and that infn will be acces by userDocumentSnapshot
      DocumentSnapshot userDocumentSnapshot = await FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();
      String videoID = DateTime.now().microsecondsSinceEpoch.toString();

      // 1.upload video to storage
      String videoDownloadUrl = await  uploadCompressedVideoFileToFirebaseStorage(videoID, videoFilePath);

      // 2. upload thumbnail to storage
      String thumbnailDownloadUrl = await  uploadThumbnailImageToFirebaseStorage(videoID, videoFilePath);

      // 3. Save overall video info to firestore database
      Video videoObject = Video(
         userID: FirebaseAuth.instance.currentUser!.uid,
         userName: (userDocumentSnapshot.data() as Map<String , dynamic>)["userName"],
         userProfileImage: (userDocumentSnapshot.data() as Map<String , dynamic>)["images"],
        videoID: videoID,
        totalComments: 0,
        totalShares: 0,
        likesList: [],
        title: title,
        description: description,
        videoUrl: videoDownloadUrl,
        thumbnailUrl: thumbnailDownloadUrl,
        publishedDateTime: DateTime.now().millisecondsSinceEpoch,
      );

      await FirebaseFirestore.instance.collection("videos").doc(videoID).set(videoObject.toJson());

      showProgressBarAnimation = false;
      Get.to(BaseScreen());

      Get.snackbar("New Video", "you have successfully uploaded your video ");

    }
    catch(errorMsg)
    {
     Get.snackbar("Video upload Unsuccessfull", "your video is not uploaded . Try again later");
    }
  }
}