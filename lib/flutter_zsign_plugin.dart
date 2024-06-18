import 'dart:ffi' as ffi;
import 'dart:ffi';
import 'dart:io' show Platform;
import 'package:ffi/ffi.dart';
import 'flutter_zsign_plugin_platform_interface.dart';

typedef md5C = ffi.Pointer<Utf8> Function(ffi.Pointer<Utf8>);
typedef Md5 = ffi.Pointer<Utf8> Function(ffi.Pointer<Utf8>);

// typedef signIpaC = ffi.Void Function(
//     ffi.Pointer<Utf8>,
//     ffi.Pointer<Utf8>,
//     ffi.Pointer<Utf8>,
//     ffi.Pointer<Utf8>,
//     ffi.Pointer<Utf8>,
//     ffi.Pointer<Utf8>,
//     ffi.Pointer<Utf8>,
//     ffi.Pointer<Utf8>,
//     ffi.Pointer<Utf8>,
//     ffi.Pointer<Utf8>,
//     ffi.Pointer<Utf8>,
//     ffi.Pointer<Utf8>,
//     ffi.Int32,
//     ffi.Int32,
//     ffi.Int32,
//     ffi.Int32,
//     ffi.Int32,
//     ffi.Int32,
//     ffi.Int32,
//     ffi.Int32,
//     ffi.Int32,
//     ffi.Pointer<Utf8>);
//
// typedef SignIpa = void Function(
//     Pointer<Utf8>,
//     Pointer<Utf8>,
//     Pointer<Utf8>,
//     Pointer<Utf8>,
//     Pointer<Utf8>,
//     Pointer<Utf8>,
//     Pointer<Utf8>,
//     Pointer<Utf8>,
//     Pointer<Utf8>,
//     Pointer<Utf8>,
//     Pointer<Utf8>,
//     Pointer<Utf8>,
//     int,
//     int,
//     int,
//     int,
//     int,
//     int,
//     int,
//     int,
//     int,
//     Pointer<Utf8>);

class FlutterZsignPlugin {
  String md5(String str) {
    if (!(Platform.isMacOS || Platform.isIOS)) {
      throw Exception("Only support iOS or macOs platform");
    }
    Md5 md5Fun = DynamicLibrary.process().lookupFunction<md5C, Md5>('md5');
    var value = md5Fun(str.toNativeUtf8());
    return value.toDartString();
  }

  // int md5(String str) {
  //   if (!(Platform.isMacOS || Platform.isIOS)) {
  //     throw Exception("Only support iOS or macOs platform");
  //   }
  //   Md5 md5Fun = DynamicLibrary.process().lookupFunction<md5C, Md5>('sum');
  //   var resultPtr = md5Fun();
  //   // final result = resultPtr.toDartString();
  //   // calloc.free(resultPtr);
  //   return resultPtr;
  // }

  // void signIpa(
  //     String ipaPath,
  //     String p12Path,
  //     String p12Password,
  //     String mpPath,
  //     String dylibFilePath,
  //     String dylibPrefixPath,
  //     String removeDylibPath,
  //     String appName,
  //     String appVersion,
  //     String appBundleId,
  //     String appIconPath,
  //     String outputPath,
  //     int deletePlugIns,
  //     int deleteWatchPlugIns,
  //     int deleteDeviceSupport,
  //     int deleteSchemeURL,
  //     int enableFileAccess,
  //     int sign,
  //     int zipLevel,
  //     int zipIpa,
  //     int showLog,
  //     Pointer<Utf8> error,
  //     ) {
  //   if (!Platform.isIOS) {
  //     throw Exception("Only support iOS platform");
  //   }
  //   final signIpaFn = DynamicLibrary.process().lookupFunction<signIpaC, SignIpa>('sign_ipa');
  //   signIpaFn(
  //     ipaPath.toNativeUtf8(),
  //     p12Path.toNativeUtf8(),
  //     p12Password.toNativeUtf8(),
  //     mpPath.toNativeUtf8(),
  //     dylibFilePath.toNativeUtf8(),
  //     dylibPrefixPath.toNativeUtf8(),
  //     removeDylibPath.toNativeUtf8(),
  //     appName.toNativeUtf8(),
  //     appVersion.toNativeUtf8(),
  //     appBundleId.toNativeUtf8(),
  //     appIconPath.toNativeUtf8(),
  //     outputPath.toNativeUtf8(),
  //     deletePlugIns,
  //     deleteWatchPlugIns,
  //     deleteDeviceSupport,
  //     deleteSchemeURL,
  //     enableFileAccess,
  //     sign,
  //     zipLevel,
  //     zipIpa,
  //     showLog,
  //     error,
  //   );
  // }

  Future<String?> getPlatformVersion() {
    return FlutterZsignPluginPlatform.instance.getPlatformVersion();
  }
}
