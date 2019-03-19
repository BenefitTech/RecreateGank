String getTimestampString(DateTime date) {
  DateTime currentDate = DateTime.now();
  Duration diff = currentDate.difference(date);

  if (diff.inDays > 0) {
    return diff.inDays.toString() + '几天前';
  } else if (diff.inHours > 0) {
    return diff.inHours.toString() + '几小时前';
  } else if (diff.inMinutes > 0) {
    return diff.inMinutes.toString() + '几分钟前';
  } else if (diff.inSeconds > 0) {
    return '刚刚';
  }

  return date.toString();
}

String formatDate({String dateString}) {
  DateTime moonLanding = DateTime.parse(dateString);
  return '${moonLanding.year}-${moonLanding.month}-${moonLanding.day}';
}

String getWeekday({int index}) {
  const days = ['日', '一', '二', '三', '四', '五', '六'];
  return days[index];
}

String getDayString({String dateString}) {
  DateTime dateTime = DateTime.parse(dateString);
  String day = dateTime.day.toString();
  return day.length < 2 ? '0$day' : day;
}

String getMonthString({String dateString}) {
  DateTime date = DateTime.parse(dateString);
  const months = [
    "一月",
    "二月",
    "三月",
    "四月",
    "五月",
    "六月",
    "七月",
    "八月",
    "九月",
    "十月",
    "十一月",
    "十二月"
  ];
  return '${months[date.month - 1]}';
}
