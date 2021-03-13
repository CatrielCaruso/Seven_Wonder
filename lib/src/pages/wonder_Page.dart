import 'package:flutter/material.dart';
import 'package:seven_wonder/src/model/modelWonder.dart';

class WonderPage extends StatelessWidget {
  final Wonder wonder;

  WonderPage({this.wonder});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: size.height * 0.4,
            child: CustomScrollView(
              slivers: <Widget>[
                _SilverApp(size: size, wonder: wonder),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.location_pin),
                SizedBox(
                  width: 20,
                ),
                Text(
                  '${wonder.country}',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  '-',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  '${wonder.city}',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Divider(
            indent: 20,
            endIndent: 20,
            color: Colors.black,
            height: 5.0,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              '${wonder.description}',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Divider(
            indent: 20,
            endIndent: 20,
            color: Colors.black,
            height: 5.0,
          ),
        ],
      ),
    ));
  }
}

class _SilverApp extends StatelessWidget {
  const _SilverApp({
    Key key,
    @required this.size,
    @required this.wonder,
  }) : super(key: key);

  final Size size;
  final Wonder wonder;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_rounded,
          size: 40.0,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      pinned: false,
      snap: false,
      floating: true,
      expandedHeight: size.height * 0.4,
      flexibleSpace: FlexibleSpaceBar(
        title: Text('${wonder.name}'),
        background: Hero(
          tag: wonder.id,
          child: Image.network(
            wonder.image,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}