part of 'palindrome_bloc.dart';

abstract class PalindromeEvent extends Equatable {
  const PalindromeEvent();

  @override
  List<Object> get props => [];
}

class IsPalindromeEvent extends PalindromeEvent {
  String value;

  IsPalindromeEvent({required this.value});
}
