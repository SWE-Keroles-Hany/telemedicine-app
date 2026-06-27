import 'package:dartz/dartz.dart';
import 'package:telemedicine/core/error/failure.dart';
import 'package:telemedicine/features/check_yourself/data/repo/check_yourself_repo.dart';

class DeleteHistoryUsecase {
  final CheckYourselfRepo checkYourselfRepo;

  DeleteHistoryUsecase({required this.checkYourselfRepo});

  Future<Either<Failure, void>> deleteHistory({required int patientId}) async {
    return await checkYourselfRepo.deleteHistory(patientId: patientId);
  }
}
