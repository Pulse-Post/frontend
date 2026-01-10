abstract interface class LocalStorageService {
  Future get(String key);
  Future put(String key, String value);
  Future delete(String key);
}
