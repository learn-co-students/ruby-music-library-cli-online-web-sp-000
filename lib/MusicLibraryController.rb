class MusicLibraryController
  def initialize(path = "./db/mp3s")
    @importer = MusicImporter.new(path)
    @importer.import
  end
  def call
    @controller = MusicLibraryController.new()
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    while true do
      puts "What would you like to do?"
      case gets.gsub(/\n/,"")
      when "exit"
        return
        break
      when "list songs"
        list_songs
      when "list artists"
        list_artists
      when "list genres"
        list_genres
      when "list artist"
        list_songs_by_artist
      when "list genre"
        list_songs_by_genre
      when "play song"
        list_songs
        play_song
      end
    end
  end
  def list_songs
    output = []
    raw_songs = Song.all
    raw_songs.sort_by! { |song|  song.name}
    raw_songs.each_with_index do |song, key|
      output << "#{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
    output.uniq!
    output.each_with_index do |song, index|
      puts "#{index + 1}. #{song}"
    end
  end
  def list_artists
    raw_artists = Artist.all
    raw_artists.sort_by! {|artist| artist.name}
    raw_artists.each_with_index do |artist, index|
      puts "#{index + 1}. #{artist.name}"
    end
  end
  def list_genres
    raw_genres = Genre.all
    raw_genres.sort_by! {|genre| genre.name}
    raw_genres.each_with_index do |genre, index|
      puts "#{index + 1}. #{genre.name}"
    end
  end
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist = gets.gsub(/\n/, "")
    songs = Song.all.find_all {|song| song.artist.name === artist}
    song_list = []
    songs.each_with_index do |song, index|
      song_list << "#{song.name} - #{song.genre.name}"
    end
    song_list.uniq!
    song_list.sort! { |a, b| a<=>b }
    song_list.each_with_index do |song, index|
      puts "#{index + 1}. #{song}"
    end
  end
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.gsub(/\n/,"")
    genre = Genre.all.find {|genre| genre.name === input}
    if (genre != nil)
      genre.songs.sort_by! {|song| song.name}
      genre.songs.each_with_index do |song, index|
        puts "#{index + 1}. #{song.artist.name} - #{song.name}"
      end
    end
  end
  def play_song
    puts "Which song number would you like to play?"
    raw_songs = Song.all
    raw_songs.uniq!
    raw_songs.sort_by! { |song|  song.name}
    input = gets.gsub(/\n/,"").to_i
    if (input <= raw_songs.length && input >= 1)
      song = raw_songs[input - 1]
      if (song != nil)
        puts "Playing #{song.name} by #{song.artist.name}"
      end
    end
  end
end
