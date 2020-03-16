require_all 'lib'
require 'pry'


class MusicLibraryController

include Sortable
#extend Findable

  attr_accessor :path


def initialize(path = './db/mp3s')
@path = path
@library = MusicImporter.new(@path)
@library.import
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

  until @input == 'exit'
      puts "What would you like to do?"
        @input = gets.chomp
      case @input
      when   'list songs'
        self.list_songs
      when   'list artists'
        self.list_artists
      when   'list genres'
        self.list_genres
      when   'list artist'
        self.list_songs_by_artist
      when   'list genre'
        self.list_songs_by_genre
      when   'play song'
        self.play_song
      end
    end

end



def list_songs
Song.sort_by_name.each_with_index {|song, index| puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
end

def list_artists
Artist.sort_by_name.each_with_index {|artist, index| puts "#{index + 1}. #{artist.name}"}
end

def list_genres
Genre.sort_by_name.each_with_index {|genre, index| puts "#{index + 1}. #{genre.name}"}
end

def list_songs_by_artist

puts "Please enter the name of an artist:"
artist = Artist.find_by_name(gets.chomp)
  if Artist.all.include?(artist) == true
    name_sort(artist.songs).each_with_index { |song, index| puts "#{index + 1}. #{song.name} - #{song.genre.name}" }
  end
end

def list_songs_by_genre
  puts "Please enter the name of a genre:"
  genre = Genre.find_by_name(gets.chomp)
    if Genre.all.include?(genre) == true

    name_sort(genre.songs).each_with_index { |song, index| puts "#{index + 1}. #{song.artist.name} - #{song.name}" }

    end
end

def play_song
puts "Which song number would you like to play?"
num = gets.chomp.to_i - 1
arr = []
name_sort(Song.all).each { |song| arr << song }
  if num >= 0 && num <= arr.length - 1
    choice = arr[num]
    puts "Playing #{choice.name} by #{choice.artist.name}"
  end
end

end
