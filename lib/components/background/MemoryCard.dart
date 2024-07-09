import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memory/model/memory/MemoryInfo.dart';
import 'package:memory/model/meta/Meta.dart';
import 'package:memory/utils/api_config.dart';

class MemoryCard extends StatelessWidget {
  final dynamic data;
  final String? accessToken; // 个人相册token，如果类型为MemoryInfo则不需要此参数

  const MemoryCard({super.key, required this.data, this.accessToken});

  @override
  Widget build(BuildContext context) {
    if (data is MemoryInfo) {
      // MemoryInfo相册
      return memoryWidget(data);
    } else if (data is Meta) {
      // 个人相册
      return personalWidget(data, accessToken);
    } else {
      return memoryWidget('');
    }
  }
}

// memory相册
Widget memoryWidget(data) {
  return Scaffold(
    body: Stack(
      children: [
        background(data.url, ''),
        titleText(data.title),
        authorText(data.author),
      ],
    ),
  );
}

// 个人相册
Widget personalWidget(data, accessToken) {
  String url =
      '${APIConfig.GET_IMAGE}${data.id}/thumbnail?size=preview&c=${data.thumbhash}';
  Widget widget;
  // 由于 CachedNetworkImage 目前不支持web端传入headers，所以这里使用Image.network
  if (kIsWeb) { 
    widget = background4web(url, accessToken);
  } else {
    widget = background(url, accessToken);
  }

  return Scaffold(
    body: Stack(
      children: [widget],
    ),
  );
}

// 背景
Widget background(String imageUrl, accessToken) {
  return Positioned.fill(
    child: CachedNetworkImage(
      httpHeaders: <String, String>{'Authorization': 'Bearer $accessToken'},
      imageUrl: imageUrl,
      placeholder: (context, url) => const CircularProgressIndicator(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
      fit: BoxFit.cover,
    ),
  );
}

// 背景  web端网络请求的图片显示
// 因为 CachedNetworkImage不支持web端传入headers，所以这里使用Image.network
Widget background4web(String imageUrl, accessToken) {
  return Positioned.fill(
    child: Image.network(
      imageUrl,
      fit: BoxFit.cover,
      headers: <String, String>{'Authorization': 'Bearer $accessToken'},
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
        fontSize: 44.sp,
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
        fontSize: 22.sp,
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
