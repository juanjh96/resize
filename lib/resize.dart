import 'package:flutter/material.dart';

class ResizeInheritedWidget extends InheritedWidget {
  ResizeInheritedWidget({
    @required this.child,
    this.resizeBloc,
  });

  @override
  final Widget child;
  final ResizeBloc resizeBloc;

  static ResizeInheritedWidget of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType();

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;
}

class BuilderMaterialApp {
  static Widget resizeTablet(BuildContext context, Widget child) {
    final _shortestSide = MediaQuery.of(context).size.shortestSide;
    if (_shortestSide < 600) {
      return child;
    } else {
      return ResizeInheritedWidget(
        resizeBloc: ResizeBloc(),
        child: ResizeTable(
          child: child,
        ),
      );
    }
  }
}

class ResizeBloc extends ChangeNotifier {
  bool flag = false;
  double padding;

  @override
  void notifyListeners() {
    super.notifyListeners();
  }
}

class ResizeTable extends StatelessWidget {
  const ResizeTable({Key key, this.child}) : super(key: key);

  final Widget child;
  @override
  Widget build(BuildContext context) {
    final _resizeBloc = ResizeInheritedWidget.of(context).resizeBloc;
    final _mediaQuery = MediaQuery.of(context).size;
    return Stack(
      children: [
        AnimatedBuilder(
          animation: _resizeBloc,
          child: child,
          builder: (context, childAnimated) {
            if (_resizeBloc.flag) {
              _resizeBloc.padding = _mediaQuery.width * 0.12;
            } else {
              _resizeBloc.padding = _mediaQuery.width * 0.25;
            }
            return Center(
              child: AnimatedContainer(
                height: double.infinity,
                width: double.infinity,
                padding: EdgeInsets.all(_resizeBloc.padding),
                duration: const Duration(milliseconds: 250),
                child: SetResizeTablet(
                  child: childAnimated,
                ),
              ),
            );
          },
        ),
        Positioned(
          bottom: 30,
          right: 30,
          child: SizedBox(
            height: _mediaQuery.width * 0.11,
            width: _mediaQuery.width * 0.11,
            child: FloatingActionButton(
              child: Icon(
                Icons.fullscreen_exit_sharp,
                size: _mediaQuery.width * 0.07,
                color: Colors.white54,
              ),
              backgroundColor: Colors.white.withOpacity(0.2),
              onPressed: () {
                _resizeBloc.flag = !_resizeBloc.flag;
                _resizeBloc.notifyListeners();
              },
            ),
          ),
        )
      ],
    );
  }
}

class SetResizeTablet extends StatelessWidget {
  SetResizeTablet({
    Key key,
    @required this.child,
  }) : super(key: key);

  final Widget child;
  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context);
    return FittedBox(
      child: Container(
        width: 411.0,
        height: 731.0,
        child: MediaQuery(
          data: _mediaQuery.copyWith(
            size: Size(411.0, 731.0),
            padding: EdgeInsets.zero,
            viewInsets: EdgeInsets.zero,
            viewPadding: EdgeInsets.zero,
            devicePixelRatio: 1.0,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(
              _mediaQuery.size.width * 0.02,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
