import 'dart:async';

import 'package:flutter/material.dart';
import 'package:memory/components/empty/EmptyCard.dart';
import 'package:memory/components/background/MemoryCard.dart';
import 'package:memory/utils/preference_util.dart';

class FadeOutCard extends StatefulWidget {
  final dynamic dataList; // 数据
  final int animTime; // 动画时长
  final int displayTime; // 显示时长

  // animTime 默认动画时长为2m,displayTime 默认显示时长为3
  const FadeOutCard(
      {super.key,
      required this.dataList,
      this.animTime = 2,
      this.displayTime = 3});

  @override
  _FadeOutCardState createState() =>
      _FadeOutCardState(dataList, displayTime, animTime);
}

class _FadeOutCardState extends State<FadeOutCard>
    with TickerProviderStateMixin {
  late List<AnimationController> _conList = []; //  动画控制器
  late List<Animation<double>> _animList = []; //   动画
  late List<AnimatedBuilder> _builderList = []; // 动画布局
  late dynamic _dataList; // 数据
  late int _animTime; // 动画时长
  late int _displayTime; // 显示时长
  Timer? _timer; // 定时器

  _FadeOutCardState(dynamic dataList, int displayTime, int animTime) {
    _dataList = dataList;
    _animTime = animTime;
    _displayTime = displayTime;
  }

  @override
  void initState() {
    super.initState();
    initData();
  }

  //  初始化动画及布局
  initData() async {
    for (var i = 0; i < _dataList.length; i++) {
      // 初始化动画和布局
      await initAnim(i);
    }

    setState(() {});
    // 开始轮播
    startCarousel();
  }

  // 初始化布局
  initWiget(int index) async {
    String accessToken = await PreferenceHelper.getAccessToken();
    _builderList.add(AnimatedBuilder(
      animation: _animList[index],
      builder: (BuildContext context, Widget? child) {
        return Opacity(
            opacity: _animList[index].value,
            child: MemoryCard(
              data: _dataList[index],
              accessToken: accessToken,
            ));
      },
    ));
  }

  // 初始化动画
  initAnim(int index) {
    _conList.add(AnimationController(
      vsync: this,
      duration: Duration(seconds: _animTime),
    ));
    _animList.add(Tween(begin: 1.0, end: 0.0).animate(_conList[index]));
    // 初始化布局
    initWiget(index);
  }

  // 开始轮播
  void startCarousel() {
    if (_dataList.length > 1) {
      // 只有MemoryCard数量>1时，执行任何切换动画
      Future.delayed(Duration(seconds: _displayTime), () {
        startAnim(_dataList.length - 1);
      });

      var duration = Duration(seconds: _displayTime); // 设置轮播间隔  图片展示时长
      int currentIndex = _conList.length - 1;

      // 图片每隔duration秒切换一次
      _timer = Timer.periodic(duration, (timer) {
        // 图片倒序循环显示  memoryCard下标
        currentIndex = (currentIndex - 1 + _conList.length) % _conList.length;
        nextMemoryCard(currentIndex);
      });
    }
  }

  // 开始动画
  void startAnim(int index) {
    _conList[index].forward();
  }

  // 动画翻转
  void reverseAnim(int index) {
    _conList[index].reverse();
  }

  // 启动下一个MemoryCard动画
  void nextMemoryCard(int currentIndex) {
    int nextIndex = (currentIndex - 1 + _conList.length) % _conList.length;
    //清除已经显示过的MemoryCard, 释放内存

    // 图片显示时长
    Future.delayed(Duration(seconds: _displayTime), () {
      // 启动下一个
      startAnim(currentIndex);
      // 显示再下一个MemoryCard
      reverseAnim(nextIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: _dataList.isEmpty ? [EmptyCard()] : _builderList,
    ));
  }

  @override
  void dispose() {
    _conList.forEach((item) {
      item.dispose();
    });
    super.dispose();
    _timer?.cancel(); // 取消定时器
  }
}
