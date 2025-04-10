import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService{
  static const String _rota = '/get_advice';
  static const String _baseUrl = 'https://make-communication.onrender.com';
  
  static Future<String> getAdvice(String message) async{
    final url = Uri.parse('$_baseUrl$_rota');

    final response = await http.post(
      url,
      headers: {'Content-Type':'application/json'},
      body: jsonEncode({'message':message}),
    );

    if (response.statusCode == 200){
      final data = jsonDecode(response.body);
      return data['reply'] ?? 'Falha ao obter resposta.';
    } else {
      final error = jsonDecode(response.body);
      final erro = error['message'] ?? 'Erro desconhecido';
      throw Exception('Erro ${response.statusCode}: $erro');
    }
  }
}
