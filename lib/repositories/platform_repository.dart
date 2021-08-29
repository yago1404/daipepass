import 'package:daipepass/database.test.dart';
import 'package:daipepass/models/platform_data.dart';

class PlatformRepository {
  Future<List<PlatformData>> getAllPlatforms() async {
    await Future.delayed(Duration(seconds: 1));
    return platformDataList;
  }

  Future<bool> addPlatform({
    required PlatformData platform,
  }) async {
    return true;
  }

  Future<bool> deletePlatform({
    required PlatformData platform,
  }) async {
    return true;
  }
}
