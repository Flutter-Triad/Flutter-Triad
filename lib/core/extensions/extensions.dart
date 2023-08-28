extension NonNullString on String? {
  String onNull() {
    if (this == null) {
      return '';
    } else {
      return this!;
    }
  }
}

extension NonNullLocale on String? {
  String pareWithDefaultLocale() {
    if (this == null) {
      return 'ar';
    } else {
      return this!;
    }
  }
}

extension NonNullBool on bool? {
  bool onNull() {
    if (this == null) {
      return false;
    } else {
      return this!;
    }
  }
}

extension NonNullBoolNotification on bool? {
  bool onNotify() {
    if (this == null) {
      return true;
    } else {
      return this!;
    }
  }
}

extension NonNullDouble on double? {
  double onNull() {
    if (this == null) {
      return 0;
    } else {
      return this!;
    }
  }
}

extension NonNullInt on int? {
  int onNull() {
    if (this == null) {
      return 0;
    } else {
      return this!;
    }
  }
}

extension NonNullList<T> on List<T>? {
  List<T> onNull() {
    if (this == null) {
      return [];
    } else {
      return this!;
    }
  }
}

extension NonNullFunction on Function()? {
  Function() onNull() {
    if (this == null) {
      return () {};
    } else {
      return this!;
    }
  }
}


extension NonNullDateTime on DateTime? {
  DateTime onNull() {
    if (this == null) {
      return DateTime.now();
    } else {
      return this!;
    }
  }
}

extension StringExtension on String {
  String capitalize() {
    if (isEmpty) {
      return this;
    }
    return this[0].toUpperCase() + substring(1);
  }
}