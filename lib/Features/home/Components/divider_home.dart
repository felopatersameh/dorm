import 'package:flutter/Material.dart';

class DividerHome extends StatelessWidget {
  const DividerHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 8,
      thickness: 4,
      indent: 140,
      endIndent: 140,
      color: Color(0xffe0e3e7),
    );
  }
}
