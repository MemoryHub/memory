import 'package:flutter/material.dart';
import 'package:memory/components/background/anim/FadeOutCard.dart';
import 'package:memory/model/MemoryInfo.dart';



void main() {
  runApp(MaterialApp(
    title: 'Memory',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: MainApp(),
  ));
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
List<MemoryInfo> imgList = [
   MemoryInfo(
  'https://rmrbcmsonline.peopleapp.com/upload/zw/bjh_image/1562928602_f210de46edb5c4ace6799a105b6cbf22.jpeg',
  'Last Dinner', 
  'Vinci'),
  MemoryInfo(
  'https://p9.itc.cn/q_70/images03/20211022/900898000dbc4c7c8cc4c7e4486eeb90.jpeg',
  'MonetTitle', 
  'Monet'),
  MemoryInfo(
  'https://q4.itc.cn/images01/20240317/e50d37ab7314415596b23d9cf1fb8127.jpeg'
, 'Van GoghTitle'
, 'Van Gogh'),
  MemoryInfo(
  'https://q1.itc.cn/images01/20240317/a83020a77bb04a9f94e5f18811ab9eff.jpeg'
, 'Van GoghTitle2'
, 'Van Gogh2'),
  MemoryInfo(
  'https://pic1.zhimg.com/70/v2-24e0f2420c7258cbec3c8b780415ebac_1440w.avis?source=172ae18b&biz_tag=Post'
, 'Mona Lisa'
, 'Vinci')];
  
  @override
  Widget build(BuildContext context) {
    return FadeOutCard(dataList: imgList);
  }
 

}