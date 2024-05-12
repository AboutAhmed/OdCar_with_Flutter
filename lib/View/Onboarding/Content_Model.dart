class OnboardingContent {
  final String image;
  final String title;
  final String description;

  OnboardingContent({
    required this.image,
    required this.title,
    required this.description,
  });
}

List<OnboardingContent> contents = [
  OnboardingContent(
    title: 'Find the perfect car for your needs.',
    image: 'assets/Frame1.png',
    description:
    'Welcome to our rental car services! Explore our range of vehicles tailored to your needs.',
  ),
  OnboardingContent(
    title: 'Rent your favourite car quickly and easily',
    image: 'assets/Frame2.png',
    description:
    'You can quickly mark your favourite cars, making it easier to find and rent them whenever you need.',
  ),
  OnboardingContent(
    title: 'Pick up your car and start your journey',
    image: 'assets/Frame3.png',
    description:
    'Ready to hit the road? book now and embark on your next adventure with confidence!!',
  ),
];
