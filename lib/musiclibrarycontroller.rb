class MusicLibraryController

  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
  end


  def call
    input = nil
    until input == 'exit'
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"

      input = gets.strip
        case input
          when 'list songs' then list_songs
          when 'list artists' then list_artists
          when 'list genres' then list_genres
          when 'list artist' then list_songs_by_artist
          when 'list genre' then list_songs_by_genre
          when 'play song' then play_song
        end
    end
  end


  def list_artists
    counter = 1
    ordered_list = Artist.all.sort_by! {|artist| artist.name}
    ordered_list.each do |artist|
      puts "#{counter}. #{artist.name}"
      counter += 1
    end
  end

  def list_songs
    counter = 1
    ordered_list = Song.all.sort_by! {|song| song.name}
    ordered_list.each do |song|
      puts "#{counter}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      counter += 1
    end
  end

  def list_genres
    counter = 1
    ordered_list = Genre.all.sort_by! {|song| song.name}
    ordered_list.each do |genre|
      puts "#{counter}. #{genre.name}"
      counter += 1
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip

      if artist = Artist.find_by_name(input)
        counter = 1
        artist.songs.sort{|a, b| a.name <=> b.name}.each do |s|
          puts "#{counter}. #{s.name} - #{s.genre.name}"
          counter += 1
        end
      end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip

    if genre = Genre.find_by_name(input)
      counter = 1
      genre.songs.sort{|a, b| a.name <=> b.name}.each do |s|
          puts "#{counter}. #{s.artist.name} - #{s.name}"
          counter += 1
      end
    end
  end

  def play_song
      puts "Which song number would you like to play?"
      input = gets.strip.to_i
      if input > 0 && input <= Song.all.length
        input -= 1
        ordered_list = Song.all.sort_by! {|song| song.name}
        play_song = ordered_list.fetch(input)
        puts "Playing #{play_song.name} by #{play_song.artist.name}"
      end
  end







end
