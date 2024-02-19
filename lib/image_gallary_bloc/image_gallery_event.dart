part of 'image_gallery_bloc.dart';

abstract class ImageGalleryEvent extends Equatable {
  const ImageGalleryEvent();

  @override
  List<Object> get props => [];
}

class LoadImageGallery extends ImageGalleryEvent {}


