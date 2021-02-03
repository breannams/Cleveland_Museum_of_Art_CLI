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
       @@all.find_all{|t| t.title.downcase.include?(input.downcase)}.each do|t2|
          if t2.tombstone_description != nil && t2.fun_fact != nil &&  !t2.tombstone_description.empty? && !t2.fun_fact.empty?
            puts Rainbow("- Title: #{t2.title}. Description: #{t2.tombstone_description}. Fun fact! #{t2.fun_fact}").wheat
            puts Rainbow("********").pink
          else 
            puts Rainbow("I'm sorry, we do not have more detailed information about #{t2.title} at this time.").palevioletred.bright.underline
          end
       end
     end
  
     def self.find_by_medium(input)
      @@all.find_all{|m| m.type.downcase.include?(input.downcase)}.each do|m2| 
        puts Rainbow("- Artwork title: #{m2.title}.").wheat
        puts Rainbow("****************").pink
      end
     end

     def self.find_by_creator(input)
      @@all.select{|c| c.creators.downcase.include?(input.downcase)}.each do |c2| 
        puts Rainbow("- Creator: #{c2.creators}. Artwork title: #{c2.title}.").wheat
        puts Rainbow("**********").pink
      end
     end

     def self.find_by_department(input)
      @@all.find_all{|d| d.department.downcase.include?(input.downcase)}.each do|d2| 
        puts Rainbow("- Department: #{d2.department}. Artwork title: #{d2.title}.").wheat
        puts Rainbow("*************").pink
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