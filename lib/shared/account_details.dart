import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tjk/providers/accountP.dart';
import 'package:tjk/providers/appP.dart';

import '../const.dart';
import '../language.dart';

class AccountDetails extends StatefulWidget {
  @override
  _AccountDetailsState createState() => _AccountDetailsState();
}

class _AccountDetailsState extends State<AccountDetails> {
  TextEditingController _nameController;
  TextEditingController _addressController;
  TextEditingController _phoneController;

  @override
  initState() {
    super.initState();
    _nameController = TextEditingController();
    _addressController = TextEditingController();
    _phoneController = TextEditingController();
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
    return Consumer2<AppP, AccountP>(
      builder: (context, app, account, child) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
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
                      style: title28TS.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
          ),
          Text(LN["salgy"][app.ln], style: titleTS),
          Padding(
            padding: const EdgeInsets.only(top: 5.0, bottom: 20.0),
            child: account.isEditing
                ? CupertinoTextField(
                    controller: _addressController,
                    style: title28TS.copyWith(fontWeight: FontWeight.bold),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0),
                    child: Text(
                      account.address,
                      style: title28TS.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
          ),
          Text(LN["telefon"][app.ln], style: titleTS),
          Padding(
            padding: const EdgeInsets.only(top: 5.0, bottom: 20.0),
            child: account.isEditing
                ? CupertinoTextField(
                    controller: _phoneController,
                    style: title28TS.copyWith(fontWeight: FontWeight.bold),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0),
                    child: Text(
                      account.phone,
                      style: title28TS.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
          ),
          OutlinedButton(
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Text(
                !account.isEditing
                    ? LN["uytgetmek"][app.ln]
                    : LN["yatda_saklamak"][app.ln],
                style: titleTS,
              ),
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
    );
  }
}
