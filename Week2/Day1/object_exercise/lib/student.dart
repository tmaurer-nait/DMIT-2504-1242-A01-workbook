class Student {
  // Properties
  late String _firstName;
  late String _lastName;
  late int _idNumber;

  // Constructors
  Student(
      {required String firstName,
      required String lastName,
      required int idNumber}) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.idNumber = idNumber;
  }

  Student.emptyStudent() {
    _firstName = '';
    _lastName = '';
    _idNumber = 0;
  }

  // Methods
  set firstName(String value) {
    // Validate before setting
    if (value.isEmpty) {
      throw Exception('First name must be at least 1 character');
    }

    _firstName = value;
  }

  String get firstName {
    return _firstName;
  }

  set lastName(String value) {
    // Validate before setting
    if (value.isEmpty) {
      throw Exception('Last name must be at least 1 character');
    }

    _lastName = value;
  }

  String get lastName {
    return _lastName;
  }

  set idNumber(int value) {
    // Validate before setting
    if (value < 0) {
      throw Exception('Id number must be positive');
    }

    _idNumber = value;
  }

  int get idNumber {
    return _idNumber;
  }

  String get fullName {
    return '$_lastName, $_firstName';
  }

  void incrementID() {
    _idNumber++;
  }
}
