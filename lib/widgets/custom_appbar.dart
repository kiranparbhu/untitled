import '../utils/app_styles.dart';
import 'package:flutter/material.dart';
import '../utils/base_state.dart';

class CustomAppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBarWidget(
      {Key? key,
        this.title,
        this.showFilter = false,
        this.leading,
        this.automaticallyImplyLeading = false,
        this.onLeadingClick,
        this.onFilterClick,
        this.actions,
        this.backgroundColor,
        this.titleSpacing=0,
        this.tabType})
      : super(key: key);

  @override
  State<CustomAppBarWidget> createState() => _CustomAppBarWidgetState();
  final String? title;
  final bool showFilter;
  final Widget? leading;
  final double? titleSpacing;

  final Function()? onLeadingClick;
  final Function()? onFilterClick;
  final List<Widget>? actions;
  final String? tabType;
  final bool automaticallyImplyLeading;
  final Color? backgroundColor;

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}

class _CustomAppBarWidgetState extends BaseState<CustomAppBarWidget> {
  var userType = "";

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: widget.backgroundColor,
      elevation: 0,
      leading: widget.leading,
      automaticallyImplyLeading: widget.automaticallyImplyLeading,
      title: Text(
        widget.title ?? '',
        style: AppStyles.appBarTitleStyle(),
      ),titleSpacing: widget.titleSpacing,
      actions: widget.actions,
    );
  }
}