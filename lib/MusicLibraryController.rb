class MusicLibraryController

  def initialize(path = './db/mp3s')
  musicimporter = MusicImporter.new(path)
  musicimporter.import
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
      input = gets
    end

    ##The pry is located just below.
    def list_songs
      songs = []
      Song.all.each {|song| songs << "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
      songs.sort_by! {|song| song.split(" - ")[1]}
      songs.collect!.with_index {|song, position| "#{position + 1}. #{song}"}
      songs.each{|song| puts song}
    end

    def list_artists
      artists = []
      Artist.all.each {|artist| artists << "#{artist.name}"}
      artists.sort!.collect!.with_index{|artist, position| "#{position + 1}. #{artist}"}
      artists.each {|artist| puts artist}
    end

    def list_genres
      genres = []
      Genre.all.each {|genre| genres << "#{genre.name}"}
      genres.sort!.collect!.with_index{|genre, position| "#{position + 1}. #{genre}"}
      genres.each {|genre| puts genre}
    end

    def list_songs_by_artist
      puts "Please enter the name of an artist:"
      name = gets
      songs = []
      if artist = Artist.find_by_name(name)
       songs = []
       artist.songs.each {|song| songs << "#{song.name} - #{song.genre.name}" }
       songs.sort_by! {|song| song.split(" - ")[0]}
       songs.collect!.with_index {|song, position| "#{position + 1}. #{song}" }
       songs.each {|song| puts song}
     end
    end

    def list_songs_by_genre
      puts "Please enter the name of a genre:"
      name = gets
      songs = []
      if genre = Genre.find_by_name(name)
       songs = []
       genre.songs.each {|song| songs << "#{song.artist.name} - #{song.name}" }
       songs.sort_by! {|song| song.split(" - ")[1]}
       songs.collect!.with_index {|song, position| "#{position + 1}. #{song}" }
       songs.each {|song| puts song}
     end
    end

    def play_song
      puts "Which song number would you like to play?"
      input = gets.to_i
       member = self.list_songs[input - 1]
       artist_name = member.split(" - ")[0].slice!(3,13)
       song_name = member.split(" - ")[1]
      puts "Playing #{song_name} by #{artist_name}"
    end


  end

end
