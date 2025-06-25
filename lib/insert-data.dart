import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doit/assets/app_icons/app-icons.dart';
import 'package:doit/components/app-colors.dart';
import 'package:doit/fetch-data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InsertDataView extends StatefulWidget {
  const InsertDataView({super.key});

  @override
  State<InsertDataView> createState() => _InsertDataViewState();
}

class _InsertDataViewState extends State<InsertDataView> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.1, 0.9],
                    colors: [AppColors.blue1, AppColors.blue2]),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                height: 42,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.white1,
                ),
                child: TextFormField(
                  controller: titleController,
                  style: GoogleFonts.poppins(
                      color: AppColors.black1,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Title',
                    hintStyle: GoogleFonts.poppins(
                        color: AppColors.grey1,
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                height: 42,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.white1,
                ),
                child: TextFormField(
                  controller: descriptionController,
                  style: GoogleFonts.poppins(
                      color: AppColors.black1,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Description',
                    hintStyle: GoogleFonts.poppins(
                        color: AppColors.grey1,
                        fontSize: 18,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              isloading
                  ? CircularProgressIndicator()
                  : FloatingActionButton(
                child: Icon(Icons.add),
                backgroundColor: AppColors.blue3,
                onPressed: () async {
                  try {
                    isloading = true;
                    setState(() {});
                    print("-------------1:${titleController.text}");
                    print("-------------2:${descriptionController.text}");
                    String docId=DateTime.now().microsecondsSinceEpoch.toString();
                    await FirebaseFirestore.instance
                        .collection(FirebaseAuth.instance.currentUser!.uid).doc(docId)
                        .set({
                      'title': titleController.text,
                      'description': descriptionController.text,
                      'docId':docId
                    });
                    isloading = false;
                    titleController.clear();
                    descriptionController.clear();
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>FetchDataView()));
                    setState(() {});
                  }
                  catch (error)
                  {
                    isloading=false;
                    setState(() {

                    });
                    print('Error:-${error.toString()}');
                  }


                  // isloading= true;
                  // setState(() {
                  //
                  // });
                  // await FirebaseFirestore.instance
                  //     .collection('insert')
                  //     .add({
                  //       'title': titleController.text,
                  //       'description': descriptionController.text
                  //     })
                  //     .then((onValue) {
                  //       isloading=false;
                  //       setState(() {
                  //
                  //       });
                  // }).onError((handleError, error) {
                  //       print("Error------${handleError.toString()}");
                  //       isloading=false;
                  //       setState(() {
                  //
                  //       });
                  //     });
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
