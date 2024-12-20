import 'package:flutter/material.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  late PageController _pageController;
  int _currentPage = 0;

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
            colors: [
              Color(0XFFE6E9AF),
              Color(0XFFD8C4B6),
            ],
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
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemBuilder: (context, index) => OnboardContent(
                    images: demoData[index].images,
                    title: demoData[index].title,
                    description: demoData[index].description,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  demoData.length,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    height: 10,
                    width: _currentPage == index ? 20 : 10,
                    decoration: BoxDecoration(
                      color: _currentPage == index
                          ? const Color(0xFF8B279C) // Active color
                          : const Color(0xFFD4A4D6), // Inactive color
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 60,
                width: 60,
                child: ElevatedButton(
                  onPressed: () {
                    if (_currentPage == demoData.length - 1) {
                      Navigator.pushNamed(context, '/login');
                    } else {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: EdgeInsets.zero,
                    elevation: 5,
                  ),
                  child: Ink(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF8B279C),
                          Color(0xFF6B0078),
                        ],
                      ),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ),
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

  const Onboard({
    required this.images,
    required this.title,
    required this.description,
  });
}

final List<Onboard> demoData = [
  const Onboard(
    images: "assets/images/flower.png",
    title: "Find Your Ideal Therapist",
    description:
        "Discover licensed mental health professionals who can provide personalized care for your unique needs.",
  ),
  const Onboard(
    images: "assets/images/appoint.png",
    title: "Book Therapy Sessions with Ease",
    description:
        "Schedule appointments at your convenience, and manage your mental health journey seamlessly.",
  ),
  const Onboard(
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
        Semantics(
          label: title,
          child: Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF22177A),
                ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 16),
        Semantics(
          label: description,
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Color(0xFF605EA1)),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
