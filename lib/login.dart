import 'package:flutter/material.dart';
import './sinup.dart';

import './provider/service.dart';
import './product.dart';

class LoginElevenPage extends StatefulWidget {
  @override
  _LoginElevenPageState createState() => _LoginElevenPageState();
}

class _LoginElevenPageState extends State<LoginElevenPage> {
  final _username = TextEditingController();
  final _password = TextEditingController();

  Future<void> _simpleDialog(String val) async {
    switch (await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text(val),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, "Yes");
                },
                child: const Text('Yes'),
              ),
            ],
          );
        })) {
      case "Yes":
        break;
      case "No":
        return;
        // ignore: dead_code
        break;
    }
  }

  Future<void> _registed() async {
    switch (await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('Welcome at  Classifieds App'),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UserProductsScreen()),
                  );
                },
                child: const Text('Yes'),
              ),
            ],
          );
        })) {
      case "Yes":
        _showSnackBar("Thanks!", "Yes");
        break;
      case "No":
        _showSnackBar("Oh! No... Try to provide you best", "No");
        break;
    }
  }

  void _showSnackBar(String text, String ans) {
    final snackBar = SnackBar(
        duration: Duration(milliseconds: 500),
        backgroundColor: ans.compareTo("Yes") == 0 ? Colors.green : Colors.red,
        content: Row(
          children: <Widget>[
            Icon(
              ans.compareTo("Yes") == 0 ? Icons.favorite : Icons.watch_later,
              color: ans.compareTo("Yes") == 0 ? Colors.pink : Colors.yellow,
              size: 24.0,
              semanticLabel: text,
            ),
            Text(text)
          ],
        ));
    // ignore: deprecated_member_use
    Scaffold.of(context).showSnackBar(snackBar);
  }

  void _submitData() {
    if (_username.text.isEmpty || _password.text.isEmpty) {
      _simpleDialog("Please fill all information in  login form ");
    } else {
      Services.login(_username.text, _password.text).then((result) {
        if (result!['message'] == "success") {
          _registed();
        } else {
          _simpleDialog(
              "Your username and password are  not correct please try again ");
        }
      });
    }

    _password.clear();
    _username.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Card(
                    color: Colors.blue.shade900,
                    margin: const EdgeInsets.all(0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    elevation: 10,
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
          SafeArea(
            child: ListView(
              children: [
                const SizedBox(height: 40.0),
                Text(
                  "Classifieds App",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline3!.copyWith(
                        color: Colors.white,
                      ),
                ),
                Text(
                  " ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
                const SizedBox(height: 30.0),
                Card(
                  margin: const EdgeInsets.all(32.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: ListView(
                    shrinkWrap: true,
                    primary: false,
                    physics: NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(16.0),
                    children: [
                      const SizedBox(height: 20.0),
                      Text(
                        "Login",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                              color: Colors.blue.shade900,
                            ),
                      ),
                      const SizedBox(height: 40.0),
                      TextField(
                        controller: _username,
                        onSubmitted: (_) => _submitData(),
                        decoration: InputDecoration(
                          labelText: "Username",
                        ),
                      ),
                      TextField(
                        onSubmitted: (_) => _submitData(),
                        obscureText: true,
                        controller: _password,
                        decoration: InputDecoration(
                            labelText: "Password",
                            suffix: Icon(Icons.visibility)),
                      ),
                      const SizedBox(height: 30.0),
                      ElevatedButton(
                        child: Text("Login"),
                        onPressed: () {
                          _submitData();
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(16.0),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        children: [
                          Text(
                            "Have you Account? No",
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.black,
                            ),
                          ),
                          TextButton(
                            child: Text(
                              "Signup",
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.blue,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignupPage()));
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 8.0),
                      /*TextButton(
                        child: Text(
                          "Forgot password?",
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.blue,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Forgetpassword()));
                        },
                      ),*/
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
