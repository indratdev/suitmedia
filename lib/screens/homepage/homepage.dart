import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suitmedia/statemanagement/listUserbloc/list_users_bloc.dart';
import 'package:suitmedia/statemanagement/newUserbloc/newuser_bloc.dart';
import 'package:suitmedia/utils/constants.dart';

class HomePage extends StatelessWidget {
  String _name = "";
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Constants.greenColor),
        backgroundColor: Colors.white,
        title: Text(
          "Home",
          style: TextStyle(color: Constants.greenColor),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text(
                            "Welcome",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          BlocBuilder<NewuserBloc, NewuserState>(
                            builder: (context, state) {
                              if (state is SendNewUserState) {
                                _name = state.newUser;
                                return Text(
                                  _name,
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                );
                              }
                              return Text(_name);
                            },
                          ),
                        ]),
                  )
                ],
              ),
            ),
            BlocBuilder<ListUsersBloc, ListUsersState>(
              builder: (context, state) {
                if (state is SuccessSendListUser) {
                  var data = state.data;
                  return Container(
                    alignment: Alignment.center,
                    // color: Colors.red,
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: MediaQuery.of(context).size.width / 7,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(45),
                              child: Image.network(data.avatar)),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            "${data.first_name} ${data.last_name}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            data.email,
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: InkWell(
                            onTap: () async {
                              Navigator.pushNamed(context, '/website');
                            },
                            child: const Text(
                              "Website",
                              style: TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return Container(
                    alignment: Alignment.center,
                    // color: Colors.red,
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: MediaQuery.of(context).size.width / 6,
                          child: const Icon(Icons.person_sharp),
                        ),
                        const SizedBox(height: 20),
                        const Text("Select a user to show the profile")
                      ],
                    ),
                  );
                }
              },
            ),
            Container(
              child: Column(
                children: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Constants.greenColor,
                      minimumSize: const Size.fromHeight(50),
                      shape: const StadiumBorder(),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/users');
                      BlocProvider.of<NewuserBloc>(context)
                          .add(GetListUserRegresin());
                    },
                    child: const Text("Choose a user"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
