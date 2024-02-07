class ProjectUtils {
  final String images;
  final String title;
  final String subtitle;
  final String gitlink;

  ProjectUtils({
    required this.images,
    required this.title,
    required this.subtitle,
    required this.gitlink,
  });
}

List<ProjectUtils> myprojects = [
  ProjectUtils(
    images: "assets/projects/innerbalance.jpeg",
    title: "InnerBalance",
    subtitle:
        "Your guide to mental wellness. Reduce stress, gain insights, and foster a healthier mind.",
    gitlink: "https://github.com/sahilwaradkar/innerbalance",
  ),
  ProjectUtils(
    images: "assets/projects/simpliAdmission.jpeg",
    title: "SimpliAdmission",
    subtitle:
        " Simplify engineering college admissions stress-free. Explore colleges, details, and contacts for better acceptance chances.",
    gitlink: "https://github.com/prathmesh0/SimpliAdmission",
  ),
  ProjectUtils(
    images: "assets/projects/vortexx.jpeg",
    title: "Vortex",
    subtitle:
        "Vortex acts as your virtual assistant, capable of generating the text and images you ask for.",
    gitlink: "https://github.com/prathmesh0/Vortex",
  ),
  ProjectUtils(
    images: "assets/projects/calculator.jpeg",
    title: "Calculator",
    subtitle:
        "Used in daily life to perform basic mathematical calculations.",
    gitlink: "https://github.com/prathmesh0/calculator",
  ),
  ProjectUtils(
    images: "assets/projects/expense.jpeg",
    title: "Expense Tracker",
    subtitle:
        "Easily monitor and manage your finances on the go, ensuring budget control and financial clarity.",
    gitlink:
        "https://github.com/prathmesh0/https---github.com-prathmesh0-Expense_Tracker",
  ),
  ProjectUtils(
    images: "assets/projects/maggie.png",
    title: "Maggie - Virtual Assistant",
    subtitle:
        "A Python-driven virtual assistant that responds to voice commands, executing tasks with efficiency and precision.",
    gitlink: "https://github.com/prathmesh0/VIRTUAL-ASSISTANT-Maggie",
  ),
  ProjectUtils(
    images: "assets/projects/meal.jpeg",
    title: "Meal App",
    subtitle:
        "Offers a range of dishes with step-by-step guidance, featuring convenient filters and categories for quick access.",
    gitlink: "https://github.com/prathmesh0/Meal_App",
  ),
];
