import 'package:flutter/material.dart';

/// Function to build the left side of the screen i.e the image with the text
buildLeftView({
  required Size size,
  required double containerWidth,
  required double containerHeight,
}) {
  return Container(
    width: containerWidth,
    height: containerHeight,
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/lib/madam.png'),
        fit: BoxFit.cover,
      ),
    ),
    child: Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: size.width > 800 ? size.height * 0.2 : size.height * 0.1,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0x00414141).withOpacity(0.3),
              const Color(0x00414141).withOpacity(0.9),
              const Color(0x00414141).withOpacity(0.9),
            ],
          ),
        ),
        padding: const EdgeInsets.only(
          top: 10.0,
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            "Dream • Connect • Achieve",
            style: getTextStyle(size),
          ),
        ),
      ),
    ),
  );
}

getTextStyle(Size size) {
  if (size.width <= 400) {
    return TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: size.width * 0.05,
    );
  }
  return TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: size.width * 0.02,
  );
}
