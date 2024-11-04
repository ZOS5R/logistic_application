import 'package:easy_localization/easy_localization.dart';

String timeAgo(DateTime timestamp) {
  final now = DateTime.now();
  final difference = now.difference(timestamp);

  if (difference.inDays > 365) {
    final years = (difference.inDays / 365).floor();
    return '$years ${years > 1 ? 'years'.tr() : 'year'.tr()} ${'ago'.tr()}';
  } else if (difference.inDays > 30) {
    final months = (difference.inDays / 30).floor();
    return '$months ${months > 1 ? 'months'.tr() : 'month'.tr()} ${'ago'.tr()}';
  } else if (difference.inDays > 0) {
    return '${difference.inDays} ${difference.inDays > 1 ? 'days'.tr() : 'day'.tr()} ${'ago'.tr()}';
  } else if (difference.inHours > 0) {
    return '${difference.inHours} ${difference.inHours > 1 ? 'hours'.tr() : 'hour'.tr()} ${'ago'.tr()}';
  } else if (difference.inMinutes > 0) {
    return '${difference.inMinutes} ${difference.inMinutes > 1 ? 'minutes'.tr() : 'minute'.tr()} ${'ago'.tr()}';
  } else {
    return 'Just now'.tr();
  }
}
