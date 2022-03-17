
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../modules/employee_details/employee_details_notifier.dart';
import 'api_repository.dart';

//base API provider

final homeApiRepositoryProvider = Provider<ApiRepository>(
      (ref) => ApiRepository(),
);

final employeeDetailsNotifier = StateNotifierProvider(
  (ref) => EmployeeDetailsNotifier(ref.watch(homeApiRepositoryProvider)),
);
