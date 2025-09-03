import 'package:doit/common/constants/app-colors.dart';
import 'package:doit/common/constants/app-images.dart';
import 'package:doit/common/widgets/app_text.dart';
import 'package:doit/common/widgets/gradient_background.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'onboarding-controller.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    OnboardingController onboardingController = Get.put(OnboardingController());
    return Scaffold(
      floatingActionButton: Obx( ()=> FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: AppColors.white1,
          child: Icon(
            onboardingController.pageIndex == 3
                ? Icons.check
                : Icons.arrow_forward,
            color: AppColors.black1,size: 30,
          ),
          onPressed: (){
            onboardingController.nextPage();
          },
        ),
      ),
      body: GradientBackground(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: onboardingController.pageController,
                onPageChanged: onboardingController.onPageChanged,
                children: [
                  OnboardingText(
                    image: AppImages.onbording1,
                    title: "Plan your tasks to do,"
                        "that way you’ll stay organized"
                        " and you won’t skip any",
                  ),
                  OnboardingText(
                    image: AppImages.onbording2,
                    title: "Make a full schedule for "
                        "the whole week and stay"
                        " organized and productive"
                        " all days",
                  ),
                  OnboardingText(
                    image: AppImages.onbording3,
                    title: "create a team task, invite"
                        " people and manage your"
                        " work together",
                  ),
                  OnboardingText(
                    image: AppImages.onbording4,
                    title: "You informations are"
                        "     secure with us",
                  ),
                ],
              ),
            ),

            Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(4, (index) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      height: 8,
                      width: onboardingController.pageIndex.value == index
                          ? 24
                          : 8,
                      decoration: BoxDecoration(
                        color: onboardingController.pageIndex.value == index
                            ? Colors.white
                            : Colors.grey,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    );
                  }),
                )),
          ],
        ),
      ),
    );
  }
}

class OnboardingText extends StatefulWidget {
  final String image;
  final String title;

  const OnboardingText({
    super.key,
    required this.image,
    required this.title,
  });

  @override
  State<OnboardingText> createState() => _OnboardingTextState();
}

class _OnboardingTextState extends State<OnboardingText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    _controller.forward(); // Start animation
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:35,vertical: 50),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Image.asset(widget.image),
          const SizedBox(height: 30),
          SlideTransition(
            position: _slideAnimation,
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: AppText(
                text: widget.title,
                color: AppColors.white1,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          // const SizedBox(height: 15),
          // SlideTransition(
          //   position: _slideAnimation,
          //   child: FadeTransition(
          //     opacity: _fadeAnimation,
          //     child: AppText(
          //       text: widget.subtitle,
          //       color: AppColors.grey1,
          //       fontSize: 14,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
