import 'package:flutter/material.dart';
import '../sentinel_logic.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _controller = TextEditingController();
  String lastInput = "";
  Map<String, dynamic>? result;
  String learningState = "v0.1";

  void _submitInput() {
    String input = _controller.text;
    result = Sentinel.evaluate(input, lastInput: lastInput);

    if (result!['decision'] == SentinelDecision.AllowLearn) {
      learningState = "v0.2";
    } else {
      learningState = "v0.1";
    }

    setState(() {
      lastInput = input;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sentinel v0.1 Test App")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "輸入文字測試 Sentinel"),
            ),
            SizedBox(height: 10),
            ElevatedButton(onPressed: _submitInput, child: Text("送出")),
            SizedBox(height: 20),
            if (result != null)
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Sentinel 判定: ${result!['decision']}"),
                      Text("理由: ${result!['reason']}"),
                      Text("Allow Response: ${result!['allowResponse']}"),
                      Text("Learning State: $learningState")
                    ],
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
