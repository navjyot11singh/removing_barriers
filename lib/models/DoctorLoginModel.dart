import 'Data.dart';
import 'DoctorData.dart';

class DoctorLoginModel {
  final int? status;
  final bool? error;
  final String? message;
  final DoctorData? data;

  DoctorLoginModel({
    this.status,
    this.error,
    this.message,
    this.data,});

  factory DoctorLoginModel.fromJson(Map<String, dynamic> json) {
    return DoctorLoginModel(
      status: json['status'],
      error: json['error'],
      message: json['message'],
      data: DoctorData.fromJson(json['data']),
      // token: json['token'],
    );
  }

}