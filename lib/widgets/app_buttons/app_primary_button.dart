import 'package:flutter/material.dart';
import 'package:nexmat/app_configs/environment.dart';

import '../app_loader.dart';

///
/// Created by Sunil Kumar from Boiler plate
///
class AppPrimaryButton extends StatefulWidget {
  const AppPrimaryButton(
      {required this.child,
      Key? key,
      this.onPressed,
      this.height,
      this.width,
      this.color,
      this.shape,
      this.padding,
      this.textStyle})
      : super(key: key);

  final ShapeBorder? shape;
  final Widget child;
  final VoidCallback? onPressed;
  final double? height, width;
  final Color? color;
  final EdgeInsets? padding;
  final TextStyle? textStyle;

  @override
  AppPrimaryButtonState createState() => AppPrimaryButtonState();
}

class AppPrimaryButtonState extends State<AppPrimaryButton> {
  bool _isLoading = false;

  void showLoader() {
    setState(() {
      _isLoading = true;
    });
  }

  void hideLoader() {
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return _isLoading
        ? Center(child: AppProgress(color: widget.color ?? theme.primaryColor))
        : ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                elevation: 0,
                fixedSize: Size(
                    widget.width ?? MediaQuery.of(context).size.width / 2,
                    widget.height ?? 52),
                textStyle: widget.textStyle ??
                    const TextStyle(
                      fontFamily: Environment.fontFamily,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    )),
            onPressed: widget.onPressed,
            child: widget.child,
          );
  }
}
