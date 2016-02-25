library css_loader.base;

import 'dart:html';

bool isCssImported(String id) {
  final sheets = document.getElementsByTagName('style');
  return sheets.firstWhere((StyleElement e) => e.id == id,
      orElse: () => null) != null;
}

void importCssString(String cssText, [String id]) {
  if (cssText == null) throw new ArgumentError.notNull('cssText');
  if (id != null && isCssImported(id)) return;

  final style = new StyleElement()..appendText(cssText);
  if (id != null) style.id = id;

  document.head.append(style);
}

void importCssStyleSheet(Uri uri) {
  final link = new LinkElement()
    ..rel = 'stylesheet'
    ..href = uri.toString();

  document.head.append(link);
}
