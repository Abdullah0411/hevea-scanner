import 'package:flutter/material.dart';

extension SafeAccess<T> on Iterable<T> {
  T? safeElementAt(int index) => length <= index ? null : elementAt(index);
}

extension ListSafeAccess<T> on List<T> {
  T? safeElementAt(int index) => length <= index ? null : elementAt(index);
}

extension ListWidgets<T> on List<T> {
  List<Widget> listToWidgets(Widget Function(T) builder) {
    return map((item) => builder(item)).toList();
  }
}

extension MapKeysList<K, V> on Map<K, V> {
  List<K> get keysToList => keys.toList();
}

extension MapValuesList<K, V> on Map<K, V> {
  List<V> get valuesToList => values.toList();
}

extension MapFilterByKey<K, V> on Map<K, V> {
  Map<K, V> filterByKey(bool Function(K key) predicate) {
    return Map.fromEntries(
      entries.where((entry) => predicate(entry.key)),
    );
  }
}

