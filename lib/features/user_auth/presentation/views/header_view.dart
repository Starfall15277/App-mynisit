import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../view_models/app_view_model.dart';
import 'bottom_sheets/delete_bottom_sheet_view.dart';
import 'bottom_sheets/settings_bottom_sheet_view.dart';

class HeaderView extends StatelessWidget {
  const HeaderView({super.key});

  @override
  Widget build(BuildContext context) {
    // รับข้อมูลจาก Theme
    ThemeData theme = Theme.of(context);

    return Consumer<AppViewModel>(
      builder: (context, viewModel, child) {
        Color iconColor = theme.brightness == Brightness.light
            ? Colors.black // สีของไอคอนในโหมดสว่าง
            : Colors.white; // สีของไอคอนในโหมดมืด
        double iconSize = theme.brightness == Brightness.light
            ? 28.0 // ขนาดไอคอนในโหมดสว่าง
            : 28.0; // ขนาดไอคอนในโหมดมืด

        return Row(
          children: [
            Expanded(
              flex: 4,
              child: Container(
                margin: EdgeInsets.only(left: 20),
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: FittedBox(
                          fit: BoxFit.fitHeight,
                          child: Text("Welcome back,",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: theme.textTheme.bodyText1?.color,
                              )),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: FittedBox(
                          fit: BoxFit.fitHeight,
                          child: Text(
                            viewModel.username,
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: theme.textTheme.bodyText1?.color,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Trash Icon
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: () {
                  HapticFeedback.mediumImpact();
                  viewModel.bottomSheetBuilder(DeleteBottomSheetView(), context);
                },
                child: Transform.scale(
                  scale: 1.4, // ปรับขนาดไอคอนตามที่ต้องการ
                  child: Icon(
                    Icons.delete,
                    color: iconColor, // ใช้สีของไอคอนตามโหมด
                    size: 22.5, // ใช้ขนาดของไอคอนตามโหมด
                  ),
                ),
              ),
            ),
            // Settings Icon
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: () {
                  HapticFeedback.mediumImpact();
                  viewModel.bottomSheetBuilder(SettingsBottomSheetView(), context);
                },
                child: Transform.scale(
                  scale: 1.4, // ปรับขนาดไอคอนตามที่ต้องการ
                  child: Icon(
                    Icons.edit,
                    color: iconColor, // ใช้สีของไอคอนตามโหมด
                    size: 22.5, // ใช้ขนาดของไอคอนตามโหมด
                  ),
                ),
              ),
            ),
            Divider(
              color: Colors.black, // สีของเส้นแบ่ง
            ),
          ],
        );
      },
    );

  }
}
