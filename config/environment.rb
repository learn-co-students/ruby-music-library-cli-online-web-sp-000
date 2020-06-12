require 'bundler'
require_relative "../lib/Artist.rb"
require_relative "../lib/Genre.rb"
require_relative "../lib/Song.rb"
require_relative "../lib/concerns/modules.rb"
require_relative "../lib/MusicImporter.rb"
require_relative "../lib/MusicLibraryController.rb"

Bundler.require

require_all 'lib'
