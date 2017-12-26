@JS('pc')
library playcanvas;

import 'dart:html';
import 'package:func/func.dart';
import 'package:js/js.dart';

@JS()
external int get FILLMODE_FILL_WINDOW;

@JS()
external int get RESOLUTION_AUTO;

@JS()
class Application {
  external factory Application(CanvasElement canvas,
      [ApplicationOptions options]);
  external Entity get root;
  external Scene get scene;
  external void fire(String type, event);
  external void on(String type, Func1 callback, [target]);
  external void resizeCanvas();
  external void setCanvasFillMode(int fillMode);
  external void setCanvasResolution(int resolution, [num width, num height]);
  external void start();
}

@JS()
@anonymous
class ApplicationOptions {}

@JS()
class Color {
  external factory Color(num r, num g, num b);
  external num get r;
  external num get g;
  external num get b;
}

@JS()
@anonymous
class ComponentOptions {
  external factory ComponentOptions({Color clearColor, String type});
}

@JS()
class Entity extends GraphNode {
  external factory Entity(String name);
  external void addComponent(String type, [ComponentOptions options]);
  external void rotate(num x, num y, num z);
  external void setEulerAngles(num x, num y, num z);
  external void setPosition(num x, num y, num z);
}

@JS()
class GraphNode {
  external void addChild(GraphNode child);
}

@JS()
class Scene {
  external Color get ambientLight;
  external void set ambientLight(Color v);
}