import 'package:flutter/material.dart';

class Utils {
  static void toastmsg(BuildContext context, String message) {
    // Get the overlay state
    OverlayState overlay = Overlay.of(context);

    // Create a new overlay entry
    OverlayEntry overlayEntry = OverlayEntry(
      builder: (BuildContext context) => Positioned(
        bottom: 16.0,
        //left: MediaQuery.of(context).size.width * 0.10,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12.0),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.8),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(
              message,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );

    // Insert the overlay entry
    overlay.insert(overlayEntry);

    // Wait for some time and then remove the overlay entry
    Future.delayed(Duration(seconds: 2), () {
      overlayEntry.remove();
    });
  }
}
