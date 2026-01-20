import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test_task/features/gallery/presentation/bloc/gallery_event.dart';
import 'package:flutter_test_task/features/gallery/presentation/bloc/gallery_state.dart';
import 'package:flutter_test_task/features/new_image/data/services/firebase_storage_service.dart';

class GalleryBloc extends Bloc<GalleryEvent, GalleryState> {
  final FirebaseStorageService storageService;

  GalleryBloc({required this.storageService}) : super(const GalleryInitial()) {
    on<LoadImagesEvent>(_onLoadImages);
  }

  Future<void> _onLoadImages(
    LoadImagesEvent event,
    Emitter<GalleryState> emit,
  ) async {
    emit(const GalleryLoading());
    try {
      final images = await storageService.getUserImages();
      emit(GalleryLoaded(images));
    } catch (e) {
      emit(GalleryError(e.toString()));
    }
  }
}
