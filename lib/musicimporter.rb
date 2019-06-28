class MusicImporter
  
  attr_reader :path
  
  def initialize(path)
    @path = path
  end
  
  def path 
    @path 
  end
  
  def files()
    @files ||= Dir.glob("#{@path}/*.mp3").collect{|file| file.gsub("#{@path}/", "")}
  end
  
  def import()
    files.each{|filename| Song.create_from_filename(filename)}
  end

end

class MusicLibraryController
  
  extend Concerns::Findable
  
  def initialize(path= "./db/mp3s")
    importer = MusicImporter.new(path).import
  end
  
  def call
    
    input = ""
    while input != "exit"
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
  when 'list songs'
    list_songs 
  when 'list artists'
    list_artists
  when 'list genres'
    list_genres
  when 'list artist'
    list_songs_by_artist
  when 'list genre'
    list_songs_by_genre
  when 'play song'
   play_song
  end
end
end

def list_songs
  list_of_songs = Song.all.sort{|a, b| a.name.upcase <=> b.name.upcase}.each.with_index(1) do 
    |s, i| puts "#{i}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
  end
  list_of_songs
end

def list_artists
  sorted_by_artist = Artist.all.sort_by do |artist|
    artist.name 
  end
  sorted_by_artist.each.with_index(1) do |a, i|
    puts "#{i}. #{a.name}"
  end
end

def list_genres 
  sorted_by_genre = Genre.all.sort_by do |genre|
    genre.name 
  end
  sorted_by_genre.each.with_index(1) do |g, i|
    puts "#{i}. #{g.name}"
  end
end

def list_songs_by_artist
  puts "Please enter the name of an artist:"
  input = gets.chomp
  if artist = Artist.find_by_name(input)
    artist.songs.sort{|a, b| a.name.upcase <=> b.name.upcase}.each.with_index(1) do 
    |s, i| puts "#{i}. #{s.name} - #{s.genre.name}"
  end
  end
end

def list_songs_by_genre 
  puts "Please enter the name of a genre:"
  input = gets.chomp 
  if genre = Genre.find_by_name(input)
    genre.songs.sort{|a, b| a.name.upcase <=> b.name.upcase}.each.with_index(1) do 
    |s, i| puts "#{i}. #{s.artist.name} - #{s.name}"
  end
  end
end

def play_song
  puts "Which song number would you like to play?"
  list_songs = Song.all.sort{|a, b| a.name <=> b.name}
  input = gets.chomp.to_i 
  if input.between?(1, Song.all.length)
    song = list_songs[input - 1]
    puts "Playing #{song.name} by #{song.artist.name}"
  end
end

end
 

  
  
 
