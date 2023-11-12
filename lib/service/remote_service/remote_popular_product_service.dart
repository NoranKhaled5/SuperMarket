import 'package:http/http.dart' as http;

import '../../const.dart';

class RemotePopularProductService {
  var client = http.Client();
  var remoteUrl = '$baseUrl/api/popularproducts';

  Future<dynamic> get() async {
    var response = await client.get(
      Uri.parse('$remoteUrl?populate=product,product.images')
    );
    return response;

  }
}