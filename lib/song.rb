require "pry"

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
    song=self.new
    self.all << song
    song
  end

  def self.create_by_name(name)
    song=self.create
    song.name=name
    song
  end


  def self.new_by_name(name)
    song=self.new
    song.name=name
    song
  end


  def self.find_by_name(name)
    self.all.find {|i| i.name==name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)!=nil
      return self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by{|i| i.name}
  end

  def self.new_from_filename(string)
    song=self.new
    arr=string.split("-")
    song.name=(arr[1]).chomp(".mp3").strip
    song.artist_name=(arr[0]).strip
    song
  end

  def self.create_from_filename(string)
    song=self.new_from_filename(string)
    song.save
  end

  def self.destroy_all
    self.all.clear
  end

end
