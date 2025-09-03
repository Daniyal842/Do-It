// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:doit/firebase_practice/update-data.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
//
// class FetchDataView extends StatefulWidget {
//   const FetchDataView({super.key});
//
//   @override
//   State<FetchDataView> createState() => _FetchDataViewState();
// }
//
// class _FetchDataViewState extends State<FetchDataView> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: StreamBuilder(
//         stream: FirebaseFirestore.instance
//             .collection(FirebaseAuth.instance.currentUser!.uid)
//             .snapshots(),
//         builder: (conntext, snapshots) {
//           return ListView.builder(
//             itemCount: snapshots.data!.docs.length,
//             itemBuilder: (conntext, index) {
//               return ListTile(
//                 onLongPress: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (conntext) => UpdateDataView(
//                                 docId: snapshots.data!.docs[index]['docId']
//                                     .toString(),
//                                 title: snapshots.data!.docs[index]['title']
//                                     .toString(),
//                                 description: snapshots
//                                     .data!.docs[index]['description']
//                                     .toString(),
//                               )));
//                 },
//                 onTap: () async {
//                   await FirebaseFirestore.instance
//                       .collection(FirebaseAuth.instance.currentUser!.uid)
//                       .doc(snapshots.data!.docs[index]['docId'].toString())
//                       .delete();
//                 },
//                 title: Text(snapshots.data!.docs[index]['title'].toString()),
//                 subtitle:
//                     Text(snapshots.data!.docs[index]['description'].toString()),
//                 trailing: Text(snapshots.data!.docs[index]['docId'].toString()),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
