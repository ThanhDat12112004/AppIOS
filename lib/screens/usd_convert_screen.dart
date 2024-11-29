import 'package:flutter/material.dart';

class USDConverterScreen extends StatefulWidget {
  const USDConverterScreen({super.key});

  @override
  _USDConverterScreen createState() => _USDConverterScreen();
}

class _USDConverterScreen extends State<USDConverterScreen> {
  final TextEditingController _controller = TextEditingController();
  double? _convertedTemperature;

  void _convertUSD() {
    setState(() {
      final input = double.tryParse(_controller.text);
      if (input != null)
        _convertedTemperature = input / 25265;
      else
        _convertedTemperature = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chuyển VND sang USD'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Nhập số tiền (VND)',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Nhập số tiền VND',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              _convertedTemperature == null
                  ? 'Kết quả sẽ hiển thị ở đây'
                  : 'USD: ${_convertedTemperature!.toStringAsFixed(3)}',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _convertUSD,
        child: const Icon(Icons.h_mobiledata_outlined),
      ),
    );
  }
}
