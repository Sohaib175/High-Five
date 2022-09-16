import 'package:get_storage/get_storage.dart';

class GetStorageHandler {
  final getStorage = GetStorage();

  setLocaleId(String userId) {
    getStorage.write("userId", userId);
  }

  String getLocaleId() {
    var data = getStorage.read("userId");
    return data ?? "";
  }

  deleteLocaleId() {
    getStorage.remove("userId");
  }
}
