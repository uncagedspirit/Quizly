class TimeFormatter {
  TimeFormatter._();

  static String formatDuration(Duration d) {
    final m = d.inMinutes;
    final s = d.inSeconds.remainder(60);
    return '${m}m ${s}s';
  }

  static String formatRelative(DateTime dt) {
    final now = DateTime.now();
    final diff = dt.difference(now);

    if (diff.isNegative) {
      final abs = diff.abs();
      if (abs.inMinutes < 1) return 'just now';
      if (abs.inMinutes < 60) return '${abs.inMinutes}m ago';
      if (abs.inHours < 24) return '${abs.inHours}h ago';
      if (abs.inDays < 7) return '${abs.inDays}d ago';
      return '${dt.day}/${dt.month}/${dt.year}';
    } else {
      if (diff.inMinutes < 1) return 'in less than a minute';
      if (diff.inMinutes < 60) return 'in ${diff.inMinutes}m';
      if (diff.inHours < 24) return 'in ${diff.inHours}h';
      if (diff.inDays < 7) return 'in ${diff.inDays}d';
      return 'on ${dt.day}/${dt.month}';
    }
  }
}
