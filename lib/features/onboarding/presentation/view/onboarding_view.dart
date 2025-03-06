import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../view_model/onboarding_cubit.dart';

class OnboardingScreenView extends StatelessWidget {
  const OnboardingScreenView({super.key});

  final List<Map<String, String>> onboardingData = const [
    {
      "image": "assets/images/onb1.jpg",
      "title": "Welcome to MindCare! ",
      "description": "We Take Care of you and your Mental Health0"
    },
    {
      "image": "assets/images/onb2.jpg",
      "title": "Find Your Trusted Doctor ",
      "description":
          "Browse experienced mental health professionals and find the right doctor who understands your needs."
    },
    {
      "image": "assets/images/onb3.jpg",
      "title": "Book Appointments with Ease ",
      "description":
          "Schedule your therapy sessions or consultations effortlessly, all in just a few taps."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OnboardingCubit(),
      child: BlocBuilder<OnboardingCubit, OnboardingState>(
        builder: (context, state) {
          final cubit = context.read<OnboardingCubit>();
          return Scaffold(
            body: Stack(
              children: [
                // Background Image PageView
                PageView.builder(
                  controller: cubit.pageController,
                  onPageChanged: (index) =>
                      cubit.onPageChanged(index, onboardingData.length),
                  itemCount: onboardingData.length,
                  itemBuilder: (context, index) {
                    return Image.asset(
                      onboardingData[index]["image"]!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    );
                  },
                ),

                // Top Bar
                Positioned(
                  top: 40,
                  left: 20,
                  right: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (state.currentIndex > 0)
                        IconButton(
                          icon:
                              const Icon(Icons.arrow_back, color: Colors.black),
                          onPressed: () => cubit.pageController.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          ),
                        )
                      else
                        const SizedBox(width: 48),
                      Image.asset(
                        'assets/images/logo.png',
                        width: 100,
                        height: 100,
                      ),
                      TextButton(
                        onPressed: () =>
                            cubit.skipToLastPage(onboardingData.length),
                        child: const Text(
                          "Skip",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Title and Description
                Positioned(
                  bottom: 120,
                  left: 20,
                  right: 20,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          onboardingData[state.currentIndex]["title"]!,
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          onboardingData[state.currentIndex]["description"]!,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),

                // Bottom Dots and Buttons
                Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: List.generate(
                          onboardingData.length,
                          (index) => Container(
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: state.currentIndex == index
                                  ? Colors.pink
                                  : Colors.grey,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: state.isLastPage
                            ? () => cubit.navigateToLogin(context)
                            : cubit.nextPage,
                        child: Text(
                          state.isLastPage ? "Get Started" : "Next",
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
