import 'dart:async';
import 'package:sqflite/sqflite.dart';
import '../../../modules/employee_details/employee_details_model.dart';
import 'database_service.dart';

class EmployeeDatabase {
  final DatabaseService _service;

  EmployeeDatabase(this._service);


  Future<dynamic> addEmployeeDetails(EmployeeDetails employeeDetails) async {
    try{
      final Database? db = await _service.database;

      return await db!.insert(
        _service.employeeDetailsTable,
        employeeDetails.toJson(),
      );


    } on DatabaseException catch (e){


    }

  }

  Future<List<EmployeeDetails>>  fetchAddresses() async {

    final Database? db = await _service.database;
    List<EmployeeDetails>  employeeDetails=[];

    final List<Map<String, dynamic>> maps = await db!.rawQuery(
        'SELECT * FROM ${_service.employeeDetailsTable} ');

    maps.forEach((v) {
      employeeDetails.add( EmployeeDetails.fromJsonDB(v));
    });


    return employeeDetails;



  }




}
