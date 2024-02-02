part of '../../wfile.dart';

/// The base class for key-value brokers.
abstract class Broker<K, T> {
  const Broker();

  K get prefix;

  bool exists(K key);

  T? read(K key);

  void write(K key, T value);

  /// Delete this key-value.
  void delete(K key);

  /// Delete all pairs of key-value.
  void clear();
}
