import 'package:flutter/material.dart';
import 'package:mobile_detailing_app/pages/supplies/components/supply.dart';
import 'package:mobile_detailing_app/pages/supplies/components/supply_type_filter.dart';
import 'package:badges/badges.dart' as badges;

class SuppliesPage extends StatefulWidget {
  const SuppliesPage({super.key});

  @override
  State<SuppliesPage> createState() => _SuppliesPageState();
}

class _SuppliesPageState extends State<SuppliesPage> {
  var selectedFilter = 'All';
  List<CartItem> cartItems = [];

  void addToCart(CartItem item) {
    setState(() {
      // int index = cartItems.indexWhere((element) => element.id == item.id);
      // if (index != -1) {
      //   cartItems[index].quantity += item.quantity;
      // } else {
      //   cartItems.add(item);
      // }
      cartItems.add(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Supply> filteredSupplies = selectedFilter != 'All'
        ? supplies.where((supply) {
            return supply.type.name == selectedFilter;
          }).toList()
        : supplies;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back_ios, size: 24.0)),
                const Text('Supplies',
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
                const Spacer(),
                badges.Badge(
                  showBadge: cartItems.isNotEmpty,
                  position: badges.BadgePosition.topEnd(top: -0, end: -0),
                  badgeContent: Text(
                    cartItems.length.toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                  child: IconButton(
                      icon: Icon(Icons.shopping_cart_outlined,
                          color: Theme.of(context).colorScheme.secondary),
                      onPressed: () {
                        print('Open Cart');
                        print('Cart items: $cartItems');
                      }),
                )
              ]),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SupplyTypeFilter(
                    selectedFilter: selectedFilter,
                    onFilterChanged: (value) {
                      setState(() {
                        selectedFilter = value;
                      });
                    },
                  )
                ],
              ),
              const SizedBox(height: 20.0),
              Expanded(
                child: ListView.builder(
                  itemCount: filteredSupplies.length,
                  itemBuilder: (context, index) {
                    return SuppliesCard(
                      supply: filteredSupplies[index],
                      addToCart: addToCart,
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SuppliesCard extends StatefulWidget {
  const SuppliesCard({
    super.key,
    required this.supply,
    required this.addToCart,
  });

  final Supply supply;
  final Function(CartItem) addToCart;

  @override
  State<SuppliesCard> createState() => _SuppliesCardState();
}

class _SuppliesCardState extends State<SuppliesCard> {
  late String selectedUnit;
  late double selectedPrice;

  @override
  void initState() {
    super.initState();
    _updateSelectedUnitAndPrice();
  }

  @override
  void didUpdateWidget(SuppliesCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.supply != oldWidget.supply) {
      _updateSelectedUnitAndPrice();
    }
  }

  void _updateSelectedUnitAndPrice() {
    selectedUnit = widget.supply.pricePerUnit.keys.first;
    selectedPrice = widget.supply.pricePerUnit[selectedUnit]!;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Theme.of(context).colorScheme.surface,
        child: Container(
            padding: const EdgeInsets.all(20.0),
            height: 270.0,
            width: 600,
            child: Column(children: [
              Row(children: [
                SizedBox(
                    height: 120.0,
                    width: 80.0,
                    child: Image.asset(widget.supply.imageUrl)),
                const SizedBox(width: 10),
                Flexible(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Text(widget.supply.title,
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.onSurface),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1),
                      Text(widget.supply.subtitle,
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Theme.of(context).colorScheme.onSurface),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1),
                      const SizedBox(height: 10.0),
                      Text(widget.supply.description,
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.onSurface,
                              fontSize: 14.0),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3)
                    ]))
              ]),
              const SizedBox(height: 10.0),
              SizedBox(
                  height: 40.0,
                  width: 500,
                  child: Row(children: [
                    //Dropdown for selecting unit
                    DropdownButton<String>(
                      value: selectedUnit,
                      dropdownColor: Theme.of(context).colorScheme.primary,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onSecondary),
                      onChanged: (String? newValue) {
                        if (newValue != null &&
                            widget.supply.pricePerUnit.containsKey(newValue)) {
                          setState(() {
                            selectedUnit = newValue;
                            selectedPrice =
                                widget.supply.pricePerUnit[selectedUnit]!;
                          });
                        }
                      },
                      items: widget.supply.pricePerUnit.keys
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    const Spacer(),
                    // Display the selected price
                    Text(
                      'Price: \$${selectedPrice.toStringAsFixed(2)}',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface),
                    )
                  ])),
              const SizedBox(height: 10.0),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            WidgetStateProperty.all<Color>(Colors.cyan)),
                    onPressed: () {
                      // Add to cart
                      CartItem cartItem = CartItem(
                        id: widget.supply.id,
                        title: widget.supply.title,
                        quantity: 1,
                        unitAndPrice: {selectedUnit: selectedPrice},
                      );
                      widget.addToCart(cartItem);
                    },
                    child: const Text('ADD TO ORDER',
                        style: TextStyle(color: Colors.white)),
                  ))
            ])));
  }
}

class CartItem {
  CartItem(
      {required this.id,
      required this.title,
      required this.quantity,
      required this.unitAndPrice});
  String id;
  String title;
  Map<String, double> unitAndPrice;
  int quantity;

  @override
  String toString() {
    return 'CartItem{id: $id, title: $title, quantity: $quantity, unitAndPrice: $unitAndPrice}';
  }
}
