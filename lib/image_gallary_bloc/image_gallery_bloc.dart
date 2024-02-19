import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
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
          Uri.parse(
              'https://api.unsplash.com/photos/?client_id=YOUR_ACCESS_KEY'),
        );
      } catch (e) {}
    });
  }
}
