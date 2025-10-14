import 'dart:io';
import 'package:carsnexus_employee/Network/api_connection_test_response_model.dart';
import 'package:carsnexus_employee/Network/api_header.dart';
import 'package:carsnexus_employee/Network/api_services.dart';
import 'package:carsnexus_employee/Network/apis.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'Check pattern of baseUrl in Apis',
    () {
      // Define the regex pattern for the URL
      var pattern1 = RegExp(r'^https:\/\/.*\/api\/employee\/$');
      var pattern2 = RegExp(r'^http:\/\/.*\/api\/employee\/$');

      // Check if the baseUrl matches the pattern
      expect(
        ((pattern1.hasMatch(Apis.baseUrl) || pattern2.hasMatch(Apis.baseUrl)) &&
            Apis.baseUrl != "https://carsnexus.com/api/employee/"),
        isTrue,
        reason: 'The baseUrl does not match the required pattern',
      );
    },
  );

  test(
    'api_services.g.dart file exists',
    () {
      var filePath = 'lib/Network/api_services.g.dart';

      // Check if the file exists
      expect(File(filePath).existsSync(), isTrue,
          reason: 'api_services.g.dart file does not exist/\n'
              'Please run the command: flutter pub run build_runner build --delete-conflicting-outputs');
    },
  );

  test(
    'Check if [Apis.apiConnectionTest] endpoint is giving response',
    () async {
      ApiConnectionTestResponse response;
      response = await ApiServices(ApiHeader().dioData()).apiConnectionTest();
      expect(response.success, true, reason: 'The response from /${Apis.apiConnectionTest} is not successful');
    },
  );
}
