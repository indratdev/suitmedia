part of 'newuser_bloc.dart';

abstract class NewuserEvent extends Equatable {
  const NewuserEvent();

  @override
  List<Object> get props => [];
}

class SendNewUser extends NewuserEvent {
  String userName;

  SendNewUser({required this.userName});
}

class GetListUserRegresin extends NewuserEvent {}
