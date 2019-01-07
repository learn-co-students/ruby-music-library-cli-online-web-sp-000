class MusicImporter
attr_accessor :path

def initialize(path)
  self.path = path
end

def files
  Dir["#{self.path}/*"].collect do |filename|
    filename.slice! "#{self.path}/"
    filename
  end
end

def import
  self.files.each do |filename|
    Song.create_from_filename(filename)
  end
end

end
