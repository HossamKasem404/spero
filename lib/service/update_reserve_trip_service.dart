import "dart:convert";

import "package:flutter/material.dart";
import "package:http/http.dart" as http;
import "package:project1univ/main.dart";

class UpdateInfoReserveTripService {
  Future updateinforeservetripservice(
      int id ,
      String email,
      String fathername,
      String mothername,
      String gender,
      String flightclass,
      int wight,
      int amountofpeople,
      BuildContext context) async {
    http.Response response =
        await http.post(Uri.parse("$url/UpdateInfoReserve"), headers: {
      "Accept": "application/json",
      "Authorization": "Bearer $token",
    }, body: {
      "TripID": id.toString(),
      "email": email ?? "",
      "fatherName": fathername?? "",
      "MotherName": mothername?? "",
      "Gendor": gender?? "",
      "FlightClass": flightclass?? "",
      "Wight": wight.toString()?? "",
      "amountpeople": amountofpeople.toString()?? ""
    });
    var responseData = jsonDecode(response.body);
    print(responseData);
    if  (response.statusCode==200){
       showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text("${responseData["Message"]}"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Close"),
                ),
              ],
            );
          },
        );
    }else{
       showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text("${responseData["Message"]}"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Close"),
                ),
              ],
            );
          },
        );
    }
  }
}
