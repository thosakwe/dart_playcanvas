import 'dart:html';
import 'dart:js';
import 'package:js/js.dart';
import 'package:playcanvas/playcanvas.dart' as pc;

void main() {
  // Create a PlayCanvas application
  var canvas = document.getElementById('application');
  var app = new pc.Application(canvas)..start();

  // Fill the available space at full resolution
  app.setCanvasFillMode(pc.FILLMODE_FILL_WINDOW);
  app.setCanvasResolution(pc.RESOLUTION_AUTO);

  // Ensure the canvas is resized when window changes size
  window.onResize.listen((_) => app.resizeCanvas());

  // Create box entity
  var cube = new pc.Entity('cube');
  cube.addComponent(
    'model',
    new pc.ComponentOptions(
      type: 'box',
    ),
  );

  // Create camera entity
  var camera = new pc.Entity('camera');
  camera.addComponent(
    'camera',
    new pc.ComponentOptions(
      clearColor: new pc.Color(0.1, 0.1, 0.1),
    ),
  );

  // Create directional light entity
  var light = new pc.Entity('light');
  light.addComponent('light');

  // Set ambient light color
  app.scene.ambientLight = new pc.Color(0.2, 0.2, 0.2);

  // Add to hierarchy
  app.root.addChild(cube);
  app.root.addChild(camera);
  app.root.addChild(light);

  // Set up initial positions and orientations
  camera.setPosition(0, 0, 3);
  light.setEulerAngles(45, 0, 0);

  // Register a global update event
  app.on('update', allowInterop((deltaTime) {
    cube.rotate(10 * deltaTime, 20 * deltaTime, 30 * deltaTime);
  }));
}
