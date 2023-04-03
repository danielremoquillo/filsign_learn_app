import 'package:filsign_learn_app/screens/lessons/alphabet_1/alphabet_1_lesson_1_main_screen.dart';
import 'package:filsign_learn_app/widgets/dialog_widgets/locked_dialog.dart';
import 'package:filsign_learn_app/widgets/progress_painter.dart';
import 'package:flutter/material.dart';

class SubLessonTile extends StatefulWidget {
  final Color backgroundColor;
  final String lessonImageSrc;
  final String lessonImageSrcLocked;
  final String lessonTitle;
  final double progressValue;
  final bool isAvailable;
  final bool isEnd;
  final bool isStart;
  final pageRoute;
  const SubLessonTile(
      {super.key,
      required this.backgroundColor,
      required this.lessonImageSrc,
      required this.lessonTitle,
      this.progressValue = 0.0,
      this.isAvailable = false,
      required this.lessonImageSrcLocked,
      this.pageRoute,
      this.isEnd = false,
      this.isStart = false});

  @override
  State<SubLessonTile> createState() => _SubLessonTileState();
}

class _SubLessonTileState extends State<SubLessonTile>
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
    return Column(
      children: [
        GestureDetector(
          onTap: () => widget.isAvailable
              ? Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return widget.pageRoute;
                }))
              : _showLockedDialog(),
          child: Row(
            children: [
              Stack(
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
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 1.5,
                          color: widget.isAvailable || widget.isStart
                              ? Colors.black
                              : const Color.fromARGB(255, 167, 167, 167),
                        ),
                        color: widget.isAvailable || widget.isStart
                            ? widget.backgroundColor
                            : const Color(0xFFBCBCBC),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: widget.isAvailable || widget.isStart
                            ? Image.asset(widget.lessonImageSrc)
                            : ImageFiltered(
                                imageFilter: const ColorFilter.matrix(<double>[
                                  0.2126, 0.7152, 0.0722, 0, 0, // R
                                  0.2126, 0.7152, 0.0722, 0, 0, // G
                                  0.2126, 0.7152, 0.0722, 0, 0, // B
                                  0, 0, 0, 0.2, 0, // A
                                ]),
                                child: widget.isAvailable || widget.isStart
                                    ? Image.asset(widget.lessonImageSrc)
                                    : Image.asset(widget.lessonImageSrcLocked),
                              ),
                      ),
                    ),
                  ),
                  !widget.isAvailable && !widget.isStart
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
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.lessonTitle,
                      style: TextStyle(
                          fontSize: 15,
                          color: widget.isAvailable || widget.isStart
                              ? Colors.black
                              : Colors.grey[400])),
                  if (widget.isAvailable && !widget.isEnd)
                    Text(
                      widget.progressValue == 1
                          ? 'COMPLETED'
                          : 'PROGRESS : ${widget.progressValue}',
                      style: TextStyle(
                          fontSize: 12,
                          color: widget.progressValue == 1
                              ? Color(0xFFFFCD1F)
                              : const Color(0xFF01CF8E)),
                    ),
                  if (widget.isAvailable && widget.isEnd)
                    Text(
                      widget.progressValue == 1
                          ? 'COMPLETED'
                          : 'CLAIM YOUR REWARDS',
                      style: TextStyle(
                          fontSize: 12,
                          color: widget.isAvailable || widget.isStart
                              ? const Color(0xFF01CF8E)
                              : Colors.grey[400]),
                    ),
                  if (!widget.isAvailable)
                    Text(
                      'LOCKED',
                      style: TextStyle(fontSize: 12, color: Colors.grey[400]),
                    ),
                ],
              ),
            ],
          ),
        ),
        widget.isEnd
            ? const SizedBox()
            : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.10,
                    child: VerticalDivider(
                      color: widget.isAvailable || widget.isStart
                          ? Colors.black
                          : const Color.fromARGB(255, 167, 167, 167),
                      width: MediaQuery.of(context).size.width * 0.25,
                      thickness: 2,
                    ),
                  ),
                ],
              ),
      ],
    );
  }
}
