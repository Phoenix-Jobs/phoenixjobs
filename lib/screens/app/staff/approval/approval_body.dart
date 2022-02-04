import 'package:flutter/material.dart';

class ApprovalBody extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final state;
  // ignore: use_key_in_widget_constructors
  const ApprovalBody({this.state});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: <Widget>[
        // first item
        InkWell(
          onTap: () {},
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 10,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(40.0),
                  bottomRight: Radius.circular(40.0),
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
                color: Colors.white),
            child: Row(
              children: <Widget>[
                // Profile picture
                Container(
                  width: 50,
                  height: 50,
                  alignment: Alignment.topLeft,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://images.pexels.com/photos/37347/office-sitting-room-executive-sitting.jpg?cs=srgb&dl=pexels-pixabay-37347.jpg&fm=jpg'),
                        fit: BoxFit.fill),
                  ),
                ),
                const SizedBox(width: 10),
                // middle row
                SizedBox(
                  width: 245,
                  height: 45,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // upper row
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          // From user
                          RichText(
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'From ',
                                  style: TextStyle(
                                    color: Colors.grey[850],
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const TextSpan(
                                  text: 'userxxx1',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // application date
                          RichText(
                            text: const TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: '03/12/2021',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Waiting for approval status',
                              style: TextStyle(
                                color: Colors.yellow[800],
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // approval status
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                // next icon
                const SizedBox(
                  width: 1,
                  child:
                      Icon(Icons.arrow_forward, color: Colors.grey, size: 18.0),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        // second item
        InkWell(
          onTap: () {},
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 10,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(40.0),
                  bottomRight: Radius.circular(40.0),
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
                color: Colors.white),
            child: Row(
              children: <Widget>[
                // Profile picture
                Container(
                  width: 50,
                  height: 50,
                  alignment: Alignment.topLeft,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://images.pexels.com/photos/37347/office-sitting-room-executive-sitting.jpg?cs=srgb&dl=pexels-pixabay-37347.jpg&fm=jpg'),
                        fit: BoxFit.fill),
                  ),
                ),
                const SizedBox(width: 10),
                // middle row
                SizedBox(
                  width: 245,
                  height: 45,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // upper row
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          // From user
                          RichText(
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'From ',
                                  style: TextStyle(
                                    color: Colors.grey[850],
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const TextSpan(
                                  text: 'userxxx2',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // application date
                          RichText(
                            text: const TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: '02/12/2021',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Approved',
                              style: TextStyle(
                                color: Colors.greenAccent[700],
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // approval status
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                // next icon
                const SizedBox(
                  width: 1,
                  child:
                      Icon(Icons.arrow_forward, color: Colors.grey, size: 18.0),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        // third item
        InkWell(
          onTap: () {},
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 10,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(40.0),
                  bottomRight: Radius.circular(40.0),
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
                color: Colors.white),
            child: Row(
              children: <Widget>[
                // Profile picture
                Container(
                  width: 50,
                  height: 50,
                  alignment: Alignment.topLeft,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://images.pexels.com/photos/37347/office-sitting-room-executive-sitting.jpg?cs=srgb&dl=pexels-pixabay-37347.jpg&fm=jpg'),
                        fit: BoxFit.fill),
                  ),
                ),
                const SizedBox(width: 10),
                // middle row
                SizedBox(
                  width: 245,
                  height: 45,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // upper row
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          // From user
                          RichText(
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'From ',
                                  style: TextStyle(
                                    color: Colors.grey[850],
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const TextSpan(
                                  text: 'userxxx3',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // application date
                          RichText(
                            text: const TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: '01/12/2021',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Declined',
                              style: TextStyle(
                                color: Colors.redAccent[700],
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // approval status
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                // next icon
                const SizedBox(
                  width: 1,
                  child:
                      Icon(Icons.arrow_forward, color: Colors.grey, size: 18.0),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
