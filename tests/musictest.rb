require_relative '../config/environment.rb'
require_relative '../lib/musiclibrarycontroller.rb'

mlc = MusicLibraryController.new("./spec/fixtures/mp3s")
mlc.call
