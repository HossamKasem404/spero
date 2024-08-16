import "dart:convert";

import "package:flutter/material.dart";
import "package:http/http.dart" as http;
import "package:project1univ/main.dart";
import "package:project1univ/models/loginmodel.dart";


Future login(String ? email, String ? password, BuildContext context) async {
  http.Response response = await http.post(Uri.parse("http://10.0.2.2:8000/api/loginClient"),
      body: <String, dynamic>{
        "email": email!,
        "password": password!
      },
      headers: {
        "Accept": "application/json",
        
      });

  var responseData = jsonDecode(response.body);
  print(responseData);
  if (response.statusCode == 200) {
    print("فات عالرد");
    if (responseData['token'] != null) {
      print("قصح التوكن");
      userinfo['token'] = responseData['token'];
      print("خزنا");
      token = userinfo["token"];
      print("احتفظ فيها");
      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, "HomePage");
    } else {
      print("token not found");
    }
  } else if (response.statusCode == 500) {
    userinfo['Massage'] = responseData['Massage'];

    String h = userinfo['Massage'];
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(h)));
  } else if (response.statusCode == 422) {
    userinfo["message"] = responseData["message"];
    String h = userinfo['message'];
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(h)));
  }

}
