import 'package:flutter/material.dart';
import 'package:getdatawithpagination/services/provider.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  callApi() {
    Provider.of<HamroProvider>(context, listen: false).fetchDatafromApi();
  }

  @override
  void initState() {
    callApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Project 2 ")),
      body: Consumer<HamroProvider>(
        builder: (context, value, child) {
          print(value.nayaModel);
          return ListView.builder(
            itemCount: value.nayaModel.length,
            itemBuilder: ((context, index) {
              return Card(
                  child: ListTile(
                title: Text("${value.nayaModel[index].title}"),
              ));
            }),
          );
        },
      ),
    );
  }
}
