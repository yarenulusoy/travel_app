import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  ImageWidget({Key? key, required this.path, this.boxFit}) : super(key: key);

  String basePath = "assets/images/";
  String path;
  BoxFit? boxFit;

  @override
  Widget build(BuildContext context) {
    int index = path.indexOf('.');
    String extension = path.substring(index + 1, path.length);
    basePath = '$basePath$extension/';
    return Image.asset('$basePath$path', fit: boxFit ?? BoxFit.fill);
  }
}

//kullanımı: dolmabahce.jpg
//bu widget resmin uzantısından dosyasının yolunu buluyor ve ekleyip o şekilde servis ediyor.
//Örnek: dolmabahce.jpg olsun         yolu: assets/images/jpg/dolmabahce.jpg
