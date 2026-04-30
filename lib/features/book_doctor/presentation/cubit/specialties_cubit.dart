import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telemedicine/features/book_doctor/domain/usecases/get_specialties.dart';
import 'package:telemedicine/features/book_doctor/presentation/cubit/specialties_states.dart';

class SpecialtiesCubit extends Cubit<SpecialtiesState> {
  final GetSpecialtiesUseCase getSpecialtiesUseCase;

  SpecialtiesCubit({required this.getSpecialtiesUseCase})
      : super(GetSpecialtiesInitial());

  Future<void> getSpecialties() async {
    emit(GetSpecialtiesLoading());

    final result = await getSpecialtiesUseCase.getSpecialties();

    result.fold(
      (failure) => emit(GetSpecialtiesError(failure.message)),
      (specialties) => emit(GetSpecialtiesSuccess(specialties)),
    );
  }
}
