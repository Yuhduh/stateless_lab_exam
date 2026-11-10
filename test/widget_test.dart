import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stateless_lab_exam/masayon_main.dart';
import 'package:stateless_lab_exam/masayon_shopping_cart_page.dart';

void main() {
  testWidgets('Buttons log messages and keep the cart fixed', (tester) async {
    await tester.binding.setSurfaceSize(const Size(414, 1200));
    addTearDown(() => tester.binding.setSurfaceSize(null));
    final messages = <String>[];
    final originalDebugPrint = debugPrint;
    debugPrint = (String? message, {int? wrapWidth}) {
      if (message != null) messages.add(message);
    };
    addTearDown(() => debugPrint = originalDebugPrint);
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.byTooltip('Back'));
    await tester.tap(find.byTooltip('Shopping bag'));
    await tester.tap(find.text('Change'));
    for (final name in ['Wireless Mouse', 'USB-C Hub', 'Laptop Stand']) {
      for (final action in [
        'Increase quantity:',
        'Decrease quantity:',
        'Remove',
      ]) {
        final button = find.byTooltip('$action $name');
        await tester.ensureVisible(button);
        await tester.tap(button);
      }
    }
    await tester.ensureVisible(find.text('Place Order'));
    await tester.tap(find.text('Place Order'));
    await tester.pump();
    debugPrint = originalDebugPrint;

    expect(messages, [
      'Back clicked',
      'Cart clicked',
      'Change delivery address clicked',
      for (final name in ['Wireless Mouse', 'USB-C Hub', 'Laptop Stand']) ...[
        'Increase quantity: $name',
        'Decrease quantity: $name',
        'Remove item: $name',
      ],
      'Place order clicked! Total: PHP 1850.00',
    ]);
    expect(find.byType(CartItemCard), findsNWidgets(3));
    expect(find.text('1'), findsNWidgets(3));
    expect(find.text('PHP 1,850.00'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('Small screens and larger text scroll without overflow', (
    tester,
  ) async {
    addTearDown(() => tester.binding.setSurfaceSize(null));
    for (final width in [320.0, 414.0, 800.0]) {
      await tester.binding.setSurfaceSize(Size(width, 640));
      await tester.pumpWidget(
        MaterialApp(
          builder: (context, child) => MediaQuery(
            data: MediaQuery.of(context)
                .copyWith(textScaler: const TextScaler.linear(1.5)),
            child: child!,
          ),
          home: const ShoppingCartPage(),
        ),
      );
      await tester.ensureVisible(find.text('Place Order'));
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull, reason: 'Width: $width');
      expect(find.text('Place Order').hitTestable(), findsOneWidget);
    }
  });
}
