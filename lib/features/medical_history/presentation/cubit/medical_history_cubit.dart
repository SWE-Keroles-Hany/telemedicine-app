import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telemedicine/features/medical_history/domain/usecases/get_medical_history.dart';
import 'package:telemedicine/features/medical_history/domain/usecases/rate_doctor.dart';
import 'package:telemedicine/features/medical_history/presentation/cubit/medical_history_states.dart';

class MedicalHistoryCubit extends Cubit<MedicalHistoryState> {
  final GetMedicalHistoryUseCase getMedicalHistoryUseCase;
  final RateDoctorUseCase rateDoctorUseCase;

  MedicalHistoryCubit({
    required this.getMedicalHistoryUseCase,
    required this.rateDoctorUseCase,
  }) : super(GetMedicalHistoryInitial());

  Future<void> getMedicalHistory() async {
    emit(GetMedicalHistoryLoading());

    final result = await getMedicalHistoryUseCase.getMedicalHistory();

    result.fold(
      (failure) => emit(GetMedicalHistoryError(failure.message)),
      (medicalHistory) => emit(GetMedicalHistorySuccess(medicalHistory)),
    );
  }

  Future<void> rateDoctor({
    required int doctorId,
    required int starts,

    required int medicalRecordId,
  }) async {
    emit(RateDoctorLoading());

    final result = await rateDoctorUseCase.rateDoctor(
      medicalRecordId: medicalRecordId,
      doctorId: doctorId,
      starts: starts,
    );

    result.fold(
      (failure) => emit(RateDoctorError(failure.message)),
      (_) => emit(RateDoctorSuccess()),
    );
  }
}
