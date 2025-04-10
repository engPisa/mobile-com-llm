import 'package:flutter/material.dart';
import 'services/api_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Conselhos de Estudo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        useMaterial3: true,
      ),
      home: const StudyAdvicePage(),
    );
  }
}

class StudyAdvicePage extends StatefulWidget {
  const StudyAdvicePage({super.key});

  @override
  State<StudyAdvicePage> createState() => _StudyAdvicePageState();
}

class _StudyAdvicePageState extends State<StudyAdvicePage> {
  final TextEditingController _controller = TextEditingController();
  String _response = '';
  bool _loading = false;

  void _buscarConselho() async {
    final message = _controller.text.trim();
    if (message.isEmpty) return;

    setState(() {
      _loading = true;
      _response = '';
    });

    try {
      final result = await ApiService.getAdvice("Sou um estudante. Minha dúvida é: $message");
      setState(() {
        _response = result;
      });
    } catch (e) {
      setState(() {
        _response = 'Erro ao buscar resposta: $e';
      });
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[50],
      appBar: AppBar(
        title: const Text('📚 Conselhos de Estudo'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Digite sua dúvida ou dificuldade 👇',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _controller,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: 'Ex: Não consigo focar nos estudos...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                fillColor: Colors.white,
                filled: true,
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: _loading ? null : _buscarConselho,
              icon: const Icon(Icons.psychology_alt),
              label: const Text('Pedir conselho'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
                minimumSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 20),
            if (_loading)
              const CircularProgressIndicator()
            else if (_response.isNotEmpty)
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.indigo.shade100),
                  ),
                  child: SingleChildScrollView(
                    child: Text(
                      _response,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
