 require "pry"
class Artwork
    attr_accessor :creator_bio, :fun_fact
    attr_reader :title, :series, :creation_date, :creators, :culture, :department, :type
 ##private methods for attr_readers
    @@all = []
    
     def initialize(hash)
         hash.each do |k, v|
          self.send("#{k}=", v)
        end

         @@all << self
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

      def series=(series)
        @series = series
      end

      def creation_date= (creation_date)
        @creation_date = creation_date
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

 end
# binding.pry
 
 #can't use .send on attr_readers :(