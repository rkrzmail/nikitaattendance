
import 'package:nikitaattendance/com.ns.data/nson.dart';
import 'package:http/http.dart' as http;

class Internet {


  static Future<Nson> getNson(http.Response response) async {
    try {
      return Nson.parseJson(response.body);
    } on Exception catch (_) {
      return Nson({}).setMessage(response.statusCode, response.body);
    }
  }

  static Future<Nson> getHeaders(http.Response response) async {
    try {
      return Nson(response.headers);
    } on Exception catch (_) {
      return Nson({}).setMessage(response.statusCode, response.body);
    }
  }

  static Future<http.Response> postRaw (String url, {Map? header, Map? body}) async {
    var jbody = Nson(body).toJson();
    Map<String, String> headers =  {"Content-Type": "application/json"
    };
    var response = await http.post(Uri.parse(url),
        headers: headers??{},
        body: jbody
    );
    //App.log (json.encode(headers));
    //App.log (jbody);

    return response;
  }

  static Future<http.Response> getRaw (String url, {Map? header,  Map<String, dynamic>? body}) async {

    String jbody = Uri(queryParameters: body).query;
    Map<String, String> headers =  {"Content-Type": "application/json"
    };

    var response = await http.get(Uri.parse(url + '?' + jbody),
        headers:headers
    );

    return response;
  }

}