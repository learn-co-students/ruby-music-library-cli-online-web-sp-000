# class Artist
#   extend Concerns::Findable
#
#   attr_accessor :name, :song, :genre
#   @@all = []
#
#   def initialize(name)
#     @name = name
#     @song = song
#     @genre = genre
#     @songs = []
#   end
#
#   def self.all
#     @@all
#   end
#
#   def songs
#     @songs
#   end
#
#   def self.destroy_all
#     @@all.clear
#   end
#
#   def save
#     @@all << self
#   end
#
#   def self.create(name)
#     artist = Artist.new(name)
#     @@all << artist
#     artist
#   end
#
#   def add_song(song)
#     song.artist = self unless song.artist == self
#     songs << song unless songs.include?(song)
#   end
#
#   def genres
#     songs.collect do |song|
#        song.genre
#      end.uniq
#    end
#
# end
#
# class Genre
#   extend Concerns::Findable
#
#   attr_accessor :name, :artist, :song
#   @@all = []
#
#   def initialize(name)
#     @name = name
#     @artist = artist
#     @song = song
#     @songs = []
#   end
#
#   def self.all
#     @@all
#   end
#
#   def self.destroy_all
#     @@all.clear
#   end
#
#   def save
#     @@all << self
#   end
#
#   def songs
#     @songs
#   end
#
#   def self.create(name)
#     genre = Genre.new(name)
#     @@all << genre
#     genre
#   end
#
#   def artists
#     songs.collect do |song|
#        song.artist
#      end.uniq
#   end
# end
#
# class MusicImporter
#
#   attr_accessor :path, :file
#
#   def initialize(path)
#     @path = path
#   end
#
#   def files
#     Dir.entries(path).select do |file|
#       file.end_with?("mp3")
#     end
#   end
#
#   def import
#     files.each do |file|
#       Song.create_from_filename(file)
#     end
#   end
#
# end
#
# require 'pry'
# class MusicLibraryController
#
#   attr_accessor :path
#
#   def initialize(path = "./db/mp3s")
#     @path = path
#     music_importer = MusicImporter.new(path)
#     music_importer.import
#   end
#
#   def call
#     input = ""
#     until input == "exit"
#       puts "Welcome to your music library!"
#       puts "To list all of your songs, enter 'list songs'."
#       puts "To list all of the artists in your library, enter 'list artists'."
#       puts "To list all of the genres in your library, enter 'list genres'."
#       puts "To list all of the songs by a particular artist, enter 'list artist'."
#       puts "To list all of the songs of a particular genre, enter 'list genre'."
#       puts "To play a song, enter 'play song'."
#       puts "To quit, type 'exit'."
#       puts "What would you like to do?"
#       input = gets.chomp
#
#       case input
#       when 'list songs'
#         self.list_songs
#       when 'list artists'
#         self.list_artists
#       when 'list genres'
#         self.list_genres
#       when 'list artist'
#         self.list_songs_by_artist
#       when 'list genre'
#         self.list_songs_by_genre
#       when 'play song'
#         self.play_song
#       end
#     end
#
#   end
#
#   def list_songs
#     song_sorted = Song.all.sort { |a, b| a.name <=> b.name }
#     song_sorted.each_with_index do |song, index|
#       puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
#     end
#   end
#
#   def list_artists
#     song_sorted = Artist.all.sort { |a, b| a.name <=> b.name }
#     song_sorted.each_with_index do |artist, index|
#       puts "#{index + 1}. #{artist.name}"
#     end
#   end
#
#   def list_genres
#     song_sorted = Genre.all.sort { |a, b| a.name <=> b.name }
#     song_sorted.each_with_index do |genre, index|
#       puts "#{index + 1}. #{genre.name}"
#     end
#   end
#
#   def list_songs_by_artist
#     input = ""
#     puts "Please enter the name of an artist:"
#     input = gets.chomp
#     artist = Artist.find_by_name(input)
#     #binding.pry
#     if artist != nil
#       artist_sorted = artist.songs.sort { |a, b| a.name <=> b.name }
#       artist_sorted.each_with_index do |song, index|
#         puts "#{index + 1}. #{song.name} - #{song.genre.name}"
#       end
#     end
#
#   end
#
#   def list_songs_by_genre
#     input = ""
#     puts "Please enter the name of a genre:"
#     input = gets.chomp
#     genre = Genre.find_by_name(input)
#     #binding.pry
#     if genre != nil
#       genre_sorted = genre.songs.sort { |a, b| a.name <=> b.name }
#       genre_sorted.each_with_index do |song, index|
#         puts "#{index + 1}. #{song.artist.name} - #{song.name}"
#       end
#     end
#
#   end
#
#   def play_song
#     puts "Which song number would you like to play?"
#     input = gets.chomp.to_i
#     songs = Song.all
#
#     if (1..songs.length).include?(input)
#       song = Song.all.sort{ |a, b| a.name <=> b.name }[input - 1]
#     end
#     # binding.pry
#
#     puts "Playing #{song.name} by #{song.artist.name}" if song
#   end
#
#
# end
#
# class Song
#   attr_accessor :name
#   attr_reader :artist, :genre
#   @@all = []
#
#   def initialize(name,artist = nil,genre = nil)
#     @name = name
#     #@artist = artist
#     self.artist=(artist) unless artist == nil
#     self.genre=(genre) unless genre == nil
#     #@genre = genre
#   end
#
#   def self.all
#     @@all
#   end
#
#   def artist=(artist)
#     @artist = artist
#     artist.add_song(self)
#
#   end
#
#   def genre=(genre)
#     @genre = genre
#     if genre.songs.include?(self) == false
#       genre.songs << self
#     end
#   end
#
#   def self.destroy_all
#     @@all.clear
#   end
#
#   def save
#     @@all << self
#   end
#
#   def self.create(name)
#     song = Song.new(name)
#     @@all << song
#     song
#   end
#
#   def self.find_by_name(name)
#     all.find do |song|
#       song.name == name
#     end
#   end
#
#   def self.find_or_create_by_name(name)
#     find_by_name(name) || create(name)
#   end
#
#   def self.new_from_filename(filename)
#     song = Song.new(filename)
#     song.name = filename.split(" - ")[1]
#     #title = filename.split(" - ")[1]
#     artist = filename.split(" - ")[0]
#     genre = filename.split(" - ")[2].chomp(".mp3")
#     song.artist = Artist.find_or_create_by_name(artist)
#     song.genre = Genre.find_or_create_by_name(genre)
#     song
#   end
#
#   def self.create_from_filename(filename)
#     song = new_from_filename(filename)
#     @@all << song
#
#   end
#
# end

# module Concerns
#   module Findable
#     def create(name)
#       song = Song.new(name)
#       @@all << song
#       song
#     end
#
#     def find_by_name(name)
#       self.all.find do |song|
#         song.name == name
#       end
#     end
#
#     def find_or_create_by_name(name)
#       find_by_name(name) || create(name)
#     end
#   end
#
# end
