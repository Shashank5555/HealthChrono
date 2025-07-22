import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/auth/custom_auth/auth_util.dart';

String? changeDateFormat(String dateString) {
  try {
    DateTime parsedDate;

    // ISO 8601 with optional microseconds and optional timezone offset
    if (RegExp(
            r'^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}(\.\d+)?([+-]\d{2}:\d{2}|Z)?$')
        .hasMatch(dateString)) {
      parsedDate = DateTime.parse(dateString).toLocal();
      return DateFormat('MMMM dd, yyyy hh:mm a').format(parsedDate);
    }

    // Format: YYYY-MM-DD
    if (RegExp(r'^\d{4}-\d{2}-\d{2}$').hasMatch(dateString)) {
      parsedDate = DateFormat('yyyy-MM-dd').parse(dateString);
      return DateFormat('MMMM dd, yyyy').format(parsedDate);
    }

    // Format: YYYY-MM-DD hh:mm:ss AM/PM
    if (RegExp(r'^\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2} (AM|PM)$')
        .hasMatch(dateString)) {
      parsedDate = DateFormat('yyyy-MM-dd hh:mm:ss a').parse(dateString);
      return DateFormat('MMM dd, yyyy hh:mm:ss a').format(parsedDate);
    }

    return 'Invalid date format';
  } catch (e) {
    return 'Invalid date';
  }
}

String? getStartDate(String period) {
  final DateTime now = DateTime.now();
  final DateFormat formatter = DateFormat('yyyy-MM-dd');

  late DateTime startDate;

  // Determine the start date based on the period
  switch (period.toLowerCase()) {
    case "today":
      startDate = now; // Start date is today
      break;
    case "week":
      // Subtract 6 days to include 7 days total (today included)
      startDate = now.subtract(Duration(days: 6));
      break;
    case "month":
      // Subtract 29 days to include 30 days total (today included)
      startDate = now.subtract(Duration(days: 29));
      break;
    case "year":
      // Subtract 364 days to include 365 days total (today included)
      startDate = now.subtract(Duration(days: 364));
      break;
    case "all":
      startDate = DateTime(1970, 1, 1); // Arbitrary start date for "All"
      break;
    default:
      throw Exception("Invalid period: $period");
  }

  // Format the start date to `yyyy-MM-dd`
  return formatter.format(startDate);
}

String? getEndDate() {
  final DateTime now = DateTime.now();
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  return formatter.format(now); // End date is today
}

DateTime? getTokenExpiryTime(bool rememberMe) {
  return DateTime.now().add(Duration(minutes: rememberMe ? 10080 : 60));
}

DateTime getMaxDate() {
  return DateTime.now().subtract(Duration(days: (18 * 365.25).toInt()));
}

List<String> getStartAndEndDateTime(
  DateTime selectedDateLocal,
  String startTimeString,
) {
  // Parse the time string to extract hour and minute
  final timeParts = startTimeString.split(RegExp(r'[: ]'));
  int hour = int.parse(timeParts[0]);
  int minute = int.parse(timeParts[1]);
  String period = timeParts[2];

  // Convert to 24-hour format
  if (period == 'PM' && hour != 12) {
    hour += 12;
  } else if (period == 'AM' && hour == 12) {
    hour = 0;
  }

  // Construct the start datetime in **local time**
  final localStart = DateTime(
    selectedDateLocal.year,
    selectedDateLocal.month,
    selectedDateLocal.day,
    hour,
    minute,
  );

  // Convert to UTC
  final utcStart = localStart.toUtc();
  final utcEnd =
      utcStart.add(Duration(minutes: 30)).subtract(Duration(milliseconds: 1));

  return [
    utcStart.toIso8601String(),
    utcEnd.toIso8601String(),
  ];
}

bool isTimeSlotBooked(
  String selectedDate,
  List<String>? startTimesList,
  String timeSlotString,
  List<String>? latestStatus,
) {
  try {
    if (startTimesList == null || startTimesList.isEmpty) {
      return false;
    }
    // Get device's local timezone offset from UTC
    final timeZoneOffset = DateTime.now().timeZoneOffset;

    // Parse date
    final dateParts = selectedDate.split('-');
    final year = int.parse(dateParts[0]);
    final month = int.parse(dateParts[1]);
    final day = int.parse(dateParts[2]);

    // Parse time string like "12:40 PM"
    final timeParts = timeSlotString.split(' ');
    final hourMinute = timeParts[0].split(':');
    int hour = int.parse(hourMinute[0]);
    int minute = int.parse(hourMinute[1]);
    final period = timeParts[1].toUpperCase();

    if (period == 'PM' && hour != 12) hour += 12;
    if (period == 'AM' && hour == 12) hour = 0;

    // Build local DateTime
    final localTime = DateTime(year, month, day, hour, minute);

    // Convert local time to UTC based on device offset
    final utcEquivalent = localTime.subtract(timeZoneOffset);

    for (int i = 0; i < startTimesList.length; i++) {
      final startUtc = DateTime.parse(startTimesList[i]);

      if (startUtc.year == utcEquivalent.year &&
          startUtc.month == utcEquivalent.month &&
          startUtc.day == utcEquivalent.day &&
          startUtc.hour == utcEquivalent.hour &&
          startUtc.minute == utcEquivalent.minute) {
        // ✅ Only check latestStatus if it's provided
        if (latestStatus != null && i < latestStatus.length) {
          if (latestStatus[i].toLowerCase() == 'cancelled') {
            return false;
          }
        }

        return true;
      }
    }

    return false;
  } catch (e) {
    return false;
  }
}

List<String> formatUtcDateTimeToLocal(String utcDateTimeString) {
  try {
    final utcDateTime = DateTime.parse(utcDateTimeString);

    // Dynamically get local offset from device
    final timeZoneOffset = DateTime.now().timeZoneOffset;

    // Convert to local by applying the offset manually
    final localDateTime = utcDateTime.add(timeZoneOffset);

    // Format date: "Apr 06, 2025"
    final months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    final formattedDate =
        '${months[localDateTime.month - 1]} ${localDateTime.day.toString().padLeft(2, '0')}, ${localDateTime.year}';

    // Format time: "7:00 PM"
    int hour = localDateTime.hour;
    final minute = localDateTime.minute.toString().padLeft(2, '0');
    final isPM = hour >= 12;
    final displayHour = (hour % 12 == 0) ? 12 : (hour % 12);
    final amPm = isPM ? 'PM' : 'AM';
    final formattedTime = '$displayHour:$minute $amPm';

    return [formattedDate, formattedTime];
  } catch (e) {
    return ['Invalid Date', 'Invalid Time'];
  }
}

int convertIsoToUnixTimestamp(String isoDateTimeString) {
  try {
    final utcDateTime = DateTime.parse(isoDateTimeString);
    final localDateTime = utcDateTime.toLocal();
    final unixSeconds = localDateTime.millisecondsSinceEpoch ~/ 1000;
    return unixSeconds;
  } catch (e) {
    return 0; // return 0 on error
  }
}

int calculateAgeFromDate(String birthDateString) {
  try {
    final birthDate = DateFormat('yyyy-MM-dd').parseStrict(birthDateString);
    final today = DateTime.now();

    int age = today.year - birthDate.year;

    // If birthday hasn't occurred yet this year, subtract 1
    if (today.month < birthDate.month ||
        (today.month == birthDate.month && today.day < birthDate.day)) {
      age--;
    }

    return age;
  } catch (e) {
    // You can choose to return -1 or throw depending on how you want to handle parsing errors
    return -1;
  }
}
