// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

class DeviceInfoDatasource {
  final DeviceInfoPlugin deviceInfoPlugin;

  DeviceInfoDatasource({
    required this.deviceInfoPlugin,
  });

  Future<IosDeviceInfo> getDeviceInfo() async {
    if (!Platform.isIOS) {
      throw UnsupportedError('there\'s only iOS support right now');
    }

    return await deviceInfoPlugin.iosInfo;
  }
}
