import 'package:object_exercise/student.dart';

void main(List<String> arguments) {
  var studentA = Student(firstName: 'Tom', lastName: 'Maurer', idNumber: 1);

  var studentB = Student.emptyStudent();

  print(studentA.fullName);

  print(studentB.fullName);
  studentB.firstName = 'John';
  studentB.lastName = 'Smith';
  print(studentB.fullName);
}
