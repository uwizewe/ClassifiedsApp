import 'package:flutter/material.dart';

import './login.dart';
import './provider/service.dart';
import './product.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    final _name = TextEditingController();
    final _phone = TextEditingController();
    final _username = TextEditingController();
    final _password = TextEditingController();
    final _repassword = TextEditingController();

    Future<void> _simpleDialog() async {
      switch (await showDialog(
          context: context,
          builder: (BuildContext context) {
            return SimpleDialog(
              title: const Text('The mobile number can be of 10  charchaters'),
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

    Future<void> _simpleDialogpass() async {
      switch (await showDialog(
          context: context,
          builder: (BuildContext context) {
            return SimpleDialog(
              title: const Text('Passwords are not matched'),
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

    Future<void> _simpleDialogs() async {
      switch (await showDialog(
          context: context,
          builder: (BuildContext context) {
            return SimpleDialog(
              title: const Text('Please fill all information in the form'),
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

    void _showSnackBar(String text, String ans) {
      final snackBar = SnackBar(
          duration: Duration(milliseconds: 500),
          backgroundColor:
              ans.compareTo("Yes") == 0 ? Colors.green : Colors.red,
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

    Future<void> _notregisted() async {
      switch (await showDialog(
          context: context,
          builder: (BuildContext context) {
            return SimpleDialog(
              title: const Text('You are already registered'),
              children: <Widget>[
                SimpleDialogOption(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LoginElevenPage()),
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

    Future<void> _notregistedtwo() async {
      switch (await showDialog(
          context: context,
          builder: (BuildContext context) {
            return SimpleDialog(
              title: const Text('Something went wrong please try again'),
              children: <Widget>[
                SimpleDialogOption(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LoginElevenPage()),
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

    void _submitData() {
      if (_name.text.isEmpty ||
          _phone.text.isEmpty ||
          _username.text.isEmpty ||
          _username.text.isEmpty ||
          _password.text.isEmpty) {
        _simpleDialogs();
      } else if (_phone.text.length != 10) {
        _simpleDialog();
      } else if (_password.text != _repassword.text) {
        _simpleDialogpass();
      } else {
        Services.register(
                _name.text, _phone.text, _username.text, _password.text)
            .then((result) {
          print("ress========>");
          print(result);
          if ('success' == result.trim()) {
            print(result);
            print('one');
            _notregistedtwo();
          } else if (result.trim() == 'duplicate') {
            print(result);
            print('two');
            _notregisted();
          } else {
            print('three');
            print(result);
            _registed();
          }
        });
      }
    }

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
                    color: Colors.blue.shade800,
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
                const SizedBox(height: 15.0),
                Text(
                  "Classifieds App",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline3!.copyWith(
                        color: Colors.white,
                      ),
                ),
                Text(
                  "",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
                const SizedBox(height: 15.0),
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
                        "Signup",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                              color: Colors.blue.shade900,
                            ),
                      ),
                      const SizedBox(height: 20.0),
                      TextField(
                          onSubmitted: (_) => _submitData(),
                          controller: _name,
                          decoration: InputDecoration(
                            labelText: "Names",
                          )),
                      TextField(
                          keyboardType: TextInputType.phone,
                          onSubmitted: (_) => _submitData(),
                          controller: _phone,
                          decoration: InputDecoration(
                            hintText: '07xxxxxxxx',
                            labelText: "Phone number",
                          )),
                      TextField(
                          onSubmitted: (_) => _submitData(),
                          controller: _username,
                          decoration: InputDecoration(
                            labelText: "Username",
                          )),
                      TextField(
                          obscureText: true,
                          onSubmitted: (_) => _submitData(),
                          controller: _password,
                          decoration: InputDecoration(
                            suffix: Icon(Icons.visibility),
                            labelText: "Password",
                          )),
                      TextField(
                          obscureText: true,
                          onSubmitted: (_) => _submitData(),
                          controller: _repassword,
                          decoration: InputDecoration(
                            suffix: Icon(Icons.visibility),
                            labelText: "Re-Password",
                          )),
                      const SizedBox(height: 30.0),
                      ElevatedButton(
                        child: Text("Signup",
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.white,
                            )),
                        onPressed: () {
                          _submitData();
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(16.0),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      TextButton(
                        child: Row(
                          children: [
                            Text(
                              "Already have you Account?",
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.blue,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      const SizedBox(height: 8.0),
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
