import 'package:flutter/material.dart';
import 'package:flutter_template/arhitecture/view_model_provider.dart';
import 'package:flutter_template/network/api_response.dart';
import 'package:flutter_template/screens/dashboard/transactions/transaction_list_widget.dart';
import 'package:flutter_template/util/scale_ui_utils.dart';
import 'package:flutter_template/widgets/button_widget.dart';
import 'package:flutter_template/widgets/circle_progress_widget.dart';
import 'package:flutter_template/widgets/text_widget.dart';
import 'package:flutter_template/widgets/toolbar_widget.dart';


import '../../router.dart';
import 'dashboard_provider.dart';

class DashBoardScreen extends StatelessWidget {
  DashboardProvider model;

  @override
  Widget build(BuildContext context) {

    return ViewModelProvider<DashboardProvider>.withConsumer(
        viewModel: new DashboardProvider(),
        onModelReady: (model) {
          this.model = model;
          this.model.getDashboard();
        },
        builder: (context, model, child) => Scaffold(
                body: SafeArea(
              child: ListView(children: <Widget>[
                ToolbarWidget(
                  showBackBtn: false,
                  themeColor: ThemeColor.black,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: Container(
                          child: Image.asset("assets/images/background.png")),
                    ),
                    Expanded(
                        flex: 7,
                        child: Container(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Container(
                              child: CustomPaint(
                                foregroundPainter: CircleProgressWidget(50.5),
                                child: Container(
                                  width: ScreenUtil().setWidth(165),
                                  height: ScreenUtil().setHeight(165),
                                  child: Center(
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                        TextWidget(
                                          "Available",
                                          fontWeight: FontWeight.normal,
                                          fontSize: 14,
                                        ),
                                        RichText(
                                            text: TextSpan(
                                                style: TextStyle(
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 17,
                                                  fontFamily: "Nunito Sans",
                                                  height: 1.3,
                                                  color: Colors.black,
                                                ),
                                                children: [
                                              TextSpan(
                                                text: r"$",
                                              ),
                                              TextSpan(
                                                  text: "150",
                                                  style: TextStyle(
                                                    fontSize: 30,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: "Nunito Sans",
                                                  )),
                                              TextSpan(
                                                  text: ".50",
                                                  style: TextStyle(
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily: "Nunito Sans",
                                                  ))
                                            ])),
                                        TextWidget(r"of $" + model.dashboardResponse.totalFunds.toString(),
                                        fontSize: 14,),
                                      ])),
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: RichText(
                                  text: TextSpan(
                                      style: TextStyle(
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 12,
                                          fontFamily: "Nunito Sans",
                                          color: Colors.black),
                                      children: [
                                    TextSpan(
                                      text: 'Next Paydown in ',
                                    ),
                                    TextSpan(
                                        text: '3 days',
                                        style: TextStyle(
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            fontFamily: "Nunito Sans",
                                            color: Colors.black)),
                                  ])),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  top: ScreenUtil().setHeight(10)),
                              alignment: Alignment.center,
                              child: TextWidget(
                                model.dashboardResponse.text2,
                                fontSize: 12,
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.only(
                                    top: ScreenUtil().setHeight(10)),
                                width: ScreenUtil().setWidth(200),
                                height: ScreenUtil().setHeight(42),
                                child: ButtonWidget("Pay Now",
                                    styles: ButtonStyles.blue, callback: () {
//                                  Router.showPayNowScreen(context);
                                })),
                          ],
                        )))
                  ],
                ),
                Container(
                  child: Card(
                    margin: EdgeInsets.only(
                        right: ScreenUtil().setWidth(16),
                        left: ScreenUtil().setWidth(16),
                        bottom: ScreenUtil().setHeight(20),
                        top: ScreenUtil().setHeight(20)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Expanded(
                            flex: 3,
                            child: Container(
                              child: Image.asset("assets/images/ruby-pass.png"),
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.only(
                                  right: ScreenUtil().setWidth(5),
                                  left: ScreenUtil().setWidth(5),
                                  bottom: ScreenUtil().setHeight(5),
                                  top: ScreenUtil().setHeight(5)),
                              width: ScreenUtil().setWidth(97),
                              height: ScreenUtil().setHeight(50),
                            )),
                        Expanded(
                          flex: 7,
                          child: Container(
                            alignment: Alignment.centerLeft,
                            constraints: BoxConstraints(
                                minHeight: ScreenUtil().setHeight(60),
                                maxHeight: ScreenUtil().setHeight(70)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                TextWidget(model.dashboardResponse.rubyTitle,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    textAlign: TextAlign.right),
                                TextWidget(
                                    model.dashboardResponse.rubySubtitle,
                                    fontSize: 14,
                                    textAlign: TextAlign.left),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Divider(
                  thickness: 1,
                ),
                Container(
                  child: showTransactions(),
                ),
              ]),
            )));
  }

  showTransactions() {
    switch (model.apiResponse.status) {
      case Status.LOADING:
      return  Center(child: Container(margin : EdgeInsets.all(30), height: ScreenUtil().setHeight(50),
            width: ScreenUtil().setHeight(50),
            child: CircularProgressIndicator()));
        break;
      case Status.COMPLETED:
        return TransactionsList(model.dashboardResponse);
        break;
      case Status.ERROR:
        return Text(model.apiResponse.toString());
        break;
    }
  }
}
