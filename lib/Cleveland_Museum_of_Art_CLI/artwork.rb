class Artwork
    
    attr_accessor :creator_bio, :fun_fact
    attr_reader :title, :creators, :department, :type, :tombstone_description

    @@all = []
    
     def initialize(hash)
         hash.each do |k, v|
          self.send("#{k}=", v)
        end
        @@all << self
     end
 
     def self.all
       @@all
     end

     def self.find_by_title(input)
       @@all.find_all{|t| t.title.include?(input)|| t.title == input}.each do|t2|
          if t2.tombstone_description && t2.fun_fact != nil
          puts "- Description: #{t2.tombstone_description}. Fun fact! #{t2.fun_fact}"
          puts " -------------"
          else t2.tombstone_description || t2.funfact == nil
          puts "I'm sorry, we do not have more detailed information about this piece of artwork at this time."
          end
       end
     end
  
     def self.find_by_medium(input)
      @@all.find_all{|m| m.type.include?(input)}.each do|m2| 
        puts "- Artwork title: #{m2.title}"
        puts "----------------"
      end
     end

     def self.find_by_creator(input)
      @@all.select{|c| c.creators.include?(input)}.each do |c2| 
        puts "- Creator: #{c2.creators}. Artwork title: #{c2.title}."
        puts "----------"
      end
     end

     def self.find_by_department(input)
      @@all.find_all{|d| d.department.include?(input)}.each do|d2| 
        puts "- Department: #{d2.department}. Artwork title: #{d2.title}."
        puts "-------------"
      end
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