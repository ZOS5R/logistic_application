import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:logistic_app/core/api/api_result.dart';
import 'package:logistic_app/core/services/notifications/api/notification_api_service.dart';

class NotificationRepository {
  final NotificationApiService _apiService;
  NotificationRepository(this._apiService);
  saveUserToken({required String token, required int userId}) async {
    final result = await _apiService.saveDeviceToken(
        FormData.fromMap({"device_token": token, 'user_id': userId}));
    debugPrint('result: $result');
  }

  Future<String?> getFCMkey() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    if (Platform.isIOS) {
      String? fcmKey = await messaging.getToken();
      debugPrint('fcmKey: $fcmKey');

      return fcmKey;
    }
    String? fcmKey = await messaging.getToken();
    debugPrint('fcmKey: $fcmKey');

    return fcmKey;
  }

  // Future<ApiResult> fetchNotifications({required int userId}) async {
  //   try {
  //     final result = await _apiService.fetchNotifications(FormData.fromMap({
  //       'user_id': userId,
  //     }));
  //     return ApiResult.success(result);
  //   } catch (e) {
  //     return ApiResult.failure(e.toString());
  //   }
  // }

  Future<ApiResult> getUnReedNotifications({required int userId}) async {
    try {
      final result = await _apiService.getUnReedNotifications(FormData.fromMap({
        'user_id': userId,
      }));
      return ApiResult.success(result);
    } catch (e) {
      return ApiResult.failure(e.toString());
    }
  }
}
