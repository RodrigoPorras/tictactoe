String soundTypeToFilename(SfxType type) {
  switch (type) {
    case SfxType.buttonTap:
      return 'button_tap.mp3';
    case SfxType.squareTap:
      return 'tap.mp3';
  }
}

enum SfxType {
  buttonTap,
  squareTap,
}
