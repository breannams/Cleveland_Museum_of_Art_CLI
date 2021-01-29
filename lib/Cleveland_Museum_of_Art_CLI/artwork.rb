class Artwork
    attr_accessor :creator_bio, :fun_fact, :wall_description, :tombstone_description
    attr_reader :title, :series, :creation_date, :creators, :culture, :department, :type
 
    @@all = []
    
     def initialize(hash)
         hash.each do |k, v|
             @k = v
         end
         @@all << self
     end
 
     def save
       @@all << self
     end
 
     def self.all
       @@all
     end
 
  end
 
 puts Artwork.all
 
 #can't use .send on attr_readers :(