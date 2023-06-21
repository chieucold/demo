// Helper functions for validator and sanitizer.

T? shift<T>(List<T> l) {
  if (l.isNotEmpty) {
    // ignore: always_specify_types
    final first = l.first;
    l.removeAt(0);
    return first;
  }
  return null;
}

// ignore: always_specify_types
Map merge(Map? obj, Map? defaults) {
  // ignore: parameter_assignments
  obj ??= <dynamic, dynamic>{};
  // ignore: parameter_assignments
  defaults?.forEach((dynamic key, dynamic val) => obj!.putIfAbsent(key, () => val));
  return obj;
}
