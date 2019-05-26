import 'package:recreate_gank/model/DailyResponse.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const double _kMinFlingVelocity = 800.0;

class PhotoView extends StatefulWidget {
  PhotoView({Key key, this.item}) : super(key: key);

  final PostData item;

  @override
  _PhotoViewState createState() => _PhotoViewState();
}

class _PhotoViewState extends State<PhotoView>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<Offset> flingAnimation;

  var offset = Offset.zero;
  var scale = 1.0;
  Offset normalizedOffset;
  double previousScale;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(vsync: this)
      ..addListener(handleFlingAnimation);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void handleFlingAnimation() {
    setState(() {
      offset = flingAnimation.value;
    });
  }

  Offset clampOffset(Offset offset) {
    final Size size = context.size;
    final Offset minOffset = Offset(size.width, size.height) * (1 - scale);
    return Offset(
        offset.dx.clamp(minOffset.dx, 0.0), offset.dy.clamp(minOffset.dy, 0.0));
  }

  void handleOnScaleStart(ScaleStartDetails details) {
    setState(() {
      previousScale = scale;
      normalizedOffset = (details.focalPoint - offset) / scale;

      // The fling animation stops if an input gesture starts.
      controller.stop();
    });
  }

  void handleOnScaleUpdate(ScaleUpdateDetails details) {
    setState(() {
      scale = (previousScale * details.scale).clamp(1.0, 4.0);
      offset = clampOffset(details.focalPoint - normalizedOffset * scale);
    });
  }

  void handleOnScaleEnd(ScaleEndDetails details) {
    final double magnitude = details.velocity.pixelsPerSecond.distance;
    if (magnitude < _kMinFlingVelocity) {
      return;
    }

    final Offset direction = details.velocity.pixelsPerSecond / magnitude;
    final double distance = (Offset.zero & context.size).shortestSide;
    flingAnimation = Tween<Offset>(
            begin: offset, end: clampOffset(offset + direction * distance))
        .animate(controller);
    controller
      ..value = 0.0
      ..fling(velocity: magnitude / 1000.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.item.desc),
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        onScaleStart: handleOnScaleStart,
        onScaleUpdate: handleOnScaleUpdate,
        onScaleEnd: handleOnScaleEnd,
        child: ClipRect(
          child: Transform(
            transform: Matrix4.identity()
              ..translate(offset.dx, offset.dy)
              ..scale(scale),
            child: Stack(
              children: <Widget>[
                Center(child: CupertinoActivityIndicator()),
                Positioned.fill(
                  child: Image.network(widget.item.url, fit: BoxFit.cover),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
