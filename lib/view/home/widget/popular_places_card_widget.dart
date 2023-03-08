part of '../home_content_view.dart';

class _PopularPlacesWidget extends StatefulWidget {
  _PopularPlacesWidget({Key? key}) : super(key: key);

  @override
  State<_PopularPlacesWidget> createState() => _PopularPlacesWidgetState();
}

class _PopularPlacesWidgetState extends State<_PopularPlacesWidget>
    with BaseState {
  @override
  final FirebaseFunctions _functions = FirebaseFunctions();
  List popularPlacesList = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AutoSizeTextWidget(
                  title: HomeStringValues().POPULAR_PLACES,
                  style: textThemeLight.headline6,
                  maxLines: 1,
                ),
              ],
            )),
        Expanded(
            flex: 6,
            child: FutureBuilder(
                future: _functions.getAllPost(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Text("Hata oluştu");
                  }
                  if (snapshot.connectionState == ConnectionState.done) {
                    popularPlacesList = snapshot.data as List;
                    return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: popularPlacesList.length,
                        itemBuilder: (BuildContext context, int index) {
                          var post = popularPlacesList[index];
                          return Padding(
                            padding: paddingConstants.paddingOnlyRight15,
                            child: GestureDetector(
                              onTap: () {
                                String? post_id = popularPlacesList[index].id;
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DetailPage(
                                            placesList: post,
                                            post_id: post_id)));
                              },
                              child: PlacesCardWidget(
                                post_id: popularPlacesList[index].id.toString(),
                                title:
                                    popularPlacesList[index].title.toString(),
                                city: popularPlacesList[index]
                                    .city
                                    .toString(),
                              ),
                            ),
                          );
                        });
                  }
                  return Center(child: CircularProgressIndicator());
                })),
      ],
    );
  }
}

