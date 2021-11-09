import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:integration_testing/main.dart' as app;

void main() {
  // O Teste de integração é bem semelhante ao teste de widgets,
  // só que com o objetivo percorrer todo o fluxo desejado.

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      expect(find.text('Teste de integração - aqui'), findsOneWidget);

      await tester.tap(find.byKey(const Key('ir-listview')));

      await tester.pumpAndSettle();

      expect(find.text('Email*'), findsOneWidget);

      expect(find.text('CPF*'), findsOneWidget);

      await tester.enterText(find.byKey(const Key('email')), 'a@a.com');

      await tester.pump();

      await tester.enterText(find.byKey(const Key('cpf')), '00000000000');

      await tester.pump();

      await tester.tap(find.byKey(const Key('proximo')));

      await tester.pumpAndSettle();

      await tester.tap(find.text('A'));

      await tester.pump();
      await tester.pump(const Duration(seconds: 1));

      await tester.tap(find.text('B').last);
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));

      await tester.pumpAndSettle();

      await tester.tap(find.byKey(const Key('proximo')));

      await tester.pumpAndSettle();

      expect(find.text('Chegou ao fim !'), findsOneWidget);

      await tester.pump();
    });
  });
}
