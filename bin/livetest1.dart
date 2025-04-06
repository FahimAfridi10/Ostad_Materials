void main() {
  List<Map<String, dynamic>> students = [
    {
      "name": "Alice",
      "scores": [85, 90, 78],
    },
    {
      "name": "Bob",
      "scores": [88, 76, 95],
    },
    {
      "name": "Charlie",
      "scores": [90, 92, 85],
    },
  ];

  List<MapEntry<String, double>> averages =
      students.map((student) {
        String name = student['name'];
        List<int> scores = List<int>.from(student['scores']);
        double avg = scores.reduce((a, b) => a + b) / scores.length;
        return MapEntry(name, double.parse(avg.toStringAsFixed(2)));
      }).toList();

  averages.sort((a, b) => b.value.compareTo(a.value));

  Map<String, double> sortedMap = Map.fromEntries(averages);

  print(sortedMap);
}
