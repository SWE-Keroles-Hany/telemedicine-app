abstract class SpecialtiesState {}

class GetSpecialtiesInitial extends SpecialtiesState {}

class GetSpecialtiesLoading extends SpecialtiesState {}

class GetSpecialtiesSuccess extends SpecialtiesState {
  final List<String> specialties;

  GetSpecialtiesSuccess(this.specialties);
}

class GetSpecialtiesError extends SpecialtiesState {
  final String message;

  GetSpecialtiesError(this.message);
}
