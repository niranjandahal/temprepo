import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:searchimplement/description.dart';

class searchpage extends StatefulWidget {
  const searchpage({super.key});

  @override
  State<searchpage> createState() => _searchpageState();
}

class _searchpageState extends State<searchpage> {
  var jsondata;
  List<Map<String, dynamic>> _allUsers = [];
  List<Map<String, dynamic>> _newlist = [];
  getdata() async {
    var response = await http
        .get(Uri.parse("https://niranjandahal.github.io/tempjson/user.json"));
    if (response.statusCode == 200) {
      jsondata = json.decode(response.body);
    } else {
      print("Error");
    }
    for (var i = 0; i < jsondata.length; i++) {
      _allUsers.add({
        "name": jsondata[i]["name"],
        "id": jsondata[i]["id"],
        "age": jsondata[i]["age"],
      });
    }
    //TO SHOW ALL LIST AT INITIAL
    setState(() {
      _newlist = _allUsers;
    });
  }

  //
  @override
  void initState() {
    super.initState();
    getdata();
  }

  void _searchlist(String value) {
    setState(() {
      if (value.isEmpty) {
        _newlist = _allUsers;
      } else {
        _newlist = _allUsers
            .where((element) => element['name']
                .toString()
                .toLowerCase()
                .contains(value.toString().toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: Text("Search Page"),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                onChanged: (value) {
                  _searchlist(value);
                },
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: ListView.builder(
                itemCount: _newlist.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => description(
                            context,
                            _newlist[index]['name'],
                            _newlist[index]['age'],
                          ),
                        ),
                      );
                    },
                    child: Card(
                      child: ListTile(
                        title: Text(_newlist[index]['name']),
                        subtitle: Text(_newlist[index]['age'].toString()),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
