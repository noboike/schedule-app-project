import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'uiAnimation.dart';
import 'glob.dart';

class animationPlayer extends StatefulWidget {
  const animationPlayer({super.key});

  @override
  State<animationPlayer> createState() => _animationPlayerState();
}

class _animationPlayerState extends State<animationPlayer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    _controller.addListener(() {
      context.read<glob>().globPlayAnimations();
    });
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}



class notifyBox extends StatelessWidget {
  final dynamic type;
  final String text;
  const notifyBox({super.key, this.type = 'alert', required this.text});

  @override
  Widget build(BuildContext context) {
    var ratio = MediaQuery.of(context).size.width / 428;
    Color color1 = type == 'success'
        ? Color.fromRGBO(60, 134, 80, 1)
        : type == 'error'
            ? Color.fromRGBO(134, 60, 60, 1)
            : Color.fromRGBO(192, 108, 61, 1);
    Color color2 = type == 'success'
        ? Color.fromRGBO(40, 99, 57, 1)
        : type == 'error'
            ? Color.fromRGBO(91, 39, 39, 1)
            : Color.fromRGBO(128, 77, 48, 1);
    ratio = ratio > 1 ? 1 : ratio;
    ratio *= 1.5;
    return Positioned(
      top: context.watch<glob>().box['y'] * ratio,
      left: MediaQuery.of(context).size.width / 2 -
          (context.watch<glob>().box['w'] / 2) * ratio,
      child: Container(
        width: context.watch<glob>().box['w'] * ratio,
        height: 38.0 * ratio,
        decoration: BoxDecoration(
          color: color1,
          borderRadius: BorderRadius.circular(50 * ratio),
        ),
        child: Stack(
          children: [
            Align(
              alignment: context.watch<glob>().app_language == 'arabic' ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(
                width: 28 * ratio,
                height: 28 * ratio,
                margin: EdgeInsets.only(
                  right: context.watch<glob>().app_language == 'arabic' ? 5 * ratio : 0,
                  left: context.watch<glob>().app_language != 'arabic' ? 5 * ratio : 0,
                ),
                decoration: BoxDecoration(
                    color: color2,
                    borderRadius: BorderRadius.circular(28 * ratio)),
                child: Center(
                  child: Icon(
                    type == 'success'
                        ? Icons.done
                        : type == 'error'
                            ? Icons.close
                            : Icons.priority_high,
                    size: 16 * ratio,
                    color: type == 'success'
                        ? Color.fromRGBO(125, 255, 154, 1)
                        : type == 'error'
                            ? Color.fromRGBO(255, 125, 125, 1)
                            : Color.fromRGBO(222, 162, 128, 1),
                  ),
                ),
              ),
            ),
            Align(
              alignment: context.watch<glob>().app_language == 'arabic' ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(
                width: 142 * ratio,
                height: 28 * ratio,
                margin: EdgeInsets.only(
                  right: context.watch<glob>().app_language == 'arabic' ? 41 * ratio : 0,
                  left: context.watch<glob>().app_language != 'arabic' ? 41 * ratio : 0,
                ),
                child: Center(
                    child: Opacity(
                  opacity: context.watch<glob>().box['opacity'],
                  child: Text(
                    text,
                    style: TextStyle(color: Colors.white, fontSize: 14 * ratio, fontFamily: context.watch<glob>().app_language),
                    textAlign: TextAlign.center,
                  ),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
