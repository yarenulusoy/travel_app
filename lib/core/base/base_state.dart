import 'package:travel_app/constant/border_constant.dart';
import 'package:travel_app/constant/color_constant.dart';
import 'package:travel_app/constant/height_constant.dart';
import 'package:travel_app/constant/image_constant.dart';
import 'package:travel_app/constant/padding_constant.dart';
import 'package:travel_app/constant/positioned_constant.dart';
import 'package:travel_app/constant/width_constant.dart';

abstract class BaseState{
  final ColorConstants colorConstants = ColorConstants.instance;
  final PaddingConstants paddingConstants = PaddingConstants.instance;
  final WidthConstant widthConstant =WidthConstant.instance;
  final HeightConstant heightConstant =HeightConstant.instance;
  final BorderConstant borderConstant=BorderConstant.instance;
  final ImageConstant imageConstant=ImageConstant.instance;
  final PositionedConstant positionedConstant=PositionedConstant.instance;
}

//bunu yapmamızın sebebi widgete with diyerek BaseState tanımlıyoruz.
//Bu sayede ColorConstant.instance yazmak yerine colorConstant yazarak kullanıyoruz.
//Daha verimli ve daha temiz bir kod yazıyoruz.