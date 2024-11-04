part of 'notification_cubit.dart';

@freezed
class NotificationState with _$NotificationState {
  const factory NotificationState.initial() = _Initial;
  const factory NotificationState.success(List notifications) = _Success;
  const factory NotificationState.failure(String message) = _Failure;
  const factory NotificationState.length(int notificationLength) = _Length;

  const factory NotificationState.loading() = _Loading;
}
