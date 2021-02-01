 require "pry"
class Artwork
    
    attr_accessor :creator_bio, :fun_fact
    attr_reader :title, :creators, :department, :type, :tombstone_description

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

     def self.find_by_title(title)
      @@all.find {|t| t.title == title}
     end
  
     def self.find_by_medium(type)
      @@all.find {|m| m.type == type}
     end

     def self.find_by_creator(creators)
      @@all.find {|c| c.creators == creators}
     end

     def self.find_by_department(department)
      @@all.find {|d| d.department == department}
     end

      private
      
      def title=(title)
        @title = title
      end


      def creators= (creators)
          @creators = creators
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

 