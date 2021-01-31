class Cli


    ##TO DO!!!: make the list of departments and mediums output only once per type.
    ##TO DO!!: figure out how to incorporate colorize :)
    def run
        puts "Hello, and welcome to Cleveland Museum of Arts!"
        puts "-----------------------------------------------"
        cleveland_museum_of_art_CLI = Api.new()
        input = nil
            puts "Please select from the following search options:"
            puts "To search for a work of art by artist name, enter 'name'"
            puts "To search for a work of art by artwork title, enter 'title'"
            puts "To search for a work of art by art medium, enter 'type'"
            puts "For list of art mediums enter 'm'"
            puts "To search for artwork by Departments, enter 'department'"
            puts "For a list of art Departments enter 'd'"
            puts "Or type 'exit' to finish your search."
            
        while input != "exit"
            input = gets.strip.downcase

            if input == "name"
                search_by_artist_name
            
            elsif input == "title"
                search_by_title
            
            elsif input == "type"
                search_by_medium
            
            elsif input == "m"
                list_of_mediums
        
            elsif input == "department"
                search_by_department

            elsif input == "d"
                list_of_departments
            elsif input == "exit"
                puts "Thank you, have a great day!"
            end
        end
        
    end

    # def search_by_artist_name
        
    # end

    def search_by_title
        puts "Please enter the title of the artwork:"
        input = gets.strip.downcase
        if art = Artwork.find_by_title(input)
          art.title.each {|t| puts "#{t.title}, description: #{t.tombstone_description}, fun fact! #{t.fun_fact}" }
        end
     end

   
    # def search_by_medium

    # end

    # def search_by_department
    # end

    def list_of_departments
        dept = Artwork.all.sort{|a,b| a.department <=> b.department}.each {|d| puts "#{d.department}"}
        dept.uniq
     ##need to figure out how to only return uniq. otherwise it returns everyyy dept for eveeerrryy artwork in API.
    end

    def list_of_mediums
        medium = Artwork.all.sort{|a,b| a.type <=> b.type}.each {|m| puts "#{m.type}"}
    end
end
