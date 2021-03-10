//importing packages
import 'package:flutter/material.dart';

class CustomDropDown extends StatefulWidget {
  final List<String> titles;
  final dynamic defaulyValue;
  final BorderRadius borderRadius;
  final Color backgroundColor;
  final Color titleColor;
  final Function onChange;

  const CustomDropDown({
    required this.titles,
    required this.defaulyValue,
    required this.borderRadius,
    required this.backgroundColor,
    required this.titleColor,
    required this.onChange,
  });
  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown>
    with SingleTickerProviderStateMixin {
  bool isMenuOpen = false;
  GlobalKey? _dropdownKey;

  late Offset buttonPosition;
  late Size buttonSize;

  late BorderRadius _borderRadius;

  late OverlayEntry _overlayEntry;
  late OverlayState? _overlayState;

  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    _overlayState = Overlay.of(context);

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    _animation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);

    _animationController.addListener(() {
      _overlayState!.setState(() {});
    });
    _borderRadius = widget.borderRadius;
    _dropdownKey = LabeledGlobalKey("button_icon");
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  findButton() {
    RenderBox renderBox =
        _dropdownKey!.currentContext!.findRenderObject() as RenderBox;
    buttonSize = renderBox.size;
    buttonPosition = renderBox.localToGlobal(Offset.zero);
  }

  void closeMenu() {
    _overlayEntry.remove();
    _animationController.reverse();
    isMenuOpen = !isMenuOpen;
  }

  void openMenu() {
    findButton();
    _animationController.forward();
    _overlayEntry = _overlayEntryBuilder();
    _overlayState!.insert(_overlayEntry);
    isMenuOpen = !isMenuOpen;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (isMenuOpen) {
          closeMenu();
        } else {
          openMenu();
        }
      },
      child: Container(
        key: _dropdownKey,
        height: 50,
        decoration: BoxDecoration(
          color: const Color(0xFFE5FAFF),
          borderRadius: _borderRadius,
        ),
        child: Center(
          child: Text(
            '${widget.defaulyValue}',
            style: TextStyle(
              fontSize: 15,
              fontFamily: 'Reglo',
              color: widget.titleColor,
            ),
          ),
        ),
      ),
    );
  }

  OverlayEntry _overlayEntryBuilder() {
    return OverlayEntry(
      builder: (context) {
        return Positioned(
          top: (buttonPosition.dy + buttonSize.height) -
              ((1 - _animation.value) * 20),
          left: buttonPosition.dx,
          width: buttonSize.width,
          child: Material(
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Opacity(
                opacity: _animation.value,
                child: ClipRRect(
                  borderRadius: _borderRadius,
                  child: Container(
                    height: 150,
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: _borderRadius,
                    ),
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(
                          widget.titles.length - 1,
                          (index) {
                            if (widget.titles[index] == widget.defaulyValue)
                              return SizedBox();
                            else {
                              return Container(
                                color: Colors.white,
                                width: buttonSize.width,
                                height: 30,
                                margin: EdgeInsets.symmetric(vertical: 5),
                                child: InkWell(
                                  hoverColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  onTap: () {
                                    widget.onChange(widget.titles[index]);
                                    closeMenu();
                                  },
                                  child: Center(
                                    child: Text(
                                      widget.titles[index],
                                      style: TextStyle(
                                        color: widget.titleColor,
                                        fontFamily: 'Reglo',
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
