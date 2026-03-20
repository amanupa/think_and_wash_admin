import 'package:flutter/material.dart';

class ErrorBody extends StatelessWidget {
  final String message;
  const ErrorBody({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, color: Colors.red, size: 48),
          const SizedBox(height: 12),
          Text(message, style: const TextStyle(color: Colors.red)),
        ],
      ),
    );
  }
}
