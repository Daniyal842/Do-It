import 'package:doit/common/constants/app-colors.dart';
import 'package:doit/common/widgets/app_text.dart';
import 'package:doit/common/widgets/app_textform.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Detailpage extends StatefulWidget {
  const Detailpage({super.key});

  @override
  State<Detailpage> createState() => _DetailpageState();
}

class _DetailpageState extends State<Detailpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Stack(
          children:[
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors:[
                        Color(0xFF1A2B49),
                        Color(0xFF2E4A8E),
                        //  Color(0xFFFFFFFF),
                        Color(0xFFD9D9D9),

                      ] )
              ),
            ),//for color-------------------------------------
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 60,),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.9,
                    height: 42,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey.shade500,
                    ),
                    child: AppTextForm(
                      hintText: 'search by task title',
                    )
                    // TextFormField(
                    //   decoration: InputDecoration(
                    //       border: InputBorder.none,
                    //       hintText: 'search by task title',
                    //       hintStyle: GoogleFonts.poppins(
                    //         fontSize: 12,
                    //         color: Colors.white,
                    //       ),
                    //       contentPadding: EdgeInsets.all(16),
                    //       suffixIcon: Icon(Icons.search,color: Colors.white,)
                    //   ),
                    // ),
                  ),
                ),//----------------------------------text field----------
                SizedBox(height: 60,),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 17,),
                    child: AppText(text: 'Task List', fontSize: 18, color: Colors.white)),//-------------------------------text
                SizedBox(height: 20,),

                Align(
                  alignment: Alignment.center,
                  child: Container(
                      width: MediaQuery.of(context).size.width*0.9,
                      height: 51,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: AppColors.white1
                      ),
                      child:Stack(
                        children:[ Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 6),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Text('Client meeting',style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                              ),),
                              Text('Tomorrow | 10:30pm',style: GoogleFonts.poppins(
                                fontSize: 10,
                                //fontWeight: FontWeight.bold,
                                color: Colors.grey.shade500,
                              ),),



                            ],
                          ),
                        ),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 270,vertical: 5),
                              child: Icon(Icons.chevron_right,size: 40,color: AppColors.blue3,))
                        ],
                      )
                  ),
                ),//--------------------------container+text--------------
                Spacer(),
                Container(
                  width: 411,
                  height: 444,
                  decoration: BoxDecoration(
                    borderRadius:BorderRadius.only(
                      topRight: Radius.circular(25),
                      topLeft: Radius.circular(25),
                    ),
                    color: Colors.white,
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        SizedBox(height: 40,),
                        Container(
                          width: MediaQuery.of(context).size.width*0.9,
                          height: 42,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: AppColors.blue3,
                          ),
                          child: TextFormField(
                            style: TextStyle(
                                color: Colors.white
                            ),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'task',
                                hintStyle: GoogleFonts.poppins(
                                  fontSize: 16,
                                  color: AppColors.blue3,
                                ),
                                contentPadding: EdgeInsets.all(10),
                                prefixIcon: Icon(Icons.check,color: Colors.white,)


                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Container(
                          width: MediaQuery.of(context).size.width*0.9,
                          height: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: AppColors.blue2,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: Icon(Icons.description,color: Colors.white,),
                              ),
                              Expanded(
                                child: TextFormField(
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Description',
                                    hintStyle: GoogleFonts.poppins(
                                      fontSize: 16,
                                      color: AppColors.blue2,
                                    ),
                                    contentPadding: EdgeInsets.all(5),



                                  ),
                                  maxLines: null,
                                  keyboardType: TextInputType.multiline,
                                  maxLength: 200,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20,),
                        Row(//-----------------------------------------------------
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 157,
                              height: 42,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: AppColors.blue2,
                              ),
                              child: TextFormField(
                                style: TextStyle(
                                    color: Colors.white
                                ),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Date',
                                    hintStyle: GoogleFonts.poppins(
                                      fontSize: 16,
                                      color: AppColors.blue2,
                                    ),
                                    contentPadding: EdgeInsets.all(10),
                                    prefixIcon: Icon(Icons.event,color: Colors.white,)


                                ),
                              ),
                            ),
                            SizedBox(width: 10,),
                            Container(
                              width: 157,
                              height: 42,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: AppColors.blue2,
                              ),
                              child: TextFormField(
                                style: TextStyle(
                                    color: Colors.white
                                ),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Time',
                                    hintStyle: GoogleFonts.poppins(
                                      fontSize: 16,
                                      color: AppColors.white1,
                                    ),
                                    contentPadding: EdgeInsets.all(10),
                                    prefixIcon: Icon(Icons.access_time,color: Colors.white,)


                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(//-----------------------------------------------------
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                width: 157,
                                height: 45,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: AppColors.blue3)
                                ),
                                child: Center(
                                  child: AppText(text: 'Cancel', fontSize: 16, color: AppColors.blue3),
                                )

                            ),
                            SizedBox(width: 10,),
                            Container(
                                width: 157,
                                height: 45,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.blue2,
                                ),
                                child:Center(
                                  child: AppText(text: 'create', fontSize: 16, color: Colors.white),
                                )

                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                ),
              ],
            ),
          ]
      ),
    );
  }
}
