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

end
