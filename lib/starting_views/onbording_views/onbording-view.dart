import 'package:doit/app_views/auth_views/sign_in_view/sign-in-view.dart';
import 'package:doit/assets/app_icons/app-icons.dart';
import 'package:doit/assets/app_images/app-images.dart';
import 'package:doit/components/app-colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnbordingView extends StatefulWidget {
  const OnbordingView({super.key});

  @override
  State<OnbordingView> createState() => _OnbordingViewState();
}

class _OnbordingViewState extends State<OnbordingView> {
  int select = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            select = (select + 1).clamp(1, 5);
            if(select==5)
              {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInView()));
              }
            setState(() {
              //select = (select + 1).clamp(1, 4);
            });
          },
          backgroundColor: AppColors.white1,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          child: Icon(
            select == 4 ? Icons.check : Icons.arrow_forward,
            color: AppColors.blue2,
            size: 30,
          )),
      body: SizedBox.expand(
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [
                        0.1,
                        0.9
                      ],
                      colors: [
                        // Color(0xff1253AA),
                        // Color(0xff05243E)
                        AppColors.blue1,
                        AppColors.blue2,
                      ]),
                ),
              ),
            ),
            PageView(
              children: [
                select == 1
                    ? Onbording1()
                    : select == 2
                        ? Onbording2()
                        : select == 3
                            ? Onbording3()
                            : Onbording4()
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Onbording1 extends StatelessWidget {
  const Onbording1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Column(
          children: [
            Image.asset(AppImages.onbording1),
            SizedBox(
              height: 40,
            ),
            Text(
              "Plan your tasks to do,that\n"
              " way you'll stay organied\n"
              "  and you won't skip any",
              style: GoogleFonts.poppins(
                  color: AppColors.white1,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}

class Onbording2 extends StatelessWidget {
  const Onbording2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Column(
          children: [
            Image.asset(AppImages.onbording2),
            SizedBox(
              height: 40,
            ),
            Text(
              "   Make a full schdule for\n"
              " the whole week and stay\n"
              "organized and productive\n"
              "                 all days",
              style: GoogleFonts.poppins(
                  color: AppColors.white1,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}

class Onbording3 extends StatelessWidget {
  const Onbording3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Column(
          children: [
            Image.asset(AppImages.onbording3),
            SizedBox(
              height: 40,
            ),
            Text(
              "create a team task, invite\n"
              "pepole and manage your\n"
              "          work together",
              style: GoogleFonts.poppins(
                  color: AppColors.white1,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}

class Onbording4 extends StatelessWidget {
  const Onbording4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Column(
          children: [
            Image.asset(AppImages.onbording4),
            SizedBox(
              height: 40,
            ),
            Text(
              "Your information are\n  "
              "    secure with us",
              style: GoogleFonts.poppins(
                  color: AppColors.white1,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
