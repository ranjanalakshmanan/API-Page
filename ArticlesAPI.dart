import 'dart:convert';

import 'package:api/Api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;


class MSD extends StatefulWidget {
  const MSD({Key? key}) : super(key: key);

  @override
  State<MSD> createState() => _MSDState();
}

class _MSDState extends State<MSD> {

  Future<String> FetchUserData() async{
    var map = new Map<String, dynamic>();
    map['sId'] = '500';
    map['uuId'] = '';
    map['userId'] = '423914';
List<News> list = [];

    var resp = await http.post(
      Uri.parse('http://devapi.hidoc.co:8080/HidocWebApp/api/getArticlesByUid?'),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
      },
      body: map,
    );
    print(resp.body);
    //final resp = await http.post(Uri.parse("http://devapi.hidoc.co:8080/HidocWebApp/api/getArticlesByUid?sId=500&uuId&userId=423914"));

    if (resp.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return resp.body;


    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  @override
  Widget build(BuildContext context) {
    return   FutureBuilder<String>(
      future: FetchUserData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
         return Text(snapshot.data!);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        // By default, show a loading spinner.
        return const CircularProgressIndicator();
      },

    );
  }
}
