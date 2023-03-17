import 'package:flutter/material.dart';

class CustomOvalImage extends StatelessWidget {
  final String imagePathUrl;

  const CustomOvalImage({super.key, required this.imagePathUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      // constraints: maxco,
      width: 100,
      height: 100,
      constraints: const BoxConstraints(maxWidth: 100),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            imagePathUrl,
          ),
        ),
        // borderRadius: BorderRadius.circular(50),
        border: Border.all(
          width: 2,
        ),
      ),
    );
  }
}
