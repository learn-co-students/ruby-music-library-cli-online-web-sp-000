require 'bundler'
require_relative "../lib/Artist.rb"
require_relative "../lib/Genre.rb"
require_relative "../lib/Song.rb"
require_relative "../lib/concerns/modules.rb"
require_relative "../bin/MusicLibraryController.rb"

Bundler.require

require_all 'lib'
