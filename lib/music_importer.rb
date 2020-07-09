require 'pry'

class MusicImporter

  extend Concerns::Findable
  include Concerns::Findable
  extend Concerns

attr_accessor :path

def initialize(path)

@path = path
@files = []

end



def files
  Dir.each_child(@path) { |filename|
if filename[-4..-1] == ".mp3"
   @files << filename
 end
  }
  return @files
end

def import
  self.files
  @files.each {|filename|
    Song.create_from_filename(filename)
  }
end






end
