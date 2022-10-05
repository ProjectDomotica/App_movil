import 'package:app_front_dark_solution/src/models/datos_models.dart';
import 'package:http/http.dart' as http;

class HttpService {
  final url = 'https://wizgpcbpmm.us-west-2.awsapprunner.com/api/data';

  Future<List<Datos>?> getListado() async {
    final respuestaDatos = await http.get(Uri.parse(url));

    if (respuestaDatos.statusCode == 200) {
      print('Grupos Exito');
      return datosFromJson(respuestaDatos.body);
      // return convert.jsonDecode(respuesta.body);
    } else {
      throw Exception('Error al cargar datos');
    }
  }
}
