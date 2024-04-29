import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class HomeButton extends StatelessWidget {
  const HomeButton({
    super.key,
    required this.assetspath,
    required this.imgName,
    required this.functionpg,
  });
  final String assetspath;
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
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Stack(
                    children: [
                      // Placeholder image
                      FadeInImage(
                        fadeInDuration: Duration(milliseconds: 100),
                        fadeOutDuration: Duration(milliseconds: 100),
                        placeholder: MemoryImage(kTransparentImage),
                        image: AssetImage(assetspath),
                        fit: BoxFit.cover,
                        height: MediaQuery.of(context).size.height / 4,
                        width: MediaQuery.of(context).size.width,
                      ),

                      Positioned(
                        top: 85,
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: ClipRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                            child: Container(
                              height: MediaQuery.of(context).size.height / 4,
                              color: Colors.transparent,
                              child: Center(
                                child: Text(
                                  imgName,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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
