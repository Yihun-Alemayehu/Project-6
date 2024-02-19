import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:project_6/data/constants/api_key.dart';
import 'package:project_6/data/models/image_model.dart';
import 'package:http/http.dart';

part 'image_gallery_event.dart';
part 'image_gallery_state.dart';

final http = Client();

class ImageGalleryBloc extends Bloc<ImageGalleryEvent, ImageGalleryState> {
  ImageGalleryBloc() : super(ImageGalleryInitial()) {
    on<LoadImageGallery>((event, emit) async {
      emit(ImageLoadingState());
      try {
        final response = await http.get(
          Uri.parse('https://api.unsplash.com/photos/?client_id=$ACCESS_KEY'),
        );
        if (response.statusCode == 200) {
          // List<Image> images = [];
          // final data = json.decode(response.body);
          // for (var i = 0; i < 10; i++) {
          //   images.add(Image.fromJson(data[i]));
          // }
          // images.add(Image(id: data['id'], url: data['url']));
          // images.add(Image(id: data['id'], url: data['url']));

          final List<dynamic> jsonData = json.decode(response.body);
          final List<Image> images =
              jsonData.map((data) => Image.fromJson(data)).toList();
          emit(ImageLoadedState(images: images));
        } else {
          emit(const ImageFailedState(errorMessage: "Failed to Fetch images"));
        }
      } catch (e) {
        emit(ImageFailedState(errorMessage: "Error : $e"));
      }
    });
  }
}
