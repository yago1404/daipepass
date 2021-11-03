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
    print('add platform ${platform.title}');
    return true;
  }

  Future<bool> deletePlatform({required String title}) async {
    print(title);
    List<PlatformData> platformList = platformDataList;
    return true;
  }
}
