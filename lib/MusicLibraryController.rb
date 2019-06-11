require 'pry'
class MusicLibraryController

  def initialize(path = './db/mp3s')
    obj = MusicImporter.new(path)
    obj.import
  end

  def call
    # puts "Welcome to the jungle!"
    # puts "Insert pull tab A into slot B:"

    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    cmd = ""
    while (cmd!= "exit")
      cmd = gets.strip
      if cmd == "list songs"
        list_songs
      elsif cmd == "list artists"
        list_artists
      elsif cmd == "list genres"
        list_genres
      elsif cmd == "list artist"
        list_songs_by_artist
      elsif cmd == "list genre"
        list_songs_by_genre
      elsif cmd == "play song"
        play_song
      end
    end
  end

  def list_songs
    sorted = Song.all.sort.uniq
    #binding.pry
    sorted.each {|x| puts "#{sorted.index(x) + 1}. #{x.artist.name} - #{x.name} - #{x.genre.name}"}
  end

  def pick_song(num)
    index = num - 1
    sorted = Song.all.sort.uniq
    sorted[index]
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    a = gets.strip
    ray = []
    match = Artist.all.select {|x| x.name == a}
    #binding.pry
    if !match.first.nil?
      sorted =  match.first.songs.sort.uniq
      sorted.each {|x| puts "#{sorted.index(x) + 1}. #{x.name} - #{x.genre.name}"}
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    g = gets.strip
    ray = []
    match = Genre.all.select {|x| x.name == g}
    if !match.first.nil?
      sorted = match.first.songs.sort.uniq
      sorted.each {|x| puts "#{sorted.index(x) + 1}. #{x.artist.name} - #{x.name}"}
    end

  end

  def play_song
    #list_songs
    puts "Which song number would you like to play?"
    s = gets.strip.to_i
    libsize = Song.all.size + 1
    #binding.pry
    if s.is_a?(Integer) && (s < libsize && s > 0)
      song = pick_song(s)
      #binding.pry
      puts "Playing #{song.name} by #{song.artist.name}" if !song.nil?
    end
  end

  def list_artists
    sorted = Artist.all.sort.uniq
    #binding.pry
    sorted.each {|y| puts "#{sorted.index(y) + 1}. #{y.name}"}
  end

  def list_genres
    sorted = Genre.all.sort
    #binding.pry
    sorted.each {|z| puts "#{sorted.index(z) + 1}. #{z.name}"}
  end


end
