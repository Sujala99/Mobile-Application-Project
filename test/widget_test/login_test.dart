import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_application_project/app/di/di.dart';
import 'package:mobile_application_project/features/auth/presentation/view/login_view.dart';
import 'package:mobile_application_project/features/auth/presentation/view_model/login/login_bloc.dart';

void main() {
  testWidgets('Should have a title "Login"', (WidgetTester tester) async {
    // Create a mock LoginBloc provider
    await tester.pumpWidget(
      BlocProvider<LoginBloc>(
        create: (context) => getIt<LoginBloc>(),
        child: MaterialApp(
          home: LoginView(),
        ),
      ),
    );

    // Find the login title using a direct text finder
    Finder titleFinder = find.byWidgetPredicate(
      (widget) =>
          widget is Text &&
          widget.data == 'Login' &&
          widget.style?.fontSize == 30, // Ensures it's the large title
    );

    // Expect only one title to be found
    expect(titleFinder, findsOneWidget);
  });

  testWidgets('Should find username and password text fields',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      BlocProvider<LoginBloc>(
        create: (context) => getIt<LoginBloc>(),
        child: MaterialApp(
          home: LoginView(),
        ),
      ),
    );

    // Find the username text field by key
    Finder usernameField = find.byKey(const ValueKey('username'));
    expect(usernameField, findsOneWidget);

    // Find the password text field by key
    Finder passwordField = find.byKey(const ValueKey('password'));
    expect(passwordField, findsOneWidget);
  });

  testWidgets('Should find login and register buttons',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      BlocProvider<LoginBloc>(
        create: (context) => getIt<LoginBloc>(),
        child: MaterialApp(
          home: LoginView(),
        ),
      ),
    );

    // Find the login button specifically inside an ElevatedButton
    Finder loginButton = find.widgetWithText(ElevatedButton, 'Login');
    expect(loginButton, findsOneWidget);

    // Find the Register button using key
    Finder registerButton = find.byKey(const ValueKey('registerButton'));
    expect(registerButton, findsOneWidget);
  });
}
