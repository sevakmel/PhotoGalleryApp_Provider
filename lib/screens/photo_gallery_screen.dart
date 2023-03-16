import 'package:flutter/material.dart';
import 'package:photo_gallery_app/provider/gallery_data.dart';
/*import 'package:photo_gallery_app/keys.dart';
import '../services/network_helper.dart';*/
import 'package:provider/provider.dart';

class PhotoGallery extends StatefulWidget {
  @override
  State<PhotoGallery> createState() => _PhotoGalleryState();
}

class _PhotoGalleryState extends State<PhotoGallery> {
  /*Future<List<String>>? images;

  Future<List<String>> getImages() async {
    List<String> images = [];
    String url = "https://pixabay.com/api/?key=$pixabyApiKey&image_type=photo";
    NetworkHelper networkHelper = NetworkHelper(url: url);
    dynamic data = await networkHelper.getData();
    List<dynamic> hitsList = data["hits"] as List;
    for (int i = 0; i < hitsList.length; i++) {
      images.add(hitsList[i]["largeImageURL"]);
    }
    return images;
  }

  @override
  void initState() {
    super.initState();

    images = getImages();
    // getImages().then((value) => print(value));
  } ------------- FOR PROVIDER we have to rid of initstate, FutureBuilder,
  and copy getImages to provider directory (gallery_data.dart) */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(6.0),
          child: GridView.builder(
              itemCount: context.watch<GalleryData>().photos.length/*snapshot.data?.length ??*/,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 6,
                mainAxisSpacing: 6,
              ),
              itemBuilder: (context, index) {
                return Image.network(

                  context.watch<GalleryData>().photos[index],

                  /*snapshot.data![index],*/

                  fit: BoxFit.cover,
                );
              }),
        ),
      ),
     );
  }
}
