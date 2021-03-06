import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'homepage.dart';
import 'weather_viewmodel.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

 

 
  @override
  Widget build(BuildContext context) {
    return new TheViewModel( 
                  theModel:  new WeatherViewModel(),child: 
                  new MaterialApp(
                    title: 'Flutter Demo',
                    home: new HomePage()


                  ),
    );
  }
}


// This might seem a bit odd
// InheritedWidgets allow you to propagate values down the widgettree. 
// it can then be accessed by just writing  TheViewModel.of(context)
class TheViewModel extends InheritedWidget
{
  final WeatherViewModel theModel;

  const TheViewModel({Key key, 
                      @required 
                      this.theModel, 
                      @required 
                      Widget child}) :  assert(theModel != null),assert(child != null),
                      super(key: key, child: child);

  static WeatherViewModel of(BuildContext context) => (context.inheritFromWidgetOfExactType(TheViewModel)as TheViewModel).theModel;                  


  @override
  bool updateShouldNotify(TheViewModel oldWidget) => theModel != oldWidget.theModel;
  
}

