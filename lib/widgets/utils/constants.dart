//default time
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobile_detailing_app/models/client.dart';

DateTime timeNow = DateTime.now().toUtc().add(const Duration(hours: -7));

//default latlng
LatLng defaultLatLng = const LatLng(38.449303347635514, -122.70937465995486);

//default position
Position defaultPosition = Position(
    latitude: 38.449303347635514,
    longitude: -122.70937465995486,
    timestamp: timeNow,
    accuracy: 0.0,
    altitude: 0.0,
    heading: 0.0,
    speed: 0.0,
    speedAccuracy: 0.0,
    altitudeAccuracy: 0.0,
    headingAccuracy: 0.0);

Color kPrimaryColor = const Color(0xFF72DDE9);

List<Client> clients = [
  Client(
      'client1',
      'John',
      'Doe',
      '1600 Pennsylvania Ave NW',
      '20500',
      'Washington',
      'john.doe@example.com',
      '+1-202-456-1111',
      const Color(0xFFB4E5E5)),
  Client('client2', 'Jane', 'Smith', '1 Infinite Loop', '95014', 'Cupertino',
      'jane.smith@example.com', '+1-408-996-1010', const Color(0xFFE5E5B4)),
  Client('client3', 'Bob', 'Johnson', '350 Fifth Ave', '10118', 'New York',
      'bob.johnson@example.com', '+1-212-736-3100', const Color(0xFFB4B4F5)),
  Client(
      'client4',
      'Alice',
      'Williams',
      '221B Baker St',
      'NW1 6XE',
      'London',
      'alice.williams@example.com',
      '+44-20-7224-3688',
      const Color(0xFFF5F5B4)),
  Client(
      'client5',
      'Mike',
      'Brown',
      '1600 Amphitheatre Parkway',
      '94043',
      'Mountain View',
      'mike.brown@example.com',
      '+1-650-253-0000',
      const Color(0xFFB4F5F5)),
  Client(
      'client6',
      'Emma',
      'Jones',
      '4 Privet Drive',
      'M4C 1A4',
      'Little Whinging',
      'emma.jones@example.com',
      '+44-111-111-1111',
      const Color(0xFFF5B4B4)),
  Client(
      'client7',
      'Chris',
      'Garcia',
      '1600 Holloway Ave',
      '94132',
      'San Francisco',
      'chris.garcia@example.com',
      '+1-415-338-1111',
      const Color(0xFFD4F5B4)),
  Client(
      'client8',
      'Olivia',
      'Miller',
      '4059 Mt Lee Dr',
      '90068',
      'Los Angeles',
      'olivia.miller@example.com',
      '+1-323-258-4333',
      const Color(0xFFB4F5D4)),
  Client('client9', 'David', 'Martinez', '1 Microsoft Way', '98052', 'Redmond',
      'david.martinez@example.com', '+1-425-882-8080', const Color(0xFFF5E5B4)),
  Client('client10', 'Sophia', 'Davis', '1601 Willow Rd', '94025', 'Menlo Park',
      'sophia.davis@example.com', '+1-650-543-4800', const Color(0xFFE5B4F5)),
  Client('client11', 'Lucas', 'Lopez', '5 Avenue Anatole', '75007', 'Paris',
      'lucas.lopez@example.com', '+33-1-4411-2345', const Color(0xFFB4D4F5)),
  Client(
      'client12',
      'Ella',
      'Gonzalez',
      '1201 S Figueroa St',
      '90015',
      'Los Angeles',
      'ella.gonzalez@example.com',
      '+1-213-741-1151',
      const Color(0xFFF5D4B4)),
  Client('client13', 'Daniel', 'Wilson', '10 Downing St', 'SW1A 2AA', 'London',
      'daniel.wilson@example.com', '+44-20-7925-0918', const Color(0xFFB4F5E5)),
  Client(
      'client14',
      'Ava',
      'Anderson',
      '3500 Deer Creek Rd',
      '94070',
      'Palo Alto',
      'ava.anderson@example.com',
      '+1-650-561-1091',
      const Color(0xFFF5B4D0)),
  Client(
      'client15',
      'Matthew',
      'Thomas',
      '30 Rockefeller Plaza',
      '10112',
      'New York',
      'matthew.thomas@example.com',
      '+1-212-632-3975',
      const Color(0xFFD0B4F5)),
  Client('client16', 'Mia', 'Taylor', '405 Lexington Ave', '10174', 'New York',
      'mia.taylor@example.com', '+1-212-210-6795', const Color(0xFFFFB3BA)),
  Client(
      'client17',
      'Anthony',
      'Moore',
      '2 Lincoln Memorial Cir NW',
      '20002',
      'Washington',
      'anthony.moore@example.com',
      '+1-202-426-6841',
      const Color(0xFFBAE1FF)),
  Client('client18', 'Grace', 'Jackson', '350 Fifth Ave', '10118', 'New York',
      'grace.jackson@example.com', '+1-212-736-3100', const Color(0xFFFFDFBA)),
  Client(
      'client19',
      'Joshua',
      'White',
      '1600 Pennsylvania Ave NW',
      '20500',
      'Washington',
      'joshua.white@example.com',
      '+1-202-456-1111',
      const Color(0xFFFFFFBA)),
  Client(
      'client20',
      'Isabella',
      'Harris',
      '1 Infinite Loop',
      '95014',
      'Cupertino',
      'isabella.harris@example.com',
      '+1-408-996-1010',
      const Color(0xFFBAFFBA)),
];

Client defaultClient = Client(
    'client20',
    'Unknown',
    'User',
    '1 Infinite Loop',
    '95014',
    'Cupertino',
    'isabella.harris@example.com',
    '+1-408-996-1010',
    Colors.blue);


//Google Maps Api Key
//AIzaSyDg5XmVPBDFSb-WGRcH21i3l0lJpJnn7c0


