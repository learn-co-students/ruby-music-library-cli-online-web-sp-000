class MusicLibraryController
  attr_reader :path, :songs

  def initialize(path = './db/mp3s')
    @path = path
    # binding.pry
    importer = MusicImporter.new(path)
    @songs = importer.import
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

    user_input = gets.strip

    case user_input
      when "list songs"
        self.list_songs
      when "list artists"
        self.list_artists
      when "list genres"
        self.list_genreslis
      when "list artist"
        self.list_songs_by_artist
      when "list genre"
        self.list_songs_by_genre
      when "play song"
        self.play_song
      else
        self.call unless user_input == 'exit'
    end
  end

  def list_songs
    # binding.pry
    Song.all
    .sort_by{|song| song.name}
    .each.with_index(1){|song, index| puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end

  def list_artists
    Artist.all
    .sort_by{|artist| artist.name}
    .each.with_index(1){|artist, index| puts "#{index}. #{artist.name}"}
  end

  def list_genres
    Genre.all
    .sort_by{|genre| genre.name}
    .each.with_index(1){|genre, index| puts "#{index}. #{genre.name}"}
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    user_input_artist = gets.strip

    Song.all
    .sort_by{|song| song.name}
    .select{|song| song.artist.name == user_input_artist}
    .each.with_index(1){|song, index| puts "#{index}. #{song.name} - #{song.genre.name}"}
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    user_input_genre = gets.strip

    Song.all
    .sort_by{|song| song.name}
    .select{|song| song.genre.name == user_input_genre}
    .each.with_index(1){|song, index| puts "#{index}. #{song.artist.name} - #{song.name}"}
  end

  def play_song
    puts "Which song number would you like to play?"
    user_choice = gets.strip
    sorted_list = Song.all.sort_by{|song| song.name}

    sorted_list.each.with_index(1) {|song, index|
      if index == user_choice.to_i
        puts "Playing #{song.name} by #{song.artist.name}"
      end}
  end
  # binding.pry
end