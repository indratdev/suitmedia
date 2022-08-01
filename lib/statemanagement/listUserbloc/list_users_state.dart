part of 'list_users_bloc.dart';

abstract class ListUsersState extends Equatable {
  const ListUsersState();

  @override
  List<Object> get props => [];
}

class ListUsersInitial extends ListUsersState {}

class SuccessSendListUser extends ListUsersState {
  Datas data;

  SuccessSendListUser(
    this.data,
  );

  @override
  List<Object> get props => [data];
}
