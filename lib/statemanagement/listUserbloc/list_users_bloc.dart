import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:suitmedia/datas/usermodel.dart';

part 'list_users_event.dart';
part 'list_users_state.dart';

class ListUsersBloc extends Bloc<ListUsersEvent, ListUsersState> {
  ListUsersBloc() : super(ListUsersInitial()) {
    on<SendListUser>((event, emit) {
      try {
        emit(SuccessSendListUser(event.data));
      } catch (e) {
        print(e.toString());
      }
    });
  }
}
