import 'package:bercerita_app/states/onboarding_states/onboarding_notifier.dart';
import 'package:bercerita_app/widgets/bottom_bar.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class OnboardingPage extends ConsumerStatefulWidget {
  const OnboardingPage({super.key});

  @override
  ConsumerState<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends ConsumerState<OnboardingPage> {
  @override
  void initState() {
    super.initState();
  }

  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(onboardingProvider);

    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: Container(
            margin: const EdgeInsets.only(top: 34),
            child: Stack(
              alignment: Alignment.center,
              children: [
                PageView(
                  scrollDirection: Axis.horizontal,
                  reverse: false,
                  onPageChanged: (index) {
                    ref.read(onboardingProvider.notifier).pageChanged(index);
                  },
                  controller: pageController,
                  physics: const ClampingScrollPhysics(),
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 320,
                          margin: const EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 12,
                          ),
                          child: Image.asset('assets/logoBerceritaPanjang.png'),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 24),
                          child: const Text(
                            'Selamat Datang di Aplikasi Bercerita',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(
                          height: 34,
                        ),
                        Container(
                          height: 80,
                          margin: const EdgeInsets.symmetric(
                            horizontal: 16,
                          ),
                          child: const Text(
                            'Temukan petualangan tak terbatas dan mimpimu di dalam halaman-halaman cerita penuh warna.',
                            textAlign: TextAlign.center,
                          ),
                        ),
                        nextButton(context, 1, 'Selanjutnya')
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                            height: 320,
                            margin: const EdgeInsets.symmetric(
                              horizontal: 32,
                              vertical: 12,
                            ),
                            child: Lottie.asset(
                                'assets/animations/readingAnimate.json')),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 24),
                          child: const Text(
                            'Jelajahi Cerita, Temukan Hikmahnya!',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(
                          height: 34,
                        ),
                        Container(
                          height: 80,
                          margin: const EdgeInsets.symmetric(
                            horizontal: 16,
                          ),
                          child: const Text(
                            'Kami memiliki kumpulan cerita dongeng pendek yang menarik, menghibur dan mendidik baik untuk anak-anak dan orang dewasa.',
                            textAlign: TextAlign.center,
                          ),
                        ),
                        nextButton(context, 2, 'Mulai Membaca'),
                      ],
                    ),
                  ],
                ),
                Positioned(
                  top: 530,
                  child: DotsIndicator(
                    mainAxisAlignment: MainAxisAlignment.center,
                    dotsCount: 2,
                    position: state.page,
                    reversed: false,
                    decorator: DotsDecorator(
                        size: const Size.square(8),
                        activeSize: const Size(18, 8),
                        activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget nextButton(BuildContext context, int index, String title) {
    return GestureDetector(
      child: Container(
        width: 325.w,
        height: 5.h,
        margin: EdgeInsets.only(top: 10.h, left: 25.w, right: 25.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.amber,
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      onTap: () async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        if (index < 2) {
          pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 500),
            curve: Curves.ease,
          );
        } else {
          await prefs.setInt("initScreen", 1);
          Navigator.pushAndRemoveUntil(
              // ignore: use_build_context_synchronously
              context,
              MaterialPageRoute(builder: (builder) => const BottomBar()),
              (route) => false);
        }
      },
    );
  }
}
