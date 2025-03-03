import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:sonanceep_sns/constants/voids.dart' as voids;
import 'package:sonanceep_sns/details/rounded_button.dart';

class CustomFlutterSlider extends StatefulWidget {
  final Key? key;
  final Axis axis;
  final double? handlerWidth;
  final double? handlerHeight;
  final FlutterSliderHandler? handler;
  final FlutterSliderHandler? rightHandler;
  final FlutterSliderHandler? playbackPositionHandler;
  final Function(int handlerIndex, dynamic lowerValue, dynamic upperValue)?
      onDragStarted;
  final Function(int handlerIndex, dynamic lowerValue, dynamic upperValue)?
      onDragCompleted;
  final Function(int handlerIndex, dynamic lowerValue, dynamic upperValue)?
      onDragging;
  final double? min;
  final double? max;
  final List<double> values;
  final List<FlutterSliderFixedValue>? fixedValues;
  final bool rangeSlider;
  final bool playbackPositionBar;
  final bool rtl;
  final bool jump;
  final bool selectByTap;
  final List<FlutterSliderIgnoreSteps> ignoreSteps;
  final bool disabled;
  final double? touchSize;
  final bool visibleTouchArea;
  final double minimumDistance;
  final double maximumDistance;
  final FlutterSliderHandlerAnimation handlerAnimation;
  final FlutterSliderTooltip? tooltip;
  final FlutterSliderTrackBar trackBar;
  final FlutterSliderStep step;
  final FlutterSliderHatchMark? hatchMark;
  final bool centeredOrigin;
  final bool lockHandlers;
  final double? lockDistance;
  final BoxDecoration? decoration;
  final BoxDecoration? foregroundDecoration;
  final Widget Function(bool slidingByActiveTrackBar)? soundFileWidget;

  CustomFlutterSlider({
    this.key,
    this.min,
    this.max,
    required this.values,
    this.fixedValues,
    this.axis = Axis.horizontal,
    this.handler,
    this.rightHandler,
    this.playbackPositionHandler,
    this.handlerHeight,
    this.handlerWidth,
    this.onDragStarted,
    this.onDragCompleted,
    this.onDragging,
    this.rangeSlider = false,
    this.playbackPositionBar = false,
    this.rtl = false,
    this.jump = false,
    this.ignoreSteps = const [],
    this.disabled = false,
    this.touchSize,
    this.visibleTouchArea = false,
    this.minimumDistance = 0,
    this.maximumDistance = 0,
    this.tooltip,
    this.trackBar = const FlutterSliderTrackBar(),
    this.handlerAnimation = const FlutterSliderHandlerAnimation(),
    this.selectByTap = true,
    this.step = const FlutterSliderStep(),
    this.hatchMark,
    this.centeredOrigin = false,
    this.lockHandlers = false,
    this.lockDistance,
    this.decoration,
    this.foregroundDecoration,
    this.soundFileWidget,
  })
      : assert(touchSize == null || (touchSize >= 4 && touchSize <= 50)),
        assert((ignoreSteps.length > 0 && step.rangeList == null) ||
            (ignoreSteps.length == 0)),
        assert((step.rangeList != null &&
                minimumDistance == 0 &&
                maximumDistance == 0) ||
            (minimumDistance > 0 && step.rangeList == null) ||
            (maximumDistance > 0 && step.rangeList == null) ||
            (step.rangeList == null)),
        assert(centeredOrigin == false ||
            (centeredOrigin == true &&
                rangeSlider == false &&
                lockHandlers == false &&
                minimumDistance == 0 &&
                maximumDistance == 0)),
        assert(lockHandlers == false ||
            (centeredOrigin == false &&
                (ignoreSteps.length == 0) &&
                (fixedValues == null || fixedValues.length == 0) &&
                rangeSlider == true &&
                values.length > 1 &&
                lockHandlers == true &&
                lockDistance != null &&
                step.rangeList == null &&
                lockDistance >=
                    step.step /* && values[1] - values[0] == lockDistance*/)),
        assert(
            fixedValues != null || (min != null && max != null && min <= max),
            "Min and Max are required if fixedValues is null"),
        assert(
            rangeSlider == false || (rangeSlider == true && values.length > 1),
            "Range slider needs two values"),
//        assert( fixedValues == null || (fixedValues != null && values[0] >= 0 && values[0] <= 100), "When using fixedValues, you should set values within the range of fixedValues" ),
//        assert( fixedValues == null || (fixedValues != null && values.length > 1 && values[1] >= values[0] && values[1] <= 100), "When using fixedValues, you should set values within the range of fixedValues" ),
        super(key: key);

  @override
  _CustomFlutterSliderState createState() => _CustomFlutterSliderState();
}

class _CustomFlutterSliderState extends State<CustomFlutterSlider>
    with TickerProviderStateMixin {
  bool __isInitCall = true;

  double? _touchSize;

  late Widget leftHandler;
  late Widget rightHandler;
  late Widget playbackPositionHandler;

  double? _leftHandlerXPosition = 0;
  double? _rightHandlerXPosition = 0;
  double? _playbackPositionHandlerXPosition = 0;
  double? _leftHandlerYPosition = 0;
  double? _rightHandlerYPosition = 0;
  double? _playbackPositionHandlerYPosition = 0;

  double? _lowerValue = 0;
  double? _upperValue = 0;
  double? _playbackValue = 0;
  dynamic _outputLowerValue = 0;
  dynamic _outputUpperValue = 0;
  dynamic _outputPlaybackValue = 0;

  double? _realMin;
  double? _realMax;

  late double _divisions;
  double _handlersPadding = 0;

  GlobalKey leftHandlerKey = GlobalKey();
  GlobalKey rightHandlerKey = GlobalKey();
  GlobalKey playbackPositionHandlerKey = GlobalKey();
  GlobalKey containerKey = GlobalKey();
  GlobalKey leftTooltipKey = GlobalKey();
  GlobalKey rightTooltipKey = GlobalKey();

  double? _handlersWidth;
  double? _handlersHeight;

  late double _constraintMaxWidth;
  late double _constraintMaxHeight;

  double? _containerWidthWithoutPadding;
  double? _containerHeightWithoutPadding;

  double _containerLeft = 0;
  double _containerTop = 0;

  late FlutterSliderTooltip _tooltipData;

  late List<Function> _positionedItems;

  double _rightTooltipOpacity = 0;
  double _leftTooltipOpacity = 0;
  double _playbackPositionTooltipOpacity = 0;

  late AnimationController _rightTooltipAnimationController;
  Animation<Offset>? _rightTooltipAnimation;
  late AnimationController _leftTooltipAnimationController;
  Animation<Offset>? _leftTooltipAnimation;
  late AnimationController _playbackPositionTooltipAnimationController;
  Animation<Offset>? _playbackPositionTooltipAnimation;

  AnimationController? _leftHandlerScaleAnimationController;
  Animation<double>? _leftHandlerScaleAnimation;
  AnimationController? _rightHandlerScaleAnimationController;
  Animation<double>? _rightHandlerScaleAnimation;
  AnimationController? _playbackPositionHandlerScaleAnimationController;
  Animation<double>? _playbackPositionHandlerScaleAnimation;

  double? _containerHeight;
  double? _containerWidth;

  int _decimalScale = 0;

  double xDragTmp = 0;
  double yDragTmp = 0;

  double? xDragStart;
  double? yDragStart;

  double? _widgetStep;
  double? _widgetMin;
  double? _widgetMax;
  List<FlutterSliderIgnoreSteps> _ignoreSteps = [];
  List<FlutterSliderFixedValue> _fixedValues = [];

  List<Positioned> _points = [];

  bool __dragging = false;

  double? __dAxis,
      __rAxis,
      __axisDragTmp,
      __axisPosTmp,
      __containerSizeWithoutPadding,
      __rightHandlerPosition,
      __leftHandlerPosition,
      __playbackHandlerPosition,
      __containerSizeWithoutHalfPadding;

  Orientation? oldOrientation;

  double __lockedHandlersDragOffset = 0;
  double? _distanceFromRightHandler, _distanceFromLeftHandler;
  double _handlersDistance = 0;

  bool _slidingByActiveTrackBar = false;
  bool _leftTapAndSlide = false;
  bool _rightTapAndSlide = false;
  bool _trackBarSlideOnDragStartedCalled = false;

  @override
  void initState() {
    initMethod();

    super.initState();
  }

  @override
  void didUpdateWidget(CustomFlutterSlider oldWidget) {
    __isInitCall = false;

    initMethod();
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _rightTooltipAnimationController.dispose();
    _leftTooltipAnimationController.dispose();
    _playbackPositionTooltipAnimationController.dispose();
    _leftHandlerScaleAnimationController!.dispose();
    _rightHandlerScaleAnimationController!.dispose();
    _playbackPositionHandlerScaleAnimationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
         // 以前の画面の向きを記憶
        oldOrientation ??= MediaQuery.of(context).orientation;

        return LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            // コンテナの最大幅と最大高さを取得する
            _constraintMaxWidth = constraints.maxWidth;
            _constraintMaxHeight = constraints.maxHeight;
            // コンテナのパディングを除いた幅と高さを計算する
            _containerWidthWithoutPadding = _constraintMaxWidth - _handlersWidth!;
            _containerHeightWithoutPadding = _constraintMaxHeight - _handlersHeight!;

            // スライダーに適切なサイズを見つける
            double? sliderProperSize = _findProperSliderSize();
            if(widget.axis == Axis.vertical) {  // スライダーが垂直方向の場合
              double layoutWidth = constraints.maxWidth;
              if(layoutWidth == double.infinity) {
                layoutWidth = 0;
              }
              // コンテナのパディングを除いたサイズを高さに設定する
              __containerSizeWithoutPadding = _containerHeightWithoutPadding;
              // コンテナの幅はスライダーのサイズとレイアウトの幅のうち大きい方に設定する
              _containerWidth = [(sliderProperSize! * 2), layoutWidth].reduce(max);
              // コンテナの高さはレイアウトの高さに設定する
              _containerHeight = constraints.maxHeight;
            } else {  // スライダーが水平方向の場合
              double layoutHeight = constraints.maxHeight;
              if (layoutHeight == double.infinity) {
                layoutHeight = 0;
              }
              // コンテナの幅はレイアウトの幅に設定する
              _containerWidth = constraints.maxWidth;
              // コンテナの高さはスライダーのサイズとレイアウトの高さのうち大きい方に設定する
              _containerHeight = [(sliderProperSize! * 2), layoutHeight].reduce(max);
              // コンテナのパディングを除いたサイズを幅に設定する
              __containerSizeWithoutPadding = _containerWidthWithoutPadding;
            }

            // 画面の向きが変わった場合
            if(MediaQuery.of(context).orientation != oldOrientation) {
              // ハンドルの位置を初期化
              _leftHandlerXPosition = 0;
              _rightHandlerXPosition = 0;
              _leftHandlerYPosition = 0;
              _rightHandlerYPosition = 0;
              _playbackPositionHandlerXPosition = 0;
              _playbackPositionHandlerYPosition = 0;

              // レンダリングボックスを初期化する
              _renderBoxInitialization();

              // ハンドルの位置を調整する
              _arrangeHandlersPosition();

              // 目盛りを描画する
              _drawHatchMark();

              // 画面の向きを記憶しておく
              oldOrientation = MediaQuery.of(context).orientation;
            }

            return Container(
              key: containerKey,
              height: _containerHeight,
              width: _containerWidth,
              foregroundDecoration: widget.foregroundDecoration,
              decoration: widget.decoration,
              child: Stack(
                clipBehavior: Clip.none,
                children: drawHandlers(),  // レンジスライダーの構成要素
              ),
            );
          },
        );
      },
    );
  }

  double? _findProperSliderSize() {
    List<double?> sizes = [
      widget.trackBar.activeTrackBarHeight,
      widget.trackBar.inactiveTrackBarHeight
    ];
    if (widget.axis == Axis.horizontal) {
      sizes.add(_handlersHeight);
    } else {
      sizes.add(_handlersWidth);
    }

    return sizes.reduce((value, element) => max(value!, element!));
  }

  void initMethod() {
    _widgetMax = widget.max;  // ウィジェットの最大値を取得
    _widgetMin = widget.min;  // ウィジェットの最小値を取得

    _touchSize = widget.touchSize ?? 15;  // タッチサイズを設定。デフォルトは15

    // validate inputs
    _validations();  // 入力値の検証

    // to display min of the range correctly.
    // if we use fakes, then min is always 0
    // so calculations works well, but when we want to display
    // result numbers to user, we add ( _widgetMin ) to the final numbers

    //    if(widget.axis == Axis.vertical) {
    //      animationStart = Offset(0.20, 0);
    //      animationFinish = Offset(-0.52, 0);
    //    }

    // 初期化時に呼ばれるかどうか
    if (__isInitCall) {
      // 左側のハンドラのスケールアニメーションコントローラを作成
      _leftHandlerScaleAnimationController = AnimationController(duration: widget.handlerAnimation.duration, vsync: this);
      // 右側のハンドラのスケールアニメーションコントローラを作成
      _rightHandlerScaleAnimationController = AnimationController(duration: widget.handlerAnimation.duration, vsync: this);
      // 再生時のハンドラのスケールアニメーションコントローラを作成
      _playbackPositionHandlerScaleAnimationController = AnimationController(duration: widget.handlerAnimation.duration, vsync: this);
    }

    _leftHandlerScaleAnimation = Tween(
      begin: 1.0,
      end: widget.handlerAnimation.scale
    ).animate( // 左側のハンドラのスケールアニメーションを設定
      CurvedAnimation(
        parent: _leftHandlerScaleAnimationController!,
        reverseCurve: widget.handlerAnimation.reverseCurve,
        curve: widget.handlerAnimation.curve, 
      )
    );
    _rightHandlerScaleAnimation = Tween(
      begin: 1.0,
      end: widget.handlerAnimation.scale
    ).animate(  // 右側のハンドラのスケールアニメーションを設定
      CurvedAnimation(
        parent: _rightHandlerScaleAnimationController!,
        reverseCurve: widget.handlerAnimation.reverseCurve,
        curve: widget.handlerAnimation.curve,
      )
    );
    _playbackPositionHandlerScaleAnimation = Tween(
      begin: 1.0,
      end: widget.handlerAnimation.scale
    ).animate( // 左側のハンドラのスケールアニメーションを設定
      CurvedAnimation(
        parent: _playbackPositionHandlerScaleAnimationController!,
        reverseCurve: widget.handlerAnimation.reverseCurve,
        curve: widget.handlerAnimation.curve, 
      )
    );

    _setParameters();
    _setValues();

    if (widget.rangeSlider == true && widget.maximumDistance > 0 && (_upperValue! - _lowerValue!) > widget.maximumDistance) {
      throw 'lower and upper distance is more than maximum distance';  // 最大距離を超えた場合はエラーを投げる
    }
    if (widget.rangeSlider == true && widget.minimumDistance > 0 && (_upperValue! - _lowerValue!) < widget.minimumDistance) {
      throw 'lower and upper distance is less than minimum distance';  // 最小距離より小さい場合はエラーを投げる
    }

    Offset animationStart = Offset(0, 0);  // アニメーションの開始位置
    if (widget.tooltip != null &&
        widget.tooltip!.disableAnimation != null &&
        widget.tooltip!.disableAnimation!) {
      animationStart = Offset(0, -1);  // アニメーションを無効にする場合は開始位置を変更
    }

    Offset? animationFinish;  // アニメーションの終了位置
    switch (_tooltipData.direction) {  // ツールチップの方向によって終了位置を決める
      case FlutterSliderTooltipDirection.top:
        animationFinish = Offset(0, -1);
        break;
      case FlutterSliderTooltipDirection.left:
        animationFinish = Offset(-1, 0);
        break;
      case FlutterSliderTooltipDirection.right:
        animationFinish = Offset(1, 0);
        break;
      default:
        animationFinish = Offset.zero;
        break;
    }

    if (__isInitCall) {  // 初期化時に呼ばれるかどうか
      _rightTooltipOpacity = (_tooltipData.alwaysShowTooltip == true) ? 1 : 0;  // 右側のツールチップの不透明度を設定。常に表示する場合は1、そうでない場合は0
      _leftTooltipOpacity = (_tooltipData.alwaysShowTooltip == true) ? 1 : 0;  // 左側のツールチップの不透明度を設定。常に表示する場合は1、そうでない場合は0
      _playbackPositionTooltipOpacity = (_tooltipData.alwaysShowTooltip == true) ? 1 : 0;  // 左側のツールチップの不透明度を設定。常に表示する場合は1、そうでない場合は0

      _leftTooltipAnimationController = AnimationController(duration: Duration(milliseconds: 200), vsync: this);  // 左側のツールチップのアニメーションコントローラを作成
      _rightTooltipAnimationController = AnimationController(duration: Duration(milliseconds: 200), vsync: this);  // 右側のツールチップのアニメーションコントローラを作成
      _playbackPositionTooltipAnimationController = AnimationController(duration: Duration(milliseconds: 200), vsync: this);  // 再生時のツールチップのアニメーションコントローラを作成
    } else {
      if (_tooltipData.alwaysShowTooltip!) {
        _rightTooltipOpacity = _leftTooltipOpacity = _playbackPositionTooltipOpacity = 1;  // 常に表示する場合は不透明度を1にする
      }
    }

    _leftTooltipAnimation = Tween<Offset>(begin: animationStart, end: animationFinish).animate(
      CurvedAnimation(
        parent: _leftTooltipAnimationController,
        curve: Curves.fastOutSlowIn,  // 左側のツールチップのアニメーションを設定
      )
    );

    _rightTooltipAnimation = Tween<Offset>(begin: animationStart, end: animationFinish).animate(
      CurvedAnimation(
        parent: _rightTooltipAnimationController,
        curve: Curves.fastOutSlowIn,  // 右側のツールチップのアニメーションを設定
      )
    );

    _playbackPositionTooltipAnimation = Tween<Offset>(begin: animationStart, end: animationFinish).animate(
      CurvedAnimation(
        parent: _playbackPositionTooltipAnimationController,
        curve: Curves.fastOutSlowIn,  // 左側のツールチップのアニメーションを設定
      )
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _renderBoxInitialization();  // レンダリングボックスの初期化を行う

      _arrangeHandlersPosition();  // ハンドラの位置を調整する

      _drawHatchMark();  // 目盛りを描画する

      setState(() {});  // 状態を更新する
    });
  }

  void _drawHatchMark() {
    if (widget.hatchMark == null || widget.hatchMark!.disabled) return;  // widget.hatchMarkがnullまたは無効化されている場合
    _points = [];


    // widget.trackBarの非アクティブなトラックバーの高さとアクティブなトラックバーの高さのうち、大きい方をmaxTrackBarHeightという変数に代入する
    double maxTrackBarHeight = [
      widget.trackBar.inactiveTrackBarHeight,
      widget.trackBar.activeTrackBarHeight
    ].reduce(max);

    // FlutterSliderHatchMarkというクラスのインスタンスをhatchMarkという変数に代入する
    FlutterSliderHatchMark hatchMark = FlutterSliderHatchMark();
    // hatchMarkのプロパティをwidget.hatchMarkのプロパティに合わせる
    hatchMark.disabled = widget.hatchMark!.disabled;
    hatchMark.density = widget.hatchMark!.density;
    hatchMark.linesDistanceFromTrackBar = widget.hatchMark!.linesDistanceFromTrackBar ?? 0;
    hatchMark.labelsDistanceFromTrackBar = widget.hatchMark!.labelsDistanceFromTrackBar ?? 0;
    hatchMark.smallLine = widget.hatchMark!.smallLine ?? const FlutterSliderSizedBox(
      height: 5,
      width: 1,
      decoration: BoxDecoration(color: Colors.black45)
    );
    hatchMark.bigLine = widget.hatchMark!.bigLine ?? const FlutterSliderSizedBox(
      height: 9,
      width: 2,
      decoration: BoxDecoration(color: Colors.black45)
    );
    hatchMark.labelBox = widget.hatchMark!.labelBox ?? const FlutterSliderSizedBox(height: 50, width: 50);
    hatchMark.labels = widget.hatchMark!.labels ?? null;
    hatchMark.linesAlignment = widget.hatchMark!.linesAlignment;
    hatchMark.displayLines = widget.hatchMark!.displayLines ?? false;

    // hatchMarkが表示される場合
    if (hatchMark.displayLines!) {
      double percent = 100 * hatchMark.density;  //hatchMarkの密度に応じたパーセント値を代入
      double barWidth, barHeight, distance;
      double? linesTop, linesLeft, linesRight, linesBottom;

      // スライダーが水平の場合
      if (widget.axis == Axis.horizontal) {
        //  top = hatchMark.linesDistanceFromTrackBar - 2.25;
        // distanceという変数にスライダーの幅からハンドラーの幅を引いた値をpercentで割った値を代入する。これは、各ハッチマークの間隔を表す。
        distance = ((_constraintMaxWidth - _handlersWidth!) / percent);
      } else {  // スライダーの軸が垂直な場合
        //  left = hatchMark.linesDistanceFromTrackBar - 3.62;
        // distanceという変数にスライダーの高さからハンドラーの高さを引いた値をpercentで割った値を代入する。これは、各ハッチマークの間隔を表す。
        distance = ((_constraintMaxHeight - _handlersHeight!) / percent);
      }

      Alignment linesAlignment;
      if (widget.axis == Axis.horizontal) {  // スライダーの軸が水平な場合
        // ハッチマークが左側にある場合
        if (hatchMark.linesAlignment == FlutterSliderHatchMarkAlignment.left) {
          linesAlignment = Alignment.bottomCenter;  // linesAlignmentに下中央を表す値を代入する
        } else {  // ハッチマークが右側にある場合
          linesAlignment = Alignment.topCenter;  // linesAlignmentに上中央を表す値を代入する
        }
      } else {  // スライダーの軸が垂直な場合
        // ハッチマークが左側にある場合
        if (hatchMark.linesAlignment == FlutterSliderHatchMarkAlignment.left) {
          linesAlignment = Alignment.centerRight;  // linesAlignmentに中央右を表す値を代入する
        } else {  // ハッチマークが右側にある場合
          linesAlignment = Alignment.centerLeft;  // linesAlignmentに中央左を表す値を代入する
        }
      }

      // ハッチマークを表示するためのウィジェットをbarLineという変数に代入する
      Widget barLine;
      for (int p = 0; p <= percent; p++) {
        // barLineBoxという変数にhatchMarkのsmallLineプロパティを代入する
        FlutterSliderSizedBox? barLineBox = hatchMark.smallLine;

        if (p % 5 - 1 == -1) {
          barLineBox = hatchMark.bigLine;
        }

        if (widget.axis == Axis.horizontal) {
          barHeight = barLineBox!.height;
          barWidth = barLineBox.width;
        } else {
          barHeight = barLineBox!.width;
          barWidth = barLineBox.height;
        }

        barLine = Align(
          alignment: linesAlignment,
          child: Container(
            decoration: barLineBox.decoration,
            foregroundDecoration: barLineBox.foregroundDecoration,
            transform: barLineBox.transform,
            height: barHeight,
            width: barWidth,
          ),
        );

        if (widget.axis == Axis.horizontal) {
          //  left = (p * distance) + _handlersPadding - labelBoxHalfSize - 0.5;
          linesLeft = (p * distance) + _handlersPadding - 0.75;
          if (hatchMark.linesAlignment == FlutterSliderHatchMarkAlignment.right) {
            linesTop = _containerHeight! / 2 + maxTrackBarHeight / 2 + 2;
            linesBottom = _containerHeight! / 2 - maxTrackBarHeight - 15;
          } else {
            linesTop = _containerHeight! / 2 - maxTrackBarHeight - 15;
            linesBottom = _containerHeight! / 2 + maxTrackBarHeight / 2 + 2;
          }
          if (hatchMark.linesAlignment == FlutterSliderHatchMarkAlignment.left)
            linesBottom += hatchMark.linesDistanceFromTrackBar!;
          else
            linesTop += hatchMark.linesDistanceFromTrackBar!;
        } else {
          linesTop = (p * distance) + _handlersPadding - 0.5;
          if (hatchMark.linesAlignment == FlutterSliderHatchMarkAlignment.right) {
            linesLeft = _containerWidth! / 2 + maxTrackBarHeight / 2 + 2;
            linesRight = _containerWidth! / 2 - maxTrackBarHeight - 15;
          } else {
            linesLeft = _containerWidth! / 2 - maxTrackBarHeight - 15;
            linesRight = _containerWidth! / 2 + maxTrackBarHeight / 2 + 2;
          }
          if (hatchMark.linesAlignment == FlutterSliderHatchMarkAlignment.left)
            linesRight += hatchMark.linesDistanceFromTrackBar!;
          else
            linesLeft += hatchMark.linesDistanceFromTrackBar!;
        }

        _points.add(Positioned(
          top: linesTop,
          bottom: linesBottom,
          left: linesLeft,
          right: linesRight,
          child: barLine
        ));
      }
    }

    if (hatchMark.labels != null && hatchMark.labels!.length > 0) {
      List<Widget> labelWidget = [];
      Widget? label;
      double labelBoxHalfSize;
      double? top, left, bottom, right;
      double? tr;
      for (FlutterSliderHatchMarkLabel markLabel in hatchMark.labels!) {
        label = markLabel.label;
        tr = markLabel.percent;
        labelBoxHalfSize = 0;

        if (widget.rtl) tr = 100 - tr!;

        if (widget.axis == Axis.horizontal) {
          labelBoxHalfSize = hatchMark.labelBox!.width / 2 - 0.5;
        } else {
          labelBoxHalfSize = hatchMark.labelBox!.height / 2 - 0.5;
        }

        labelWidget = [
          Container(
            height: widget.axis == Axis.vertical
                ? hatchMark.labelBox!.height
                : null,
            width: widget.axis == Axis.horizontal
                ? hatchMark.labelBox!.width
                : null,
            decoration: hatchMark.labelBox!.decoration,
            foregroundDecoration: hatchMark.labelBox!.foregroundDecoration,
            transform: hatchMark.labelBox!.transform,
            child: Align(alignment: Alignment.center, child: label),
          )
        ];

        Widget bar;
        if (widget.axis == Axis.horizontal) {
          bar = Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: labelWidget,
          );
          left = tr! * _containerWidthWithoutPadding! / 100 - 0.5 + _handlersPadding - labelBoxHalfSize;
          //  left = (tr * distance) + _handlersPadding - labelBoxHalfSize - 0.5;

          top = hatchMark.labelsDistanceFromTrackBar;
          bottom = 0;
        } else {
          bar = Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: labelWidget,
          );
          top = tr! * _containerHeightWithoutPadding! / 100 - 0.5 + _handlersPadding - labelBoxHalfSize;
          right = 0;
          left = hatchMark.labelsDistanceFromTrackBar;
        }

        _points.add(Positioned(
          top: top, bottom: bottom, left: left, right: right, child: bar
        ));
      }
    }
  }

  void _validations() {
    if (widget.rangeSlider == true && widget.playbackPositionBar == false && widget.values.length < 2)
      throw 'when range mode is true, slider needs both lower and upper values';
    if (widget.rangeSlider == true && widget.playbackPositionBar == true && widget.values.length < 3)
      throw 'when range mode and playback position is true, slider needs lower, upper values and playback position';


    if (widget.fixedValues == null) {
      if (widget.values[0] < _widgetMin!)
        throw 'Lower value should be greater than min';

      if (widget.rangeSlider == true) {
        if (widget.values[1] > _widgetMax!)
          throw 'Upper value should be smaller than max';
      }
      if (widget.playbackPositionBar == true)
        if (widget.values.last > _widgetMax! || widget.values.last < _widgetMin!)
          throw 'Playback position should be within the range';

    } else {
      if (!(widget.fixedValues != null &&
          widget.values[0] >= 0 &&
          widget.values[0] <= 100)) {
        throw 'When using fixedValues, you should set values within the range of fixedValues';
      }

      int val = widget.playbackPositionBar == true ? 2 : 1;
      if (widget.rangeSlider == true && widget.values.length > val) {
        if (!(widget.fixedValues != null &&
            widget.values[1] >= 0 &&
            widget.values[1] <= 100)) {
          throw 'When using fixedValues, you should set values within the range of fixedValues';
        }

        if (widget.playbackPositionBar == true) {
          if (!(widget.fixedValues != null &&
            widget.values.last >= 0 &&
            widget.values.last <= 100)) {
          throw 'When using fixedValues, you should set values within the range of fixedValues';
          }
        }
      }
    }

    if (widget.rangeSlider == true) {
      if (widget.values[0] > widget.values[1])
        throw 'Lower value must be smaller than upper value';
    }
  }

  void _setParameters() {
    _realMin = 0;
    _widgetMax = widget.max;
    _widgetMin = widget.min;

    _ignoreSteps = [];

    if (widget.fixedValues != null && widget.fixedValues!.length > 0) {  // 固定値がある場合
      _realMax = 100;
      _realMin = 0;
      _widgetStep = 1;
      _widgetMax = 100;
      _widgetMin = 0;

      List<double> fixedValuesIndices = [];
      for (FlutterSliderFixedValue fixedValue in widget.fixedValues!) {
        fixedValuesIndices.add(fixedValue.percent!.toDouble());
      }

      double lowerIgnoreBound = -1;
      double upperIgnoreBound;
      List<double> fixedV = [];
      for (double fixedPercent = 0; fixedPercent <= 100; fixedPercent++) {
        dynamic fValue = '';
        for (FlutterSliderFixedValue fixedValue in widget.fixedValues!) {
          if (fixedValue.percent == fixedPercent.toInt()) {
            fixedValuesIndices.add(fixedValue.percent!.toDouble());
            fValue = fixedValue.value;

            upperIgnoreBound = fixedPercent;
            if (fixedPercent > lowerIgnoreBound + 1 || lowerIgnoreBound == 0) {
              if (lowerIgnoreBound > 0) lowerIgnoreBound += 1;
              upperIgnoreBound = fixedPercent - 1;
              _ignoreSteps.add(FlutterSliderIgnoreSteps(
                  from: lowerIgnoreBound, to: upperIgnoreBound));
            }
            lowerIgnoreBound = fixedPercent;
            break;
          }
        }
        _fixedValues.add(FlutterSliderFixedValue(
            percent: fixedPercent.toInt(), value: fValue));
        if (fValue.toString().isNotEmpty) {
          fixedV.add(fixedPercent);
        }
      }

      double? biggestPoint = _findBiggestIgnorePoint(ignoreBeyondBoundaries: true);  // 無視するステップの中で最も大きいポイントを探す
      if (!fixedV.contains(100)) {  // 固定値のリストに100が含まれていない場合
        _ignoreSteps.add(FlutterSliderIgnoreSteps(from: biggestPoint! + 1, to: 101));  // 無視するステップのリストに最大値から101までを追加
      }
    } else {
      _realMax = _widgetMax! - _widgetMin!;
      _widgetStep = widget.step.step;
    }

    _ignoreSteps.addAll(widget.ignoreSteps);  // ウィジェットの無視するステップをリストに追加

    _handlersWidth = widget.handlerWidth ?? widget.handlerHeight ?? 35;  // ハンドラの幅を設定。ウィジェットの幅がなければ高さを、高さもなければ35を使う
    _handlersHeight = widget.handlerHeight ?? widget.handlerWidth ?? 35;  // ハンドラの高さを設定。ウィジェットの高さがなければ幅を、幅もなければ35を使う

    _setDivisionAndDecimalScale();  // 小数点と分割数を設定する

    _positionedItems = [  // 配置するアイテムのリストに左右のハンドラのウィジェットを追加
      _leftHandlerWidget,
      _rightHandlerWidget,
      _playbackHandlerWidget,
    ];

    FlutterSliderTooltip widgetTooltip = widget.tooltip ?? FlutterSliderTooltip();

    _tooltipData = FlutterSliderTooltip();
    // ツールチップのボックススタイルを設定。ウィジェットのボックススタイルがなければデフォルトのスタイルを使う
    _tooltipData.boxStyle = widgetTooltip.boxStyle ?? FlutterSliderTooltipBox(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12, width: 0.5),
        color: Color(0xffffffff),
      )
    );
    // ツールチップのテキストスタイルを設定。
    _tooltipData.textStyle = widgetTooltip.textStyle ?? TextStyle(fontSize: 12, color: Colors.black38);
    // ツールチップの左側の接頭辞を設定
    _tooltipData.leftPrefix = widgetTooltip.leftPrefix ?? null;
    // ツールチップの左側の接尾辞を設定。
    _tooltipData.leftSuffix = widgetTooltip.leftSuffix ?? null;
    // ツールチップの右側の接頭辞を設定。
    _tooltipData.rightPrefix = widgetTooltip.rightPrefix ?? null;
    // ツールチップの右側の接尾辞を設定。
    _tooltipData.rightSuffix = widgetTooltip.rightSuffix ?? null;
    // ツールチップを常に表示するかどうかを設定。
    _tooltipData.alwaysShowTooltip = widgetTooltip.alwaysShowTooltip ?? false;
    // ツールチップを無効にするかどうかを設定。
    _tooltipData.disabled = widgetTooltip.disabled ?? false;
    // ツールチップのアニメーションを無効にするかどうかを設定。
    _tooltipData.disableAnimation = widgetTooltip.disableAnimation ?? false;
    // ツールチップの方向を設定。
    _tooltipData.direction = widgetTooltip.direction ?? FlutterSliderTooltipDirection.top;
    // ツールチップの位置オフセットを設定。
    _tooltipData.positionOffset = widgetTooltip.positionOffset ?? null;
    // ツールチップのフォーマットを設定。
    _tooltipData.format = widgetTooltip.format ?? null;
    // ツールチップのカスタムウィジェットを設定。
    _tooltipData.custom = widgetTooltip.custom ?? null;

    // ハンドラのZインデックスを調整する
    _arrangeHandlersZIndex();
    // ハンドラを生成する
    _generateHandler();

    // ハンドラの距離を設定。
    _handlersDistance = widget.lockDistance ?? _upperValue! - _lowerValue!;
  }

  void _setDivisionAndDecimalScale() {
    _divisions = _realMax! / _widgetStep!;
    String tmpDecimalScale = '0';
    List<String> tmpDecimalScaleArr = _widgetStep.toString().split(".");
    if (tmpDecimalScaleArr.length > 1) tmpDecimalScale = tmpDecimalScaleArr[1];
    if (int.parse(tmpDecimalScale) > 0) {
      _decimalScale = tmpDecimalScale.length;
    }
  }

  List<double?> _calculateUpperAndLowerValues() {
    double? localLV, localUV, localPPV;
    localLV = widget.values[0];
    if (widget.rangeSlider) {
      localUV = widget.values[1];
    } else {
      // when direction is rtl, then we use left handler. so to make right hand side
      // as blue ( as if selected ), then upper value should be max
      if (widget.rtl) {
        localUV = _widgetMax;
      } else {
        // when direction is ltr, so we use right handler, to make left hand side of handler
        // as blue ( as if selected ), we set lower value to min, and upper value to (input lower value)
        localUV = localLV;
        localLV = _widgetMin;
      }
    }

    if(widget.playbackPositionBar) {
      localPPV = widget.values.last;
    }

    return widget.playbackPositionBar == true ? [localLV, localUV, localPPV] : [localLV, localUV];
  }

  void _setValues() {
    List<double?> localValues = _calculateUpperAndLowerValues();

    _lowerValue = localValues[0]! - _widgetMin!;
    _upperValue = localValues[1]! - _widgetMin!;
    if(widget.playbackPositionBar) _playbackValue = localValues.last! - _widgetMin!;

    _outputUpperValue = _displayRealValue(_upperValue);
    _outputLowerValue = _displayRealValue(_lowerValue);
    if(widget.playbackPositionBar) _outputPlaybackValue = _displayRealValue(_playbackValue);

    if (widget.rtl == true) {
      _outputLowerValue = _displayRealValue(_upperValue);
      _outputUpperValue = _displayRealValue(_lowerValue);
      if(widget.playbackPositionBar) _outputPlaybackValue = _displayRealValue(_playbackValue);

      double tmpUpperValue = _realMax! - _lowerValue!;
      double tmpLowerValue = _realMax! - _upperValue!;

      _lowerValue = tmpLowerValue;
      _upperValue = tmpUpperValue;
    }
  }

  void _arrangeHandlersPosition() {
    if (!__dragging) {
      if (widget.axis == Axis.horizontal) {
        _handlersPadding = _handlersWidth! / 2;
        _leftHandlerXPosition = getPositionByValue(_lowerValue);
        _rightHandlerXPosition = getPositionByValue(_upperValue);
        _playbackPositionHandlerXPosition = getPositionByValue(_playbackValue);
      } else {
        _handlersPadding = _handlersHeight! / 2;
        _leftHandlerYPosition = getPositionByValue(_lowerValue);
        _rightHandlerYPosition = getPositionByValue(_upperValue);
        _playbackPositionHandlerYPosition = getPositionByValue(_playbackValue);
      }
    }
  }

  void _generateHandler() {
    /*Right Handler Data*/
    FlutterSliderHandler inputRightHandler = widget.rightHandler ?? FlutterSliderHandler();
    inputRightHandler.child ??= Icon(
      (widget.axis == Axis.horizontal) ? Icons.maximize : Icons.maximize,
      color: Colors.transparent,
    );
    inputRightHandler.decoration ??= BoxDecoration(boxShadow: [
      BoxShadow(
        color: Colors.transparent,
        blurRadius: 2,
        spreadRadius: 0.2,
        offset: Offset(0, 1)
      )
    ], color: Colors.transparent, shape: BoxShape.circle);

    rightHandler = _MakeHandler(
      animation: _rightHandlerScaleAnimation,
      id: rightHandlerKey,
      visibleTouchArea: widget.visibleTouchArea,
      handlerData: widget.rightHandler,
      width: _handlersWidth,
      height: _handlersHeight,
      axis: widget.axis,
      handlerIndex: 2,
      touchSize: _touchSize
    );

    leftHandler = _MakeHandler(
      animation: _leftHandlerScaleAnimation,
      id: leftHandlerKey,
      visibleTouchArea: widget.visibleTouchArea,
      handlerData: widget.handler,
      width: _handlersWidth,
      height: _handlersHeight,
      rtl: widget.rtl,
      rangeSlider: widget.rangeSlider,
      axis: widget.axis,
      touchSize: _touchSize
    );

    playbackPositionHandler = _MakeHandler(
      animation: _playbackPositionHandlerScaleAnimation,
      id: playbackPositionHandlerKey,
      visibleTouchArea: widget.visibleTouchArea,
      handlerData: widget.playbackPositionHandler,
      width: _handlersWidth,
      height: _handlersHeight,
      axis: widget.axis,
      handlerIndex: 3,
      touchSize: _touchSize
    );

    if (widget.rangeSlider == false) {
      rightHandler = leftHandler;
    }
  }

  double getPositionByValue(value) {
    if (widget.axis == Axis.horizontal)
      return (((_constraintMaxWidth - _handlersWidth!) / _realMax!) * value) - _touchSize!;
    else
      return (((_constraintMaxHeight - _handlersHeight!) / _realMax!) * value) - _touchSize!;
  }

  double getValueByPosition(double position) {
    double value = ((position / (__containerSizeWithoutPadding! / _divisions)) *
        _widgetStep!);
    value = (double.parse(value.toStringAsFixed(_decimalScale)) -
        double.parse((value % _widgetStep!).toStringAsFixed(_decimalScale)));
    return value;
  }

  double? getLengthByValue(value) {
    return value * __containerSizeWithoutPadding / _realMax;
  }

  double getValueByPositionIgnoreOffset(double position) {
    double value = ((position / (__containerSizeWithoutPadding! / _divisions)) * _widgetStep!);
    return value;
  }

  void _playbackPositionHandlerMove(
    PointerEvent pointer, {
      double lockedHandlersDragOffset = 0,
      double tappedPositionWithPadding = 0,
      bool selectedByTap = false,
    }
  ) {
    if (widget.disabled || (widget.handler != null && widget.handler!.disabled))
      return;

    // _handlersDistance = widget.lockDistance ?? _upperValue! - _lowerValue!;

    // Tip: lockedHandlersDragOffset only subtracts from left handler position
    // because it calculates drag position only by left handler's position
    if (lockedHandlersDragOffset == 0) __lockedHandlersDragOffset = 0;

    if (selectedByTap) {
      _callbacks('onDragStarted', 0);
    }

    bool validMove = true;

    if (widget.axis == Axis.horizontal) {
      __dAxis = pointer.position.dx - tappedPositionWithPadding - lockedHandlersDragOffset - _containerLeft;
      __axisDragTmp = xDragTmp;
      __containerSizeWithoutPadding = _containerWidthWithoutPadding;
      __playbackHandlerPosition = _playbackPositionHandlerXPosition;
    } else {
      __dAxis = pointer.position.dy - tappedPositionWithPadding - lockedHandlersDragOffset - _containerTop;
      __axisDragTmp = yDragTmp;
      __containerSizeWithoutPadding = _containerHeightWithoutPadding;
      __playbackHandlerPosition = _playbackPositionHandlerYPosition;
    }

    __axisPosTmp = __dAxis! - __axisDragTmp! + _touchSize!;

    _checkRangeStep(getValueByPositionIgnoreOffset(__axisPosTmp!));

    __rAxis = getValueByPosition(__axisPosTmp!);

    if (widget.rangeSlider &&
        widget.minimumDistance > 0 &&
        (__rAxis! + widget.minimumDistance) >= _upperValue!) {
      _lowerValue = (_upperValue! - widget.minimumDistance > _realMin!)
          ? _upperValue! - widget.minimumDistance : _realMin;
      _updateLowerValue(_lowerValue);

      if (lockedHandlersDragOffset == 0) validMove = validMove & false;
    }

    if (widget.rangeSlider &&
        widget.maximumDistance > 0 &&
        __rAxis! <= (_upperValue! - widget.maximumDistance)) {
      _lowerValue = (_upperValue! - widget.maximumDistance > _realMin!)
          ? _upperValue! - widget.maximumDistance
          : _realMin;
      _updateLowerValue(_lowerValue);

      if (lockedHandlersDragOffset == 0) validMove = validMove & false;
    }

    double? tS = _touchSize;
    if (widget.jump) {
      tS = _touchSize! + _handlersPadding;
    }

    validMove = validMove & _leftHandlerIgnoreSteps(tS);

    bool forcePosStop = false;
    // if (((__axisPosTmp! <= 0) || (__axisPosTmp! - tS! >= __playbackHandlerPosition!))) {
    //   forcePosStop = true;
    // }

    if (validMove && ((__axisPosTmp! + _handlersPadding >= _handlersPadding) || forcePosStop)) {
      double tmpLowerValue = __rAxis!;

      if (tmpLowerValue > _realMax!) tmpLowerValue = _realMax!;
      if (tmpLowerValue < _realMin!) tmpLowerValue = _realMin!;

      if (tmpLowerValue > _upperValue!) tmpLowerValue = _upperValue!;

      if (widget.jump == true) {
        if (!forcePosStop) {
          _playbackValue = tmpLowerValue;
          _leftHandlerMoveBetweenSteps(
              __dAxis! - __axisDragTmp!, selectedByTap);
          __leftHandlerPosition = getPositionByValue(_playbackValue);
        } else {
          if (__axisPosTmp! - tS! >= __playbackHandlerPosition!) {
            // __leftHandlerPosition = __rightHandlerPosition;
            _playbackValue = tmpLowerValue = _upperValue!;
          } else {
            __playbackHandlerPosition = getPositionByValue(_realMin);
            _playbackValue = tmpLowerValue = _realMin!;
          }
          _updateLowerValue(tmpLowerValue);
        }
      } else {
        _playbackValue = tmpLowerValue;

        if (!forcePosStop) {
          __playbackHandlerPosition = __dAxis! - __axisDragTmp!; // - (_touchSize);

          _leftHandlerMoveBetweenSteps(__playbackHandlerPosition, selectedByTap);
          tmpLowerValue = _playbackValue!;
        } else {
          if (__axisPosTmp! - tS! >= __playbackHandlerPosition!) {
            // __leftHandlerPosition = __rightHandlerPosition;
            _playbackValue = tmpLowerValue = _upperValue!;
          } else {
            __playbackHandlerPosition = getPositionByValue(_realMin);
            _playbackValue = tmpLowerValue = _realMin!;
          }
          _updateLowerValue(tmpLowerValue);
        }
      }
    }

    if (widget.axis == Axis.horizontal) {
      _playbackPositionHandlerXPosition = __playbackHandlerPosition;
    } else {
      _playbackPositionHandlerYPosition = __playbackHandlerPosition;
    }
    if (widget.lockHandlers || lockedHandlersDragOffset > 0) {
      _lockedHandlers('playbackHandler');
    }
    setState(() {});

    if (selectedByTap) {
      _callbacks('onDragging', 0);
      _callbacks('onDragCompleted', 0);
    } else {
      _callbacks('onDragging', 0);
    }
  }

  void _leftHandlerMove(
    PointerEvent pointer, {
      double lockedHandlersDragOffset = 0,
      double tappedPositionWithPadding = 0,
      bool selectedByTap = false,
    }
  ) {
    if (widget.disabled || (widget.handler != null && widget.handler!.disabled))
      return;

    _handlersDistance = widget.lockDistance ?? _upperValue! - _lowerValue!;

    // Tip: lockedHandlersDragOffset only subtracts from left handler position
    // because it calculates drag position only by left handler's position
    if (lockedHandlersDragOffset == 0) __lockedHandlersDragOffset = 0;

    if (selectedByTap) {
      _callbacks('onDragStarted', 0);
    }

    bool validMove = true;

    if (widget.axis == Axis.horizontal) {
      __dAxis = pointer.position.dx -
          tappedPositionWithPadding -
          lockedHandlersDragOffset -
          _containerLeft;
      __axisDragTmp = xDragTmp;
      __containerSizeWithoutPadding = _containerWidthWithoutPadding;
      __rightHandlerPosition = _rightHandlerXPosition;
      __leftHandlerPosition = _leftHandlerXPosition;
    } else {
      __dAxis = pointer.position.dy -
          tappedPositionWithPadding -
          lockedHandlersDragOffset -
          _containerTop;
      __axisDragTmp = yDragTmp;
      __containerSizeWithoutPadding = _containerHeightWithoutPadding;
      __rightHandlerPosition = _rightHandlerYPosition;
      __leftHandlerPosition = _leftHandlerYPosition;
    }

    __axisPosTmp = __dAxis! - __axisDragTmp! + _touchSize!;

    _checkRangeStep(getValueByPositionIgnoreOffset(__axisPosTmp!));

    __rAxis = getValueByPosition(__axisPosTmp!);

    if (widget.rangeSlider &&
        widget.minimumDistance > 0 &&
        (__rAxis! + widget.minimumDistance) >= _upperValue!) {
      _lowerValue = (_upperValue! - widget.minimumDistance > _realMin!)
          ? _upperValue! - widget.minimumDistance : _realMin;
      _updateLowerValue(_lowerValue);

      if (lockedHandlersDragOffset == 0) validMove = validMove & false;
    }

    if (widget.rangeSlider &&
        widget.maximumDistance > 0 &&
        __rAxis! <= (_upperValue! - widget.maximumDistance)) {
      _lowerValue = (_upperValue! - widget.maximumDistance > _realMin!)
          ? _upperValue! - widget.maximumDistance
          : _realMin;
      _updateLowerValue(_lowerValue);

      if (lockedHandlersDragOffset == 0) validMove = validMove & false;
    }

    double? tS = _touchSize;
    if (widget.jump) {
      tS = _touchSize! + _handlersPadding;
    }

    validMove = validMove & _leftHandlerIgnoreSteps(tS);

    bool forcePosStop = false;
    if (((__axisPosTmp! <= 0) ||
        (__axisPosTmp! - tS! >= __rightHandlerPosition!))) {
      forcePosStop = true;
    }

    if (validMove &&
        ((__axisPosTmp! + _handlersPadding >= _handlersPadding) ||
            forcePosStop)) {
      double tmpLowerValue = __rAxis!;

      if (tmpLowerValue > _realMax!) tmpLowerValue = _realMax!;
      if (tmpLowerValue < _realMin!) tmpLowerValue = _realMin!;

      if (tmpLowerValue > _upperValue!) tmpLowerValue = _upperValue!;

      if (widget.jump == true) {
        if (!forcePosStop) {
          _lowerValue = tmpLowerValue;
          _leftHandlerMoveBetweenSteps(
              __dAxis! - __axisDragTmp!, selectedByTap);
          __leftHandlerPosition = getPositionByValue(_lowerValue);
        } else {
          if (__axisPosTmp! - tS! >= __rightHandlerPosition!) {
            __leftHandlerPosition = __rightHandlerPosition;
            _lowerValue = tmpLowerValue = _upperValue!;
          } else {
            __leftHandlerPosition = getPositionByValue(_realMin);
            _lowerValue = tmpLowerValue = _realMin!;
          }
          _updateLowerValue(tmpLowerValue);
        }
      } else {
        _lowerValue = tmpLowerValue;

        if (!forcePosStop) {
          __leftHandlerPosition = __dAxis! - __axisDragTmp!; // - (_touchSize);

          _leftHandlerMoveBetweenSteps(__leftHandlerPosition, selectedByTap);
          tmpLowerValue = _lowerValue!;
        } else {
          if (__axisPosTmp! - tS! >= __rightHandlerPosition!) {
            __leftHandlerPosition = __rightHandlerPosition;
            _lowerValue = tmpLowerValue = _upperValue!;
          } else {
            __leftHandlerPosition = getPositionByValue(_realMin);
            _lowerValue = tmpLowerValue = _realMin!;
          }
          _updateLowerValue(tmpLowerValue);
        }
      }
    }

    if (widget.axis == Axis.horizontal) {
      _leftHandlerXPosition = __leftHandlerPosition;
    } else {
      _leftHandlerYPosition = __leftHandlerPosition;
    }
    if (widget.lockHandlers || lockedHandlersDragOffset > 0) {
      _lockedHandlers('leftHandler');
    }
    setState(() {});

    if (selectedByTap) {
      _callbacks('onDragging', 0);
      _callbacks('onDragCompleted', 0);
    } else {
      _callbacks('onDragging', 0);
    }
  }

  bool _leftHandlerIgnoreSteps(double? tS) {
    bool validMove = true;
    if (_ignoreSteps.length > 0) {
      if (__axisPosTmp! <= 0) {
        double? ignorePoint;
        if (widget.rtl)
          ignorePoint = _findBiggestIgnorePoint();
        else
          ignorePoint = _findSmallestIgnorePoint();

        __leftHandlerPosition = getPositionByValue(ignorePoint);
        _lowerValue = ignorePoint;
        _updateLowerValue(_lowerValue);
        return false;
      } else if (__axisPosTmp! - tS! >= __rightHandlerPosition!) {
        __leftHandlerPosition = __rightHandlerPosition;
        _lowerValue = _upperValue;
        _updateLowerValue(_lowerValue);
        return false;
      }

      for (FlutterSliderIgnoreSteps steps in _ignoreSteps) {
        if (((!widget.rtl) &&
                (getValueByPositionIgnoreOffset(__axisPosTmp!) >
                        steps.from! - _widgetStep! / 2 &&
                    getValueByPositionIgnoreOffset(__axisPosTmp!) <=
                        steps.to! + _widgetStep! / 2)) ||
            ((widget.rtl) &&
                (_realMax! - getValueByPositionIgnoreOffset(__axisPosTmp!) >
                        steps.from! - _widgetStep! / 2 &&
                    _realMax! - getValueByPositionIgnoreOffset(__axisPosTmp!) <=
                        steps.to! + _widgetStep! / 2))) validMove = false;
      }
    }

    return validMove;
  }

  void _leftHandlerMoveBetweenSteps(handlerPos, bool selectedByTap) {
    double nextStepMiddlePos =
        getPositionByValue((_lowerValue! + (_lowerValue! + _widgetStep!)) / 2);
    double prevStepMiddlePos =
        getPositionByValue((_lowerValue! - (_lowerValue! - _widgetStep!)) / 2);

    if (handlerPos > nextStepMiddlePos || handlerPos < prevStepMiddlePos) {
      if (handlerPos > nextStepMiddlePos) {
        _lowerValue = _lowerValue! + _widgetStep!;
        if (_lowerValue! > _realMax!) _lowerValue = _realMax;
        if (_lowerValue! > _upperValue!) _lowerValue = _upperValue;
      } else {
        _lowerValue = _lowerValue! - _widgetStep!;
        if (_lowerValue! < _realMin!) _lowerValue = _realMin;
      }
    }
    _updateLowerValue(_lowerValue);
  }

  void _lockedHandlers(handler) {
    double? distanceOfTwoHandlers = getLengthByValue(_handlersDistance);

    double? leftHandlerPos, rightHandlerPos;
    if (widget.axis == Axis.horizontal) {
      leftHandlerPos = _leftHandlerXPosition;
      rightHandlerPos = _rightHandlerXPosition;
    } else {
      leftHandlerPos = _leftHandlerYPosition;
      rightHandlerPos = _rightHandlerYPosition;
    }

    if (handler == 'rightHandler') {
      _lowerValue = _upperValue! - _handlersDistance;
      leftHandlerPos = rightHandlerPos! - distanceOfTwoHandlers!;
      if (getValueByPositionIgnoreOffset(__axisPosTmp!) - _handlersDistance <
          _realMin!) {
        _lowerValue = _realMin;
        _upperValue = _realMin! + _handlersDistance;
        rightHandlerPos = getPositionByValue(_upperValue);
        leftHandlerPos = getPositionByValue(_lowerValue);
      }
    } else {
      _upperValue = _lowerValue! + _handlersDistance;
      rightHandlerPos = leftHandlerPos! + distanceOfTwoHandlers!;
      if (getValueByPositionIgnoreOffset(__axisPosTmp!) + _handlersDistance >
          _realMax!) {
        _upperValue = _realMax;
        _lowerValue = _realMax! - _handlersDistance;
        rightHandlerPos = getPositionByValue(_upperValue);
        leftHandlerPos = getPositionByValue(_lowerValue);
      }
    }

    if (widget.axis == Axis.horizontal) {
      _leftHandlerXPosition = leftHandlerPos;
      _rightHandlerXPosition = rightHandlerPos;
    } else {
      _leftHandlerYPosition = leftHandlerPos;
      _rightHandlerYPosition = rightHandlerPos;
    }

    _updateUpperValue(_upperValue);
    _updateLowerValue(_lowerValue);
  }

  void _updateLowerValue(value) {
    _outputLowerValue = _displayRealValue(value);
    if (widget.rtl == true) {
      _outputLowerValue = _displayRealValue(_realMax! - value);
    }
  }

  void _rightHandlerMove(
    PointerEvent pointer, {
      double tappedPositionWithPadding = 0,
      bool selectedByTap = false
    }
  ) {
    if (widget.disabled || (widget.rightHandler != null && widget.rightHandler!.disabled)) return;

    _handlersDistance = widget.lockDistance ?? _upperValue! - _lowerValue!;

    if (selectedByTap) {
      _callbacks('onDragStarted', 1);
    }

    bool validMove = true;

    if (widget.axis == Axis.horizontal) {
      __dAxis = pointer.position.dx - tappedPositionWithPadding - _containerLeft;
      __axisDragTmp = xDragTmp;
      __containerSizeWithoutPadding = _containerWidthWithoutPadding;
      __rightHandlerPosition = _rightHandlerXPosition;
      __leftHandlerPosition = _leftHandlerXPosition;
      __containerSizeWithoutHalfPadding = _constraintMaxWidth - _handlersPadding + 1;
    } else {
      __dAxis = pointer.position.dy - tappedPositionWithPadding - _containerTop;
      __axisDragTmp = yDragTmp;
      __containerSizeWithoutPadding = _containerHeightWithoutPadding;
      __rightHandlerPosition = _rightHandlerYPosition;
      __leftHandlerPosition = _leftHandlerYPosition;
      __containerSizeWithoutHalfPadding = _constraintMaxHeight - _handlersPadding + 1;
    }

    __axisPosTmp = __dAxis! - __axisDragTmp! + _touchSize!;

    _checkRangeStep(getValueByPositionIgnoreOffset(__axisPosTmp!));

    __rAxis = getValueByPosition(__axisPosTmp!);

    if (widget.rangeSlider &&
        widget.minimumDistance > 0 &&
        (__rAxis! - widget.minimumDistance) <= _lowerValue!) {
      _upperValue = (_lowerValue! + widget.minimumDistance < _realMax!)
          ? _lowerValue! + widget.minimumDistance
          : _realMax;
      validMove = validMove & false;
      _updateUpperValue(_upperValue);
    }
    if (widget.rangeSlider &&
        widget.maximumDistance > 0 &&
        __rAxis! >= (_lowerValue! + widget.maximumDistance)) {
      _upperValue = (_lowerValue! + widget.maximumDistance < _realMax!)
          ? _lowerValue! + widget.maximumDistance
          : _realMax;
      validMove = validMove & false;
      _updateUpperValue(_upperValue);
    }

    double? tS = _touchSize;
    double rM = _handlersPadding;
    if (widget.jump) {
      rM = -_handlersWidth!;
      tS = -_touchSize!;
    }

    validMove = validMove & _rightHandlerIgnoreSteps(tS);

    bool forcePosStop = false;
    if (((__axisPosTmp! >= __containerSizeWithoutPadding!) ||
        (__axisPosTmp! - tS! <= __leftHandlerPosition!))) {
      forcePosStop = true;
    }

    if (validMove && (__axisPosTmp! + rM <= __containerSizeWithoutHalfPadding! || forcePosStop)) {
      double tmpUpperValue = __rAxis!;

      if (tmpUpperValue > _realMax!) tmpUpperValue = _realMax!;
      if (tmpUpperValue < _realMin!) tmpUpperValue = _realMin!;

      if (tmpUpperValue < _lowerValue!) tmpUpperValue = _lowerValue!;

      if (widget.jump == true) {
        if (!forcePosStop) {
          _upperValue = tmpUpperValue;
          _rightHandlerMoveBetweenSteps(__dAxis! - __axisDragTmp!, selectedByTap);
          __rightHandlerPosition = getPositionByValue(_upperValue);
        } else {
          if (__axisPosTmp! - tS! <= __leftHandlerPosition!) {
            __rightHandlerPosition = __leftHandlerPosition;
            _upperValue = tmpUpperValue = _lowerValue!;
          } else {
            __rightHandlerPosition = getPositionByValue(_realMax);
            _upperValue = tmpUpperValue = _realMax!;
          }

          _updateUpperValue(tmpUpperValue);
        }
      } else {
        _upperValue = tmpUpperValue;

        if (!forcePosStop) {
          __rightHandlerPosition = __dAxis! - __axisDragTmp!;
          _rightHandlerMoveBetweenSteps(__rightHandlerPosition, selectedByTap);
          tmpUpperValue = _upperValue!;
        } else {
          if (__axisPosTmp! - tS! <= __leftHandlerPosition!) {
            __rightHandlerPosition = __leftHandlerPosition;
            _upperValue = tmpUpperValue = _lowerValue!;
          } else {
            __rightHandlerPosition = getPositionByValue(_realMax) + 1;
            _upperValue = tmpUpperValue = _realMax!;
          }
        }
        _updateUpperValue(tmpUpperValue);
      }
    }

    if (widget.axis == Axis.horizontal) {
      _rightHandlerXPosition = __rightHandlerPosition;
    } else {
      _rightHandlerYPosition = __rightHandlerPosition;
    }
    if (widget.lockHandlers) {
      _lockedHandlers('rightHandler');
    }

    setState(() {});

    if (selectedByTap) {
      _callbacks('onDragging', 1);
      _callbacks('onDragCompleted', 1);
    } else {
      _callbacks('onDragging', 1);
    }
  }

  bool _rightHandlerIgnoreSteps(double? tS) {
    bool validMove = true;
    if (_ignoreSteps.length > 0) {
      if (__axisPosTmp! <= 0) {
        if (!widget.rangeSlider) {
          double? ignorePoint;
          if (widget.rtl)
            ignorePoint = _findBiggestIgnorePoint();
          else
            ignorePoint = _findSmallestIgnorePoint();

          __rightHandlerPosition = getPositionByValue(ignorePoint);
          _upperValue = ignorePoint;
          _updateUpperValue(_upperValue);
        } else {
          __rightHandlerPosition = __leftHandlerPosition;
          _upperValue = _lowerValue;
          _updateUpperValue(_upperValue);
        }
        return false;
      } else if (__axisPosTmp! >= __containerSizeWithoutPadding!) {
        double? ignorePoint;

        if (widget.rtl)
          ignorePoint = _findSmallestIgnorePoint();
        else
          ignorePoint = _findBiggestIgnorePoint();

        __rightHandlerPosition = getPositionByValue(ignorePoint);
        _upperValue = ignorePoint;
        _updateUpperValue(_upperValue);
        return false;
      }

      for (FlutterSliderIgnoreSteps steps in _ignoreSteps) {
        if (((!widget.rtl) &&
                (getValueByPositionIgnoreOffset(__axisPosTmp!) >
                        steps.from! - _widgetStep! / 2 &&
                    getValueByPositionIgnoreOffset(__axisPosTmp!) <=
                        steps.to! + _widgetStep! / 2)) ||
            ((widget.rtl) &&
                (_realMax! - getValueByPositionIgnoreOffset(__axisPosTmp!) >
                        steps.from! - _widgetStep! / 2 &&
                    _realMax! - getValueByPositionIgnoreOffset(__axisPosTmp!) <=
                        steps.to! + _widgetStep! / 2))) validMove = false;
      }
    }
    return validMove;
  }

  double? _findSmallestIgnorePoint({ignoreBeyondBoundaries = false}) {
    double? ignorePoint = _realMax;
    bool beyondBoundaries = false;
    for (FlutterSliderIgnoreSteps steps in _ignoreSteps) {
      if (steps.from! < _realMin!) beyondBoundaries = true;
      if (steps.from! < ignorePoint! && steps.from! >= _realMin!)
        ignorePoint = steps.from! - _widgetStep!;
      else if (steps.to! < ignorePoint && steps.to! >= _realMin!)
        ignorePoint = steps.to! + _widgetStep!;
    }
    if (beyondBoundaries || ignoreBeyondBoundaries) {
      if (widget.rtl) {
        ignorePoint = _realMax! - ignorePoint!;
      }
      return ignorePoint;
    } else {
      if (widget.rtl) return _realMax;
      return _realMin;
    }
  }

  double? _findBiggestIgnorePoint({ignoreBeyondBoundaries = false}) {
    double? ignorePoint = _realMin;
    bool beyondBoundaries = false;
    for (FlutterSliderIgnoreSteps steps in _ignoreSteps) {
      if (steps.to! > _realMax!) beyondBoundaries = true;

      if (steps.to! > ignorePoint! && steps.to! <= _realMax!)
        ignorePoint = steps.to! + _widgetStep!;
      else if (steps.from! > ignorePoint && steps.from! <= _realMax!)
        ignorePoint = steps.from! - _widgetStep!;
    }
    if (beyondBoundaries || ignoreBeyondBoundaries) {
      if (widget.rtl) {
        ignorePoint = _realMax! - ignorePoint!;
      }

      return ignorePoint;
    } else {
      if (widget.rtl) return _realMin;
      return _realMax;
    }
  }

  void _rightHandlerMoveBetweenSteps(handlerPos, bool selectedByTap) {
    double nextStepMiddlePos =
        getPositionByValue((_upperValue! + (_upperValue! + _widgetStep!)) / 2);
    double prevStepMiddlePos =
        getPositionByValue((_upperValue! - (_upperValue! - _widgetStep!)) / 2);

    if (handlerPos > nextStepMiddlePos || handlerPos < prevStepMiddlePos) {
      if (handlerPos > nextStepMiddlePos) {
        _upperValue = _upperValue! + _widgetStep!;
        if (_upperValue! > _realMax!) _upperValue = _realMax;
      } else {
        _upperValue = _upperValue! - _widgetStep!;
        if (_upperValue! < _realMin!) _upperValue = _realMin;
        if (_upperValue! < _lowerValue!) _upperValue = _lowerValue;
      }
    }
    _updateUpperValue(_upperValue);
  }

  void _updateUpperValue(value) {
    _outputUpperValue = _displayRealValue(value);
    if (widget.rtl == true) {
      _outputUpperValue = _displayRealValue(_realMax! - value);
    }
  }

  void _checkRangeStep(double realValue) {
    double? sliderFromRange, sliderToRange;
    if (widget.step.rangeList != null) {
      for (FlutterSliderRangeStep rangeStep in widget.step.rangeList!) {
        if (widget.step.isPercentRange) {
          sliderFromRange = _widgetMax! * rangeStep.from! / 100;
          sliderToRange = _widgetMax! * rangeStep.to! / 100;
        } else {
          sliderFromRange = rangeStep.from;
          sliderToRange = rangeStep.to;
        }

        if (realValue >= sliderFromRange! && realValue <= sliderToRange!) {
          _widgetStep = rangeStep.step;
          _setDivisionAndDecimalScale();
          break;
        }
      }
    }
  }

  Positioned _playbackHandlerWidget() {
    if (widget.rangeSlider == false)
      return Positioned(
        child: Container(),
      );

    double? bottom;
    double? right;
    if (widget.axis == Axis.horizontal) {
      bottom = 0;
    } else {
      right = 0;
    }

    return Positioned(
      key: const Key('playbackPositionHandler'),
      left: _playbackPositionHandlerXPosition,
      top: _playbackPositionHandlerYPosition,
      bottom: bottom,
      right: right,
      child: Listener(
        child: Draggable(
          axis: widget.axis,
          feedback: Container(),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              _tooltip(
                  side: 'playback',
                  value: _outputLowerValue,
                  opacity: _playbackPositionTooltipOpacity,
                  animation: _playbackPositionTooltipAnimation),
              if(widget.playbackPositionBar)...[
                playbackPositionHandler,
              ],
            ],
          ),
        ),
        onPointerMove: (_) {
          __dragging = true;

          _playbackPositionHandlerMove(_);
        },
        onPointerDown: (_) {
          if (widget.disabled ||
              (widget.handler != null && widget.handler!.disabled)) return;

          // _renderBoxInitialization();

          xDragTmp = (_.position.dx - _containerLeft - _playbackPositionHandlerXPosition!);
          yDragTmp = (_.position.dy - _containerTop - _playbackPositionHandlerYPosition!);
          // xDragTmp = (_.position.dx - _containerLeft);
          // yDragTmp = (_.position.dy - _containerTop);

          // if (!_tooltipData.disabled! &&
          //     _tooltipData.alwaysShowTooltip == false) {
          //   _playbackPositionTooltipOpacity = 1;
          //   _playbackPositionTooltipAnimationController.forward();

          //   if (widget.lockHandlers) {
          //     _playbackPositionTooltipOpacity = 1;
          //     _playbackPositionTooltipAnimationController.forward();
          //   }
          // }

          // _playbackPositionHandlerScaleAnimationController!.forward();

          setState(() {});

          _callbacks('onDragStarted', 0);
        },
        onPointerUp: (_) {
          __dragging = false;

          // _adjustPlaybackHandlerPosition();

          // if (widget.disabled ||
          //     (widget.handler != null && widget.handler!.disabled)) return;

          // _arrangeHandlersZIndex();

          // _stopHandlerAnimation(
          //     animation: _playbackPositionHandlerScaleAnimation,
          //     controller: _playbackPositionHandlerScaleAnimationController);

          // _hideTooltips();

          setState(() {});

          _callbacks('onDragCompleted', 0);
        },
      ),
    );
  }

  void _adjustPlaybackHandlerPosition() {
    if (!widget.jump) {
      double position = getPositionByValue(_lowerValue);
      if (widget.axis == Axis.horizontal) {
        _playbackPositionHandlerXPosition = position > _rightHandlerXPosition! ? _rightHandlerXPosition : position;
        if (widget.lockHandlers || __lockedHandlersDragOffset > 0) {
          position = getPositionByValue(_lowerValue! + _handlersDistance);
          _rightHandlerXPosition = position < _playbackPositionHandlerXPosition! ? _playbackPositionHandlerXPosition : position;
        }
      } else {
        _playbackPositionHandlerYPosition = position > _rightHandlerYPosition! ? _rightHandlerYPosition : position;
        if (widget.lockHandlers || __lockedHandlersDragOffset > 0) {
          position = getPositionByValue(_lowerValue! + _handlersDistance);
          _rightHandlerYPosition = position < _playbackPositionHandlerYPosition! ? _playbackPositionHandlerYPosition : position;
        }
      }
    }
  }

  Positioned _leftHandlerWidget() {
    if (widget.rangeSlider == false)
      return Positioned(
        child: Container(),
      );

    double? bottom;
    double? right;
    if (widget.axis == Axis.horizontal) {
      bottom = 0;
    } else {
      right = 0;
    }

    return Positioned(
      key: Key('leftHandler'),
      left: _leftHandlerXPosition,
      top: _leftHandlerYPosition,
      bottom: bottom,
      right: right,
      child: Listener(
        child: Draggable(
            axis: widget.axis,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                _tooltip(
                    side: 'left',
                    value: _outputLowerValue,
                    opacity: _leftTooltipOpacity,
                    animation: _leftTooltipAnimation),
                leftHandler,
              ],
            ),
            feedback: Container()),
        onPointerMove: (_) {
          __dragging = true;

          _leftHandlerMove(_);
        },
        onPointerDown: (_) {
          if (widget.disabled ||
              (widget.handler != null && widget.handler!.disabled)) return;

          _renderBoxInitialization();

          xDragTmp = (_.position.dx - _containerLeft - _leftHandlerXPosition!);
          yDragTmp = (_.position.dy - _containerTop - _leftHandlerYPosition!);

          if (!_tooltipData.disabled! &&
              _tooltipData.alwaysShowTooltip == false) {
            _leftTooltipOpacity = 1;
            _leftTooltipAnimationController.forward();

            if (widget.lockHandlers) {
              _rightTooltipOpacity = 1;
              _rightTooltipAnimationController.forward();
            }
          }

          _leftHandlerScaleAnimationController!.forward();

          setState(() {});

          _callbacks('onDragStarted', 0);
        },
        onPointerUp: (_) {
          __dragging = false;

          _adjustLeftHandlerPosition();

          if (widget.disabled ||
              (widget.handler != null && widget.handler!.disabled)) return;

          _arrangeHandlersZIndex();

          _stopHandlerAnimation(
              animation: _leftHandlerScaleAnimation,
              controller: _leftHandlerScaleAnimationController);

          _hideTooltips();

          setState(() {});

          _callbacks('onDragCompleted', 0);
        },
      ),
    );
  }

  void _adjustLeftHandlerPosition() {
    if (!widget.jump) {
      double position = getPositionByValue(_lowerValue);
      if (widget.axis == Axis.horizontal) {
        _leftHandlerXPosition = position > _rightHandlerXPosition! ? _rightHandlerXPosition : position;
        if (widget.lockHandlers || __lockedHandlersDragOffset > 0) {
          position = getPositionByValue(_lowerValue! + _handlersDistance);
          _rightHandlerXPosition = position < _leftHandlerXPosition! ? _leftHandlerXPosition : position;
        }
      } else {
        _leftHandlerYPosition = position > _rightHandlerYPosition! ? _rightHandlerYPosition : position;
        if (widget.lockHandlers || __lockedHandlersDragOffset > 0) {
          position = getPositionByValue(_lowerValue! + _handlersDistance);
          _rightHandlerYPosition = position < _leftHandlerYPosition! ? _leftHandlerYPosition : position;
        }
      }
    }
  }

  void _hideTooltips() {
    if (!_tooltipData.alwaysShowTooltip!) {
      _leftTooltipOpacity = 0;
      _rightTooltipOpacity = 0;
      _leftTooltipAnimationController.reset();
      _rightTooltipAnimationController.reset();
    }
  }

  Positioned _rightHandlerWidget() {
    double? bottom;
    double? right;
    if (widget.axis == Axis.horizontal) {
      bottom = 0;
    } else {
      right = 0;
    }

    return Positioned(
      key: Key('rightHandler'),
      left: _rightHandlerXPosition,
      top: _rightHandlerYPosition,
      right: right,
      bottom: bottom,
      child: Listener(
        child: Draggable(
          axis: Axis.horizontal,
          feedback: Container(
//                            width: 20,
//                            height: 20,
//                            color: Colors.blue.withOpacity(0.7),
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: ([
              _tooltip(
                side: 'right',
                value: _outputUpperValue,
                opacity: _rightTooltipOpacity,
                animation: _rightTooltipAnimation
              ),
              rightHandler,
            ]),
          ),
        ),
        onPointerMove: (_) {
          __dragging = true;

          if (!_tooltipData.disabled! &&
              _tooltipData.alwaysShowTooltip == false) {
            _rightTooltipOpacity = 1;
          }
          _rightHandlerMove(_);
        },
        onPointerDown: (_) {
          if (widget.disabled ||
              (widget.rightHandler != null && widget.rightHandler!.disabled))
            return;

          _renderBoxInitialization();

          xDragTmp = (_.position.dx - _containerLeft - _rightHandlerXPosition!);
          yDragTmp = (_.position.dy - _containerTop - _rightHandlerYPosition!);

          if (!_tooltipData.disabled! &&
              _tooltipData.alwaysShowTooltip == false) {
            _rightTooltipOpacity = 1;
            _rightTooltipAnimationController.forward();

            if (widget.lockHandlers) {
              _leftTooltipOpacity = 1;
              _leftTooltipAnimationController.forward();
            }

            setState(() {});
          }
          if (widget.rangeSlider == false) {
            _leftHandlerScaleAnimationController!.forward();
            // _playbackPositionHandlerScaleAnimationController!.forward();
          } else {
            _rightHandlerScaleAnimationController!.forward();
            // _playbackPositionHandlerScaleAnimationController!.forward();
          }

          _callbacks('onDragStarted', 1);
        },
        onPointerUp: (_) {
          __dragging = false;

          _adjustRightHandlerPosition();

          if (widget.disabled ||
              (widget.rightHandler != null && widget.rightHandler!.disabled))
            return;

          _arrangeHandlersZIndex();

          if (widget.rangeSlider == false) {
            _stopHandlerAnimation(
                animation: _leftHandlerScaleAnimation,
                controller: _leftHandlerScaleAnimationController);
          } else {
            _stopHandlerAnimation(
                animation: _rightHandlerScaleAnimation,
                controller: _rightHandlerScaleAnimationController);
          }

          _hideTooltips();

          setState(() {});

          _callbacks('onDragCompleted', 1);
        },
      ),
    );
  }

  void _adjustRightHandlerPosition() {
    if (!widget.jump) {
      double position = getPositionByValue(_upperValue);
      if (widget.axis == Axis.horizontal) {
        _rightHandlerXPosition = position < _leftHandlerXPosition!
            ? _leftHandlerXPosition
            : position;
        if (widget.lockHandlers) {
          position = getPositionByValue(_upperValue! - _handlersDistance);
          _leftHandlerXPosition = position > _rightHandlerXPosition!
              ? _rightHandlerXPosition
              : position;
        }
      } else {
        _rightHandlerYPosition = position < _leftHandlerYPosition!
            ? _leftHandlerYPosition
            : position;
        if (widget.lockHandlers) {
          position = getPositionByValue(_upperValue! - _handlersDistance);
          _leftHandlerYPosition = position > _rightHandlerYPosition!
              ? _rightHandlerYPosition
              : position;
        }
      }
    }
  }

  void _stopHandlerAnimation(
      {Animation? animation, AnimationController? controller}) {
    if (widget.handlerAnimation.reverseCurve != null) {
      if (animation!.isCompleted)
        controller!.reverse();
      else {
        controller!.reset();
      }
    } else
      controller!.reset();
  }

  List<Positioned> drawHandlers() {
    // レンジスライダーの構成要素
    List<Positioned> items = [];
    
    if(widget.soundFileWidget == null) {
      items = []..addAll([
        Function.apply(_inactiveTrack, []),
        Function.apply(_playBarWidget, []),
      ]);
    } else {
      items = []..addAll([
        Function.apply(_inactiveTrack, []),
        Function.apply(_activeTrack, []),
      
      // Function.apply(_centralWidget, []),
      ]);
    }

    items.addAll(_points);

    double tappedPositionWithPadding = 0;

    items.add(
      Positioned(
        left: 0,
        right: 0,
        top: 0,
        bottom: 0,
        child: Opacity(
          opacity: 0,
          child: Listener(
            onPointerUp: (_) {
              if (widget.selectByTap && !__dragging) {
                tappedPositionWithPadding = _distance();
                if (_distanceFromLeftHandler! < _distanceFromRightHandler!) {
                  if (!widget.rangeSlider) {
                    _rightHandlerMove(_, tappedPositionWithPadding: tappedPositionWithPadding, selectedByTap: true);
                  } else {
                    _leftHandlerMove(_, tappedPositionWithPadding: tappedPositionWithPadding, selectedByTap: true);
                  }
                } else
                  _rightHandlerMove(_, tappedPositionWithPadding: tappedPositionWithPadding, selectedByTap: true);
          
              } else {
                if (_slidingByActiveTrackBar) {  // ハンドラー間
                  _callbacks('onDragCompleted', 0);
                }
                if (_leftTapAndSlide) {  // ハンドラーより左
                  _callbacks('onDragCompleted', 0);
                }
                if (_rightTapAndSlide) {  // ハンドラーより右
                  _callbacks('onDragCompleted', 1);
                }
              }
          
            //  _adjustLeftHandlerPosition();
            //  _adjustRightHandlerPosition();
          
              _hideTooltips();
          
              _stopHandlerAnimation(
                  animation: _leftHandlerScaleAnimation,
                  controller: _leftHandlerScaleAnimationController);
              _stopHandlerAnimation(
                  animation: _rightHandlerScaleAnimation,
                  controller: _rightHandlerScaleAnimationController);
              _stopHandlerAnimation(
                  animation: _playbackPositionHandlerScaleAnimation,
                  controller: _playbackPositionHandlerScaleAnimationController);
          
              _slidingByActiveTrackBar = false;
              __dragging = false;
          
              setState(() {});
            },
            onPointerDown: (_) {
              _leftTapAndSlide = false;
              _rightTapAndSlide = false;
              _slidingByActiveTrackBar = false;
              __dragging = false;
              _trackBarSlideOnDragStartedCalled = false;
          
              double leftHandlerLastPosition, rightHandlerLastPosition;
              if (widget.axis == Axis.horizontal) {
                double lX = _leftHandlerXPosition! + _handlersPadding + _touchSize! + _containerLeft;
                double rX = _rightHandlerXPosition! + _handlersPadding + _touchSize! + _containerLeft;
          
                _distanceFromRightHandler = (rX - _.position.dx);  //右ハンドラーと押されたポジションとの差
                _distanceFromLeftHandler = (lX - _.position.dx);  //左ハンドラーと押されたポジションとの差
          
                leftHandlerLastPosition = lX;
                rightHandlerLastPosition = rX;
              } else {
                double lY = _leftHandlerYPosition! + _handlersPadding + _touchSize! + _containerTop;
                double rY = _rightHandlerYPosition! + _handlersPadding + _touchSize! + _containerTop;
          
                _distanceFromLeftHandler = (lY - _.position.dy);
                _distanceFromRightHandler = (rY - _.position.dy);
          
                leftHandlerLastPosition = lY;
                rightHandlerLastPosition = rY;
              }
          
              if (widget.rangeSlider &&
                  widget.trackBar.activeTrackBarDraggable &&
                  _ignoreSteps.length == 0 &&
                  _distanceFromRightHandler! > 0 && _distanceFromLeftHandler! < 0) {  //範囲内を押した場合
                _slidingByActiveTrackBar = true;
              } else {  //範囲外を押した場合
                double thumbPosition = (widget.axis == Axis.horizontal) ? _.position.dx : _.position.dy;  //押した場所の横方向座標を取得
                if (_distanceFromLeftHandler!.abs() < _distanceFromRightHandler!.abs() ||  // ハンドラーよりも左を押した場合
                    (_distanceFromLeftHandler == _distanceFromRightHandler && thumbPosition < leftHandlerLastPosition)) {  // ハンドラーが同じ位置時
                  _leftTapAndSlide = true;
                }
                if (_distanceFromRightHandler!.abs() < _distanceFromLeftHandler!.abs() ||  // ハンドラーよりも右を押した場合
                    (_distanceFromLeftHandler == _distanceFromRightHandler && thumbPosition < rightHandlerLastPosition)) {  // ハンドラーが同じ位置時
                  _rightTapAndSlide = true;
                }
              }
          
              // if drag is within active area
              if (_distanceFromRightHandler! > 0 && _distanceFromLeftHandler! < 0) {  //範囲内を押した場合
                if (widget.axis == Axis.horizontal) {
                  xDragTmp = 0;
                  __lockedHandlersDragOffset = (_leftHandlerXPosition! + _containerLeft - _.position.dx).abs();  //左ハンドルから押されたyの距離
                } else {
                  yDragTmp = 0;
                  __lockedHandlersDragOffset = (_leftHandlerYPosition! + _containerTop - _.position.dy).abs();
                }
              }
                //              }
          
              // ハンドル間をスライドしている時のアニメーション
              if (_ignoreSteps.length == 0) {
                if ((widget.lockHandlers || __lockedHandlersDragOffset > 0) &&
                    !_tooltipData.disabled! &&
                    _tooltipData.alwaysShowTooltip == false) {
                  _leftTooltipOpacity = 1;
                  _leftTooltipAnimationController.forward();
                  _rightTooltipOpacity = 1;
                  _rightTooltipAnimationController.forward();
                }
          
                if ((widget.lockHandlers || __lockedHandlersDragOffset > 0)) {
                  _leftHandlerScaleAnimationController!.forward();
                  _rightHandlerScaleAnimationController!.forward();
                }
              }
          
              setState(() {});
            },
            onPointerMove: (_) {
              __dragging = true;
          
              if (_slidingByActiveTrackBar) {  // ハンドラー間を移動
                _trackBarSlideCallDragStated(0);
                _leftHandlerMove(_, lockedHandlersDragOffset: __lockedHandlersDragOffset);
              } else {
                tappedPositionWithPadding = _distance();  //
          
                if (widget.rangeSlider) {  //レンジスライダー時のハンドラー移動
                  if (_leftTapAndSlide) {
                  //   _trackBarSlideCallDragStated(0);
                  //   if (!_tooltipData.disabled! && _tooltipData.alwaysShowTooltip == false) {
                  //     _leftTooltipOpacity = 1;
                  //     _leftTooltipAnimationController.forward();
                  //   }
                  //   _leftHandlerMove(_, tappedPositionWithPadding: tappedPositionWithPadding);
                  } else if(_rightTapAndSlide) {
                    // _trackBarSlideCallDragStated(1);
                    // if (!_tooltipData.disabled! && _tooltipData.alwaysShowTooltip == false) {
                    //   _rightTooltipOpacity = 1;
                    //   _rightTooltipAnimationController.forward();
                    // }
                    // _rightHandlerMove(_, tappedPositionWithPadding: tappedPositionWithPadding);
                  }
                } else {  //シングルスライダー時
                  _trackBarSlideCallDragStated(1);
                  if (!_tooltipData.disabled! && _tooltipData.alwaysShowTooltip == false) {
                    _rightTooltipOpacity = 1;
                    _rightTooltipAnimationController.forward();
                  }
                  _rightHandlerMove(_, tappedPositionWithPadding: tappedPositionWithPadding);
                }
              }
            },
            child: _slidingByActiveTrackBar == true  // ハンドラー間を一度選択してからドラッグ可能に
            ? Draggable(  // ここで背後のバーにドラッグ判定
              axis: widget.axis,
              feedback: Container(),
              child: Container(
                color: Colors.transparent,
              ),
            ) : null,
          ),
        )
      )
    );

  //  items      ..addAll(_points);

    // 範囲変更時に必要
    for (Function func in _positionedItems) {
      items.add(Function.apply(func, []));
    }

    return items;
  }

  _trackBarSlideCallDragStated(handlerIndex) {
    if (!_trackBarSlideOnDragStartedCalled) {
      _callbacks('onDragStarted', handlerIndex);
      _trackBarSlideOnDragStartedCalled = true;
    }
  }

  _distance() {

    // _distanceFromLeftHandler = _distanceFromLeftHandler!.abs();
    // _distanceFromRightHandler = _distanceFromRightHandler!.abs();

    if (widget.axis == Axis.horizontal) {
      return _handlersWidth! / 2 + _touchSize! - xDragTmp;
    } else {
      return _handlersHeight! / 2 + _touchSize! - yDragTmp;
    }
  }

  Positioned _tooltip(
      {String? side, dynamic value, double? opacity, Animation? animation}) {
    if (_tooltipData.disabled! || value == '')
      return Positioned(
        child: Container(),
      );

    Widget prefix;
    Widget suffix;

    if (side == 'left') {
      prefix = _tooltipData.leftPrefix ?? Container();
      suffix = _tooltipData.leftSuffix ?? Container();
      if (widget.rangeSlider == false)
        return Positioned(
          child: Container(),
        );
    } else {
      prefix = _tooltipData.rightPrefix ?? Container();
      suffix = _tooltipData.rightSuffix ?? Container();
    }
    String numberFormat = value.toString();
    if (_tooltipData.format != null)
      numberFormat = _tooltipData.format!(numberFormat);

    List<Widget> children = [
      prefix,
      Text(numberFormat, style: _tooltipData.textStyle),
      suffix,
    ];

    Widget _tooltipHolderWidget = Column(
      mainAxisSize: MainAxisSize.min,
      children: children,
    );
    if (_tooltipData.direction == FlutterSliderTooltipDirection.top) {
      _tooltipHolderWidget = Row(
        mainAxisSize: MainAxisSize.max,
        children: children,
      );
    }

    Widget tooltipWidget = IgnorePointer(
        child: Center(
      child: FittedBox(
        child: Container(
//            height: ,
//          height: __tooltipKEY.currentContext.size.height,
          key: (side == 'left') ? leftTooltipKey : rightTooltipKey,
//            alignment: Alignment.center,
          child: (widget.tooltip != null && widget.tooltip!.custom != null)
              ? widget.tooltip!.custom!(value)
              : Container(
                  padding: EdgeInsets.all(8),
                  decoration: _tooltipData.boxStyle!.decoration,
                  foregroundDecoration:
                      _tooltipData.boxStyle!.foregroundDecoration,
                  transform: _tooltipData.boxStyle!.transform,
                  child: _tooltipHolderWidget),
        ),
      ),
    ));

    double? top, right, bottom, left;
    switch (_tooltipData.direction) {
      case FlutterSliderTooltipDirection.top:
        top = 0;
        left = 0;
        right = 0;
        break;
      case FlutterSliderTooltipDirection.left:
        left = 0;
        top = 0;
        bottom = 0;
        break;
      case FlutterSliderTooltipDirection.right:
        right = 0;
        top = 0;
        bottom = 0;
        break;
      default:
        break;
    }

    if (_tooltipData.positionOffset != null) {
      if (_tooltipData.positionOffset!.top != null)
        top = top! + _tooltipData.positionOffset!.top!;
      if (_tooltipData.positionOffset!.left != null)
        left = left! + _tooltipData.positionOffset!.left!;
      if (_tooltipData.positionOffset!.right != null)
        right = right! + _tooltipData.positionOffset!.right!;
      if (_tooltipData.positionOffset!.bottom != null)
        bottom = bottom! + _tooltipData.positionOffset!.bottom!;
    }

    tooltipWidget = SlideTransition(
        position: animation as Animation<Offset>, child: tooltipWidget);

    return Positioned(
      left: left,
      right: right,
      top: top,
      bottom: bottom,
      child: Opacity(
        opacity: opacity!,
        child: Center(child: tooltipWidget),
      ),
    );
  }

  // 背後のバー設定
  Positioned _inactiveTrack() {
    BoxDecoration boxDecoration = widget.trackBar.inactiveTrackBar ?? BoxDecoration();

    Color trackBarColor = boxDecoration.color ?? Color.fromARGB(17, 47, 47, 171);
    if (widget.disabled)
      trackBarColor = widget.trackBar.inactiveDisabledTrackBarColor;

    double? top, bottom, left, right, width, height;
    top = left = right = width = height = 0;
    right = bottom = null;

    if (widget.axis == Axis.horizontal) {
      bottom = 0;
      left = _handlersPadding;
      width = _containerWidthWithoutPadding!;
      height = widget.trackBar.inactiveTrackBarHeight;
      top = 0;
    } else {
      right = 0;
      height = _containerHeightWithoutPadding;
      top = _handlersPadding;
      width = widget.trackBar.inactiveTrackBarHeight;
    }

    return 
    // Positioned(
    //   left: left,
    //   top: top,
    //   right: right,
    //   bottom: bottom,
    //   child: SizedBox(
    //     height: _constraintMaxHeight,
    //     width: _constraintMaxWidth * 2,
    //     child: SingleChildScrollView(
    //       padding: EdgeInsets.zero,
    //       child: Container(
    //         height: height,
    //         width: width,
    //         decoration: BoxDecoration(
    //           color: trackBarColor,
    //           backgroundBlendMode: boxDecoration.backgroundBlendMode,
    //           shape: boxDecoration.shape,
    //           gradient: boxDecoration.gradient,
    //           border: boxDecoration.border,
    //           borderRadius: boxDecoration.borderRadius,
    //           boxShadow: boxDecoration.boxShadow,
    //           image: boxDecoration.image
    //         ),
    //       ),
    //     ),
    //   ),
    // );
    
    Positioned(
      left: left,
      top: top,
      right: right,
      bottom: bottom,
      child: Center(
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: trackBarColor,
            backgroundBlendMode: boxDecoration.backgroundBlendMode,
            shape: boxDecoration.shape,
            gradient: boxDecoration.gradient,
            border: boxDecoration.border,
            borderRadius: boxDecoration.borderRadius,
            boxShadow: boxDecoration.boxShadow,
            image: boxDecoration.image
          ),
        ),
      ),
    );
  }

  // レンジのバー設定
  Positioned _activeTrack() {
    BoxDecoration boxDecoration = widget.trackBar.activeTrackBar ?? BoxDecoration();

    Color trackBarColor = boxDecoration.color ?? Color(0xff2196F3);
    if(widget.disabled) trackBarColor = widget.trackBar.activeDisabledTrackBarColor;

    double? top, bottom, left, right, width, height;
    top = left = width = height = 0;
    right = bottom = null;

    if (widget.axis == Axis.horizontal) {
      bottom = 0;
      height = widget.trackBar.activeTrackBarHeight;
      if (!widget.centeredOrigin || widget.rangeSlider) {  // ウィジェットが中心原点でないか、範囲スライダーである場合
        width = _rightHandlerXPosition! - _leftHandlerXPosition!;
        left = _leftHandlerXPosition! + _handlersWidth! / 2 + _touchSize!;

        if (widget.rtl == true && widget.rangeSlider == false) {
          left = null;
          right = _handlersWidth! / 2;
          width = _containerWidthWithoutPadding! - _rightHandlerXPosition! - _touchSize!;
        }
      } else {
        if (_containerWidthWithoutPadding! / 2 - _touchSize! > _rightHandlerXPosition!) {
          width = _containerWidthWithoutPadding! / 2 - _rightHandlerXPosition! - _touchSize!;
          left = _rightHandlerXPosition! + _handlersWidth! / 2 + _touchSize!;
        } else {
          left = _containerWidthWithoutPadding! / 2 + _handlersPadding;
          width = _rightHandlerXPosition! + _touchSize! - _containerWidthWithoutPadding! / 2;
        }
      }
    } else {
      right = 0;
      width = widget.trackBar.activeTrackBarHeight;

      if (!widget.centeredOrigin || widget.rangeSlider) {
        height = _rightHandlerYPosition! - _leftHandlerYPosition!;
        top = _leftHandlerYPosition! + _handlersHeight! / 2 + _touchSize!;
        if (widget.rtl == true && widget.rangeSlider == false) {
          top = null;
          bottom = _handlersHeight! / 2;
          height = _containerHeightWithoutPadding! - _rightHandlerYPosition! - _touchSize!;
        }
      } else {
        if (_containerHeightWithoutPadding! / 2 - _touchSize! > _rightHandlerYPosition!) {
          height = _containerHeightWithoutPadding! / 2 - _rightHandlerYPosition! - _touchSize!;
          top = _rightHandlerYPosition! + _handlersHeight! / 2 + _touchSize!;
        } else {
          top = _containerHeightWithoutPadding! / 2 + _handlersPadding;
          height = _rightHandlerYPosition! + _touchSize! - _containerHeightWithoutPadding! / 2;
        }
      }
    }

    width = (width < 0) ? 0 : width;
    height = (height < 0) ? 0 : height;

    return Positioned(
      left: left,
      right: right,
      top: top,
      bottom: bottom,
      child: Center(
        child: Container(
          height: height,
          width: width,
          // decoration: BoxDecoration(
          //   color: trackBarColor,
          //   backgroundBlendMode: boxDecoration.backgroundBlendMode,
          //   shape: boxDecoration.shape,
          //   gradient: boxDecoration.gradient,
          //   border: boxDecoration.border,
          //   borderRadius: boxDecoration.borderRadius,
          //   boxShadow: boxDecoration.boxShadow,
          //   image: boxDecoration.image,
          // ),
          child: InkWell(
            onTap: () {
              _slidingByActiveTrackBar = true;
              setState(() {});
            },
            child: widget.soundFileWidget!(_slidingByActiveTrackBar),
          ),
        ),
      ),
    );
  }

  Positioned _centralWidget() {
    return Positioned(
      left: null,
      top: null,
      right: null,
      bottom: null,
      width: null,
      height: null,
      child: Center(child: widget.trackBar.centralWidget ?? Container()),
    );
  }

  Positioned _playBarWidget() {
    BoxDecoration boxDecoration = widget.trackBar.activeTrackBar ?? BoxDecoration();

    Color trackBarColor = boxDecoration.color ?? Color(0xff2196F3);
    if(widget.disabled) trackBarColor = widget.trackBar.activeDisabledTrackBarColor;

    double? top, bottom, left, right, width, height;
    top = left = width = height = 0;
    right = bottom = null;

    if (widget.axis == Axis.horizontal) {
      bottom = 0;
      height = widget.trackBar.activeTrackBarHeight;
      if (!widget.centeredOrigin || widget.rangeSlider) {  // ウィジェットが中心原点でないか、範囲スライダーである場合
        width = _rightHandlerXPosition! - _leftHandlerXPosition!;
        left = _leftHandlerXPosition! + _handlersWidth! / 2 + _touchSize!;

        if (widget.rtl == true && widget.rangeSlider == false) {
          left = null;
          right = _handlersWidth! / 2;
          width = _containerWidthWithoutPadding! - _rightHandlerXPosition! - _touchSize!;
        }
      } else {
        if (_containerWidthWithoutPadding! / 2 - _touchSize! > _rightHandlerXPosition!) {
          width = _containerWidthWithoutPadding! / 2 - _rightHandlerXPosition! - _touchSize!;
          left = _rightHandlerXPosition! + _handlersWidth! / 2 + _touchSize!;
        } else {
          left = _containerWidthWithoutPadding! / 2 + _handlersPadding;
          width = _rightHandlerXPosition! + _touchSize! - _containerWidthWithoutPadding! / 2;
        }
      }
    } else {
      right = 0;
      width = widget.trackBar.activeTrackBarHeight;

      if (!widget.centeredOrigin || widget.rangeSlider) {
        height = _rightHandlerYPosition! - _leftHandlerYPosition!;
        top = _leftHandlerYPosition! + _handlersHeight! / 2 + _touchSize!;
        if (widget.rtl == true && widget.rangeSlider == false) {
          top = null;
          bottom = _handlersHeight! / 2;
          height = _containerHeightWithoutPadding! - _rightHandlerYPosition! - _touchSize!;
        }
      } else {
        if (_containerHeightWithoutPadding! / 2 - _touchSize! > _rightHandlerYPosition!) {
          height = _containerHeightWithoutPadding! / 2 - _rightHandlerYPosition! - _touchSize!;
          top = _rightHandlerYPosition! + _handlersHeight! / 2 + _touchSize!;
        } else {
          top = _containerHeightWithoutPadding! / 2 + _handlersPadding;
          height = _rightHandlerYPosition! + _touchSize! - _containerHeightWithoutPadding! / 2;
        }
      }
    }

    width = (width < 0) ? 0 : width;
    height = (height < 0) ? 0 : height;

    return Positioned(
      left: left,
      right: right,
      top: top,
      bottom: bottom,
      child: Container(),
    );
  }

  void _callbacks(String callbackName, int handlerIndex) {
    dynamic lowerValue = _outputLowerValue;
    dynamic upperValue = _outputUpperValue;
    if (widget.rtl == true || widget.rangeSlider == false) {
      lowerValue = _outputUpperValue;
      upperValue = _outputLowerValue;
    }

    switch (callbackName) {
      case 'onDragging':
        if (widget.onDragging != null)
          widget.onDragging!(handlerIndex, lowerValue, upperValue);
        break;
      case 'onDragCompleted':
        if (widget.onDragCompleted != null)
          widget.onDragCompleted!(handlerIndex, lowerValue, upperValue);
        break;
      case 'onDragStarted':
        if (widget.onDragStarted != null)
          widget.onDragStarted!(handlerIndex, lowerValue, upperValue);
        break;
    }
  }

  dynamic _displayRealValue(double? value) {
    if (_fixedValues.length > 0) {
      return _fixedValues[value!.toInt()].value;
    }

    return double.parse((value! + _widgetMin!).toStringAsFixed(_decimalScale));
  }

  void _arrangeHandlersZIndex() {
    if (_lowerValue! >= (_realMax! / 2))
      _positionedItems = [
        _rightHandlerWidget,
        _leftHandlerWidget,
        _playbackHandlerWidget,
      ];
    else
      _positionedItems = [
        _leftHandlerWidget,
        _rightHandlerWidget,
        _playbackHandlerWidget,
      ];
  }

  void _renderBoxInitialization() {
    // _containerLeftという変数が0以下、または画面の幅から_constraintMaxWidthという変数を引いた値が_containerLeft以下の場合
    if (_containerLeft <= 0 || (MediaQuery.of(context).size.width - _constraintMaxWidth) <= _containerLeft) {
      // containerKeyという変数に紐づくウィジェットのRenderBoxオブジェクトをcontainerRenderBoxという変数に代入する
      RenderBox containerRenderBox = containerKey.currentContext!.findRenderObject() as RenderBox;
      // containerRenderBoxのグローバル座標系での左上の位置を取得し、そのx座標を_containerLeftという変数に代入する
      _containerLeft = containerRenderBox.localToGlobal(Offset.zero).dx;
    }
    if (_containerTop <= 0 || (MediaQuery.of(context).size.height - _constraintMaxHeight) <= _containerTop) {
      RenderBox containerRenderBox = containerKey.currentContext!.findRenderObject() as RenderBox;
      // containerRenderBoxのグローバル座標系での左上の位置を取得し、そのy座標を_containerTopという変数に代入する
      _containerTop = containerRenderBox.localToGlobal(Offset.zero).dy;
    }
  }
}

// ハンドラー
class _MakeHandler extends StatelessWidget {
  final double? width;
  final double? height;
  final GlobalKey? id;
  final FlutterSliderHandler? handlerData;
  final bool? visibleTouchArea;
  final Animation? animation;
  final Axis? axis;
  final int? handlerIndex;
  final bool rtl;
  final bool rangeSlider;
  final double? touchSize;

  _MakeHandler({
    this.id,
    this.handlerData,
    this.visibleTouchArea,
    this.width,
    this.height,
    this.animation,
    this.rtl = false,
    this.rangeSlider = false,
    this.axis,
    this.handlerIndex,
    this.touchSize
  });

  @override
  Widget build(BuildContext context) {
    double touchOpacity = (visibleTouchArea == true) ? 1 : 0;

    double localWidth, localHeight;
    localHeight = height! + (touchSize! * 2);
    localWidth = width! + (touchSize! * 2);

    FlutterSliderHandler handler = handlerData ?? FlutterSliderHandler();

    if (handlerIndex == 3) {
      handler.child ??= Icon(
        (axis == Axis.horizontal) ? Icons.maximize : Icons.maximize,
        color: Colors.black45,
      );
    } else if (handlerIndex == 2) {
      handler.child ??= Icon(
        (axis == Axis.horizontal) ? Icons.maximize : Icons.maximize,
        color: Colors.black45,
      );
    } else {
      IconData hIcon = (axis == Axis.horizontal) ? Icons.maximize : Icons.maximize;
      if (rtl && !rangeSlider) {
        hIcon = (axis == Axis.horizontal) ? Icons.maximize : Icons.maximize;
      }
      handler.child ??= Icon(hIcon, color: Colors.black45);
    }

    handler.decoration ??= BoxDecoration(
      boxShadow: const [
        BoxShadow(
          color: Colors.transparent,
          blurRadius: 2,
          spreadRadius: 0.2,
          offset: Offset(0, 1)
        ),
      ],
      color: Colors.transparent, shape: BoxShape.rectangle, borderRadius: BorderRadius.circular(24.0),
    );

    return Center(
      child: Container(
        key: id,
        width: localWidth,
        height: localHeight,
        child: Stack(
          children: [
            Opacity(
              opacity: touchOpacity,
              child: Container(
                color: Colors.transparent,
                child: Container(),
              ),
            ),
            Center(
              child: ScaleTransition(
                scale: animation as Animation<double>,
                child: Opacity(
                  opacity: handler.opacity,
                  child: Container(
                    alignment: Alignment.center,
                    foregroundDecoration: handler.foregroundDecoration,
                    decoration: handler.decoration,
                    transform: handler.transform,
                    width: width,
                    height: height,
                    child: handler.child,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
