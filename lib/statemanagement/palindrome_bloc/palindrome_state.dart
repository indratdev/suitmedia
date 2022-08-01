part of 'palindrome_bloc.dart';

abstract class PalindromeState extends Equatable {
  const PalindromeState();

  @override
  List<Object> get props => [];
}

class PalindromeInitial extends PalindromeState {}

class LoadingIsPalindrome extends PalindromeState {}

class FailureIsPalindrome extends PalindromeState {
  String messageError;

  FailureIsPalindrome({required this.messageError});

  @override
  List<Object> get props => [messageError];
}

class SuccessIsPalindrome extends PalindromeState {
  bool statusPalindrome;

  SuccessIsPalindrome({required this.statusPalindrome});

  @override
  List<Object> get props => [statusPalindrome];
}
