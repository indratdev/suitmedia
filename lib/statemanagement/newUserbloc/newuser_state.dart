part of 'newuser_bloc.dart';

abstract class NewuserState extends Equatable {
  const NewuserState();

  @override
  List<Object> get props => [];
}

class NewuserInitial extends NewuserState {}

class SendNewUserState extends NewuserState {
  String newUser;

  SendNewUserState({required this.newUser});

  @override
  List<Object> get props => [newUser];
}

// user list regresin
class LoadingListUser extends NewuserState {}

class FailureListUser extends NewuserState {
  String message;

  FailureListUser({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}

class SuccessGetListUserRegresin extends NewuserState {
  UserModel usermodel;

  SuccessGetListUserRegresin({
    required this.usermodel,
  });

  @override
  List<Object> get props => [usermodel];
}
