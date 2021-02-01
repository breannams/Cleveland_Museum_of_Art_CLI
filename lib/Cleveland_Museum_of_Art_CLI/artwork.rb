 require "pry"
class Artwork
    
    attr_accessor :creator_bio, :fun_fact
    attr_reader :title, :creators, :department, :type, :description, :tombstone_description

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

     def self.find_by_title(input)
       @@all.find_all{|t| t.title == input}.each do|t2|
          if t2.tombstone_description || t2.fun_fact != nil
          puts "Description: #{t2.tombstone_description}. Fun fact! #{t2.fun_fact}"
          else
            puts "I'm sorry, we do not have more detailed information about this piece of artwork at this time."
          end
       end
     end
  
     def self.find_by_medium(input)
      @@all.find_all{|m| m.type == input}.each{|m2| puts "Artwork title: #{m2.title}"}
      
     end

     def self.find_by_creator(input)
      @@all.select{|c| c.creators.include?(input)}.each{|c2| puts "Artwork title: #{c2.title}"}
     end

     def self.find_by_department(input)
      @@all.find_all{|d| d.department == input}.each{|d2| puts "Artwork title: #{d2.title}"}
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

 # @@all.find_all{|t| t.title == input}.each{|t2| puts "Description: #{t2.tombstone_description}. Fun fact! #{t2.fun_fact}"}