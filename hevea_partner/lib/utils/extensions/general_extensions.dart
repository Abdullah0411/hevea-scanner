extension SafeAccess<T> on T? {
  T safe(T defaultValue) => this ?? defaultValue;
}
