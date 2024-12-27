import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_2/widgets/drawer_content.dart';
import 'package:flutter_application_2/widgets/drawer_item.dart';

void main() {
  group('DrawerContent Widget Tests', () {
    testWidgets('DrawerContent displays list of DrawerItems', (WidgetTester tester) async {
      // Arrange
      final items = [
        DrawerItem(icon: Icons.home, label: 'Home', onTap: () {}, title: ''),
        DrawerItem(icon: Icons.settings, label: 'Settings', onTap: () {}, title: ''),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DrawerContent(items: items),
          ),
        ),
      );

      // Assert
      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Settings'), findsOneWidget);
      expect(find.byType(DrawerItem), findsNWidgets(items.length));
    });

    testWidgets('DrawerContent handles item taps', (WidgetTester tester) async {
      // Arrange
      bool homeTapped = false;
      bool settingsTapped = false;

      final items = [
        DrawerItem(
          icon: Icons.home,
          label: 'Home',
          onTap: () {
            homeTapped = true;
          },
          title: '',
        ),
        DrawerItem(
          icon: Icons.settings,
          label: 'Settings',
          onTap: () {
            settingsTapped = true;
          },
          title: '',
        ),
      ];

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DrawerContent(items: items),
          ),
        ),
      );

      // Act
      await tester.tap(find.text('Home'));
      await tester.pump();
      await tester.tap(find.text('Settings'));
      await tester.pump();

      // Assert
      expect(homeTapped, isTrue);
      expect(settingsTapped, isTrue);
    });
  });
}
