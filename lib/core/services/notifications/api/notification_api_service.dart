import 'package:dio/dio.dart';
import 'package:logistic_app/core/api/api_const.dart';
import 'package:logistic_app/core/api/api_response.dart';
import 'package:logistic_app/core/services/notifications/api/api_const.dart';
import 'package:retrofit/retrofit.dart';

part 'notification_api_service.g.dart';

@RestApi(baseUrl: ApiConst.baseUrl)
abstract class NotificationApiService {
  factory NotificationApiService(Dio dio, {String baseUrl}) =
      _NotificationApiService;

  @POST(NotificationsApiConst.saveDeviceToken)
  Future<ApiResponse> saveDeviceToken(@Body() FormData body);

  // @POST(NotificationsApiConst.fetchNotifications)
  // Future<List<NotificationModel>> fetchNotifications(@Body() FormData body);
  @POST(NotificationsApiConst.getUnReedNotifications)
  Future<int> getUnReedNotifications(@Body() FormData body);
}
