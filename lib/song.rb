class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    song.save
    song 
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    @@all.find do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(title)
    song = self.find_by_name(title) 
    if song
      song
    else 
      self.create_by_name(title)
    end
  end

  def self.alphabetical 
    sorted = self.all.sort_by do |song|
      song.name
    end
    sorted
  end

  def self.new_from_filename(filename)
    song_array = filename.split(" - ")
    song_array[1] = song_array[1].chomp(".mp3")
    song = Song.new
    song.name = song_array[1]
    song.artist_name = song_array[0]
    song
  end

  def self.create_from_filename(filename)
      song_array = filename.split(" - ")
      song_array[1] = song_array[1].chomp(".mp3")
      song = Song.new
      song.name = song_array[1]
      song.artist_name = song_array[0]
      song.save
      song 
  end

  def self.destroy_all
    self.all.clear
  end
end 
