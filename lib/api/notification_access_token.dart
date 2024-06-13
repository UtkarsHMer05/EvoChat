import 'dart:developer';

import 'package:googleapis_auth/auth_io.dart';

class NotificationAccessToken {
  static String? _token;

  //to generate token only once for an app run
  static Future<String?> get getToken async =>
      _token ?? await _getAccessToken();

  // to get admin bearer token
  static Future<String?> _getAccessToken() async {
    try {
      const fMessagingScope =
          'https://www.googleapis.com/auth/firebase.messaging';

      final client = await clientViaServiceAccount(
        // To get Admin Json File: Go to Firebase > Project Settings > Service Accounts
        // > Click on 'Generate new private key' Btn & Json file will be downloaded

        // Paste Your Generated Json File Content
        ServiceAccountCredentials.fromJson({
          "type": "service_account",
          "project_id": "evochat-4c79e",
          "private_key_id": "86dc9ace5a1250a00f0a8968f31324bb70b5455f",
          "private_key":
              "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQChrAqlT7Dc9e8T\nYhhhHsA7gUh7hdiUuh2xCiX5l5fbLgTLGaNOzEBojyWgyMFiuwIyZp/lGWQB0HTM\nLZCy2gzJpOihL9QEUUBT+xo+YnxJ22YBq5S7+yPd0Yw77oJIQ4RY1958Tr0LDo73\n4tKSTWadwQPUBspeGLMJq38+ckLj/uBhVJaSq5ZMie8tN7DZzNyc1n1n1DWpCNi7\n5oyCObkdphRRLKWBQLhyL0mMw7Zv9ahmmX0XABJKxb1RGqQwVsFUzmWtJcUGZCqp\nEQvPJyBa0kJmm0buP1Sgg2MddzcfSFDokpHedJ0i4Lms3QpHiLx6PSkwqSB4i4Yj\nkBkyEHl5AgMBAAECggEARjOHzd+MO245GXATiPyK2WvadvSYJoCoiusOsVH/mSdi\n4nQoAvvTDfP2kVoLCx2MJymDzb3YPKdxSAWTGu5u9hI7B17Wz+ceKTlUXHl0Ybe4\nlAoWxAeZu+SVYaLABLP4oIFf9RdVpBr2vrHJ4MhmQiMBUAyAzBoqiAzlbE6+N/SP\njgWgUTUEN0M67is6/FArVlucOO+DOvmpgPqSlVcRYsafdo0lGFeM5cl96WQIcsh6\ny1UhAAJjQefM0kDDfComtQDE3mwnHH1Va4WCy4jPoqlK/s78+XUnK2/BUWsxf8IB\nBipSEEW/co0JBQ1u8DdaIrUWfr5EPQW2qfDwNQbuFwKBgQDhRkfWfaSy3YXPhK0o\npiOI7a1fDcLZA3+1J+zfU5couppFfEBojGnbfFqq3LsoybdWSkkrPisOhrHofbSZ\nuFi6M2sOtshb+R8zwi5upxHTtxoBZBY1RBrv21o9hHzg8YX8DOoWhwfcFXk/2rU+\nUdIXX+8ITFzojQRLv0LRWof3owKBgQC3uQG1lwcZuu/vaPBa25O0NtPsJTzJuL9S\nQHhuqDsYkVtWmbBC5facpVBiHpay0m1kFN/2eYWXnpK6xM1SAk/D90K2e7lWv5qi\nCUEqqUWegbdLYrsVCLgXWKz6pAZTCiT5IU9gKgUVblJFnyB17lNCh6ukq1jV1wbu\niq6NOQ+MMwKBgAXOQuGzQUBe1yj++Vt31Kidv38YorHnFi58Be3HgLjK/ljWF+7Z\n14yRiuCmaahmcnQl2/biVke8ju839iSUDK1Xz+WELmu4YuZ5larCYYI8UM5CXxQm\nWi9eTtgRBwrhDpvtVUcZWcmBQCu2Hj+p6ikyDr3/AdH4eGjfWAB/PcvTAoGAbKyk\n1DNH4fJv5t/d/QCReDJOXQsR0AjWMuMr2djtS/T/YFR8rLW2kKZAzCln3tMWHfMz\nH2p2mV8VUCEFipMPd82UyriYwzWHVH3A7GlAYyg7sf3ux9xmeHjdqUzI6OnBQRRx\nDWMNqsWdKM2dt+SHn3z9DOTGIYeV9BhYc/Tiu30CgYEApZRcpTac8hSgxv3HK5oG\np4mL0Tlw0s2Y/E2kPLaS+k1nzbWxpKrO2ADAppL61QwHxp52d9v79WGGUurlfM9n\nXcwuLMMK9XoVBKL93dqSwqgA7EVyiQMorOEFbkxEpiMIGPpcFcoR+uXfxy0Y/JFn\n08WF8k8diIUu6EjcBPLFFb0=\n-----END PRIVATE KEY-----\n",
          "client_email":
              "firebase-adminsdk-kc3p4@evochat-4c79e.iam.gserviceaccount.com",
          "client_id": "102407319464727195653",
          "auth_uri": "https://accounts.google.com/o/oauth2/auth",
          "token_uri": "https://oauth2.googleapis.com/token",
          "auth_provider_x509_cert_url":
              "https://www.googleapis.com/oauth2/v1/certs",
          "client_x509_cert_url":
              "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-kc3p4%40evochat-4c79e.iam.gserviceaccount.com",
          "universe_domain": "googleapis.com"
        }),
        [fMessagingScope],
      );

      _token = client.credentials.accessToken.data;

      return _token;
    } catch (e) {
      log('$e');
      return null;
    }
  }
}
