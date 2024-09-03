import 'dart:math';

enum BookingStatus { upcoming, open, completed }

class Booking {
  Booking(this.id, this.clientId, this.date, this.duration, this.vehicle,
      this.package, this.price, this.services, this.status);
  String id;
  String clientId;
  DateTime date;
  Duration duration;
  String vehicle;
  String package;
  double price;
  List<String> services;
  BookingStatus status;
}

List<String> vehicles = [
  'Volkswagen Passat',
  'Toyota Camry',
  'Ford Mustang',
  'Audi A3',
  'Honda Civic',
  'BMW 3 Series',
  'Mercedes C-Class',
  'Chevrolet Malibu',
  'Nissan Altima',
  'Hyundai Elantra',
];

List<String> packages = [
  'Ceramic Coating',
  'Wash & Wax',
  'RV Oxidation Removal/Polish',
  'Hand Wash',
  'Entry Inside & Out (Not a Deep Clean)',
  'Deep Clean (Interior Only)'
];



List<Booking> generateRandomBookings(int count) {
  Random random = Random();
  List<Booking> bookings = [];

  for (int i = 1; i <= count; i++) {
    String id = '240$i';
    String clientId = 'client$i';
    DateTime date = DateTime.now().add(Duration(days: random.nextInt(30) - 15));
    Duration duration = Duration(hours: random.nextInt(3) + 1);
    String vehicle = vehicles[random.nextInt(vehicles.length)];
    String package = packages[random.nextInt(packages.length)];
    double price = (random.nextInt(20) + 5) * 10.0;
    List<String> services = [];
    BookingStatus status =
        BookingStatus.values[random.nextInt(BookingStatus.values.length)];

    bookings.add(Booking(id, clientId, date, duration, vehicle, package, price,
        services, status));
  }

  return bookings;
}

List<Booking> sampleBookings = generateRandomBookings(20);
