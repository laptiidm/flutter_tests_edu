import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_2/widgets/drawer_item.dart';

void main() {
  group('DrawerItem Widget Tests', () {
    testWidgets('DrawerItem displays icon and label correctly', (WidgetTester tester) async {
      // Arrange
      const testIcon = Icons.home;
      const testLabel = 'Home';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DrawerItem(
              icon: testIcon,
              label: testLabel,
              onTap: () {}, title: '',
            ),
          ),
        ),
      );

      // Assert
      expect(find.text(testLabel), findsOneWidget);
      expect(find.byIcon(testIcon), findsOneWidget);
    });

    testWidgets('DrawerItem triggers onTap callback when tapped', (WidgetTester tester) async {
      // Arrange
      bool wasTapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DrawerItem(
              icon: Icons.home,
              label: 'Home',
              onTap: () {
                wasTapped = true;
              }, title: '',
            ),
          ),
        ),
      );

      // Act
      await tester.tap(find.text('Home'));
      await tester.pump();

      // Assert
      expect(wasTapped, isTrue);
    });
  });
}

