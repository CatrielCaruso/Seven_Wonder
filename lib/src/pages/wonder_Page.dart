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
            height: size.height * 0.45,
            child: CustomScrollView(
              slivers: <Widget>[
                _SilverApp(size: size, wonder: wonder),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Icon(Icons.location_pin),
                  SizedBox(
                    width: 10,
                  ),
                  _Country(text: wonder.country),
                  _Country(text: '-'),
                  _Country(text: wonder.city),
                ],
              ),
            ),
          ),
          _Divider(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              '${wonder.description}',
              style: TextStyle(fontSize: 20),
            ),
          ),
          _Divider(),
        ],
      ),
    ));
  }
}

class _Country extends StatelessWidget {
  _Country({
    @required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Text(
      text,
      style: TextStyle(
          color: Colors.black,
          fontSize: size.height * 0.04,
          fontWeight: FontWeight.bold),
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      indent: 20,
      endIndent: 20,
      color: Colors.black,
      height: 10.0,
    );
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
      expandedHeight: size.height * 0.43,
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
