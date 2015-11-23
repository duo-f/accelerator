<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Accelerator</title>
    </head>
    <body>
        <script>
            var parts = window.location.href.split('/');
            var id = parts[parts.length - 1];

            var ws = new WebSocket('ws://{{IP}}:8080');

            function deviceMotionHandler(e) {
               accel = {id: id, x: e.accelerationIncludingGravity.x, y: e.accelerationIncludingGravity.y, z: e.accelerationIncludingGravity.z }
               ws.send(JSON.stringify(accel));
            }

            if (window.DeviceMotionEvent) {
               console.log('orientation and motion supported');
               window.addEventListener('devicemotion', deviceMotionHandler);
            } else {
               alert('Esto no funciona en este browser')
            }
        </script>
    </body>
</html>
