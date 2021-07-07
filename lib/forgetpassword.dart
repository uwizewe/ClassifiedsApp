import 'package:flutter/material.dart';

class Forgetpassword extends StatelessWidget {
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
                  "",
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
                      Column(
                        children: [
                          Text(
                            "Forgot Password",
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(color: Colors.blue.shade900),
                          ),
                          Text("You can reset your password here")
                        ],
                      ),
                      const SizedBox(height: 40.0),
                      TextField(
                        decoration: InputDecoration(
                          labelText: "Phone Number",
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      ElevatedButton(
                        child: Text("Send My Password"),
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(16.0),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      TextButton(
                        child: Text(
                          "Signup?",
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.blue,
                          ),
                          textAlign: TextAlign.center,
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
