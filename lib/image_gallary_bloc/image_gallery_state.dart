part of 'image_gallery_bloc.dart';

sealed class ImageGalleryState extends Equatable {
  const ImageGalleryState();
  
  @override
  List<Object> get props => [];
}

final class ImageGalleryInitial extends ImageGalleryState {}
