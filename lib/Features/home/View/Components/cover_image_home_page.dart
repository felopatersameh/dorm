import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/Material.dart';

class CoverImageHomePage extends StatelessWidget {
  const CoverImageHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.05, -1),
      child: CachedNetworkImage(
        fadeInDuration: Duration(milliseconds: 1400),
        fadeOutDuration: Duration(milliseconds: 1400),
        imageUrl:
            'https://i.pinimg.com/736x/b6/fe/90/b6fe909e4031bb8f846bcb3a818e9329.jpg',
        width: double.infinity,
        height: 500,
        fit: BoxFit.cover,
      ),
    );
  }
}
