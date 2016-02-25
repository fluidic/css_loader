library css_loader.test;

import 'dart:html';

@TestOn("browser")
import 'package:css_loader/css_loader.dart';
import 'package:test/test.dart';

main() {
  group('CSS tests', () {
    test('importCssString', () {
      final p = document.createElement('p');
      document.body.append(p);
      importCssString('p {color:green}');

      expect(p.getComputedStyle().color, equals('rgb(0, 128, 0)'));
    });

    test('isCssImported keeps track of the list of imported CSS by id', () {
      final p = document.createElement('p');
      document.body.append(p);

      expect(isCssImported('myid'), isFalse);

      importCssString('p {color:green}', 'myid');

      expect(isCssImported('myid'), isTrue);
    });

    test('importCssStylesheet', () {
      final p = document.createElement('p');
      document.body.append(p);
      importCssStyleSheet(new Uri(path: './test.css'));

      expect(p.getComputedStyle().color, equals('rgb(0, 128, 0)'));
    });
  });
}
