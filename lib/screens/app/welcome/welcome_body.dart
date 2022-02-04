import 'package:flutter/material.dart';
import 'package:phoenixjobs/screens/app/auth/auth_screen.dart';

class WelcomeBody extends StatelessWidget {
  //final _data, state;
  //WelcomeBody({this.state, data}) : _data = data;

  // ignore: use_key_in_widget_constructors
  const WelcomeBody();

  void _navigateWelcomeScreen({context, index}) async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => AuthScreen(),
        ));
    if (result != null) {
      // state.setState(() => something = result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/screens/welcome/bgImage.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // logo content
              Image.asset(
                "assets/images/screens/welcome/logo_content.png",
                // height: MediaQuery.of(context).size.width * 0.6,
                width: MediaQuery.of(context).size.width * 0.6,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 50),
              // start button
              MaterialButton(
                minWidth: MediaQuery.of(context).size.width * 0.8,
                height: 60,
                color: Colors.deepOrange,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                onPressed: () => _navigateWelcomeScreen(context: context),
                child: const Text(
                  "LET'S START",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
