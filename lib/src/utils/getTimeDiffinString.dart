class TimeDiffInString {
  String getTime(t) {
    DateTime now = new DateTime.now();
    DateTime messageSentTime = new DateTime.fromMillisecondsSinceEpoch(t);

    Duration diff = now.difference(messageSentTime);

    int seconds = diff.inSeconds;
    double time = 0.0;

    String message = 'a seconds ago';

    if (seconds > 60) {
      // 1m --> 60s
      time = (seconds / 60);
      return '${time.toStringAsFixed(0)}m ago';
    } else if (seconds >= (60 * 60)) {
      // 1h --> 3600s
      time = seconds / 3600;
      return time == 1
          ? 'one hour ago'
          : '${time.toStringAsFixed(0)} hours ago';
    } else if (seconds >= (60 * 60 * 24)) {
      // 1d --> 86400s
      time = seconds / 86400;
      return time >= 1 ? 'one day ago' : '${time.toStringAsFixed(0)} days ago';
    } else if (seconds >= (7 * 24 * 60 * 60)) {
      // 1w --> 604800s
      time = seconds / 604800;
      return time < 3 ? "$time week ago" : "a weeks ago";
    } else if (seconds >= (30 * 24 * 60 * 60)) {
      // 1month --> 2592000s
      time = seconds / 2592000;
      return time == 1 ? 'a month ago' : '${time.toStringAsFixed(0)}months ago';
    }
    return message;
  }
}
