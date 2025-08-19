import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  var userId = ''.obs;
  var username = ''.obs;
  var useremail = ''.obs;

  insertUserData() async {
    try {
      await FirebaseFirestore.instance.collection('UserData').add({
        'userId':userId.value,
        'username':username.value,
        'userEmail':useremail.value
      });
    }
    catch (e) {
      //isLoading.value=false;
    }
  }
  getUserId()async{
    userId.value=await FirebaseAuth.instance.currentUser!.uid;
    useremail.value=await FirebaseAuth.instance.currentUser!.email??"";
  }
  fetUserData() async {
    try {
      print('------------fetch user data function calling');
      final data = await FirebaseFirestore.instance
          .collection('UserData')
          .where('userId', isEqualTo: userId.value) // 👈 safer than using .doc(userId)
          .get();
print('--------$data');
     if (data.docs.isNotEmpty) {
        final userData = data.docs.first.data();
        username.value = userData['username'];
        print('-------------${username.value}');
        useremail.value = userData['userEmail']; // 👈 Yahaan assign kar rahe hain email ko
     }
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

}
