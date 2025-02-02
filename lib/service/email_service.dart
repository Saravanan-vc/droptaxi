import 'dart:convert';
import 'package:http/http.dart' as http;

class EmailService {
  static Future<void> sendEmail(
    dynamic time,
    dynamic date,
    dynamic name,
    dynamic number,
    dynamic amount,
    dynamic services,
    dynamic car,
    dynamic from,
    dynamic to,
  ) async {
    const String functionUrl = 'https://router-mjqqnn3geq-uc.a.run.app/sendMail';

    // Create the request body as JSON
    Map<String, dynamic> body = {
      "time": time,
      "date": date,
      "name": name,
      "number": number,
      "amount": amount.toString(),
      "services": [services, car],
      "from": from,
      "to": to
    };

   // Map<String, String> body = {'nop': "noop", 'noop': "nop"};

    try {
      // Send POST request to the function
      final response = await http.post(
        Uri.parse(functionUrl),
        headers: {"Content-Type": "application/json"},
        body: json.encode(body),
      );

      if (response.statusCode == 200) {
        // The function executed successfully
        print('Email sent successfully: ${response.body}');
      } else {
        // If the server responds with an error
        print('Error: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      // Catch any error while sending the request
      print('Error sending request: $e');
    }
  }
}

/**
 * {
    "time": "07:45",
    "date": "15/06/224",
    "name": "saravanan",
    "number": 9790860187,
    "amount": 4500,
    "km": 4589,
    "from": "salem",
    "to": "chennai"
} *
**/