import 'package:flutter/material.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF8B279C), Color(0xFFBB87D7)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  itemCount: demoData.length,
                  controller: _pageController,
                  itemBuilder: (context, index) => OnboardContent(
                    images: demoData[index].images,
                    title: demoData[index].title,
                    description: demoData[index].description,
                  ),
                ),
              ),
              SizedBox(
                height: 60,
                width: 60,
                child: ElevatedButton(
                  onPressed: () {
                    if (_pageController.page?.toInt() == demoData.length - 1) {
                      Navigator.pushNamed(context, '/login');
                    } else {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    backgroundColor:
                        const Color(0xFF8B279C), // Purple background
                  ),
                  child: const Icon(
                    Icons.arrow_forward,
                    color: Colors.white, // White arrow color
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class Onboard {
  final String images, title, description;

  Onboard({
    required this.images,
    required this.title,
    required this.description,
  });
}

final List<Onboard> demoData = [
  Onboard(
    images: "assets/images/flower.png",
    title: "Find Your Ideal Therapist",
    description:
        "Discover licensed mental health professionals who can provide personalized care for your unique needs.",
  ),
  Onboard(
    images: "assets/images/appoint.png",
    title: "Book Therapy Sessions with Ease",
    description:
        "Schedule appointments at your convenience, and manage your mental health journey seamlessly.",
  ),
  Onboard(
    images: "assets/images/chat.png",
    title: "Chat Anytime, Anywhere",
    description:
        "Connect with therapists through secure chat for support and guidance whenever you need it.",
  ),
];

class OnboardContent extends StatelessWidget {
  const OnboardContent({
    super.key,
    required this.images,
    required this.title,
    required this.description,
  });

  final String images, title, description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Image.asset(
          images,
          height: 250,
        ),
        const Spacer(),
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Text(
          description,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white70),
        ),
        const Spacer(),
      ],
    );
  }
}
