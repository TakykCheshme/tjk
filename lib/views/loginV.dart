import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:tjk/const.dart';
import 'package:tjk/language.dart';
import 'package:tjk/providers/appP.dart';

class LoginV extends StatelessWidget {
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<AppP>(
      builder: (_, app, __) => CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text(LN["girmek"][app.ln], style: titleTS),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Phone number:"),
            CupertinoTextField(
              placeholder: "phone number",
            ),
            CupertinoTextField(
              placeholder: "password",
            ),
            CupertinoButton.filled(
                child: Text("OK"),
                onPressed: () async {
                  Dio dio = Dio();
                  var r = await dio.post(
                      "https://tjk.com.tm/gala/tjk/customapi/login.php",
                      data: {
                        "phone_number": "+99364921507",
                        "password": "aman0kerim",
                      });
                  print(r);
                })
          ],
        ),
      ),
    );
  }
}
