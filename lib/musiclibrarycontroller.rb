class MusicLibraryController

  def initialize(path = './db/mp3s')
    MusicImporter.new(path).import
    # songs are imported via MusicImporter
    # each song file is created and saved into Song.all
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
    input = gets.strip

    if input == 'list songs'
      self.list_songs
    elsif input == 'list artists'
      self.list_artists
    elsif input == 'list genres'
      self.list_genres
    elsif input == 'list artist'
      self.list_songs_by_artist
    elsif input == 'list genre'
      self.list_songs_by_genre
    elsif input == 'play song'
      self.play_song
    end

    while input != "exit"
      input = gets.strip
    end
  end

  def list_songs
    sorted = Song.all.sort_by {|o| o.name}

    counter = 1
    sorted.each do |s|
      puts "#{counter}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
      counter += 1
    end
  end

  def list_artists
    sorted = Artist.all.sort_by {|o| o.name}

    counter = 1
    sorted.each do |a|
      puts "#{counter}. #{a.name}"
      counter += 1
    end
  end

  def list_genres
    sorted = Genre.all.sort_by {|o| o.name}

    counter = 1
    sorted.each do |a|
      puts "#{counter}. #{a.name}"
      counter += 1
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    name = gets.strip

    if Artist.all.include?(Artist.find_by_name(name))
      counter = 1
      sorted = Artist.find_by_name(name).songs.sort_by {|s| s.name}
      sorted.each do |s|
        puts "#{counter}. #{s.name} - #{s.genre.name}"
        counter += 1
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    name = gets.strip

    if Genre.all.include?(Genre.find_by_name(name))
      counter = 1
      sorted = Genre.find_by_name(name).songs.sort_by {|s| s.name}
      sorted.each do |g|
        puts "#{counter}. #{g.artist.name} - #{g.name}"
        counter += 1
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    number = gets.strip

    if number.to_i > 0 && number.to_i <= Song.all.size
      sorted = Song.all.sort_by {|o| o.name}
      counter = 1
      sorted.each do |s|
        puts "Playing #{s.name} by #{s.artist.name}" if counter == number.to_i
        counter += 1
      end
    end
  end

end
