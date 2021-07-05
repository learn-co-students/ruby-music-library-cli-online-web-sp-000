class MusicLibraryController
  attr_accessor :path
  def initialize(path = './db/mp3s')
    @path = path
    @importer = MusicImporter.new(@path).import
  end

  def call
    puts "Welcome to your music library!"
    holder = nil
    while holder != "exit"

      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      holder = gets
      case holder
      when "list songs"
        self.list_songs
      when "list artists"
        self.list_artists
      when "list genres"
        self.list_genres
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
    list = Song.all.sort {|a, b| a.name <=> b.name}
    counter = 0
    list.each do |song|
      counter += 1
      name = "#{counter}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      puts name
    end
  end

  def list_artists
    list = Artist.all.sort {|a, b| a.name <=> b.name}
    counter = 0
    list.each {|artist| puts "#{counter+=1}. #{artist.name}"}
  end

  def list_genres
    list = Genre.all.sort {|a, b| a.name <=> b.name}
    counter = 0
    list.each {|genre| puts "#{counter+=1}. #{genre.name}"}
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    response = gets
    if Artist.all.any? {|i| i.name == response}
      artist = Artist.find_by_name(response)
      a = artist.songs.sort {|i, x| i.name <=> x.name}
      counter = 0
      a.each {|i| puts "#{counter+=1}. #{i.name} - #{i.genre.name}"}
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    response = gets
    if Genre.all.any? {|i| i.name == response}
      genre = Genre.find_by_name(response)
      a = genre.songs.sort {|i, x| i.name <=> x.name}
      counter = 0
      a.each {|i| puts "#{counter+=1}. #{i.artist.name} - #{i.name}"}
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.to_i
    songs = Song.all.sort {|i, x| i.name <=> x.name}
    if input > 0 && input <= songs.length
      song = songs[input - 1]
      puts "Playing #{song.name} by #{song.artist.name}"
    end
  end
end
