import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tjk/const.dart';
import 'package:tjk/language.dart';
import 'package:tjk/providers/accountP.dart';
import 'package:tjk/providers/appP.dart';
import 'package:tjk/providers/cartP.dart';
import 'package:tjk/shared/account_details.dart';
import 'package:tjk/shared/bottom_button.dart';

class CheckoutV extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer3<AppP, CartP, AccountP>(
      builder: (context, app, cart, account, child) => CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text(LN["sargydy_ugratmak"][app.ln], style: titleTS),
        ),
        child: Scaffold(
          body: Stack(
            children: [
              Positioned.fill(
                child: ListView(
                  padding: EdgeInsets.fromLTRB(20.0, 100.0, 20.0, 80.0),
                  children: [
                    SizedBox(height: 10.0),
                    AccountDetails(),
                    SizedBox(height: 40.0),
                    Text("Toleg usuly:", style: titleTS),
                    SizedBox(height: 5.0),
                    RadioListTile(
                      value: PaymentMethod.nagt,
                      groupValue: cart.paymentMethod,
                      onChanged: (val) => cart.paymentMethod = val,
                      title: Text(
                        LN["nagt"][app.ln],
                        style: titleTS.copyWith(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(LN["nagt_subtitle"][app.ln]),
                    ),
                    RadioListTile(
                      value: PaymentMethod.kart,
                      groupValue: cart.paymentMethod,
                      onChanged: (val) => cart.paymentMethod = val,
                      title: Text(
                        LN["nagt_dal"][app.ln],
                        style: titleTS.copyWith(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(LN["nagt_dal_subtitle"][app.ln]),
                    ),
                    RadioListTile(
                      value: PaymentMethod.online,
                      groupValue: cart.paymentMethod,
                      onChanged: (val) => cart.paymentMethod = val,
                      title: Text(
                        LN["onlayn"][app.ln],
                        style: titleTS.copyWith(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(LN["onlayn_subtitle"][app.ln]),
                    ),
                    SizedBox(height: 10.0),
                    Text("Jemi:", style: titleTS),
                    SizedBox(height: 5.0),
                    Text(
                      cart.totalPrice.toStringAsFixed(2) + " manat",
                      style: title28TS.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              BottomButton(() {}, "Ugratmak")
            ],
          ),
        ),
      ),
    );
  }
}
