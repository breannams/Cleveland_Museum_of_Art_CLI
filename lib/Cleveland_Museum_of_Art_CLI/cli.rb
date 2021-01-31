class Cli


    ##TO DO!!!: make the list of departments and mediums output only once per type.
    ##TO DO!!: figure out how to incorporate colorize :)
    def run
        puts "-----------------------------------------------"
        puts "Hello, and welcome to Cleveland Museum of Arts!"
        puts "-----------------------------------------------"
        cleveland_museum_of_art_CLI = Api.new()
        input = nil
            puts "Please select from the following search options:"
            puts "To search for a work of art by creator name, enter 'name'"
            puts "To search for a work of art by artwork title, enter 'title'"
            puts "To search for a work of art by art medium, enter 'type'"
            puts "For list of art mediums enter 'm'"
            puts "To search for artwork by Departments, enter 'department'"
            puts "For a list of art Departments enter 'd'"
            puts "Or type 'exit' to finish your search."
            
        while input != "exit"
            input = gets.strip.downcase

            if input == "name"
                search_by_creator_name
            
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

    # def search_by_creator_name
        #puts "Please enter the name of the artist:"
    # end

    def search_by_title
        puts "Please enter the title of the artwork:"
        input = gets.strip
        
        if Artwork.find_by_title(input)
          Artwork.all.sort {|a,b| a.title <=> b.title}.each_with_index {|t, i| puts "#{i + 1}. #{t.title}. Description: #{t.tombstone_description}, Fun fact! #{t.fun_fact}"}
        else
            puts "I'm not sure what you entered, please try again."
            search_by_title
        end
     end

   
    def search_by_medium
     puts "Please enter the type of medium:"
     input = gets.strip
        if  Artwork.find_by_medium(input)
            Artwork.all.sort {|a,b| a.title <=> b.title}.each_with_index {|m, i| puts "#{i + 1}. #{m.title}"}
        puts "Would you like more information about a particular artwork? y/n"
            input2 = gets.strip.downcase
            if input2 == "y"
                search_by_title
            else
                run
            end
        else   
            puts "I'm not sure what you entered, please try again."
                search_by_medium
            
        end
    end

    # def search_by_department
    #puts "Please enter the department"
    #input = gets.strip.downcase
    #puts "I'm not sure what you entered, please try again."
    #search_by_department
    # end

    def list_of_departments
        dept = Artwork.all.sort{|a,b| a.department <=> b.department}.each {|d| puts "#{d.department}"}
        run
     ##need to figure out how to only return uniq. otherwise it returns everyyy dept for eveeerrryy artwork in API.
    end

    def list_of_mediums
        medium = Artwork.all.sort{|a,b| a.type <=> b.type}.each {|m| puts "#{m.type}"}
        run
    end
end
