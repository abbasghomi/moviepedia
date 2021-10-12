import 'package:flutter/material.dart';

class ErrorSnackBar{
  final BuildContext context;
  final int? statusCode;
  final String? message;

  ErrorSnackBar({required this.context, this.statusCode, this.message});

  void show(){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  child: Icon(Icons.error,color: Colors.red,),
                ),
                Text('Error fetching data!'),
              ],
            ),
            Text('Status Code: $statusCode'),
            Text('Message: $message'),
          ],
        ),
      ),
    );
  }


}