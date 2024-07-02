import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:memory/model/MemoryInfo.dart';

class MemoryCard extends StatelessWidget {
  
  final MemoryInfo data;

  const MemoryCard({super.key, required this.data});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
      children: [
        background(data.url),
        titleText(data.title),
        authorText(data.author),
      ],
     ),
    );
  }
}

// 背景
Widget background(String imageUrl) {
 return Positioned.fill(
    child: CachedNetworkImage(
        imageUrl: imageUrl,
        placeholder: (context, url) => const CircularProgressIndicator(),
        errorWidget: (context, url, error) => const Icon(Icons.error),
        fit: BoxFit.cover,
      ),
  );
  }

// 标题
Widget titleText(String textMessage) {
  return Positioned(
    bottom: 130.0,
    left: 80.0,
    child: Text(
        textMessage, // 使用传入的textMessage
        style: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
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
      ),
  );
}

// 作者
Widget authorText(String textMessage) {
  return Positioned(
    bottom: 80.0,
    left: 80.0,
    child: Text(
        textMessage, // 使用传入的textMessage
        style: TextStyle(
          fontSize: 14.0,
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
      ),
  );
}