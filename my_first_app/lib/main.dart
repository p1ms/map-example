import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(MyApp());

//
//
//class ExampleApp extends StatelessWidget{
//
//  void _answerQuestion(westionNumber){
//    print('westion number = $westionNumber');
//  }
//
//  Widget build(BuildContext context) {
//    var question = [
//      'Wuestion 1',
//      'Westion 2',
//      'Westion 3'
//    ];
//
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//            centerTitle: true,
//            title: Text('Title app bar'),
//         ),
//         body: Column(
//           children: <Widget>[
//              Text('Westion n'),
//             RaisedButton(
//                 child: Text('westion 1'),
//                 onPressed: null
//             ),
//             RaisedButton(
//                 child: Text('westion 2'),
//                 onPressed: null
//             ),
//             RaisedButton(
//                 child: Text('westion 3'),
//                 onPressed: null
//             ),
//             RaisedButton(
//                 child: Text('westion 4'),
//                 onPressed: null
//             )
//           ],
//         )
//       )
//     );
//  }
//}
//
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  GoogleMapController mapController;

  LatLng _center = LatLng(45.521563, -122.677433);
  LatLng _dragLocation = LatLng(45.521563, -122.677433);
  List<Placemark> _placemarks = [];
  String address = "default address";

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
//            Text(
//                address,
//              style: TextStyle(
//                fontSize: 18
//              ),
//            ),
//            Text(
//              '$_counter',
//              style: Theme.of(context).textTheme.headline4,
//            ),
            Container(
              width: 500,
              height: 500,
              child: GoogleMap(
                  onCameraIdle: () async => {
                        setState(() {
                          print('onCameraIdle');
                          _center = _dragLocation;
                        }),
                        _placemarks = await Geolocator()
                            .placemarkFromCoordinates(
                                _center.latitude, _center.longitude),
                        setState(() {
                          address = '${_placemarks[0].country}, '
//                        '${_placemarks[0].position}, '
                              '${_placemarks[0].locality}, '
                              '${_placemarks[0].administrativeArea}, '
                              '${_placemarks[0].postalCode}, '
                              '${_placemarks[0].name}, '
                              '${_placemarks[0].subAdministrativeArea}, '
                              '${_placemarks[0].isoCountryCode}, '
//                        '${_placemarks[0].subLocality}, '
//                        '${_placemarks[0].subThoroughfare}, '
                              '${_placemarks[0].thoroughfare}';
                          print(_placemarks[0].country);
                          print(_placemarks[0].position);
                          print(_placemarks[0].locality);
                          print(_placemarks[0].administrativeArea);
                          print(_placemarks[0].postalCode);
                          print(_placemarks[0].name);
                          print(_placemarks[0].subAdministrativeArea);
                          print(_placemarks[0].isoCountryCode);
                          print(_placemarks[0].subLocality);
                          print(_placemarks[0].subThoroughfare);
                          print(_placemarks[0].thoroughfare);
                        })
                      },
                  onCameraMove: (cameraPos) => {
                        _dragLocation = cameraPos.target,
                        print('camera position = '
                            '${cameraPos.target.latitude}, '
                            '${cameraPos.target.longitude}')
                      },
                  onCameraMoveStarted: () => {print('onCameraMoveStarted')},
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: _center,
                    zoom: 17.0,
                  ),
                  markers: Set<Marker>.of(
                    <Marker>[
                      Marker(
                          onTap: () {
                            print('Tapped');
                          },
                          draggable: true,
                          markerId: MarkerId('Marker'),
                          position: _dragLocation ?? _center,
                          onDragEnd: ((value) {
                            print(
                                'values is ${value.latitude}, ${value.longitude}');
                            setState(() {
                              print(
                                  'setState inDragEnd is ${value.latitude}, ${value.longitude}');
                              _dragLocation = value;
                            });
                          }))
                    ],
                  )),
            ),
            Text(
              address,
              style: TextStyle(
                  fontSize: 18
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
