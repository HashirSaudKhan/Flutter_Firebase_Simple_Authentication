import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RoundButton extends StatelessWidget {
  final String title;
  bool loading;
  final VoidCallback onTap;
  RoundButton({
    super.key,
    required this.title,
    required this.onTap,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 70,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.deepPurple[300]),
        child: Center(
            child: loading
                ? const CircularProgressIndicator(
                    strokeWidth: 3,
                    color: Colors.white,
                  )
                : Text(
                    title,
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  )),
      ),
    );
  }
}
