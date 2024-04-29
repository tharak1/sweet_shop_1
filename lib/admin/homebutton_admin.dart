import 'package:flutter/material.dart';

class AdminHomebutton extends StatelessWidget {
  const AdminHomebutton(
      {super.key, required this.imgName, required this.functionpg});
  final String imgName;
  final Widget functionpg;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        borderRadius: BorderRadius.circular(25),
        splashColor: Colors.white,
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => functionpg,
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width / 2,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  height: MediaQuery.of(context).size.height / 4,
                  child: Center(
                    child: Text(
                      imgName,
                      style: TextStyle(
                          color: const Color.fromARGB(255, 0, 0, 0),
                          fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
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
