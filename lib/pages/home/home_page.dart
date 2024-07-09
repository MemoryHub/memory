import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memory/components/background/anim/FadeOutCard.dart';
import 'package:memory/components/button/home_button.dart';
import 'package:memory/model/memory/MemoryInfo.dart';
import 'package:memory/model/meta/Meta.dart';
import 'package:memory/pages/login/login_page.dart';
import 'package:memory/utils/api_config.dart';
import 'package:memory/utils/http_util.dart';
import 'package:memory/utils/preference_util.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isMemory = true; // 相册类型切换 true:memory相册 false:个人相册
  List<Widget> _buttons = []; // 底部按钮

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
        'https://q4.itc.cn/images01/20240317/e50d37ab7314415596b23d9cf1fb8127.jpeg',
        'Van GoghTitle',
        'Van Gogh'),
    MemoryInfo(
        'https://q1.itc.cn/images01/20240317/a83020a77bb04a9f94e5f18811ab9eff.jpeg',
        'Van GoghTitle2',
        'Van Gogh2'),
    MemoryInfo(
        'https://pic1.zhimg.com/70/v2-24e0f2420c7258cbec3c8b780415ebac_1440w.avis?source=172ae18b&biz_tag=Post',
        'Mona Lisa',
        'Vinci')
  ];

  // 个人相册
  List<Meta> personalList = [];

  @override
  void initState() {
    super.initState();
    _checkToken();
  }

  // 查看登录状态
  _checkToken() async {
    bool isLogin = false;
    String accessToken = await PreferenceHelper.getAccessToken();
    if (accessToken.isNotEmpty) {
      isLogin = true;
    } else {
      isLogin = false;
    }
    // 未登录时显示Me按钮，登录后显示Memory和Photo
    setButton(isLogin);
   
  }

  // 设置底部按钮状态
  setButton(isLogin){
 if (!isLogin) {
      _buttons.add(
        HomeButton(
            text: 'Me', imgUrl: 'assets/images/mine.png', onTap: MeOnTap),
      );
    } else {
      _buttons.add(HomeButton(
        text: 'Memory',
        imgUrl: 'assets/images/mine.png', // 使用不同的图片资源
        onTap: PhotoOnTap,
      ));
      _buttons.add(SizedBox(width: 80.w)); // 添加间距
      _buttons.add(HomeButton(
        text: 'Photo',
        imgUrl: 'assets/images/mine.png', // 使用不同的图片资源
        onTap: PhotoOnTap,
      ));
    }
    setState(() {});
  }

 // 获取个人相册
  initPhotoData() async {
    // 获取后台图片数据
    Map<String, Object> _param = {
      "page": 1,
      "size": 10,
    };
    HttpUtil http = new HttpUtil(APIConfig.SEARCH_METADATA, _param);
    dynamic map = await http.getResponseMap(HttpType.POST);
    await setPhotoData(http, map);
  }

  // 个人相册设置数据
  setPhotoData(HttpUtil http, map) {
    // 确保 'assets' 和 'items' 存在
    if (map.containsKey('assets') && map['assets'].containsKey('items')) {
      List<dynamic> jsonList = map['assets']['items'];
      List<Meta> dataList = jsonList
          .map((item) => Meta.fromJson(item as Map<String, dynamic>))
          .toList();
      // 获取 'items' 集合
      if (dataList.isNotEmpty && dataList.length > 0) {
        // 遍历 meta
        dataList.forEach((meta) async {
          personalList.add(meta);
        });
        print('metaList:----------' + personalList.toString());
        setState(() {});
      }
    } else {
      print('Invalid JSON structure');
    }
  }

  // 登录按钮
  void MeOnTap() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => LoginPage(),
    ));
  }

 // 个人相册
  void PhotoOnTap() async {
    // 网络获取数据
    await initPhotoData();
    setState(() {
      isMemory = !isMemory;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      FadeOutCard(
          key: ValueKey(isMemory), dataList: isMemory ? imgList : personalList),
      Positioned(
          bottom: 80,
          child: SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buttons))),
    ]);
  }
}
