import 'package:flutter/material.dart';

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
        width: 50,
        height: 50,
        child: InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              // 按钮点击事件
              onTap();
            },
            child: Center(
                child: Image(
                    width: 18, height: 18, image: AssetImage(imgUrl)))),
      ),
    );
  }

  // 底部文字
  Widget bottomText() {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 12,
        color: Colors.white,
        fontFamily: 'Playwrite',
      ),
    );
  }
}
