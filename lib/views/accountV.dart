import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:tjk/const.dart';
import 'package:tjk/language.dart';
import 'package:tjk/providers/accountP.dart';
import 'package:tjk/providers/appP.dart';
import 'package:tjk/shared/tjk_nvigation_bar.dart';

class AccountV extends StatelessWidget {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AccountP(),
      child: Consumer2<AppP, AccountP>(
        builder: (context, app, account, child) => Scaffold(
          body: CupertinoPageScaffold(
            navigationBar: TJKNavigationBar(LN["hasabym"][app.ln]),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 100.0),
                  Text(LN["at_we_familiya"][app.ln], style: titleTS),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0, bottom: 20.0),
                    child: account.isEditing
                        ? CupertinoTextField(
                            controller: _nameController,
                            style: title28TS.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6.0),
                            child: Text(
                              account.name,
                              style: title28TS.copyWith(
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                  ),
                  Text(LN["salgy"][app.ln], style: titleTS),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0, bottom: 20.0),
                    child: account.isEditing
                        ? CupertinoTextField(
                            controller: _addressController,
                            style:
                                title28TS.copyWith(fontWeight: FontWeight.bold),
                          )
                        : Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6.0),
                            child: Text(
                              account.address,
                              style: title28TS.copyWith(
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                  ),
                  Text(LN["telefon"][app.ln], style: titleTS),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0, bottom: 20.0),
                    child: account.isEditing
                        ? CupertinoTextField(
                            controller: _phoneController,
                            style:
                                title28TS.copyWith(fontWeight: FontWeight.bold),
                          )
                        : Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6.0),
                            child: Text(
                              account.phone,
                              style: title28TS.copyWith(
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                  ),
                  CupertinoButton.filled(
                    child: Text(
                      !account.isEditing
                          ? LN["uytgetmek"][app.ln]
                          : LN["yatda_saklamak"][app.ln],
                      style: titleTS,
                    ),
                    onPressed: () {
                      if (account.isEditing) {
                        account.name = _nameController.text;
                        account.address = _addressController.text;
                        account.phone = _phoneController.text;
                        account.isEditing = false;
                      } else {
                        _nameController.text = account.name;
                        _addressController.text = account.address;
                        _phoneController.text = account.phone;
                        account.isEditing = true;
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
