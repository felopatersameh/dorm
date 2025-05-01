import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/Material.dart';

class LogoHomePage extends StatelessWidget {
  const LogoHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 8, 30, 0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: CachedNetworkImage(
          fadeInDuration: Duration(milliseconds: 1400),
          fadeOutDuration: Duration(milliseconds: 1400),
          imageUrl:
              'https://i.postimg.cc/8CMgYrhm/Screenshot-2025-03-10-at-00-00-32.png',
          width: 89.5,
          height: 35,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
