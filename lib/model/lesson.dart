class Lesson{
  final String name;
  final double letter;
  final double credit;

  Lesson({required this.name,required this.letter,required this.credit});
  @override
  String toString() {
    // TODO: implement toString
    return '$name $letter $credit';
  }
}