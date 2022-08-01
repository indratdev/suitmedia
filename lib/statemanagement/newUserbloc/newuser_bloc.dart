import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suitmedia/datas/usermodel.dart';
import 'package:suitmedia/repository/repository.dart';

part 'newuser_event.dart';
part 'newuser_state.dart';

class NewuserBloc extends Bloc<NewuserEvent, NewuserState> {
  final repo = Repository();

  NewuserBloc() : super(NewuserInitial()) {
    on<SendNewUser>((event, emit) {
      emit(SendNewUserState(newUser: event.userName));
    });

    on<GetListUserRegresin>((event, emit) async {
      try {
        emit(LoadingListUser());
        var result = await repo.GetUserList();
        emit(SuccessGetListUserRegresin(usermodel: result));
      } catch (e) {
        emit(FailureListUser(message: e.toString()));
      }
    });
  }
}
