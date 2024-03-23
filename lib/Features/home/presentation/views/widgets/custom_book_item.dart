import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({Key? key, required this.image}) : super(key: key);
  final String image ;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.6 / 4,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.red,
            image:  DecorationImage(
              fit: BoxFit.fill,
              image:CachedNetworkImageProvider(image,
              errorListener: (e){
                print('image error $e');
              }
              ),
            )),
      ),
    );
  }
}
