// flutter
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// constants
import 'package:sonanceep_sns/constants/strings.dart';
import 'package:sonanceep_sns/constants/routes.dart' as routes;
import 'package:sonanceep_sns/models/daw_mobile/daw_mobile_model.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
// model
import 'package:sonanceep_sns/models/main_model.dart';
import 'package:sonanceep_sns/models/themes_model.dart';

class DawSettingsDrawer extends ConsumerWidget {
  const DawSettingsDrawer({
    super.key,
    required this.dawMobileModel,
    required this.screenSize,
  });

  final DawMobileModel dawMobileModel;
  final Size screenSize;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    double bpm = dawMobileModel.bpm;
    int songSections = dawMobileModel.trackSections;
    int? countOfBeat = dawMobileModel.countOfBeat;
    String selectedPhoneticValue = dawMobileModel.selectedPhoneticValue;

    // size
    const double subtitleWidth = 160.0;
    const double titleFontSize = 16.0;
    const double elementTextSize = 24.0;
    const double iconSize = 40.0;
    const double timeSignatureDropdownWidth = 80.0;
    const double timeSignatureDropdownHeight = 40.0;

    return Drawer(
      child: ListView(
        itemExtent: 100,
        children: [
          ListTile(
            title: const Text(bpmSettingTitle, style: TextStyle(fontSize: titleFontSize),),
            subtitle: SizedBox(
              width: subtitleWidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => dawMobileModel.bpmMinus(1),
                    onLongPress: () async => await dawMobileModel.startBpmMinus(),
                    onLongPressEnd: (_) => dawMobileModel.stopBpmFluctuation(),
                    child: const Icon(Icons.arrow_left, size: iconSize,),
                  ),
                  Text('$bpm', style: const TextStyle(fontSize: elementTextSize),),
                  GestureDetector(
                    onTap: () => dawMobileModel.bpmPlus(1),
                    onLongPress: () async => await dawMobileModel.startBpmPlus(),
                    onLongPressEnd: (_) => dawMobileModel.stopBpmFluctuation(),
                    child: const Icon(Icons.arrow_right, size: iconSize,),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            title: const Text(songSectionsTitle, style: TextStyle(fontSize: titleFontSize),),
            subtitle: SizedBox(
              width: subtitleWidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => dawMobileModel.songSectionsMinus(1),
                    onLongPress: () async => await dawMobileModel.startSongSectionsMinus(),
                    onLongPressEnd: (_) => dawMobileModel.stopSongSectionsFluctuation(),
                    child: const Icon(Icons.arrow_left, size: iconSize,),
                  ),
                  Text('$songSections', style: const TextStyle(fontSize: elementTextSize),),
                  GestureDetector(
                    onTap: () => dawMobileModel.songSectionsPlus(1),
                    onLongPress: () async => await dawMobileModel.startSongSectionsPlus(),
                    onLongPressEnd: (_) => dawMobileModel.stopSongSectionsFluctuation(),
                    child: const Icon(Icons.arrow_right, size: iconSize,),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            title: const Text(timeSignatureTitle, style: TextStyle(fontSize: titleFontSize),),
            subtitle: SizedBox(
              width: subtitleWidth,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text('拍数', style: TextStyle(fontSize: titleFontSize),),
                      GestureDetector(
                        onTap: () => dawMobileModel.countOfBeatMinus(),
                        child: const Icon(Icons.arrow_left, size: iconSize,),
                      ),
                      Text('$countOfBeat', style: const TextStyle(fontSize: elementTextSize),),
                      GestureDetector(
                        onTap: () => dawMobileModel.countOfBeatPlus(),
                        child: const Icon(Icons.arrow_right, size: iconSize,),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 16.0),
                        child: Text('音価', style: TextStyle(fontSize: titleFontSize),),
                      ),
                      SizedBox(
                        width: timeSignatureDropdownWidth,
                        height: timeSignatureDropdownHeight,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2<String>(
                            isExpanded: true,
                            hint: const Row(
                              children: [
                                Icon(
                                  Icons.list,
                                  size: 16,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Expanded(
                                  child: Text(
                                    'Select Item',
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            items: phoneticValue.map((String item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            )).toList(),
                            value: selectedPhoneticValue.toString(),
                            onChanged: (String? value) {
                              dawMobileModel.selectTimeSignature(value: value ?? selectedPhoneticValue.toString() ?? 'no select');
                            },
                            buttonStyleData: ButtonStyleData(  // ドロップダウンボタンのスタイルをカスタマイズ
                              height: 48,
                              width: 100,
                              padding: const EdgeInsets.only(left: 16, right: 16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                  color: Colors.white,
                                ),
                                color: Colors.transparent,
                              ),
                              elevation: 2,
                            ),
                            iconStyleData: const IconStyleData(  // ドロップダウンボタンのアイコンのスタイルをカスタマイズ
                              icon: Icon(
                                Icons.arrow_forward_ios_outlined,
                              ),
                              iconSize: 14,
                              iconEnabledColor: Colors.white,
                              iconDisabledColor: Colors.white,
                            ),
                            dropdownStyleData: DropdownStyleData(  // ドロップダウンメニューのスタイルをカスタマイズ
                              maxHeight: 100,
                              width: timeSignatureDropdownWidth,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(
                                  color: Colors.white,
                                ),
                                color: Colors.transparent,
                              ),
                              scrollbarTheme: ScrollbarThemeData(
                                radius: const Radius.circular(40),
                                thickness: MaterialStateProperty.all<double>(6),
                                thumbVisibility: MaterialStateProperty.all<bool>(true),
                              ),
                            ),
                            menuItemStyleData: const MenuItemStyleData(  // ドロップダウンメニューの項目のスタイルをカスタマイズ
                              height: 40,
                              padding: EdgeInsets.only(left: 14, right: 14),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32.0, left: 56.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.download, size: 24.0,),
                  label: Text('バウンス', style: TextStyle(fontSize: 24.0),),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}