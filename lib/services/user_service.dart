import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_detailing_app/cubits/user_cubit.dart';
import 'package:mobile_detailing_app/models/user.dart';
import 'package:mobile_detailing_app/services/preference_utils.dart';

Future<void> getUser(BuildContext context) async {
  try {
    var userId = await PreferenceUtils().getString('user_id');
    DocumentSnapshot userDoc =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();
    if (userDoc.exists) {
      // Extract data from the document
      Map<String, dynamic> userData = userDoc.data() as Map<String, dynamic>;
      // Convert userData map to User object
      User user = User(
        userData['id'] ?? '',
        userData['firstName'] ?? '',
        userData['lastName'] ?? '',
        userData['email'] ?? '',
        userData['phoneNumber'] ?? '',
      );
      //save user to bloc
      context.read<UserCubit>().updateUser(user);
    } else {
      print('User not found');
    }
  } catch (e) {
    print('Error getting user: $e');
  }
}
