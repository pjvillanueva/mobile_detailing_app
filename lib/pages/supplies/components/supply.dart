// ignore: constant_identifier_names
enum SupplyType { Chemicals, Towels, Equipments, Apparel }

class Supply {
  Supply(this.title, this.subtitle, this.description, this.type,
      this.pricePerUnit, this.imageUrl, this.id);
  final String id;
  String title;
  String subtitle;
  String description;
  SupplyType type;
  String imageUrl;
  Map<String, double> pricePerUnit;
}

List<Supply> supplies = [
  Supply(
      'Stain Removal',
      'Carpet & Upholstery Agent',
      'Concentrated stain remover that deeply penetrates, dissolves tough stains, and emulsifies to lift dirt. Revive fabric, upholstery, and carpet with effective stain removal.',
      SupplyType.Chemicals,
      {'1 Gallon': 29.95, '2 Gallons': 49.95},
      'assets/images/stain-removal.png',
      '202410001'),
  Supply(
      'Spray Shine',
      'Exterior Spray Wax',
      'Effortlessly boost vehicle\'s appearance with a spray wax creating a sleek and polished finish.',
      SupplyType.Chemicals,
      {'1 Gallon': 29.95, '2 Gallons': 49.95},
      'assets/images/spray-wax.png',
      '202410002'),
  Supply(
      'Bug Removal',
      'Exterior Bug Spray',
      'Our Bug-Off Concentrate effectively dissolves bugs, shielding surfaces from corrosive insects. Skip intense scrubbing, ensuring potent protection for your vehicle\'s exterior.',
      SupplyType.Chemicals,
      {'1 Gallon': 24.95, '2 Gallons': 39.95},
      'assets/images/bug-off.png',
      '202410003'),
  Supply(
      'APC',
      'All Purpose Cleaner',
      'A concentrate all-purpose cleaner, effortlessly tackling dirt, grease, and grime. Ideal for use inside, outside, or underneath your vehicle, providing powerful cleaning in a convenient solution.',
      SupplyType.Chemicals,
      {'1 Gallon': 29.95, '2 Gallons': 49.95},
      'assets/images/all-purpose-cleaner.png',
      '202410004'),
  Supply(
      'Tire Shine',
      'Shiny Spray Dressing',
      'Concentrate Tire Shine deeply penetrates, moisturizes, and nourishes rubber, enhancing a rich, deep-black shine. Restore a supple feel that resists cracking and splitting for premium tire care.',
      SupplyType.Chemicals,
      {'1 Gallon': 29.95, '2 Gallons': 49.95},
      'assets/images/tire-shine.png',
      '202410005'),
  Supply(
      'Degreaser',
      'Remove Dirt & Grime',
      'Professional-strength concentrate degreaser for powerful, safe removal of stubborn dirt and grease, ensuring flexible cleaning capability.',
      SupplyType.Chemicals,
      {'1 Gallon': 29.95, '2 Gallons': 49.95},
      'assets/images/degreaser.png',
      '202410006'),
  Supply(
      'Foam Soap',
      'High Quality Suds',
      'Concentrate Stain Remover deeply penetrates, dissolves tough stains, and emulsifies to lift dirt. Revive fabric, upholstery, and carpet with effective stain removal, ensuring a refreshed, clean finish.',
      SupplyType.Chemicals,
      {'1 Gallon': 29.95, '2 Gallons': 49.95},
      'assets/images/foam-soap.png',
      '202410007'),
  Supply(
      'Leather Conditioner',
      'Interior Leather Clean & Protect',
      'Leather conditioner that expertly restores and preserves leather. Protecting while enhancing its natural look and feel. Experience a clean lasting effect with the added benefits of preservation.',
      SupplyType.Chemicals,
      {'1 Gallon': 49.95},
      'assets/images/leather-conditioner.png',
      '202410008'),
  Supply(
      'Glass Cleaner',
      'Clean Glass Easily',
      'Glass Cleaner, a concentrate with potent properties, effortlessly eliminates grime and grease, ensuring streak-free clarity.',
      SupplyType.Chemicals,
      {'1 Gallon': 29.95, '2 Gallons': 49.95},
      'assets/images/glass-cleaner.png',
      '202410009'),
  Supply(
      'Cleaning Mitt',
      'Exterior Cleaning Mitt',
      'Ultra Absorbent Long Chenille Microfiber Car Wash Mitt: Elevate Your Car Care Regimen with Enhanced Cleaning Performance.',
      SupplyType.Towels,
      {'1 Set': 9.95, '2 Sets': 15.95},
      'assets/images/car-mitt.png',
      '202410010'),
  Supply(
      'Interior Blowout',
      'Air Compressor Tool',
      'High-Pressure Interior Car Washing Gun with 2 Nozzle Sprayer Sets and Air Pulse Technology. Elevate Your Car Detailing Arsenal.',
      SupplyType.Equipments,
      {'1 Set': 19.95, '2 Sets': 35.95},
      'assets/images/air-tool.png',
      '202410011'),
  Supply(
      'Detail Brush',
      'Interior Cleaning Kit',
      'Tailored for detailers, our Car Detailing Kit boasts precision brushes, wash accessories, and specialized tools for vehicle interiors. Elevate your craft with dedicated supplies, including essentials for air conditioner maintenance.',
      SupplyType.Equipments,
      {'1 Set': 9.95, '2 Sets': 15.95},
      'assets/images/detail-brush-kit.png',
      '202410012'),
  Supply(
      'Foam/Soap Cannon',
      'Super Sud Soap',
      'High-Pressure Foam Sprayer. Featuring a 1L Capacity, Adjustable Angle, 1/4 Inch NPT Quick Connector.',
      SupplyType.Equipments,
      {'1 Set': 34.95, '2 Sets': 59.95},
      'assets/images/foam-cannon.png',
      '202410013'),
  Supply(
      'Scrub & Sponge',
      'Interior Cleaning Scrub',
      'Interior Scrubbing Sponge (5"x3") is your go-to tool for precision cleaning of leather, plastic, vinyl, and upholstery.',
      SupplyType.Equipments,
      {'Set of 4': 9.99, 'Set of 10': 19.95},
      'assets/images/sponge-scrub.png',
      '202410014'),
  Supply(
      'Pet Hair Removal',
      'Ugly But it Works',
      'A pet hair removal stone is an essential tool for every pet hair removal job. Far more efficient than traditional efforts.',
      SupplyType.Equipments,
      {'1 Set': 9.95, '2 Sets': 15.95},
      'assets/images/pet-hair-removal.png',
      '202410015'),
  Supply(
      'Uniform Shirt',
      'Complete Sun Protection',
      'Maintain a uniform professional-like appearance while staying cool and protected from sun UV exposure.',
      SupplyType.Apparel,
      {'Small': 59.95, 'Medium': 59.95, 'Large': 59.95, 'X-Large': 59.95},
      'assets/images/blue-hoodie-uv.png',
      '202410016'),
  Supply(
      'Sun Sleeve',
      'Better Than Sunscreen',
      'Fast, quick and easy protection from overspray and sun UV exposure.',
      SupplyType.Apparel,
      {'One Size': 19.95},
      'assets/images/black-sun-sleeve.png',
      '202410017'),
];
