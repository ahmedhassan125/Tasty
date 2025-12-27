// // import 'dart:io';
// // import 'package:flutter/services.dart';
// //
// // class SSLPinning {
// //   static Future<SecurityContext> createSecurityContext() async {
// //     final certData = await rootBundle.load(
// //       'assets/certs/server_cert.cer',
// //     );
// //
// //     final context = SecurityContext(withTrustedRoots: false);
// //
// //     context.setTrustedCertificatesBytes(
// //       certData.buffer.asUint8List(),
// //     );
// //
// //     return context;
// //   }
// // }
// import 'dart:io';
// import 'package:flutter/services.dart';
//
// class SSLPinning {
//   static Future<SecurityContext> createSecurityContext() async {
//     final certData = await rootBundle.load('assets/certs/server_cert.cer');
//
//     final context = SecurityContext(withTrustedRoots: false);
//     context.setTrustedCertificatesBytes(certData.buffer.asUint8List());
//
//     return context;
//   }
// }
//
//
