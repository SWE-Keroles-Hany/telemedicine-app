class OnboardingModel {
  final String image;
  final String title;
  final String subTitle;

  OnboardingModel({
    required this.image,
    required this.title,
    required this.subTitle,
  });
}

List<OnboardingModel> onboardingData = [
  OnboardingModel(
    image: 'assets/images/on_boarding_1.png',
    title: 'Connect with Specialists',
    subTitle:
        'Access top-rated healthcare professionals from the comfort of your home.',
  ),
  OnboardingModel(
    image: 'assets/images/on_boarding_3.png', // The AI symptoms screen
    title: 'Check Your Symptoms',
    subTitle:
        'Use our AI-powered tool to get a quick preliminary analysis of your health concerns.',
  ),
  OnboardingModel(
    image: 'assets/images/on_boarding_2.png',
    title: 'All Records in One Place',
    subTitle:
        'Securely store and access your prescriptions and medical reports anytime, anywhere.',
  ),
];
