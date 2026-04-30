import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telemedicine/features/home/domain/usecases/get_top_doctors.dart';
import 'package:telemedicine/features/home/presentation/cubit/home_states.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetTopDoctorsUseCase getTopDoctorsUseCase;

  HomeCubit({
    required this.getTopDoctorsUseCase,
  }) : super(GetTopDoctorsInitial());

  Future<void> getTopDoctors() async {
    emit(GetTopDoctorsLoading());

    final result = await getTopDoctorsUseCase.getTopDoctors();

    result.fold(
      (failure) => emit(GetTopDoctorsError(failure.message)),
      (topDoctors) => emit(GetTopDoctorsSuccess(topDoctors)),
    );
  }
}
