require 'bundler'

require_relative '../lib/concerns/findable.rb'
require_relative '../lib/artist_basics.rb'
require_relative '../lib/genre_basics.rb'
require_relative '../lib/song_basics.rb'

Bundler.require

module Concerns
end

require_all 'lib'
