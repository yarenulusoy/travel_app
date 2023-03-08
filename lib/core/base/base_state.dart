import '../constant/border/border_constant.dart';
import '../constant/height/height_constant.dart';
import '../constant/color/color_constant.dart';
import '../constant/image/image_constant.dart';
import '../constant/padding/padding_constant.dart';
import '../constant/positioned/positioned_constant.dart';
import '../constant/string/string_constant.dart';
import '../constant/width/width_constant.dart';
import '../init/theme/light/color_theme_light.dart';
import '../init/theme/light/text_theme_light.dart';


abstract class BaseState {
  final ColorThemeLight colorThemeLight = ColorThemeLight.instance;
  final PaddingConstants paddingConstants = PaddingConstants.instance;
  final WidthConstant widthConstant = WidthConstant.instance;
  final HeightConstant heightConstant = HeightConstant.instance;
  final TextThemeLight textThemeLight = TextThemeLight.instance;
  final StringConstants stringConstants = StringConstants.instance;
  final PositionedConstant positionedConstant=PositionedConstant.instance;
  final BorderConstant borderConstant=BorderConstant.instance;
  final ImageConstant imageConstant=ImageConstant.instance;
  final ColorConstants colorConstants=ColorConstants.instance;
}

//bunu yapmamızın sebebi widgete with diyerek BaseState tanımlıyoruz.
//Bu sayede ColorConstant.instance yazmak yerine colorConstant yazarak kullanıyoruz.
//Daha verimli ve daha temiz bir kod yazıyoruz.
