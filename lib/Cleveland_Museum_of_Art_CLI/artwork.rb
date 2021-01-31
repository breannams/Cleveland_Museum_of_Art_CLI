 require "pry"
class Artwork
    extend Concerns::Searchable
    attr_accessor :creator_bio, :fun_fact
    attr_reader :title, :creators, :culture, :department, :type, :tombstone_description
    
    @@all = []
    
     def initialize(hash)
         hash.each do |k, v|
          self.send("#{k}=", v)
        end
        self.save
     end
 
     def save
       @@all << self
     end
 
     def self.all
       @@all
     end

      private
      def title=(title)
      @title = title
      end


      def creators= (creators)
          @creators = creators
      end

      def culture= (culture)
        @culture = culture
      end

      def department= (department)
        @department = department
      end

      def type= (type)
        @type = type
      end
      
      def tombstone_description= (tombstone_description)
        @tombstone_description = tombstone_description
      end

 end
# binding.pry
 
 #can't use .send on attr_readers :(