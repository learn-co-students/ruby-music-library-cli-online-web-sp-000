class MusicLibraryController

  attr_accessor :path

  def initialize(path="./db/mp3s")
    @path = path
    MusicImporter.new(path).import
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
    input = nil
    until input == "exit"
      input = gets.strip

      case input

        when "list songs"
          self.list_songs
        when "list genres"
          self.list_genres
        when "list artists"
          self.list_artists
        when "list artist"
          self.list_songs_by_artist
        when "list genre"
          self.list_songs_by_genre
        when "play song"
          self.play_song
      end
    end
  end

  def list_songs
    alphabetized_songs = Song.all.sort_by {|song| song.name}
    alphabetized_songs.each_with_index {|song, i| puts "#{i+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end

  def list_artists
    #Artist.all.collect {|artist| artist.name}.sort.each_with_index {|artist, index| puts "#{index+1}. #{artist}"}
    alphabetized_artists = Artist.all.sort_by {|artist| artist.name}
    alphabetized_artists.each.with_index(1) {|artist, i| puts "#{i}. #{artist.name}"}
  end

  def list_genres
    alphabetized_genres = Genre.all.sort_by {|genre| genre.name}
    alphabetized_genres.each.with_index {|genre, i| puts "#{i+1}. #{genre.name}"}
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist = gets.strip
    alphabetized_songs_by_artist = Song.all.select {|song| song.artist.name == artist}.sort_by{|song| song.name}
    alphabetized_songs_by_artist.each_with_index {|song, i| puts "#{i+1}. #{song.name} - #{song.genre.name}"}
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre = gets.strip
    alphabetized_songs_by_genre = Song.all.select {|song| song.genre.name == genre}.sort_by{|song| song.name}
    alphabetized_songs_by_genre.each_with_index {|song, i| puts "#{i+1}. #{song.artist.name} - #{song.name}"}
  end

  def play_song
    puts "Which song number would you like to play?"
    alphabetized_songs = Song.all.sort_by {|song| song.name}
    song_number = gets.strip.to_i
    song = alphabetized_songs[song_number - 1]
    if song_number > 0 && song_number <= Song.all.length
      puts "Playing #{song.name} by #{song.artist.name}"
    end
  end

end

#rspec spec/011_music_library_cli_methods_spec.rb
