import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:suitmedia/statemanagement/newUserbloc/newuser_bloc.dart';
import 'package:suitmedia/statemanagement/palindrome_bloc/palindrome_bloc.dart';
import 'package:suitmedia/utils/constants.dart';

class LoginPage extends StatelessWidget {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _sentenseController = TextEditingController();

  LoginPage({Key? key}) : super(key: key);

  showAlertDialogResult(BuildContext context) {
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Result Palindrome"),
      content: const Text("This is my message."),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("OK"),
        ),
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<PalindromeBloc, PalindromeState>(
        listener: (context, state) {
          if (state is SuccessIsPalindrome) {
            bool result = state.statusPalindrome;
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text("Result Palindrome"),
                  content: (result)
                      ? const Text("isPalindrome")
                      : const Text("not palindrome"),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("OK"))
                  ],
                );
              },
            );
          }
        },
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.3, 1],
                  colors: [Colors.green, Colors.blue])),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.white38,
                  radius: MediaQuery.of(context).size.width / 8,
                  child: IconButton(
                    color: Colors.white,
                    onPressed: () {},
                    icon: const Icon(Icons.person_add_alt_1),
                  ),
                ),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    controller: _nameController,
                    autocorrect: false,
                    cursorHeight: 20,
                    autofocus: false,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        // borderSide:
                        //     const BorderSide(color: Colors.grey, width: 2),
                      ),
                    ),
                  ),
                ),
                // SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20),
                  child: TextField(
                    controller: _sentenseController,
                    autocorrect: false,
                    cursorHeight: 20,
                    autofocus: false,
                    decoration: InputDecoration(
                      labelText: 'Palindrome',
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        // borderSide:
                        //     const BorderSide(color: Colors.white, width: 2),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Constants.greenColor,
                      minimumSize: const Size.fromHeight(50),
                      shape: const StadiumBorder(),
                    ),
                    onPressed: () {
                      BlocProvider.of<PalindromeBloc>(context).add(
                          IsPalindromeEvent(value: _sentenseController.text));
                    },
                    child: const Text("CHECK"),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Constants.greenColor,
                      minimumSize: const Size.fromHeight(50),
                      shape: const StadiumBorder(),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                      BlocProvider.of<NewuserBloc>(context)
                          .add(SendNewUser(userName: _nameController.text));
                    },
                    child: const Text("NEXT"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
