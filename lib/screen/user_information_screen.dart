import 'dart:io';

import 'package:blackcoffer/screen/base_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:blackcoffer/utils/utils.dart';
import 'package:blackcoffer/utils/custom_button.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UserInfromationScreen extends StatefulWidget {
  const UserInfromationScreen({super.key});

  @override
  State<UserInfromationScreen> createState() => _UserInfromationScreenState();
}

class _UserInfromationScreenState extends State<UserInfromationScreen> {

  final userRef = FirebaseDatabase.instance.reference().child('UserInfo');
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;

  File? image;
  bool showSpinner = false;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final bioController = TextEditingController();

  @override
  //  dispose method used to release the memory allocated to variables when state object is removed.
  // For example, if you are using a stream in your application then you have to release memory
  // allocated to the stream controller. Otherwise, your app may get a warning from the PlayStore and AppStore about memory leakage.
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    bioController.dispose();
  }

  // for selecting image
  void selectImage() async {
    image = await pickImage(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall:showSpinner,
        child: SingleChildScrollView(
           padding:
           const EdgeInsets.symmetric(vertical: 25.0, horizontal: 5.0),
            child: Center(
              child: Column(
               children: [
                 SizedBox(
                   height: 50,
                 ),
                 InkWell(
                   onTap: () => selectImage(),
                   child: image == null
                       ? const CircleAvatar(
                     backgroundColor: Colors.purple,
                     radius: 50,
                         child: Icon(
                       Icons.account_circle,
                       size: 50,
                       color: Colors.white,
                     ),
                   )
                       : CircleAvatar(
                     backgroundImage: FileImage(image!),
                     radius: 50,
                   ),
                 ),
                 SizedBox(
                   height: 10,
                 ),
                 Text(
                     "Upload your Profile",
                   style: TextStyle(
                     fontWeight: FontWeight.bold,
                     color: Colors.purple
                   ),
                 ),
                 Container(
                   width: MediaQuery.of(context).size.width,
                   padding: const EdgeInsets.symmetric(
                       vertical: 5, horizontal: 15),
                   margin: const EdgeInsets.only(top: 20),
                   child: Column(
                     children: [
                       // name field
                       textFeld(
                         hintText: "John Smith",
                         icon: Icons.account_circle,
                         inputType: TextInputType.name,
                         maxLines: 1,
                         controller: nameController,
                       ),

                       // email
                       textFeld(
                         hintText: "abc@example.com",
                         icon: Icons.email,
                         inputType: TextInputType.emailAddress,
                         maxLines: 1,
                         controller: emailController,
                       ),

                       // bio
                       textFeld(
                         hintText: "Enter your bio here...",
                         icon: Icons.edit,
                         inputType: TextInputType.name,
                         maxLines: 2,
                         controller: bioController,
                       ),
                     ],
                   ),
                 ),
                 const SizedBox(height: 20),
                 SizedBox(
                   height: 50,
                   width: MediaQuery.of(context).size.width * 0.90,
                   child: CustomButton(
                     text: "Continue",
                     onPressed: () async {
                       setState(() {
                         showSpinner = true;
                       });
                       try {
                         int date = DateTime.now().millisecondsSinceEpoch;
                         firebase_storage.Reference ref = firebase_storage
                             .FirebaseStorage.instance
                             .ref(("/BlackCoffer$date"));
                         UploadTask uploadTask = ref.putFile(image!.absolute);
                         await Future.value(uploadTask);
                         var newUrl = await ref.getDownloadURL();
                         final User ? user = _auth.currentUser;
                         userRef.child("UserInfo").child(date.toString()).set({
                           'pId': date.toString(),
                           'pProfileImage': newUrl.toString(),
                           'pTime': date.toString(),
                           'pUserName': nameController.text.toString(),
                           'pUseremail': emailController.text.toString(),
                           'pUserbio': bioController.text.toString(),
                           'uEmail': user!.email.toString(),
                           'uid': user.uid.toString(),
                         }).then((value) {
                           toastMessages("Your account has been successfully Created ");
                           Navigator.push(
                               context,
                               MaterialPageRoute(
                                   builder: (context) => BaseScreen()));
                           setState(() {
                             showSpinner = false;
                           });
                         }).onError((error, stackTrace) {
                           toastMessages(error.toString());
                           setState(() {
                             showSpinner = true;
                           });
                         });
                       } catch (e) {
                         setState(() {
                           showSpinner = false;
                         });
                         toastMessages(e.toString());
                       }
                     }
                   ),
                 )
               ],
             ),
           ),
         ),
      ),
    );
  }

  Widget textFeld({
    required String hintText,
    required IconData icon,
    required TextInputType inputType,
    required int maxLines,
    required TextEditingController controller,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        cursorColor: Colors.purple,
        controller: controller,
        keyboardType: inputType,
        maxLines: maxLines,
        decoration: InputDecoration(
          prefixIcon: Container(
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.purple,
            ),
            child: Icon(
              icon,
              size: 20,
              color: Colors.white,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
          ),
          hintText: hintText,
          alignLabelWithHint: true,
          border: InputBorder.none,
          fillColor: Colors.purple.shade50,
          filled: true,
        ),
      ),
    );
  }

  void toastMessages(String message) {
    Fluttertoast.showToast(
        msg: message.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.indigoAccent,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  // store user data to database
  // void storeData() async {
  //   final ap = Provider.of<AuthProvider>(context, listen: false);
  //   UserModel userModel = UserModel(
  //     name: nameController.text.trim(),
  //     email: emailController.text.trim(),
  //     bio: bioController.text.trim(),
  //     profilePic: "",
  //     createdAt: "",
  //     phoneNumber: "",
  //     uid: "",
  //   );
  //   if (image != null) {
  //     ap.saveUserDataToFirebase(
  //       context: context,
  //       userModel: userModel,
  //       profilePic: image!,
  //       onSuccess: () {
  //         // once data is saved we need to store it locally ..............
  //         ap.saveUserDataToSP().then(
  //               (value) => ap.setSignIn().then(
  //                 (value) => Navigator.pushAndRemoveUntil(
  //                 context,
  //                 MaterialPageRoute(
  //                   builder: (context) => const BaseScreen(),
  //                 ),
  //                     (route) => false),
  //           ),
  //         );
  //       },
  //     );
  //   } else {
  //     showSnackBar(context, "Please upload your profile photo");
  //   }
  // }
}
