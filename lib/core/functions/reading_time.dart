int calculateReadingTime(String text) {
  const int fixedMinWpm = 2000; // Set fixed minimum speed (words per minute)

  // Split the text into words based on whitespace
  List<String> words = text.split(RegExp(r'\s+'));

  // Count the total number of words
  int totalWords = words.length;

  // Calculate the time in minutes using the fixed minimum speed
  double timeInMinutes = totalWords / fixedMinWpm;

  // Convert time to seconds
  int timeInSeconds = (timeInMinutes * 60).round();

  return timeInSeconds;
}
