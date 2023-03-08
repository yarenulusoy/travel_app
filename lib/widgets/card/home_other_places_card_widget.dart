// import 'package:flutter/material.dart';
// import 'package:travel_apps/core/base/base_state.dart';
// import 'package:travel_apps/core/extension/context_extension.dart';
// import 'package:travel_apps/widgets/images/jpg_image.dart';
//
// class OtherPlacesCardWidget extends StatelessWidget with BaseState {
//   OtherPlacesCardWidget(
//       {Key? key,
//       required this.title,
//       required this.imagePath,
//       required this.locationTitle,
//       required this.placeTitle,
//       required this.itemCount})
//       : super(key: key);
//
//   final int itemCount;
//   final String title;
//   final List<String> imagePath;
//   final List<String> placeTitle;
//   final List<String> locationTitle;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       //Kafeler kısmı
//       width: context.dynamicWidth(widthConstant.width1),
//       height: context.dynamicHeight(heightConstant.heightPoint30),
//       decoration: BoxDecoration(
//           borderRadius: borderConstant.borderRadiusCircular20,
//           color: colorConstants.hawkesBlue),
//       child: Padding(
//           padding: paddingConstants.paddingAll15,
//           child: Column(
//             children: [
//               Expanded(
//                   flex: 1,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         title,
//                         style: Theme.of(context).textTheme.headlineSmall,
//                       ),
//                       TextButton(
//                           onPressed: () {},
//                           child: Text(
//                             stringConstant.showAllOfThem,
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .bodyLarge
//                                 ?.copyWith(color: Colors.black),
//                           ))
//                     ],
//                   )),
//               Expanded(
//                   flex: 7,
//                   child: otherPlacesListviewBuilder(context)),
//             ],
//           )),
//     );
//   }
//
//   ListView otherPlacesListviewBuilder(BuildContext context) {
//     return ListView.builder(
//                   itemCount: itemCount,
//                   itemBuilder: (BuildContext ctx,int index){
//                     return  Padding(
//                       padding: paddingConstants.paddingOnlyRight10,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Expanded(
//                             flex: 6,
//                             child: Container(
//                                 width: context.dynamicWidth(widthConstant.widthPoint5),
//                                 child: Card(
//                                   child: JpgImage(path: imagePath[index]),
//                                 )),
//                           ),
//                           Padding(padding: paddingConstants.paddingVertical5),
//                           Expanded(
//                               child: Center(
//                                 child: Container(
//                                   padding: paddingConstants.paddingHorizontal5 +
//                                       paddingConstants.paddingVertical5,
//                                   decoration: BoxDecoration(
//                                       borderRadius:
//                                       borderConstant.borderRadiusCircular10,
//                                       color: Colors.grey[800]),
//                                   child: Text(
//                                     placeTitle[index],
//                                     style: TextStyle(
//                                         fontSize: 12, color: Colors.white),
//                                   ),
//                                 ),
//                               )),
//                           Expanded(child: Padding(
//                             padding: paddingConstants.paddingVertical5,
//                             child: Text(locationTitle[index]),
//                           ))
//                         ],
//                       ),
//                     );
//                   },
//                   scrollDirection: Axis.horizontal,
//                 );
//   }
// }
