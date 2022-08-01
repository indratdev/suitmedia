import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suitmedia/repository/repository.dart';

part 'palindrome_event.dart';
part 'palindrome_state.dart';

class PalindromeBloc extends Bloc<PalindromeEvent, PalindromeState> {
  final repo = Repository();

  PalindromeBloc() : super(PalindromeInitial()) {
    on<IsPalindromeEvent>((event, emit) {
      try {
        emit(LoadingIsPalindrome());
        var result = repo.CheckIsPalindrome(event.value);
        print(">> hasil bloc : $result");
        emit(SuccessIsPalindrome(statusPalindrome: result));
      } catch (e) {
        print(e.toString());
      }
    });
  }
}
