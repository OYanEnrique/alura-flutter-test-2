import 'dart:math';

import 'package:client_control/components/hamburger_menu.dart';
import 'package:client_control/components/icon_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Testing the Menu', () {
    testWidgets('Hamburguer Menu should have "Menu"', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: HamburgerMenu(),
      ));
      expect(find.text('Menu'), findsOneWidget);
    });

    testWidgets('Hamburguer Menu should have "Gerenciar clientes"', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: HamburgerMenu(),
      ));
      expect(find.text('Gerenciar clientes'), findsOneWidget);
    });
    testWidgets('Hamburguer Menu should have "Tipos de clientes"', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: HamburgerMenu(),
      ));
      expect(find.text('Tipos de clientes'), findsOneWidget);
    });

    testWidgets('Hamburguer Menu should have "Sair"', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: HamburgerMenu(),
      ));
      expect(find.text('Sair'), findsOneWidget);
    });

    testWidgets('Verificar botão "Sair" no Drawer', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          drawer: HamburgerMenu(),
          body: Builder(
            builder: (context) => Center(
              child: ElevatedButton(
                onPressed: () => Scaffold.of(context).openDrawer(),
                child: Text('Open Drawer'),
              ),
            ),
          ),
        ),
      ));

      // Abrir o drawer
      await tester.tap(find.text('Open Drawer'));
      await tester.pumpAndSettle();

      // Verificar que o botão Sair existe
      final exitButton = find.text('Sair');
      expect(exitButton, findsOneWidget);

      // Verificar que o botão é um ListTile
      final exitListTile = find.ancestor(
        of: exitButton,
        matching: find.byType(ListTile),
      );
      expect(exitListTile, findsOneWidget);
    });
  });

  group('Testing Icon Picker', () {
    testWidgets('Icon Picker deve mostrar diálogo com título', (tester) async {
      IconData? selectedIcon;

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) => Center(
              child: ElevatedButton(
                onPressed: () async {
                  selectedIcon = await showIconPicker(
                    context: context,
                    defalutIcon: Icons.favorite,
                  );
                },
                child: Text('Selecionar Ícone'),
              ),
            ),
          ),
        ),
      ));

      // Tocar no botão para abrir o icon picker
      await tester.tap(find.text('Selecionar Ícone'));
      await tester.pumpAndSettle();

      // Verificar que o diálogo aparece
      expect(find.byType(AlertDialog), findsOneWidget);
      expect(find.text('Escolha um ícone'), findsOneWidget);
    });

    testWidgets('Icon Picker deve exibir múltiplos ícones', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) => Center(
              child: ElevatedButton(
                onPressed: () async {
                  await showIconPicker(context: context);
                },
                child: Text('Selecionar Ícone'),
              ),
            ),
          ),
        ),
      ));

      await tester.tap(find.text('Selecionar Ícone'));
      await tester.pumpAndSettle();

      // Verificar que existem múltiplos IconButton no GridView
      expect(find.byType(IconButton), findsWidgets);
      
      // Verificar que alguns ícones específicos estão disponíveis
      expect(find.byIcon(Icons.card_giftcard), findsOneWidget);
      expect(find.byIcon(Icons.favorite), findsOneWidget);
      expect(find.byIcon(Icons.home), findsOneWidget);
    });

    testWidgets('Icon Picker deve permitir selecionar um ícone', (tester) async {
      IconData? selectedIcon;

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) => Center(
              child: ElevatedButton(
                onPressed: () async {
                  selectedIcon = await showIconPicker(context: context);
                },
                child: Text('Selecionar Ícone'),
              ),
            ),
          ),
        ),
      ));

      await tester.tap(find.text('Selecionar Ícone'));
      await tester.pumpAndSettle();

      // Selecionar o ícone de coração
      await tester.tap(find.byIcon(Icons.favorite));
      await tester.pumpAndSettle();

      // Verificar que o ícone foi selecionado
      expect(selectedIcon, equals(Icons.favorite));
    });

    testWidgets('Icon Picker deve ter botão Fechar', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (context) => Center(
              child: ElevatedButton(
                onPressed: () async {
                  await showIconPicker(context: context);
                },
                child: Text('Selecionar Ícone'),
              ),
            ),
          ),
        ),
      ));

      await tester.tap(find.text('Selecionar Ícone'));
      await tester.pumpAndSettle();

      // Verificar que o botão Fechar existe
      expect(find.text('Fechar'), findsOneWidget);

      // Clicar no botão Fechar
      await tester.tap(find.text('Fechar'));
      await tester.pumpAndSettle();

      // Verificar que o diálogo foi fechado
      expect(find.byType(AlertDialog), findsNothing);
    });
  });
}