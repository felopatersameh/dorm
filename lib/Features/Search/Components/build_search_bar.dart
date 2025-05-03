import '../../../Core/Resources/colors.dart';
import '../../../Core/Resources/text_style.dart';
import '../../../Core/Routes/app_routes.dart';
import '../../../main.dart';
import 'package:flutter/Material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildSearchBar extends StatefulWidget {
  final bool? enable;
  const BuildSearchBar({super.key, this.enable = false});

  @override
  State<BuildSearchBar> createState() => _BuildSearchBarState();
}

class _BuildSearchBarState extends State<BuildSearchBar> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    _controller.text = "";
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.enable == false && _focusNode.hasFocus) {
      _focusNode.unfocus();
    }

    return SearchBar(
      controller: _controller,
      textInputAction: TextInputAction.done,
      enabled: true,
      onTap: () {
        if (widget.enable == false) {
          kNavigationService.navigateTo(AppRoutes.searchPage);
        }
      },
      autoFocus: widget.enable == true,
      backgroundColor: WidgetStatePropertyAll(AppColor.secondColors),
      textStyle: WidgetStatePropertyAll(AppTextStyle.semiBold12Black),
      keyboardType: TextInputType.text,
      onChanged: (value) async {
        Duration(milliseconds: 2000);
        _controller.text = value;
      },
      focusNode: _focusNode,
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: Color(0x00000000), width: 1.0),
        ),
      ),
      trailing: [
        Icon(Icons.filter_list, color: Color(0xFF757575), weight: 22),
        10.horizontalSpace,
      ],
      leading: Icon(Icons.search, color: Colors.grey, weight: 20),
      hintText: 'Beach, mountains, long strolls...',
      hintStyle: WidgetStatePropertyAll(
        AppTextStyle.semiBold12Black.copyWith(color: Colors.grey),
      ),
      onSubmitted: (value) {},
    );
  }
}
