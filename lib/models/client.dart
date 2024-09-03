import 'package:flutter/material.dart';

class Client {
  Client(this.id, this.firstName, this.lastname, this.street, this.zipCode,
      this.city, this.email, this.phoneNumber, this.color);
  String id;
  String firstName;
  String lastname;
  String street;
  String zipCode;
  String city;
  String email;
  String phoneNumber;
  Color color;


  String get completeAddress {
    return '$street, $city $zipCode';
  }

  String get fullName {
    return '$firstName $lastname';
  }
}
