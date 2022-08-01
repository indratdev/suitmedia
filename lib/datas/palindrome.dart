class Palindrome {
  bool isPanlindrome(String input) {
    return input == input.split('').reversed.join();
  }
}
