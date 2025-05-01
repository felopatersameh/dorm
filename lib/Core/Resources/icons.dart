import 'colors.dart';
import 'package:flutter/Material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppIcons {
  //* login
  static IconData passwordvisibility = (Icons.visibility_outlined);
  static IconData passwordvisibilityOff = (Icons.visibility_off_outlined);
  static FaIcon google = (FaIcon(FontAwesomeIcons.google));
  static FaIcon apple = (FaIcon(FontAwesomeIcons.apple));

  //* Main
  static Icon home = Icon(Icons.home_outlined);
  static Icon maps = Icon(Icons.map_outlined);
  static Icon favorite = Icon(Icons.favorite_border);
  static Icon profile = Icon(Icons.person_outline);

  //* Profile
  static Icon edit = Icon(
    Icons.edit_sharp,
    color: AppColor.primaryColors,
    size: 20,
  );
  static Icon person = Icon(Icons.person);
  static Icon language = Icon(Icons.language);
  static Icon help = Icon(Icons.help_outline_sharp);
  static Icon feedback = Icon(Icons.feedback_outlined);
  static Icon logout = Icon(Icons.logout);
  static FaIcon angleRight = FaIcon(
    FontAwesomeIcons.angleRight,
    color: AppColor.primaryColors,
    size: 20,
  );
}
