import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

Future<void> debugGetAndPrintFcmToken() async {
  try {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      debugPrint("⚠️ No signed-in user — cannot get token.");
      return;
    }

    final token = await FirebaseMessaging.instance.getToken();

    debugPrint("🔑 FCM TOKEN = $token");

    if (token != null) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .set({
        'fcmToken': token,
        'fcmTokenUpdatedAt': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));

      debugPrint("✅ Token saved in Firestore under users/${user.uid}");
    }

    // Listen for refresh
    FirebaseMessaging.instance.onTokenRefresh.listen((newToken) {
      debugPrint("♻️ Token refreshed = $newToken");
    });

  } catch (e, st) {
    debugPrint("❌ Error getting token: $e\n$st");
  }
}
