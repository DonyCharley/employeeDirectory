import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../utils/services/api/api_repository.dart';
import '../../utils/services/api/api_response_state.dart';
import '../../utils/services/database/employee_details_database.dart';
import '../../utils/services/database/database_service.dart';
import 'employee_details_model.dart';


class EmployeeDetailsNotifier extends StateNotifier<ResponseState> {
  final ApiRepository _apiRepository;

  EmployeeDetailsNotifier(this._apiRepository) : super(ResponseState.initial());


  EmployeeDatabase employeeDatabase =
  EmployeeDatabase(DatabaseService.instance);


  Future<void> getEmployeeDetails({bool init = true}) async {
    try {
      if (init) state = state.copyWith(isLoading: true);

      List<EmployeeDetails>? list = await employeeDatabase.fetchAddresses();



      if (list.isEmpty) {

        saveAddress();

      }
      else {
        state =
            state.copyWith(response: list, isLoading: false, isError: false);
      }

    } catch (e) {

      state = state.copyWith(
          errorMessage: e.toString(), isError: true, isLoading: false);
    }
  }


  saveAddress(
      {bool init = true}) async {
    try {
      if (init) state = state.copyWith(isLoading: true);
      final fetchAddress = await _apiRepository.fetchEmployeeDetails();

      for(int i=0;i<fetchAddress.length;i++) {
        EmployeeDetails addressList = EmployeeDetails.fromJson(
            fetchAddress[i]);

        employeeDatabase.addEmployeeDetails(EmployeeDetails(
          address: addressList.address,
          company: addressList.company,
          email: addressList.email,
          id: addressList.id,
          name: addressList.name,
          phone: addressList.phone,
          profileImage: addressList.profileImage,
          username: addressList.username,
          website: addressList.website,
        ));
      }

      List<EmployeeDetails>? list = await employeeDatabase.fetchAddresses();
      state =
          state.copyWith(response: list, isLoading: false, isError: false);


  }
catch (e) {

      state = state.copyWith(
          errorMessage: e.toString(), isError: true, isLoading: false);
    }

 }










}