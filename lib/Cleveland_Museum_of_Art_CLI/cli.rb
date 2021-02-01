
class Cli

 
    ##To do... figure out why creator_bio isn't working.
    ##To do. FIgure out why title is all of a suddent not outputting "Sorry we blah" when the artwork title doesn't have a tombstone or funfact
    ##Searches wont raise errors when typing random jargon like "dkfjdljfd" into search field :(
    def run
       
        cleveland_museum_of_art_CLI = Api.new()
        input = nil

        while input != "exit"
        instructions
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
                break
            end
        
        end
        
    end

    def instructions
        puts "-----------------------------------------------"
        puts "Hello, and welcome to Cleveland Museum of Arts!"
        puts "-----------------------------------------------"
        puts "Please select from the following search options:"
        puts "To search for a work of art by creator name, enter 'name'"
        puts "To search for a work of art by artwork title, enter 'title'"
        puts "To search for a work of art by art medium, enter 'type'"
        puts "For list of art mediums enter 'm'"
        puts "To search for artwork by Departments, enter 'department'"
        puts "For a list of art Departments enter 'd'"
        puts "Or type 'exit' to finish your search."
    end

    def search_by_creator_name
        puts "Please enter the name of the creator:"
        input = gets.strip
        c = Artwork.find_by_creator(input)
        if c != nil
            puts "If you would like more information about a specific piece of artwork enter 'artwork', if you would like more information on the creator enter 'bio', or to return to the main menu enter 'exit'."
            input2 = gets.strip.downcase
            if input2 == "bio"
                puts "Creator bio: #{c.creator_bio}"
                
            elsif input2 == "artwork"
                search_by_title
            elsif input2 == "exit"
            end
        else
            error
            search_by_creator_name
        end
    end

    def search_by_title
        puts "Please enter the title of the artwork:"
        input = gets.strip
        art = Artwork.find_by_title(input)
        if art != nil 
           extra_search
        else
            error
            search_by_title
        end
     end

 
    def search_by_medium
     puts "Please enter the type of medium:"
     input = gets.strip
        medium = Artwork.find_by_medium(input)
        if medium != nil
            extra_search
        else   
            error
            search_by_medium
        end
    end

    def search_by_department    ##works for now until something else breaks it.
        puts "Please enter the department name:"
        input = gets.strip
        dept = Artwork.find_by_department(input)
        if dept != nil
            extra_search
        else
        error
        search_by_department
        end
    end

    def list_of_departments
        Artwork.all.collect{|artwork| artwork.department}.uniq.sort.each {|d| puts "#{d}"}
        run
     
    end

    def list_of_mediums
        Artwork.all.collect{|artwork| artwork.type}.uniq.sort.each {|m| puts "#{m}"}
    end
    
    def extra_search
        puts "If you would like more information about a piece of artwork enter 'yes', or to return to the main menu enter 'exit'."
        input = gets.strip.downcase
        if input == "yes"
            search_by_title
        elsif input == "exit"
        end
    end

    def error
        puts "I'm not sure what you entered, please check your spelling and try again."
    end
end
