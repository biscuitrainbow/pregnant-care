import 'package:flutter/material.dart';
import 'package:extended_image/extended_image.dart';

class ZoomableImage extends StatefulWidget {
  final String path;
  final Function(bool) onCanScrollChanged;

  const ZoomableImage({
    Key key,
    @required this.path,
    this.onCanScrollChanged,
  }) : super(key: key);

  @override
  _ZoomableImageState createState() => _ZoomableImageState();
}

class _ZoomableImageState extends State<ZoomableImage> {
  bool _canScroll = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: _canScroll ? ClampingScrollPhysics() : NeverScrollableScrollPhysics(),
      child: ExtendedImage.asset(
        this.widget.path,
        mode: ExtendedImageMode.gesture,
        fit: BoxFit.cover,
        initGestureConfigHandler: (state) {
          return GestureConfig(
            minScale: 1.0,
            animationMinScale: 0.7,
            maxScale: 3.0,
            animationMaxScale: 3.5,
            speed: 1.0,
            inertialSpeed: 100.0,
            initialScale: 1.0,
            inPageView: true,
            initialAlignment: InitialAlignment.topCenter,
          );
        },
        onDoubleTap: (state) {
          state.handleDoubleTap(
            scale: state.gestureDetails.totalScale > 1.0 ? 1.0 : 2.0,
          );

          setState(() {
            _canScroll = state.gestureDetails.totalScale <= 1.0;
          });

          this.widget.onCanScrollChanged(_canScroll);
        },
      ),
    );
  }
}
