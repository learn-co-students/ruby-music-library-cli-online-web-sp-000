# learn spec/001_song_basics_spec.rb
# learn spec/002_artist_basics_spec.rb
# learn spec/008_findable_module_spec.rb
# learn spec/009_music_importer_spec.rb

require 'bundler'
Bundler.require

module Concerns
  module Findable
    def find_by_name(name)
      all.detect do |s|
        s.name == name
      end
    end
    
    def find_or_create_by_name(name)
      find_by_name(name) || create(name)
    end
  end
end

require_all 'lib'

