import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_best_self/main.dart';
import 'package:my_best_self/core/dependency_injection.dart';
import 'package:my_best_self/data/domain/entities/task_hive.dart';

Future<void> main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await Hive.initFlutter();
    Hive.registerAdapter(TaskHiveAdapter());
    await Hive.openBox("todos");
    DependencyInjection.init();
  });

  tearDownAll(() async {
    await Hive.close();
  });

  testWidgets("Login -> signup", (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.byKey(const Key('LoginPage')), findsOneWidget);
    expect(find.text('Enter your name'), findsOneWidget);
    await tester.enterText(find.byKey(const Key('LoginTextField')), 'TEST');
    await tester.tap(find.byKey(const Key('LoginButton')));
    await tester.pumpAndSettle(const Duration(seconds: 1));
  });

  testWidgets("Login -> signup -> createTask", (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.byKey(const Key('LoginPage')), findsOneWidget);
    expect(find.text('Enter your name'), findsOneWidget);
    await tester.enterText(find.byKey(const Key('LoginTextField')), 'TEST');
    await tester.tap(find.byKey(const Key('LoginButton')));
    await tester.pumpAndSettle(const Duration(seconds: 1));
    await tester.tap(find.byKey(const Key('newTask')));
    await tester.pumpAndSettle(const Duration(seconds: 1));
    await tester.tap(find.byKey(const Key('booleanTask')));
    await tester.pumpAndSettle(const Duration(seconds: 2));
    expect(find.text('Escribe el nombre de la tarea'), findsOneWidget);
    await tester.enterText(
        find.byKey(const Key('nameTaskBoolean')), 'go to the park');
    await tester.pumpAndSettle(const Duration(seconds: 2));
    expect(find.text('Name Goal'), findsOneWidget);
    await tester.enterText(find.byKey(const Key('nameGoal')), 'times');
    await tester.pumpAndSettle(const Duration(seconds: 2));
    await tester.tap(find.byKey(const Key('CreateTask')));
    await tester.pumpAndSettle(const Duration(seconds: 2));
    expect(find.byKey(const Key('Homepage')), findsOneWidget);
  });

  testWidgets("Login -> signup -> createTask -> finishTask",
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.byKey(const Key('LoginPage')), findsOneWidget);
    expect(find.text('Enter your name'), findsOneWidget);
    await tester.enterText(find.byKey(const Key('LoginTextField')), 'TEST');
    await tester.tap(find.byKey(const Key('LoginButton')));
    await tester.pumpAndSettle(const Duration(seconds: 1));
    expect(find.byKey(const Key('Homepage')), findsOneWidget);
    await tester.tap(find.byKey(const Key('addTask')));
  });

  testWidgets("Login -> Signup -> createTask -> finishTask -> Points",
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.byKey(const Key('LoginPage')), findsOneWidget);
    expect(find.text('Enter your name'), findsOneWidget);
    await tester.enterText(find.byKey(const Key('LoginTextField')), 'TEST');
    await tester.tap(find.byKey(const Key('LoginButton')));
    await tester.pumpAndSettle(const Duration(seconds: 1));
    final pointsNavItem = find.text('Points');
    expect(pointsNavItem, findsOneWidget);
    await tester.tap(pointsNavItem);
    await tester.pumpAndSettle(const Duration(seconds: 2));
  });

  testWidgets("Login -> Navigate to Profile -> Logout",
      (WidgetTester tester) async {
    // Renderiza el widget principal
    await tester.pumpWidget(const MyApp());
    // Verifica que está en la página de Login
    expect(find.byKey(const Key('LoginPage')), findsOneWidget);
    expect(find.text('Enter your name'), findsOneWidget);
    await tester.enterText(find.byKey(const Key('LoginTextField')), 'TEST');
    await tester.tap(find.byKey(const Key('LoginButton')));
    final profileNavItem = find.byKey(const Key('navItem_Profile'));
    await tester.tap(profileNavItem); // Simula el tap en el ítem
    final logoutButton = find.byKey(const Key('LogoutAccount'));
    await tester.tap(logoutButton);
  });
}
