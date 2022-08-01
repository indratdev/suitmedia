import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suitmedia/statemanagement/listUserbloc/list_users_bloc.dart';
import 'package:suitmedia/statemanagement/newUserbloc/newuser_bloc.dart';
import 'package:suitmedia/utils/constants.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Constants.greenColor),
        backgroundColor: Colors.white,
        title: Text(
          "Users",
          style: TextStyle(color: Constants.greenColor),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<NewuserBloc, NewuserState>(
        builder: (context, state) {
          if (state is SuccessGetListUserRegresin) {
            var data = state.usermodel.data;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    BlocProvider.of<ListUsersBloc>(context)
                        .add(SendListUser(data: data[index]));
                    Navigator.pop(context);
                  },
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: MediaQuery.of(context).size.width / 12,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(45),
                          child: Image.network(data[index].avatar)),
                    ),
                    title: Text(
                        "${data[index].first_name} ${data[index].last_name}"),
                    subtitle: Text(data[index].email),
                  ),
                );
              },
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
