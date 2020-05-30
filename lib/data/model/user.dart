class User {
  final String email;
  final String name;
  final String age;
  final String pregnantAgeWeek;
  final String pregnantAgeDay;

  static final String keyEmail = 'email';
  static final String keyName = 'name';
  static final String keyDateOfBirth = 'dateOfBirth';
  static final String keyPregnantAgeWeek = 'pregnantAgeDay';
  static final String keyPregnantAgeDay = 'pregnantAgeWeek';

  User({
    this.email,
    this.name,
    this.age,
    this.pregnantAgeWeek,
    this.pregnantAgeDay,
  });

  User copyWith({
    email,
    name,
    age,
    pregnantAgeWeek,
    pregnantAgeDay,
  }) {
    return User(
      email: email ?? this.email,
      name: name ?? this.name,
      age: age ?? this.age,
      pregnantAgeWeek: pregnantAgeWeek ?? this.pregnantAgeWeek,
      pregnantAgeDay: pregnantAgeDay ?? this.pregnantAgeDay,
    );
  }
}
