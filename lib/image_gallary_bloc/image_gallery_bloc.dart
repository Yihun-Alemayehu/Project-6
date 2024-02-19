import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:project_6/data/models/image_model.dart';

part 'image_gallery_event.dart';
part 'image_gallery_state.dart';

class ImageGalleryBloc extends Bloc<ImageGalleryEvent, ImageGalleryState> {
  ImageGalleryBloc() : super(ImageGalleryInitial()) {
    on<ImageGalleryEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
