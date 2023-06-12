import 'package:surf_dart_courses_template/data.dart';

void main() {
  Set<AgriculturalMachinery> machinaries = {};

  machinaries = {
    ...parseMachinery(mapBefore2010),
    ...parseMachinery(mapAfter2010)
  };
  print('Set of machineries');
  printIterable(machinaries);

  final sortedMachineries = machinaries.toList()
    ..sort((a, b) => a.releaseDate.compareTo(b.releaseDate));

  print('Sorted List of machineries');
  printIterable(sortedMachineries);

  print('Average age of all machineries');
  print(calcAverage(sortedMachineries));

  print('Average age of oldest machineries');
  print(calcAverage(
      sortedMachineries.sublist(0, (sortedMachineries.length / 2).ceil() - 1)));
}

int calcAverage(List<AgriculturalMachinery> list) {
  return DateTime.now().year -
      (list.fold<int>(0, (prev, element) => prev + element.releaseDate.year) /
              list.length)
          .round();
}

List<AgriculturalMachinery> parseMachinery(
    Map<Countries, List<Territory>> data) {
  List<AgriculturalMachinery> machineries = [];
  data.forEach((key, value) {
    for (Territory territory in value) {
      machineries.addAll(territory.machineries);
    }
  });
  return machineries;
}

void printIterable<T>(Iterable<T> list) {
  for (T i in list) {
    print('$i');
  }
}
