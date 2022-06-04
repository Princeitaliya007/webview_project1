import 'package:flutter/material.dart';
import 'package:mirrorwall_project1/websitepage.dart';

import 'modals/modal.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/' : (context) => HomePage(),
        'browser_page' : (context) => WebsitePage(),
      },
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Education Websites"),
      ),
      body: ListView(
        padding: EdgeInsets.all(25),
        children: webeducation
            .map((e) => InkWell(
          onTap: (){
            Navigator.of(context).pushNamed('browser_page', arguments: e.url);
          },
              child: Container(
                    height: 200,
                    width: 200,
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(e.image),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
            ))
            .toList(),
      ),
    );
  }
}
