import 'package:flutter/material.dart';

class GameContainer extends StatefulWidget {
  GameContainer({
    required this.height,
    required this.width,
    required this.color,
    required this.shadowColor,
    required this.imageUrl,
    required this.name,
  });

  final height;
  final width;

  final Color color;
  final Color shadowColor;

  final String name;
  final String imageUrl;

  @override
  _GameContainerState createState() => _GameContainerState();
}

class _GameContainerState extends State<GameContainer> {
  bool isAdded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          print('${widget.name}');
          isAdded = !isAdded;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: isAdded ? widget.color : Colors.grey.withOpacity(.7),
          boxShadow: [
            BoxShadow(
              color:
                  isAdded ? widget.shadowColor : Colors.black.withOpacity(.5),
              blurRadius: 20,
            )
          ],
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Image.asset(
            widget.imageUrl,
            fit: BoxFit.contain,
            color: isAdded ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
