import 'package:flutter/material.dart';

const _blue = Color(0xFF185DF5);
const _lightBlue = Color(0xFFD7E8FF);
const _gray = Color(0xFF555D73);
const _border = Color(0xFFD2D7E5);
const _bold = TextStyle(fontWeight: FontWeight.bold);

Widget _card(Widget child) => Container(
  padding: const EdgeInsets.all(12),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
    border: Border.all(color: _border),
  ),
  child: child,
);

class ShoppingCartPage extends StatelessWidget {
  const ShoppingCartPage({super.key});
  static const studentName = 'Carl John Paul Masayon';

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      leading: IconButton(
        tooltip: 'Back',
        icon: const Icon(Icons.arrow_back),
        onPressed: () => debugPrint('Back clicked'),
      ),
      title: const Text('My Cart', style: _bold),
      actions: [
        IconButton(
          tooltip: 'Shopping bag',
          onPressed: () => debugPrint('Cart clicked'),
          icon: Stack(
            clipBehavior: Clip.none,
            children: [
              const Icon(Icons.shopping_bag_outlined, size: 28),
              Positioned(
                top: -6,
                right: -7,
                child: Container(
                  width: 20,
                  height: 20,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: _blue,
                    shape: BoxShape.circle,
                  ),
                  child: const Text(
                    '3',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
      ],
    ),
    body: SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 560),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: 12,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: _lightBlue,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Text(
                        'CAMPUS STORE',
                        style: TextStyle(
                          color: _blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Ready for checkout',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const Text(
                      'Review your items before placing your order.',
                      style: TextStyle(color: _gray, fontSize: 15),
                    ),
                    const SizedBox(height: 4),
                  ],
                ),
                _card(
                  Row(
                    children: [
                      const Icon(Icons.location_on, color: _blue, size: 28),
                      const SizedBox(
                        height: 36,
                        child: VerticalDivider(width: 24, color: _border),
                      ),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Deliver to $studentName', style: _bold),
                            Text(
                              'Matina, Davao City',
                              style: TextStyle(color: _gray),
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () =>
                            debugPrint('Change delivery address clicked'),
                        child: const Text(
                          'Change',
                          style: TextStyle(
                            color: _blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Order Items',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text('3 items', style: TextStyle(color: _gray)),
                  ],
                ),
                const CartItemCard(
                  name: 'Wireless Mouse',
                  price: 450,
                  quantity: 1,
                  icon: Icons.mouse_outlined,
                ),
                const CartItemCard(
                  name: 'USB-C Hub',
                  price: 850,
                  quantity: 1,
                  icon: Icons.usb_outlined,
                ),
                const CartItemCard(
                  name: 'Laptop Stand',
                  price: 700,
                  quantity: 1,
                  icon: Icons.laptop_mac_outlined,
                ),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: _lightBlue,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.sell_outlined, color: _blue, size: 28),
                      SizedBox(
                        height: 36,
                        child: VerticalDivider(
                          width: 24,
                          color: Color(0xFF9DB7DD),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'STUDENT10 applied',
                              style: TextStyle(
                                color: Color(0xFF093F8D),
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              '10% discount on items',
                              style: TextStyle(color: _gray),
                            ),
                          ],
                        ),
                      ),
                      Icon(Icons.check_circle, color: _blue, size: 28),
                    ],
                  ),
                ),
                _card(
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    spacing: 6,
                    children: [
                      Text(
                        'Payment Summary',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 2),
                      _SummaryRow('Subtotal', 'PHP 2,000.00'),
                      _SummaryRow('Discount (10%)', '− PHP 200.00'),
                      _SummaryRow('Delivery Fee', 'PHP 50.00'),
                      Divider(color: _border),
                      _SummaryRow('Total', 'PHP 1,850.00', isTotal: true),
                    ],
                  ),
                ),
                FilledButton.icon(
                  style: FilledButton.styleFrom(
                    backgroundColor: _blue,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () =>
                      debugPrint('Place order clicked! Total: PHP 1850.00'),
                  icon: const Icon(Icons.lock),
                  label: const Text(
                    'Place Order',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

class CartItemCard extends StatelessWidget {
  const CartItemCard({
    super.key,
    required this.name,
    required this.price,
    required this.quantity,
    required this.icon,
  });

  final String name;
  final double price;
  final int quantity;
  final IconData icon;

  @override
  Widget build(BuildContext context) => _card(
    Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 64,
          height: 72,
          decoration: BoxDecoration(
            color: _lightBlue,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: const Color(0xFF093F8D), size: 40),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'PHP ${price.toStringAsFixed(2)}',
                style: const TextStyle(
                  color: _blue,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 6,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  _quantityButton(
                    Icons.remove,
                    'Decrease',
                    'Decrease quantity: $name',
                  ),
                  Container(
                    width: 36,
                    constraints: const BoxConstraints(minHeight: 32),
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      border: Border.all(color: _border),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Text('$quantity', style: _bold),
                  ),
                  _quantityButton(
                    Icons.add,
                    'Increase',
                    'Increase quantity: $name',
                  ),
                ],
              ),
            ],
          ),
        ),
        IconButton(
          tooltip: 'Remove $name',
          constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
          padding: EdgeInsets.zero,
          icon: const Icon(Icons.delete_outline, color: _gray, size: 23),
          onPressed: () => debugPrint('Remove item: $name'),
        ),
      ],
    ),
  );

  Widget _quantityButton(IconData icon, String action, String message) =>
      IconButton.outlined(
        tooltip: '$action quantity: $name',
        constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
        padding: const EdgeInsets.all(3),
        style: IconButton.styleFrom(
          foregroundColor: _blue,
          side: const BorderSide(color: _blue, width: 1.5),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        icon: Icon(icon, size: 22),
        onPressed: () => debugPrint(message),
      );
}

class _SummaryRow extends StatelessWidget {
  const _SummaryRow(this.label, this.amount, {this.isTotal = false});

  final String label;
  final String amount;
  final bool isTotal;

  @override
  Widget build(BuildContext context) => DefaultTextStyle.merge(
    style: TextStyle(
      fontSize: isTotal ? 19 : 15,
      fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: Text(label)),
        const SizedBox(width: 12),
        Expanded(child: Text(amount, textAlign: TextAlign.end)),
      ],
    ),
  );
}
