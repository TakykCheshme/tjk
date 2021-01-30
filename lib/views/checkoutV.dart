import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tjk/const.dart';
import 'package:tjk/language.dart';
import 'package:tjk/providers/accountP.dart';
import 'package:tjk/providers/appP.dart';
import 'package:tjk/providers/cartP.dart';
import 'package:tjk/shared/bottom_button.dart';

class CheckoutV extends StatefulWidget {
  @override
  _CheckoutVState createState() => _CheckoutVState();
}

class _CheckoutVState extends State<CheckoutV> {
  TextEditingController _nameController;
  TextEditingController _addressController;
  TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();
    AccountP account = Provider.of<AccountP>(context, listen: false);
    _nameController = TextEditingController(text: account.name);
    _addressController = TextEditingController(text: account.address);
    _phoneController = TextEditingController(text: account.phone);
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _addressController.dispose();
    _phoneController.dispose();
  }

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
                    // AccountDetails(),
                    Text(LN["at_we_familiya"][app.ln], style: titleTS),
                    SizedBox(height: 5.0),
                    CupertinoTextField(
                      controller: _nameController,
                      style: title28TS.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      onChanged: (text) => account.name = text,
                    ),
                    SizedBox(height: 20.0),
                    Text(LN["salgy"][app.ln], style: titleTS),
                    SizedBox(height: 5.0),
                    CupertinoTextField(
                      controller: _addressController,
                      style: title28TS.copyWith(fontWeight: FontWeight.bold),
                      onChanged: (text) => account.address = text,
                    ),
                    SizedBox(height: 20.0),
                    Text(LN["telefon"][app.ln], style: titleTS),
                    SizedBox(height: 5.0),
                    CupertinoTextField(
                      controller: _phoneController,
                      style: title28TS.copyWith(fontWeight: FontWeight.bold),
                      onChanged: (text) => account.phone = text,
                    ),
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
              BottomButton(
                () {
                  if (account.name.isEmpty ||
                      account.address.isEmpty ||
                      account.phone.isEmpty)
                    showDialog(
                      context: context,
                      builder: (context) => CupertinoAlertDialog(
                        title: Text(LN["name_address_phone_empty"][app.ln]),
                        actions: [
                          CupertinoDialogAction(
                            child: Text("OK"),
                            onPressed: () => Navigator.of(context).pop(),
                          )
                        ],
                      ),
                    );
                  else if (cart.paymentMethod == null)
                    showDialog(
                      context: context,
                      builder: (context) => CupertinoAlertDialog(
                        title: Text(LN["toleg_usul_saylan"][app.ln]),
                        actions: [
                          CupertinoDialogAction(
                            child: Text("OK"),
                            onPressed: () => Navigator.of(context).pop(),
                          )
                        ],
                      ),
                    );
                  else
                    cart.checkout();
                },
                "Ugratmak",
              )
            ],
          ),
        ),
      ),
    );
  }
}
