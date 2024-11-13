import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_best_self/presentation/screens/login_page.dart';
import 'package:my_best_self/presentation/controllers/user_controller.dart';
import 'package:get/get.dart';

void main() {
  setUpAll(() {
    Get.put(UserController());
  });

  testWidgets('Login Page: Validación de campo vacío', (WidgetTester tester) async {
    await tester.pumpWidget(
      GetMaterialApp(
        initialRoute: '/login',
        getPages: [
          GetPage(name: '/login', page: () => LoginPage()),
        ],
      ),
    );

    expect(find.byKey(const Key('LoginPage')), findsOneWidget);

    await tester.tap(find.byKey(const Key('LoginButton')));
    await tester.pump();

    expect(find.text('Please, enter a name'), findsOneWidget);
  });

  testWidgets('Login Page: Validación de nombre inválido', (WidgetTester tester) async {
    await tester.pumpWidget(
      GetMaterialApp(
        initialRoute: '/login',
        getPages: [
          GetPage(name: '/login', page: () => LoginPage()),
        ],
      ),
    );

    await tester.enterText(find.byKey(const Key('LoginTextField')), '1234');
    await tester.tap(find.byKey(const Key('LoginButton')));
    await tester.pump();

    expect(find.text('The name must only contain letters'), findsOneWidget);
  });

  testWidgets('Login Page: Navegación exitosa con nombre válido', (WidgetTester tester) async {
    await tester.pumpWidget(
      GetMaterialApp(
        initialRoute: '/login',
        getPages: [
          GetPage(name: '/login', page: () => LoginPage()),
          GetPage(name: '/mainpage/', page: () => const Scaffold(body: Text('Welcome!'))),
        ],
      ),
    );

    await tester.enterText(find.byKey(const Key('LoginTextField')), 'John Doe');
    await tester.tap(find.byKey(const Key('LoginButton')));
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('LoginPage')), findsNothing);
    expect(find.text('Welcome!'), findsOneWidget);
  });
}