// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:doit/components/app-colors.dart';
// import 'package:doit/firebase_practice/fetch-data.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class UpdateDataView extends StatefulWidget {
//   String docId;
//   String title;
//   String description;
//   UpdateDataView({super.key, required this.docId,required this.title,required this.description});
//   @override
//   State<UpdateDataView> createState() => _UpdateDataViewState();
// }
//
// class _UpdateDataViewState extends State<UpdateDataView> {
//   TextEditingController titleController = TextEditingController();
//   TextEditingController descriptionController = TextEditingController();
//   bool isloading = false;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     titleController.text=widget.title;
//     descriptionController.text=widget.description;
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:  Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(
//             margin: EdgeInsets.symmetric(horizontal: 20),
//             height: 42,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               color: AppColors.white1,
//             ),
//             child: TextFormField(
//               controller: titleController,
//               style: GoogleFonts.poppins(
//                   color: AppColors.black1,
//                   fontSize: 18,
//                   fontWeight: FontWeight.w400),
//               decoration: InputDecoration(
//                 border: InputBorder.none,
//                 hintText: 'Title',
//                 hintStyle: GoogleFonts.poppins(
//                     color: AppColors.grey1,
//                     fontSize: 18,
//                     fontWeight: FontWeight.w400),
//               ),
//             ),
//           ),
//           Container(
//             margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//             height: 42,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               color: AppColors.white1,
//             ),
//             child: TextFormField(
//               controller: descriptionController,
//               style: GoogleFonts.poppins(
//                   color: AppColors.black1,
//                   fontSize: 18,
//                   fontWeight: FontWeight.w400),
//               decoration: InputDecoration(
//                 border: InputBorder.none,
//                 hintText: 'Description',
//                 hintStyle: GoogleFonts.poppins(
//                     color: AppColors.grey1,
//                     fontSize: 18,
//                     fontWeight: FontWeight.w400),
//               ),
//             ),
//           ),
//           isloading
//               ? CircularProgressIndicator()
//               : FloatingActionButton(
//             child: Icon(Icons.add),
//             backgroundColor: AppColors.blue3,
//             onPressed: () async {
//               try {
//                 isloading = true;
//                 setState(() {});
//                 print("-------------1:${titleController.text}");
//                 print("-------------2:${descriptionController.text}");
//                // String docId=DateTime.now().microsecondsSinceEpoch.toString();
//                 await FirebaseFirestore.instance
//                     .collection(FirebaseAuth.instance.currentUser!.uid).doc(widget.docId)
//                     .update({
//                   'title': titleController.text,
//                   'description': descriptionController.text,
//                 });
//                 isloading = false;
//                 titleController.clear();
//                 descriptionController.clear();
//                 Navigator.push(context, MaterialPageRoute(builder: (context)=>FetchDataView()));
//                 setState(() {});
//               }
//               catch (error)
//               {
//                 isloading=false;
//                 setState(() {
//
//                 });
//                 print('Error:-${error.toString()}');
//               }
//
//
//               // isloading= true;
//               // setState(() {
//               //
//               // });
//               // await FirebaseFirestore.instance
//               //     .collection('insert')
//               //     .add({
//               //       'title': titleController.text,
//               //       'description': descriptionController.text
//               //     })
//               //     .then((onValue) {
//               //       isloading=false;
//               //       setState(() {
//               //
//               //       });
//               // }).onError((handleError, error) {
//               //       print("Error------${handleError.toString()}");
//               //       isloading=false;
//               //       setState(() {
//               //
//               //       });
//               //     });
//             },
//           )
//         ],
//       ),
//     );
//   }
// }
