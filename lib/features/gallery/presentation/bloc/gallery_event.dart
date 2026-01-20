import 'package:equatable/equatable.dart';

abstract class GalleryEvent extends Equatable {
  const GalleryEvent();

  @override
  List<Object?> get props => [];
}

class LoadImagesEvent extends GalleryEvent {
  const LoadImagesEvent();
}
