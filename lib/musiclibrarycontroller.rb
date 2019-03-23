require 'pry'
class MusicLibraryController

  include Concerns::Meth

  attr_reader :path

  def initialize(path='./db/mp3s')
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
    var = ""
      while var != "exit"
        var = gets.strip
      case var
      when 'list songs'
        list_songs
      when 'list genres'
        list_genres
      when 'list artist'
        list_songs_by_artist
      when 'list genre'
        list_songs_by_genre
      when 'play song'
        play_song
      when 'list artists'
        list_artists
      end
    end

  end

  def list_songs
    self.files.sort_by {|x| x[/-\s(.+)\s-/]}.each_with_index {|y, index| puts "#{index+1}. #{y.gsub(/\.\w+/, '')}"}
  end

  def list_artists
    Artist.all.map {|x| x.name}.sort.each_with_index {|x, index| puts "#{index+1}. #{x}"}
  end

  def list_genres
    self.files.map{|x| x.split(" - ")[2].gsub(/\.\w+/, '')}.sort.uniq.each_with_index {|x, index| puts "#{index+1}. #{x}"}
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    var = gets
    Song.all.collect {|x| x if x.artist.name.include?(var)}.compact.sort_by {|x| x.name}.each_with_index {|x, index| puts "#{index+1}. #{x.name} - #{x.genre.name}"}
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    var = gets
    Song.all.collect {|x| x if x.genre.name.include?(var)}.compact.sort_by {|x| x.name}.each_with_index {|x, index| puts "#{index+1}. #{x.artist.name} - #{x.name}"}
  end

  def play_song
    puts "Which song number would you like to play?"
    var = gets
    index = gets.strip.to_i-1
  if index > -1 && Song.all.count-1 >= index
     song = Song.all.sort{|a, b| a.name <=> b.name}[index]
     puts "Playing #{song.name} by #{song.artist.name}"
  end
end
end
