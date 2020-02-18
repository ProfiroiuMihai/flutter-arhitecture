import 'package:flutter/material.dart';
import 'package:flutter_template/util/app_colors.dart';
import 'package:flutter_template/util/scale_ui_utils.dart';



class InputWidget extends StatefulWidget {
  String hintText;
  TextEditingController controller;
  TextInputType keyboardType;
  bool isPassword;
  Function(String) validator;
  TextInputAction action;
  FocusNode thisNode;
  FocusNode nextNode;
  bool enable;

  InputWidget(this.hintText, this.controller,
      {this.keyboardType = TextInputType.text,
      this.isPassword = false,
      this.action = TextInputAction.next,
        this.enable = true,
      this.validator,
      this.thisNode,
      this.nextNode});

  @override
  InputWidgetState createState() => InputWidgetState();
}

class InputWidgetState extends State<InputWidget> {
  Color background = Colors.transparent;
  Color labelColor = AppColors.grey;
  bool isErrorVisible = false;
  ErrorIcon errorIcon = new ErrorIcon(false);

  @override
  Widget build(BuildContext context) {
    widget.thisNode.addListener(() {
      setState(() {
        setBackgroundColor();
      });
    });

    return Container(
      color: background,
      padding: EdgeInsets.only(
          right: ScreenUtil().setWidth(10), left: ScreenUtil().setWidth(10)),
      child: TextFormField(
        textInputAction: widget.action,
        onFieldSubmitted: (covariant) {
          if(widget.action==TextInputAction.next)
          changeFocus(context);
        },
        validator: (value) => validate(value),
        focusNode: widget.thisNode,
        obscureText: widget.isPassword,
        keyboardType: widget.keyboardType,
        controller: widget.controller,
        decoration: InputDecoration(
            focusColor: AppColors.labelInputFocus,
            labelText: widget.hintText,
            labelStyle: TextStyle(color: labelColor),
            suffixIcon: errorIcon),
        style: TextStyle(color: Colors.black),
        enabled: widget.enable,
      ),
    );
  }

  String validate(value) {
    setState(() {
      if (widget.validator(value) == null) {
        setBackgroundColor();
        isErrorVisible = false;
        errorIcon = ErrorIcon(false);
      } else {
        background = AppColors.backgroundInputError;
        labelColor = AppColors.redErrorColor;
        isErrorVisible = true;
        errorIcon = ErrorIcon(true);
      }
    });
    return widget.validator(value);
  }

  void setBackgroundColor() {
    if (widget.thisNode.hasFocus == true) {
      if (!isErrorVisible) {
        labelColor = AppColors.labelInputFocus;
        background = AppColors.backgroundInputFocus;
      }
    } else {
      if (!isErrorVisible) {
        labelColor = AppColors.grey;
        background = Colors.transparent;
      }
    }
  }

  void changeFocus(context) {
    widget.controller.addListener(() {});
    widget.thisNode.unfocus();
    FocusScope.of(context).requestFocus(widget.nextNode);
  }
}

class ErrorIcon extends StatelessWidget {
  bool _isError;

  ErrorIcon(this._isError);

  bool get isError => _isError;

  @override
  Widget build(BuildContext context) {
    Widget out;
    isError
//        ? out = ImageIcon(
//            AssetImage("assets/images/error_icon.png"),
//            color: AppColors.redErrorColor,
//            size: ScreenUtil().setHeight(18),
//          )

        ? out = Icon(Icons.error,color: Colors.red,)
        : out = new Icon(
            null,
          );

    return out;
  }
}
