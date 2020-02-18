import 'package:flutter/material.dart';
import 'package:flutter_template/util/app_colors.dart';
import 'package:flutter_template/util/scale_ui_utils.dart';
import 'package:flutter_template/widgets/text_widget.dart';


enum ButtonStyles { blue, purple, pink, disable, disablePrimaryLightText }

class ButtonWidget extends StatelessWidget {
  String text;
  ButtonStyles styles;
  VoidCallback callback;
  bool isEnable;

  ButtonWidget(this.text, {this.styles = ButtonStyles.blue, this.callback,this.isEnable=true});

  var textColor;
  var buttonColor;

  @override
  Widget build(BuildContext context) {


        switch(styles){
          case ButtonStyles.blue:
            {
              buttonColor= AppColors.primaryLightColor;
              textColor = AppColors.white;
            }
            break;
          case ButtonStyles.pink:
            {
              buttonColor= AppColors.pink;
              textColor = AppColors.white;
            }
            break;
          case ButtonStyles.purple:
            {
              buttonColor= AppColors.purpleLight;
              textColor = AppColors.primaryLightColor;
            }
            break;
          case ButtonStyles.disable:
            {
              buttonColor= AppColors.disableGrey;
              textColor = AppColors.white;
            }
            break;
          case ButtonStyles.disablePrimaryLightText:
            {
              buttonColor= AppColors.disableGrey;
              textColor = AppColors.primaryLightColor;
            }
            break;
          default:{}
          break;
        }

    return Container(
        height: ScreenUtil().setHeight(55),
        child: FloatingActionButton.extended(
          backgroundColor: buttonColor,
          isExtended: true,
          label: TextWidget(
            text,            
            fontSize: ScreenUtil().setWidth(14),
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
          onPressed: () {
            if(isEnable)
            callback();
          },
        ));
  }
}
