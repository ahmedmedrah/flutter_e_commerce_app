import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCachedImage extends StatelessWidget {
  final String imgUrl;
  final BoxFit fit;

  CustomCachedImage({
    @required this.imgUrl,
    this.fit: BoxFit.contain,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imgUrl,
      placeholder: (ctx, str) => CircularProgressIndicator(),
      fit: fit,
    );
  }
}
