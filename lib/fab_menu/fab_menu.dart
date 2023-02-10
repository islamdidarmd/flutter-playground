import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FabMenu extends StatefulWidget {
  const FabMenu({Key? key}) : super(key: key);

  @override
  _FabMenuState createState() => _FabMenuState();
}

class _FabMenuState extends State<FabMenu>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<int> _animation;

  bool isOpen = false;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 200));
    final curve = CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn);
    _animation = IntTween(begin: 0, end: 300).animate(curve);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Floating Menu Example')),
      body: Container(
        color: Colors.amber,
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            if (kDebugMode) {
              print('Animation value ${_animation.value}');
            }
            return Stack(
              children: [
                Positioned(
                  right: 16,
                  bottom: (_animation.value / 2) + 40,
                  child: FloatingActionButton(
                    onPressed: () {},
                    child: const Icon(Icons.edit_attributes),
                  ),
                ),
                Positioned(
                  right: 16,
                  bottom: (_animation.value / 4) + 40,
                  child: FloatingActionButton(
                    onPressed: () {},
                    child: const Icon(Icons.account_circle),
                  ),
                ),
                Positioned(
                  bottom: 40,
                  right: 16,
                  child: Transform.rotate(
                    angle: -(_animation.value / 20),
                    child: FloatingActionButton(
                      onPressed: () {
                        if (isOpen) {
                          _animationController.reverse();
                        } else {
                          _animationController.forward();
                        }
                        this.isOpen = !this.isOpen;
                      },
                      child: this.isOpen ? Icon(Icons.add) : Icon(Icons.menu),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}