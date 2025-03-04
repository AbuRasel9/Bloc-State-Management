import 'package:bloc/bloc.dart';
import 'package:bloc_state_management/bloc/imagePicker/image_picker_event.dart';
import 'package:bloc_state_management/bloc/imagePicker/image_picker_state.dart';
import 'package:bloc_state_management/utils/image_picker_utils.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  final ImagePickerUtils imagePickerUtils;

  ImagePickerBloc(this.imagePickerUtils) : super(const ImagePickerState()) {
    on<CameraCaptureEvent>(_cameraCapture);
    on<GalleryCaptureEvent>(_galleryCapture);
  }

  void _cameraCapture(
      CameraCaptureEvent event, Emitter<ImagePickerState> emit) async {
    XFile? file = await imagePickerUtils.pickImageCamera();
    emit(
      state.copyWith(
        file: file,
      ),
    );
  }

  void _galleryCapture(
      GalleryCaptureEvent event, Emitter<ImagePickerState> emit) async {
    XFile? file = await imagePickerUtils.pickImageGallery();
    emit(state.copyWith(file: file));
  }


}
