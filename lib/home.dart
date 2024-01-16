import 'package:counter_provider/controller/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('Rebuild');
    final countPro = Provider.of<CounterProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Provider'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Counter', style: TextStyle(fontSize: 25)),
            const SizedBox(height: 10),
            Consumer<CounterProvider>(
              builder: (context, data, child) {
                return Text(data.counter.toString(),
                    style: const TextStyle(fontSize: 20));
              },
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                    onPressed: () {
                      countPro.increment();
                    },
                    child: const Icon(Icons.add)),
                const SizedBox(width: 20),
                FloatingActionButton(
                    onPressed: () {
                      countPro.decrement();
                    },
                    child: const Icon(Icons.remove)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
