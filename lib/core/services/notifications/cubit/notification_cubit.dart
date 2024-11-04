import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logistic_app/core/services/notifications/repo.dart';

part 'notification_cubit.freezed.dart';
part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationRepository repository;
  NotificationCubit(this.repository) : super(const NotificationState.initial());
  saveDeviceToken({required int userId, required String deviceToken}) async {
    await repository.saveUserToken(token: deviceToken, userId: userId);
  }

  // Future<String?> getDeviceToken() async {
  //   return await repository.getFCMkey();
  // }

  // fetchNotifications({required int userId}) async {
  //   emit(const NotificationState.loading());

  //   final result = await repository.fetchNotifications(userId: userId);
  //   result.when(
  //     success: (notifications) {
  //       emit(NotificationState.success(notifications));
  //     },
  //     failure: (message) {
  //       emit(NotificationState.failure(message));
  //     },
  //   );
  // }

  Future<int> getUnReedNotifications({required int userId}) async {
    emit(const NotificationState.loading());

    final result = await repository.getUnReedNotifications(userId: userId);
    return result.when(
      success: (notifications) {
        emit(NotificationState.length(notifications));
        return notifications;
      },
      failure: (message) {
        emit(NotificationState.failure(message));
        return 0;
      },
    );
  }
}
