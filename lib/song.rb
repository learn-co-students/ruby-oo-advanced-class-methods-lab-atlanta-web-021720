require 'pry'
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
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    song.save
    song
  end

  def self.find_by_name(name)
    song = self.all.select do |song|
      song.name == name
    end
    song[0]
  end

  def self.find_or_create_by_name(name)
    song = self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    songs = self.all
    song_names = songs.map do |song| 
      song.name
    end
    song_names = song_names.sort
    sorted_songs = []
    song_names.each do |name|
      sorted_songs << self.find_by_name(name)
    end
    sorted_songs
  end

  def self.new_from_filename(mp3)
    detail_arr = mp3.split(" - ")
    name = detail_arr[1].sub(".mp3", "")
    song = self.new_by_name(name)
    song.artist_name = detail_arr[0]
    song
  end

  def self.create_from_filename(mp3)
    song = self.new_from_filename(mp3)
    song.save
  end

  def self.destroy_all
    @@all.clear
  end

#binding.pry

end
