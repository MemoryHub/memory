import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final String imgUrl;

  const HomeButton(
      {super.key,
      required this.text,
      required this.imgUrl,
      required this.onTap});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [topCircle(), const SizedBox(height: 10), bottomText()],
    );
  }

  // 顶部圆圈
  Widget topCircle() {
    return Material(
      elevation: 5,
      shape: const CircleBorder(),
      color: Color.fromARGB(255, 223, 228, 232), // 按钮颜色
      child: Ink(
        width: 80.w,
        height: 80.h,
        child: InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              // 按钮点击事件
              onTap();
            },
            child: Center(
                child:
                    Image(width: 30.w, height: 30.h, image: AssetImage(imgUrl)))),
      ),
    );
  }

  // 底部文字
  Widget bottomText() {
    return Text(
      text,
      style: TextStyle(
        fontSize: 18.sp,
        color: Colors.white,
        fontFamily: 'Playwrite', // 确保字体名称正确，这里注释掉或替换为您的字体名称
        shadows: <Shadow>[
          Shadow(
            offset: const Offset(2.0, 2.0), // 阴影的水平和垂直偏移量
            blurRadius: 5.0, // 阴影的模糊半径
            color: Colors.black.withOpacity(0.5), // 阴影的颜色，这里使用半透明的黑色
          ),
        ],
      ),
    );
  }
}
