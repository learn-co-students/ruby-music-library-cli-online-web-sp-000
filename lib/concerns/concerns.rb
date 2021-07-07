module Concerns
  module Findable

    def find_by_name(song)
      self.all.detect {|x| x if x.name == song}
    end

    def find_or_create_by_name(song)
      self.find_by_name(song) || self.create(song)
    end
  end

  module Meth

    def files
      Dir.entries(path).select{|a| a.match(/mp3/)}
    end

    def import
      files.each {|x| Song.create_from_filename(x)}
    end

  end
end
