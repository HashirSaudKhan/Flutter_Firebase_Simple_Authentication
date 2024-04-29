import 'package:flutter/material.dart';
import 'package:flutter_firebase_ui/Providers/loadingcircleprovider.dart';
import 'package:provider/provider.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const RoundButton({
    super.key,
    required this.title,
    required this.onTap,
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
          color: Colors.deepPurple[300],
        ),
        child: Center(
          child: Provider.of<LoadingCircleProvider>(context).loading
              ? const CircularProgressIndicator(
                  strokeWidth: 3,
                  color: Colors.white,
                )
              : Text(
                  title,
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
        ),
      ),
    );
  }
}
