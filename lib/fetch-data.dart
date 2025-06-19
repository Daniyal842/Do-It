import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FetchDataView extends StatefulWidget {
  const FetchDataView({super.key});

  @override
  State<FetchDataView> createState() => _FetchDataViewState();
}

class _FetchDataViewState extends State<FetchDataView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('insert').snapshots(),
        builder: (conntext,snapshots){
          return ListView.builder(
            itemCount: snapshots.data!.docs.length,
            itemBuilder: (conntext, index){
              return ListTile(
                title: Text(snapshots.data!.docs[index]['title'].toString()),
                subtitle: Text(snapshots.data!.docs[index]['description'].toString()),
              );
            },
          );
        },
      ),
    );
  }
}
