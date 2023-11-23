import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/task.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets//theme.dart';

class TaskTile extends StatelessWidget {
  final Task? task;
  const TaskTile(this.task, {super.key});

  get pinkClr => null;

  @override
  Widget build(BuildContext context) {
    return Container(

      padding:
      EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(bottom: 12),
      child: Container(
        padding: EdgeInsets.all(16),
        //  width: SizeConfig.screenWidth * 0.78,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: _getBGClr(task?.color??0),
        ),
        child: Row(children: [

          Expanded(
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(

                  task?.title??"",
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),

                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.access_time_rounded,
                      color: Colors.white,
                      size: 20,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      "${task!.startTime} - ${task!.endTime}",
                      style: GoogleFonts.lato(
                        textStyle:
                        TextStyle(fontSize: 16, color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  task?.note??"",
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(fontSize: 15, color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            height: 60,
            width: 0.5,
            color: Colors.white.withOpacity(0.7),
          ),
          RotatedBox(
            quarterTurns: 3,
            child: Text(
              task!.isCompleted == 1 ? "COMPLETED" : "TODO",
              style: GoogleFonts.lato(
                textStyle: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  _getBGClr(int no) {
    switch (no) {
      case 0:
        return greenClr;
      case 1:
        return pinkClr;
      case 2:
        return yellowClr;
      case 3:
        return bluishClr;
      default:
        return greenClr2;
    }
  }
}