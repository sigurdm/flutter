// Copyright (c) 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';
import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:flutter_devicelab/framework/framework.dart';
import 'package:flutter_devicelab/framework/ios.dart';
import 'package:flutter_devicelab/framework/utils.dart';

/// Tests that the Flutter module project template works and supports
/// adding Flutter to an existing ios app.
Future<Null> main() async {
  await task(() async {
    section('Create Flutter module project');

    final Directory directory = await Directory.systemTemp.createTemp('module');

    try {
      await inDirectory(directory, () async {
        await flutter(
          'create',
          options: <String>['--org', 'io.flutter.devicelab', '-t', 'module', 'hello'],
        );
      });

      section('Add to iOS app');

      final Directory hostApp = dir(path.join(directory.path, 'hello_host_app'));
      mkdir(hostApp);
      recursiveCopy(
        new Directory(path.join(flutterDirectory.path, 'dev', 'integration_tests', 'ios_host_app')),
        hostApp,
      );

      await writeProvisioningCertificatesToXcConfig(path.join(hostApp.path, 'Debug.xcconfig'));

      await inDirectory(hostApp, () async {
        await exec('pod', <String>['install']);
        await exec('xcrun', <String>['xcodebuild', 'build', '-configuration', 'Debug', 'ONLY_ACTIVE_ARCH=YES',
        '-project', 'ios_host_app.xcodeproj', 'BUILD_DIR=build/ios', '-sdk', 'iphoneos', '-arch', 'arm64']);
      });

      final bool appBuilt = file(path.join(
        hostApp.path,
        'app',
        'build',
        'outputs',
        'apk',
        'debug',
        'app-debug.apk',
      )).existsSync();

      if (!appBuilt) {
        return new TaskResult.failure('Failed to build .apk');
      }
      return new TaskResult.success(null);
    } catch (e) {
      rethrow;
     // return new TaskResult.failure(e.toString());
    } finally {
      // XXX rmTree(directory);
    }
  });
}
