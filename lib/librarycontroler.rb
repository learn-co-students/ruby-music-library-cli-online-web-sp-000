class MusicLibraryController
  attr_accessor :path
  def initialize(path = './db/mp3s')
    @path = path
    importer = MusicImporter.new(path)
    importer.import
  end
  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    input = gets.chomp
    if input == "list songs"
      self.list_songs
    elsif input == "list artists"
      self.list_artists
    elsif input == "list genres"
      self.list_genres
    elsif input == "list artist"
      self.list_songs_by_artist
    elsif input == "list genre"
      self.list_songs_by_genre
    elsif input == "play song"
      self.play_song
    elsif input != 'exit'
      self.call
    end
  end
  def list_songs
    Song.all.sort_by! {|song| song.name}
    Song.all.uniq!
    Song.all.each_with_index do |song, i|
      puts (i + 1).to_s + ". #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end
  def list_artists
    Artist.all.sort_by! {|artist| artist.name}
    Artist.all.uniq!
    Artist.all.each_with_index do |artist, i|
      puts (i + 1).to_s + ". #{artist.name}"
    end
  end
  def list_genres
    Genre.all.sort_by! {|genre| genre.name}
    Genre.all.uniq!
    Genre.all.each_with_index do |genre, i|
      puts (i + 1).to_s + ". #{genre.name}"
    end
  end
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist = Artist.find_by_name(gets.chomp)
    if !(artist == nil)
      artist.songs.sort_by! {|song| song.name}
      artist.songs.uniq!
      artist.songs.each_with_index do |song, i|
        puts (i + 1).to_s + ". #{song.name} - #{song.genre.name}"
      end
    end
  end
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre = Genre.find_by_name(gets.chomp)
    if !(genre == nil)
      genre.songs.sort_by! {|song| song.name}
      genre.songs.uniq!
      genre.songs.each_with_index do |song, i|
        puts (i + 1).to_s + ". #{song.artist.name} - #{song.name}"
      end
    end
  end
  def play_song
    puts "Which song number would you like to play?"
    input = gets.chomp.to_i
    if (input != 0 && input < Song.all.uniq.length)
      Song.all.sort_by! {|song| song.name}
      Song.all.uniq!
      picked = Song.all[input - 1]
      puts "Playing #{picked.name} by #{picked.artist.name}"
    end
  end
end
