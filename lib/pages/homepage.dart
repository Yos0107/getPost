import 'package:flutter/material.dart';
import 'package:getdatawithpagination/services/provider.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final ScrollController _controller = ScrollController();

  int page = 0;
  int totalPage = 3;
  bool isLoading = false;
  bool isLastPage = false;

  callApi(int page) {
    Provider.of<HamroProvider>(context, listen: false).fetchDatafromApi(page);
  }

  @override
  void initState() {
    callApi(page);
    // print("$page");
    super.initState();
    _controller.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (page < totalPage) {
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        setState(() {
          isLoading = true;
          print("page number: $page");
        });
        page++;
        callApi(page);
        print("$page");
      }
    } else if (page == totalPage) {
      setState(() {
        isLoading = true;
        isLastPage = true;
      });
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Project 2 ")),
      body: Consumer<HamroProvider>(
        builder: (context, value, child) {
          if (value.nayaModel.isNotEmpty) {
            return ListView.builder(
              controller: _controller,
              itemCount: isLoading
                  ? value.nayaModel.length + 1
                  : value.nayaModel.length,
              itemBuilder: ((context, index) {
                if (index < value.nayaModel.length) {
                  return Card(
                    child: ListTile(
                      title: Text("${value.nayaModel[index].name}"),
                      subtitle: Text("${value.nayaModel[index].trips}"),
                      leading: CircleAvatar(
                        child: Text("${index + 1}"),
                      ),
                    ),
                  );
                } else {
                  return isLastPage
                      ? const Card(
                          child: ListTile(
                            title: Text("this is the last page"),
                          ),
                        )
                      : const Center(
                          child: CircularProgressIndicator(),
                        );
                }
              }),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
