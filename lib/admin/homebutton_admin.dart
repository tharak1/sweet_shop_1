import 'package:flutter/material.dart';

class AdminHomebutton extends StatelessWidget {
  const AdminHomebutton(
      {super.key, required this.Name, required this.functionpg});
  final String Name;
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
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                child: Center(
                  child: Text(
                    Name,
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
    );
  }
}
