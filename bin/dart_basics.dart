import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

List<String> favoriteFacts = [];
String currentLanguage = 'en';

final Map<String, Map<String, String>> translations = {
  'en': {
    'title': 'I ♡ FACTS',
    'option1': 'Exit',
    'option2': 'View favorites',
    'option3': 'Language',
    'menu1': 'Like',
    'menu2': 'Next',
    'welcome': '🐱 Welcome to Cat Facts! Here\'s the fact:',
    'lang': '🐱 Choose language:',
    'lang1': 'English',
    'lang2': 'Spanish',
    'lang3': 'Russian',
    'empty': 'Your favorite list is empty :(',
    'clear': 'Clear all',
    'back': 'Back',
    'invalid': 'Invalid choice.',
    'bye': 'Bye-bye! 🐱',
  },
  'es': {
    'title': 'Yo ♡ HECHOS',
    'option1': 'Salir',
    'option2': 'Ver favoritos',
    'option3': 'Idioma',
    'menu1': 'Agregar a favoritos',
    'menu2': 'Siguiente hecho',
    'welcome': '🐱 ¡Bienvenido a los hechos de gatos! Aquí va uno:',
    'lang': '🐱 Elige idioma:',
    'lang1': 'Inglés',
    'lang2': 'Español',
    'lang3': 'Ruso',
    'empty': 'Tu lista de favoritos está vacía :(',
    'clear': 'Eliminar todos',
    'back': 'Volver',
    'invalid': 'Opción inválida.',
    'bye': '¡Adiós! 🐱',
  },
  'ru': {
    'title': 'Я ♡ ФАКТЫ',
    'option1': 'Выход',
    'option2': 'Избранное',
    'option3': 'Язык',
    'menu1': 'Лайк',
    'menu2': 'Далее',
    'welcome': '🐱 Добро пожаловать в факты о котиках! Вот один из них:',
    'lang': '🐱 Выберите язык:',
    'lang1': 'Английский',
    'lang2': 'Испанский',
    'lang3': 'Русский',
    'empty': 'Ваш список избранного пуст :(',
    'clear': 'Очистить всё',
    'back': 'Назад',
    'invalid': 'Неверный выбор.',
    'bye': 'Пока-пока! 🐱',
  },
};

String t(String key) {
  return translations[currentLanguage]?[key] ?? '[missing "$key"]';
}

Future<String> fetchCatFact() async {
  final response = await http.get(Uri.parse('https://catfact.ninja/fact'));

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    return data['fact'];
  } else {
    return 'Failed to load cat fact.';
  }
}

String yellow(String text) => '\x1B[33m$text\x1B[0m';
String yellow256(int code, String text) => '\x1B[38;5;${code}m$text\x1B[0m';
String honey(String text) => yellow256(229, text);
String cyan(String text) => '\x1B[36m$text\x1B[0m';

void clearConsole() {
  print('\x1B[2J\x1B[0;0H');
}

void clearPreviousLine() {
  stdout.write('\x1B[1A'); // cursor up 1 line
  stdout.write('\x1B[2K'); // erase entire line
}

void showOptions() {
  print(
      '\x1B[36m[1]\x1B[0m ${t('option1')} | \x1B[36m[2]\x1B[0m ${t('option2')} | \x1B[36m[3]\x1B[0m ${t('option3')}\n');
}

void showMenu() {
  print(
      '         \x1B[36m[4]\x1B[0m ${t('menu1')}  |  \x1B[36m[5]\x1B[0m ${t('menu2')}');
}

void printAll() {
  clearConsole();
  showOptions();
  print(yellow(t('welcome')));
}

void printCatFact(String text, {int maxWidth = 40}) {
  const padding = 2;

  final words = text.split(' ');
  final List<String> lines = [];
  String currentLine = '';

  for (final word in words) {
    if ((currentLine + word).length + 1 <= maxWidth) {
      currentLine += (currentLine.isEmpty ? '' : ' ') + word;
    } else {
      lines.add(currentLine);
      currentLine = word;
    }
  }
  if (currentLine.isNotEmpty) {
    lines.add(currentLine);
  }

  final boxWidth =
      lines.map((l) => l.length).reduce((a, b) => a > b ? a : b) + padding * 2;

  final top = '┌${'─' * boxWidth}┐';
  final bottom = '└${'─' * boxWidth}┘';

  print(honey(top));
  for (final line in lines) {
    final spaces = ' ' * (boxWidth - line.length - padding * 2);
    print(honey('│${' ' * padding}$line$spaces${' ' * padding}│'));
  }
  print(honey(bottom));
}

void changeLanguage() {
  clearConsole();
  print(yellow('${t('lang')}\n'));
  print('\x1B[36m[1]\x1B[0m ${t('lang1')}');
  print('\x1B[36m[2]\x1B[0m ${t('lang2')}');
  print('\x1B[36m[3]\x1B[0m ${t('lang3')}\n');
  String? choice = stdin.readLineSync();
  switch (choice) {
    case '1':
      currentLanguage = 'en';
      break;
    case '2':
      currentLanguage = 'es';
      break;
    case '3':
      currentLanguage = 'ru';
      break;
    default:
      print('Invalid choice.');
  }
  clearConsole();
}

void printFactBox(String fact, {int width = 60}) {
  List<String> lines = [];

  while (fact.length > width) {
    int splitIndex = fact.lastIndexOf(' ', width);
    if (splitIndex == -1) splitIndex = width;
    lines.add(fact.substring(0, splitIndex));
    fact = fact.substring(splitIndex).trimLeft();
  }
  lines.add(fact);

  final top = '┌${'─' * (width + 2)}┐';
  final bottom = '└${'─' * (width + 2)}┘';

  print(top);
  for (var line in lines) {
    final paddedLine = line.padRight(width);
    print('│ $paddedLine │');
  }
  print(bottom);
}

void printFavorites() {
  clearConsole();

  if (favoriteFacts.isEmpty) {
    print('            ${t('empty')}');
  } else {
    print(yellow('                    ${t('title')}:'));
    for (var i = 0; i < favoriteFacts.length; i++) {
      printFactBox(favoriteFacts[i], width: 50);
    }
  }

  print(
      '           \x1B[36m[1]\x1B[0m ${t('clear')} |  \x1B[36m[2]\x1B[0m ${t('back')}');

  String? input = stdin.readLineSync();
  switch (input) {
    case '1':
      printAll();
      favoriteFacts.clear();
      break;
    case '2':
      printAll();
      break;
    default:
      clearPreviousLine();
      print(t('invalid'));
  }
}

Future<void> runApp() async {
  printAll();
  bool isRunning = true;
  while (isRunning) {
    String fact = await fetchCatFact();

    printCatFact('   $fact');

    showMenu();

    String? input = stdin.readLineSync();
    switch (input) {
      case '1':
        isRunning = false;
        clearConsole();
        print('\x1B[36m${t('bye')}\x1B[0m 🐱');
        break;
      case '4':
        favoriteFacts.add(fact);
        printAll();
        continue;
      case '5':
        printAll();
        continue;
      case '2':
        clearPreviousLine();
        printFavorites();
      case '3':
        changeLanguage();
        printAll();
        continue;
      default:
        printAll();
        print(t('invalid'));
    }
  }
}

void main() async {
  await runApp();
}
