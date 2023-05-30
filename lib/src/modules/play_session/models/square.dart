class Square {
  final bool pressed;
  final String value;

  Square([
    this.pressed = false,
    this.value = '',
  ]);

  Square copyWith({
    bool? pressed,
    String? value,
  }) {
    return Square(
      pressed ?? this.pressed,
      value ?? this.value,
    );
  }
}
