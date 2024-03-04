// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:sneakers_app/models/models.dart';

class CheckoutPage extends StatelessWidget {
  final List<ShoeModel> itemsInBag;
  final Map<ShoeModel, int> quantities;
  final Function onOrderPlaced;

  CheckoutPage({
    required this.itemsInBag,
    required this.quantities,
    required this.onOrderPlaced,
  });

  bool _isCashSelected = true;
  bool _isCardSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order Summary',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            // Display order summary details
            for (var item in itemsInBag)
              Text(
                '${item.model} - \$${item.price} - Quantity: ${quantities[item]}',
              ),
            SizedBox(height: 24),
            Text(
              'Payment Method',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            // Wrap the checkboxes in a StatefulBuilder
            StatefulBuilder(
              builder: (context, setState) => Column(
                children: [
                  CheckboxListTile(
                    title: Text('Cash'),
                    value: _isCashSelected,
                    onChanged: (value) {
                      setState(() {
                        _isCashSelected = value ?? false;
                        _isCardSelected = !_isCashSelected;
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: Text('Card'),
                    value: _isCardSelected,
                    onChanged: (value) {
                      setState(() {
                        _isCardSelected = value ?? false;
                        _isCashSelected = !_isCardSelected;
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Implement your logic for completing the order
                // For example, you can show a success message or navigate to a confirmation page
                onOrderPlaced(); // Call the callback to clear the bag
                Navigator.pop(context); // Close the checkout page
              },
              child: Text('Complete Order'),
            ),
          ],
        ),
      ),
    );
  }
}
