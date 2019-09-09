import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dio/dio.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xffe6020a),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final dio = new Dio(); // for http requests
  Widget _appBarTitle = new Text('Anime List...');
  Icon _searchIcon = new Icon(Icons.search);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildBar(context),
      body: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
      Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        child: new FittedBox(
          child: Material(
              color: Colors.white,
              elevation: 14.0,
              borderRadius: BorderRadius.circular(24.0),
              shadowColor: Color(0x802196F3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: myDetailsContainer1(),
                    ),
                  ),

                  Container(
                    width: 250,
                    height: 200,
                    child: ClipRRect(
                      borderRadius: new BorderRadius.circular(24.0),
                      child: Image(
                        fit: BoxFit.contain,
                        alignment: Alignment.topRight,
                        image: NetworkImage(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSqfM7fCXYqmso2rerLKvKuU4ldYVtz3AdJ5Gi3e4o8igDCY5AQ6g"),
                      ),
                    ),),
                ],)
          ),
        ),
      ),
    ),
    ],
    ),
    );
  }

    Widget myDetailsContainer1() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Container(child: Text("Tokyo Ghoul",
              style: TextStyle(color: Color(0xffe6020a), fontSize: 24.0,fontWeight: FontWeight.bold),)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[


                    Container(child: Text("Great Anime \u00B7 4.6 stars",
                      style: TextStyle(color: Colors.black54, fontSize: 18.0,),)),
                  ],)),
          ),
          Container(child: Text("Horror \u00B7 Dark",
            style: TextStyle(color: Colors.black54, fontSize: 18.0,fontWeight: FontWeight.bold),)),
        ],
      );
    }

    Widget _buildBar(BuildContext context) {
      return new AppBar(
        centerTitle: true,
        title: _appBarTitle,
        leading: new IconButton(
          icon: _searchIcon,
          onPressed: _searchPressed,

        ),
      );
    }

    void _searchPressed() {
      setState(() {
        if (this._searchIcon.icon == Icons.search) {
          this._searchIcon = new Icon(Icons.close);
          this._appBarTitle = new TextField(
            decoration: new InputDecoration(
                prefixIcon: new Icon(Icons.search),
                hintText: 'Search...'
            ),
          );
        } else {
          this._searchIcon = new Icon(Icons.search);
          this._appBarTitle = new Text('Search Example');
        }
      });
    }
}
