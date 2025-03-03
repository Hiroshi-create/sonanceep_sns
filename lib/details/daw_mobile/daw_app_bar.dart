import 'package:decorated_icon/decorated_icon.dart';
import 'package:flutter/material.dart';
import 'package:sonanceep_sns/details/daw_mobile/daw_settings_drawer.dart';
import 'package:sonanceep_sns/details/icons/my_flutter_icons_icons.dart';
import 'package:sonanceep_sns/details/sns_drawer.dart';
import 'package:sonanceep_sns/models/daw_mobile/daw_mobile_model.dart';


class DawAppBar extends StatelessWidget {
  const DawAppBar({
    super.key,
    required this.dawMobileModel,
    required this.trackWidth,
  });

  final DawMobileModel dawMobileModel;
  final double trackWidth;

  @override
  Widget build(BuildContext context) {

    return MediaQuery.of(context).orientation != Orientation.landscape ? AppBar() : AppBar(  // 横向きの画面かどうかを判別する
      title: Row(
        children: [
          Text('DTM'),
          Padding(
            padding: const EdgeInsets.only(left: 32.0),
            child: GestureDetector(
              onTap: () {},
              child: const RotatedBox(
                quarterTurns: 1,
                child: Icon(Icons.tune, size: 32.0),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: GestureDetector(
              onTap: () {},
              child: const Icon(Icons.folder, size: 32.0),
            ),
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Center(
            child: InkWell(
              onTap: () => dawMobileModel.isClickFlipBool(),
              child: DecoratedIcon(
                MyFlutterIcons.metronomicon,
                color: dawMobileModel.isClick ? Colors.blue : Colors.white,
                size: 24,
                shadows: const [
                  BoxShadow(
                    color: Colors.lightBlue,
                    blurRadius: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () => {},
        ),
        IconButton(
          icon: const Icon(Icons.remove),
          onPressed: () => {},
        ),
        IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () => Scaffold.of(context).openEndDrawer(),
        ),
      ],
      flexibleSpace: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {},
              iconSize: 48.0,
              icon: const Icon(Icons.skip_previous),
              color: Colors.blue,
            ),
            IconButton(
              key: const Key('play_button'),
              onPressed: () async => await dawMobileModel.play(trackWidth: trackWidth),
              iconSize: 48.0,
              icon: const Icon(Icons.play_arrow),
              color: Colors.blue,
            ),
            IconButton(
              key: const Key('stop_button'),
              onPressed: () async => await dawMobileModel.stop(),
              iconSize: 48.0,
              icon: const Icon(Icons.fiber_manual_record),
              color: Colors.red,
            ),
          ],
        ),
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}