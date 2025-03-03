import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sonanceep_sns/constants/colors.dart';
import 'package:sonanceep_sns/constants/doubles.dart';
import 'package:sonanceep_sns/constants/strings.dart';
import 'package:sonanceep_sns/constants/voids.dart';
import 'package:sonanceep_sns/domain/track/track.dart';
import 'package:sonanceep_sns/models/daw_mobile/daw_mobile_model.dart';

class TrackBandLeft extends ConsumerWidget {
  const TrackBandLeft({
    super.key,
    required this.leftTrackScrollController,
    required this.tracks,
    required this.trackSize,
    required this.trackPanelMaxWidth,
    required this.dawMobileModel,
  });

  final ScrollController leftTrackScrollController;
  final List<Track> tracks;
  final Size trackSize;
  final double trackPanelMaxWidth;
  final DawMobileModel dawMobileModel;

  // @override
//   TrackBandLeftState createState() {
//     return TrackBandLeftState();
//   }
// }

// class TrackBandLeftState extends State<TrackBandLeft> {

  // TrackBandLeftState({
  //   required this.leftTrackScrollController,
  //   required this.tracks,
  //   required this.trackSize,
  //   required this.trackPanelMaxWidth,
  //   required this.dawMobileModel,
  // });

  // final ScrollController leftTrackScrollController;
  // final List<Track> tracks;
  // final Size trackSize;
  // final double trackPanelMaxWidth;
  // final DawMobileModel dawMobileModel;

  @override
  // Widget build(BuildContext context) {
    Widget build(BuildContext context, WidgetRef ref) {

    // final ScrollController leftTrackScrollController = widget.leftTrackScrollController;
    // final List<Track> tracks = widget.tracks;
    // final Size trackSize = widget.trackSize;
    // final double trackPanelMaxWidth = widget.trackPanelMaxWidth;
    // final DawMobileModel dawMobileModel = widget.dawMobileModel;

    final int trackCount = tracks.length;

    return Expanded(
      child: SingleChildScrollView(  // 左側の縦ScrollView
        controller: leftTrackScrollController,
        child: Column(
          children: List.generate(trackCount, (index) {  // track追加用の+1
            Track thisTrack = tracks[index];
            bool solo = thisTrack.soloMuteRec[0];
            bool mute = thisTrack.soloMuteRec[1];
            bool rec = thisTrack.soloMuteRec[2];
            return Column(
              children: [
                Container(  // trackの左側のサイズ
                  // height: trackHeight,
                  width: trackPanelMaxWidth,
                  color: Colors.blueGrey[800],
                  child: SizedBox(
                    height: trackSize.height ,
                    width: trackPanelMaxWidth,
                    child: index != trackCount-1  // 最後のtrackはtrack追加用
                    ? Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0, bottom: 0.0, left: 16.0),
                            child: Text('${thisTrack.trackName}', style: TextStyle(color: Colors.white),),
                          ),
                          Row(
                            children: [
                              // ミュート
                              SizedBox(
                                width: trackPanelMaxWidth/7,
                                height: trackPanelMaxWidth/7,
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: mute ? Colors.cyan : Colors.transparent, //ボタンの色
                                    // backgroundColor: index != 2 ? Colors.transparent : Colors.cyan, //ボタンの色
                                    fixedSize: const Size(6.0, 6.0), //ボタンのサイズ
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(5)),
                                    ),
                                  ),
                                  onPressed: () {
                                    dawMobileModel.isMute(index: index);
                                  },
                                  child: const Text(dawMuteText, style: TextStyle(color: Colors.white),),
                                ),
                              ),
                              // ソロ
                              SizedBox(
                                width: trackPanelMaxWidth/7,
                                height: trackPanelMaxWidth/7,
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: solo ? Colors.amber : Colors.transparent, //ボタンの色
                                    fixedSize: const Size(6.0, 6.0), //ボタンのサイズ
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(5)),
                                    ),
                                  ),
                                  onPressed: () {
                                    dawMobileModel.isSolo(index: index);
                                  },
                                  child: const Text(dawSoloText, style: TextStyle(color: Colors.white),),
                                ),
                              ),
                              
                              // ボリュームスライダー
                              SizedBox(
                                width: trackPanelMaxWidth/2,
                                child: Slider(
                                  value: tracks[index].trackVolume,
                                  min: 0,
                                  max: 100,
                                  divisions: 100,
                                  onChanged: (double value) {
                                    dawMobileModel.trackVolumeChange(index: index, volume: value);
                                    // setState(() {
                                    // });
                                  },
                                ),
                              ),
                              // REC
                              SizedBox(
                                width: trackPanelMaxWidth/7,
                                height: trackPanelMaxWidth/7,
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: rec ? Colors.red : Colors.transparent, //ボタンの色
                                    fixedSize: const Size(6.0, 6.0), //ボタンのサイズ
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(5)),
                                    ),
                                  ),
                                  onPressed: () {
                                    dawMobileModel.isRec(index: index);
                                  },
                                  child: const Text(dawRecText, style: TextStyle(color: Colors.white),),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                    // track追加用
                    : Center(
                      child: FloatingActionButton(
                        onPressed: () async => await dawMobileModel.trackCountPlusOne(),
                        child: const Icon(Icons.add),
                      ),
                    )
                  ),
                ),
                const Divider(color: dividerColor, height: dividerHeightAndThickness, thickness: dividerHeightAndThickness),
              ],
            );
          }),
        ),
      ),
    );
  }
}