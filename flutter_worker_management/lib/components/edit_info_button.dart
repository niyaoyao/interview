import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_worker_management/utils/ny_color.dart';

class EditInfoButton extends StatelessWidget {
  final String acceptionRate;
  double? maxWidth;
  VoidCallback? editButtonDidTap;
  EditInfoButton({
    super.key,
    required this.acceptionRate,
    this.editButtonDidTap,
    this.maxWidth,
  });

  @override
  Widget build(BuildContext context) {
    double buttonWidth = 100;
    if (maxWidth != null) {
      buttonWidth = maxWidth!.toDouble();
    }
    return Container(
      width: buttonWidth,
      height: 32,
      child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            DottedBorder(
              color: NYColor.formColor("#007FFF"),
              borderType: BorderType.RRect,
              radius: Radius.circular(4),
              padding: EdgeInsets.all(0),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                child: Container(
                  color: NYColor.formColorAlpha("#007FFF", 0.1),
                ),
              ),
            ),
            Text(
              acceptionRate,
              softWrap: true,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style:
                  TextStyle(fontSize: 12, color: NYColor.formColor("#111111")),
            ),
            Positioned(
                bottom: 2,
                right: 2,
                child: new Image.asset(
                  "assets/icon_text_editor.png",
                  fit: BoxFit.cover,
                  width: 16,
                  height: 16,
                )),
            Positioned(
              top: 0,
              left: 0,
              width: buttonWidth,
              height: 32,
              child: GestureDetector(
                onTap: editButtonDidTap,
              ),
            ),
          ]),
    );
  }
}
