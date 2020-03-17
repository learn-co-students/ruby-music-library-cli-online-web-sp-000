class MusicLibraryController
  def initialize(path='./db/mp3s')
    music_importer = MusicImporter.new(path)
    music_importer.import
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
    command = gets.chomp
    until command == 'exit'
      case command
      when 'list songs'
        self.list_songs
      when 'list artists'
        self.list_artists
      when 'list genres'
        self.list_genres
      when 'list artist'
        self.list_songs_by_artist
      when 'list genre'
        self.list_songs_by_genre
      when 'play song'
        self.play_song
      else
      end
      command = gets.chomp
    end

    def list_songs
      songs = Song.all.sort {|a, b| a.name <=> b.name}
      songs.each_with_index {|song, index| puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
    end

    def list_artists
      artists = Artist.all.sort {|a, b| a.name <=> b.name}
      artists.each_with_index {|artist, index| puts "#{index+1}. #{artist.name}"}
    end

    def list_genres
      genres = Genre.all.sort {|a, b| a.name <=> b.name}
      genres.each_with_index {|genre, index| puts "#{index+1}. #{genre.name}"}
    end

    def list_songs_by_artist
      puts "Please enter the name of an artist:"
      artist_name = gets.chomp
      songs = Song.all.find_all {|song| song.artist.name == artist_name}
      songs.sort! {|a, b| a.name <=> b.name}
      songs.each_with_index{|song, index| puts "#{index+1}. #{song.name} - #{song.genre.name}"}
    end

    def list_songs_by_genre
      puts "Please enter the name of a genre:"
      genre_name = gets.chomp
      songs = Song.all.find_all {|song| song.genre.name == genre_name}
      songs.sort! {|a, b| a.name <=> b.name}
      songs.each_with_index{|song, index| puts "#{index+1}. #{song.artist.name} - #{song.name}"}
    end

    def play_song
      puts "Which song number would you like to play?"
      index = gets.chomp.to_i - 1
      songs = Song.all.sort {|a, b| a.name <=> b.name}
      if index >=0 and index < songs.length
        puts "Playing #{songs[index].name} by #{songs[index].artist.name}"
      end
    end
  end
end
