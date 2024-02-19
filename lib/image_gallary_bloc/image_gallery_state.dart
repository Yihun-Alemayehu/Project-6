part of 'image_gallery_bloc.dart';

abstract class ImageGalleryState extends Equatable {
  const ImageGalleryState();
  
  @override
  List<Object> get props => [];
}

class ImageGalleryInitial extends ImageGalleryState {}

class ImageLoadingState extends ImageGalleryState{}

class ImageLoadedState extends ImageGalleryState{
  final List<Image> images;

  const ImageLoadedState({required this.images});

  @override
  List<Object> get props => [images];
}

class ImageFailedState extends ImageGalleryState{
  final String errorMessage;

  const ImageFailedState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
