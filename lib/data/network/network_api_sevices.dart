// import 'dart:convert';
// import 'dart:io';

// import 'package:http/http.dart';
// import 'package:http/http.dart ' as http;

// import '../app_excaptions.dart';
// import 'base_api_services.dart';

// // A class that extends BaseApiServices to handle API responses
// class NetworkApiResponse extends BaseApiServices {
//   @override

//   // Method to make a GET API request
//   Future getGetApiResponse(String url) async {
//     dynamic responseJson;
//     try {
//       final response =
//           await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));

//       responseJson = returnResponse(response);
//     } on SocketException {
//       throw FetchDataException("No Internet connection");
//     }
//     return responseJson;
//   }

//   // Method to make a POST API request
//   @override
//   Future getPostApiResponse(String url, dynamic data) async {
//     dynamic responseJson;
//     try {
//       Response response =
//           await post(Uri.parse(url), body: data).timeout(Duration(seconds: 10));

//       responseJson = returnResponse(response);
//     } on SocketException {
//       throw FetchDataException("No Internet connection");
//     }
//     return responseJson;
//   }

//   // Method to handle the API response

//   dynamic returnResponse(http.Response response) {
//     switch (response.statusCode) {
//       case 200:
//         dynamic responseJson = jsonDecode(response.body);
//         return responseJson;

//       case 400:
//         return BadReqestException(response.body.toString());

//       case 404:
//         return UnathorisedException(response.body.toString());

//       default:
//         throw FetchDataException(
//             "Error occurred while communicating with the server"
//                     '+'
//                     'with status code ' +
//                 response.statusCode.toString());
//     }
//   }
// }

import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:mvvm/data/app_excaptions.dart';
import 'package:mvvm/data/network/base_api_services.dart';

class NetworkApiService extends BaseApiServices {
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      Response response =
          await post(Uri.parse(url), body: data).timeout(Duration(seconds: 10));

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadReqestException(response.body.toString());
      case 500:
      case 404:
        throw UnathorisedException(response.body.toString());
      default:
        throw FetchDataException(
            'Error accured while communicating with server' +
                'with status code' +
                response.statusCode.toString());
    }
  }
}
