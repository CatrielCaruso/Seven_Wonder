import 'package:flutter/material.dart';
import 'package:seven_wonder/src/model/modelWonder.dart';
import 'package:seven_wonder/src/pages/wonder_Page.dart';

import 'package:vertical_card_pager/vertical_card_pager.dart';

import 'package:seven_wonder/src/services.dart';

class Principal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Siete maravillas'),
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: getWonder(),
          //initialData: InitialData,
          // ignore: missing_return
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              return _VerticalPage(snapshot.data);
            }
          },
        ),
      ),
    );
  }
}

class _VerticalPage extends StatelessWidget {
  final List<Wonder> wonders;

  _VerticalPage(this.wonders);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            child: VerticalCardPager(
              textStyle:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              titles: _title(wonders),
              images: _images(),
              onPageChanged: (page) {
                print(page);
              },
              onSelectedItem: (index) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WonderPage(
                      wonder: wonders[index],
                    ),
                  ),
                );

                // Navigator.push(
                //   context,
                //   PageRouteBuilder(
                //     pageBuilder: (context, a, b) => WonderPage(
                //       wonder: wonders[index],
                //     ),
                //   ),
                // );
              },
            ),
          ),
        ),
      ],
    );
  }

  List<String> _title(wonders) {
    List<String> titles = [];

    for (int i = 0; i < wonders.length; i++) {
      titles.add(wonders[i].name);
    }

    return titles;
  }

  List<Widget> _images() {
    return wonders.map((e) {
      return ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Hero(
            tag: e.id,
            child: Image.network(
              e.image,
              fit: BoxFit.fill,
            ),
          ));
    }).toList();
  }
}

// ListWheelScrollView(
//           itemExtent: 100,
//           children: <Widget>[
//             Text('hola'),
//             Text('hola'),
//           ],
//         )
