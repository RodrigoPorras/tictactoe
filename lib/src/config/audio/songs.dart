const Set<Song> songs = {
  Song('song1.mp3', 'song1', artist: 'Seth_Makes_Sounds'),
  Song('song2.mp3', 'song2', artist: 'StephieQueen'),
  Song('song3.mp3', 'song3', artist: 'x1shi'),
};

class Song {
  final String filename;

  final String name;

  final String? artist;

  const Song(this.filename, this.name, {this.artist});

  @override
  String toString() => 'Song<$filename>';
}
