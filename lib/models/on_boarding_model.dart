class OnBoardingItem{
    String title;
    String description;
    String image;
    OnBoardingItem({
      required this.title,
      required this.description,
      required this.image,
    });

    static List<OnBoardingItem> generateOnBoardingItems() {
      return [
        OnBoardingItem(
          title: "Discover Movies",
          description: "Explore a vast collection of movies in all qualities and genres. Find your next favorite film with ease.",
          image: "assets/images/onBoarding1.png",
        ),
        OnBoardingItem(
          title: "Explore All Genres",
          description: "Discover movies from every genre, in all available qualities. Find something new and exciting to watch every day.",
          image: "assets/images/onBoarding2.png",
        ),
        OnBoardingItem(
          title: "Create Watchlists",
          description: "Save movies to your watchlist to keep track of what you want to watch next. Enjoy films in various qualities and genres.",
          image: "assets/images/onBoarding3.png",
        ),
        OnBoardingItem(
          title: "Rate, Review, and Learn",
          description: "Share your thoughts on the movies you've watched. Dive deep into film details and help others discover great movies with your reviews.",
          image: "assets/images/onBoarding4.png",
        ),
        OnBoardingItem(
          title: "Start Watching Now",
          description: "Enjoy thousands of films and series right at your fingertips.",
          image: "assets/images/onBoarding5.png",
        ),
      ];
    }
}
