import 'package:filsign_learn_app/screens/lessons/alphabet_1/alphabet_1_lesson_1_main_screen.dart';
import 'package:filsign_learn_app/widgets/dialog_widgets/locked_dialog.dart';
import 'package:filsign_learn_app/widgets/progress_painter.dart';
import 'package:flutter/material.dart';

class LessonTile extends StatefulWidget {
  final Color backgroundColor;
  final String lessonImageSrc;
  final String lessonImageSrcLocked;
  final String lessonTitle;
  final String lessonProgress;
  final double progressValue;
  final bool isAvailable;
  final pageRoute;
  const LessonTile(
      {super.key,
      required this.backgroundColor,
      required this.lessonImageSrc,
      required this.lessonTitle,
      required this.lessonProgress,
      this.progressValue = 0.0,
      this.isAvailable = false,
      required this.lessonImageSrcLocked,
      this.pageRoute});

  @override
  State<LessonTile> createState() => _LessonTileState();
}

class _LessonTileState extends State<LessonTile>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

//Show that the tapped lesson is locked
  _showLockedDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return const LockedDialog(
              title: 'LOCKED',
              message: 'Complete the previous lesson to unlocked.',
              buttonText: 'OKAY');
        });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            InkWell(
              onLongPress: () {},
              onTap: () => widget.isAvailable
                  ? Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                      return widget.pageRoute;
                    }))
                  : _showLockedDialog(),
              child: Stack(
                children: [
                  AnimatedBuilder(
                    animation: _controller,
                    builder: (BuildContext context, Widget? child) {
                      return CustomPaint(
                        painter: ProgressPainter(
                          value: widget.progressValue * _controller.value,
                          progressColor: const Color(0xFFFFCD1F),
                        ),
                        child: child,
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.25,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          // Elevation

                          border: Border.all(
                            width: 1.5,
                            color: widget.isAvailable
                                ? Colors.black
                                : const Color.fromARGB(255, 167, 167, 167),
                          ),
                          color: widget.isAvailable
                              ? widget.backgroundColor
                              : const Color(0xFFBCBCBC),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: widget.isAvailable
                              ? Image.asset(widget.lessonImageSrc)
                              : ImageFiltered(
                                  imageFilter:
                                      const ColorFilter.matrix(<double>[
                                    0.2126, 0.7152, 0.0722, 0, 0, // R
                                    0.2126, 0.7152, 0.0722, 0, 0, // G
                                    0.2126, 0.7152, 0.0722, 0, 0, // B
                                    0, 0, 0, 0.2, 0, // A
                                  ]),
                                  child: widget.isAvailable
                                      ? Image.asset(widget.lessonImageSrc)
                                      : Image.asset(
                                          widget.lessonImageSrcLocked),
                                ),
                        ),
                      ),
                    ),
                  ),
                  !widget.isAvailable
                      ? Positioned(
                          left: 0,
                          right: 0,
                          bottom: 0,
                          top: 0,
                          child: Icon(
                            Icons.lock,
                            size: 35,
                            color: Colors.grey[300],
                          ))
                      : const SizedBox(),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.lessonTitle,
              style: TextStyle(
                color:
                    widget.isAvailable ? Colors.black : const Color(0xFFBCBCBC),
              ),
            ),
            Text(
              widget.isAvailable ? widget.lessonProgress : 'LOCKED',
              style: TextStyle(
                fontSize: 12,
                color:
                    widget.isAvailable ? Colors.black : const Color(0xFFBCBCBC),
              ),
            )
          ],
        ));
  }
}
