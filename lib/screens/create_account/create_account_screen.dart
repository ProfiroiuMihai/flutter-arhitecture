import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/arhitecture/view_model_provider.dart';
import 'package:flutter_template/network/api_response.dart';
import 'package:flutter_template/util/app_colors.dart';
import 'package:flutter_template/util/input_validator.dart';
import 'package:flutter_template/util/scale_ui_utils.dart';
import 'package:flutter_template/widgets/button_widget.dart';
import 'package:flutter_template/widgets/input_widget.dart';
import 'package:flutter_template/widgets/text_widget.dart';
import 'package:flutter_template/widgets/toolbar_widget.dart';
import 'package:provider/provider.dart';
import '../../router.dart';
import 'create_account_provider.dart';

class CreateAccountScreen extends StatefulWidget {
  @override
  CreateAccountScreenState createState() => CreateAccountScreenState();
}

class CreateAccountScreenState extends State<CreateAccountScreen> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final checkPasswordController = TextEditingController();
  final emailNode = FocusNode();
  final passwordNode = FocusNode();
  final checkPasswordNode = FocusNode();
  CreateAccountProvider model;

  GlobalKey<FormState> _key = new GlobalKey();
  bool autoValidate = false;
  bool isValid = true;
  var initDone = false;


  void registerListener() {
    model.addListener((){
      switch (model.createAccountApi.status) {
        case Status.LOADING:
          log("loading");
          break;
        case Status.COMPLETED:
          log("COMPLETED");
          Router.showDashboardScreen(
              context);
          break;
        case Status.ERROR:
          log("eror");
          Router.showDashboardScreen(
              context);
          break;
      }
    });
  }

  void register() {
    model.createAccount();
  }

  void validateFields() {
    setState(() {
      autoValidate = true;
    });
    FocusScope.of(context).unfocus();
    if (_key.currentState.validate()) {
      register();
    }
  }


  @override
  void didChangeDependencies() {
    if (!initDone) {
      model = Provider.of<CreateAccountProvider>(context);
      registerListener();
      setState(() {
        initDone = true;
      });
    }
    super.didChangeDependencies();
  }



    @override
    Widget build(BuildContext context) {
      ScreenUtil.init(context, width: 375, height: 811, allowFontScaling: false);
      return Scaffold(
                backgroundColor: Colors.white,
                body: SafeArea(
                  child: Column(
                    children: <Widget>[
                      ToolbarWidget(
                        themeColor: ThemeColor.black,
                        showIcons: false,
                        showBackBtn: false,
                      ),
                      Expanded(
                          child: ListView(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(
                                    right: ScreenUtil().setWidth(20),
                                    left: ScreenUtil().setWidth(20)),
                                child: Form(
                                  key: _key,
                                  autovalidate: autoValidate,
                                  onChanged: () {
                                    setState(() {
                                      if (autoValidate)
                                        isValid = _key.currentState.validate();
                                    });
                                  },
                                  child: ListView(
                                    shrinkWrap: true,
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                        EdgeInsets.only(
                                            top: ScreenUtil().setHeight(50)),
                                        child: TextWidget(
                                          "Create Your Account",
                                          textAlign: TextAlign.center,
                                          styles: TextStyles.titleOnboarding,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: ScreenUtil().setHeight(15),
                                            bottom: ScreenUtil().setHeight(10),
                                            right: ScreenUtil().setWidth(20),
                                            left: ScreenUtil().setWidth(20)),
                                        child: TextWidget(
                                          "Create your user ID and password below and we’ll send you a six digit verification code to your email address to cofirm.",
                                          styles: TextStyles.normal,
                                          textAlign: TextAlign.center,
                                          color: AppColors.grey,
                                          maxLines: 50,
                                        ),
                                      ),
                                      InputWidget(
                                        "Enter your email as your username",
                                        emailController,
                                        validator: InputFieldValidators
                                            .emailValidator,
                                        thisNode: emailNode,
                                        nextNode: passwordNode,
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(
                                            top: ScreenUtil().setHeight(10),
                                          )),
                                      InputWidget(
                                        "Password",
                                        passwordController,
                                        validator: InputFieldValidators
                                            .passwordValidator,
                                        isPassword: true,
                                        thisNode: passwordNode,
                                        nextNode: checkPasswordNode,
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(
                                            top: ScreenUtil().setHeight(10),
                                          )),
                                      InputWidget(
                                        "Confirm Password",
                                        checkPasswordController,
                                        validator: InputFieldValidators
                                            .confirmPasswordValidator,
                                        isPassword: true,
                                        thisNode: checkPasswordNode,
                                        action: TextInputAction.done,
                                      ),
                                      Container(
                                          margin: EdgeInsets.only(
                                            top: ScreenUtil().setHeight(50),
                                            bottom: ScreenUtil().setHeight(10),
                                          ),
                                          child: ButtonWidget(
                                            "Send Verification Code To My Email",
                                            isEnable: isValid,
                                            styles: (isValid)
                                                ? ButtonStyles.blue
                                                : ButtonStyles.disable,
                                            callback: () {
                                              validateFields();
                                            },
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
              );
    }

    @override
    void dispose() {
      emailController.dispose();
      passwordController.dispose();
      checkPasswordController.dispose();
      super.dispose();
    }
  }
