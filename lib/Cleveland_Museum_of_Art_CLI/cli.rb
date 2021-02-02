
class Cli


    ##To do. FIgure out why title is all of a suddent not outputting "Sorry we blah" when the artwork title doesn't have a tombstone or funfact
    ##Searches wont raise errors when typing random jargon like "dkfjdljfd" into search field :(
        ##artwork not outputting description when searched by full name? but if searched by first word will return desc?? Ex. The Grand Canyon gives nothing. but Grand gives the description wtf.

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
            else
                error
            end
        
        end
        
    end

    def instructions
        puts "-----------------------------------------------"
        puts "Hello, and welcome to Cleveland Museum of Arts!".colorize(:light_magenta)
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
        puts "-------------------------------------"
        puts "Please enter the name of the creator, or enter 'menu' to return to the last search option.:".colorize(:green)
        puts "-------------------------------------"
        input = gets.strip.capitalize
        c = Artwork.find_by_creator(input)
        if c != nil
            
            puts "If you would like more information about a piece of artwork enter 'yes', or to return to the main menu enter 'menu'.".colorize(:green)
            
            extra_search
        else
                error
                search_by_creator_name
       
        end
    end

    def search_by_title
        puts "--------------------------------------------------------------------------------------------"
        puts "Please enter the title of the artwork, or enter 'menu' to return to the last search option.:".colorize(:blue)
        puts "--------------------------------------------------------------------------------------------"
        input = gets.strip.capitalize
        art = Artwork.find_by_title(input)
        if art != nil 
            puts "If you would like more information about the creator(s), please enter 'bio', to search for another piece of art enter 'artwork', or to return to the main menu enter 'menu'.".colorize(:blue)
            input2 = gets.strip.downcase
            if input2 == 'bio'
                art.each do |x|
                    if x.creators && x.creator_bio != nil
                        puts "- #{x.creators} Biography: #{x.creator_bio}.".colorize(:light_green)
                        
                    else x.creators || x.creator_bio == nil
                        puts "I'm sorry, we currently do not have more information on #{x.creators}.".colorize(:background => :red)  
                            search_by_title
                    end
                end
            elsif input2 == "artwork"
           search_by_title
            end
        elsif art == nil
            error
            search_by_title
        end
     end

 
    def search_by_medium
    puts "--------------------------------"
    puts "Please enter the type of medium, or enter 'menu' to return to the last search option.:".colorize(:light_cyan)
    puts "--------------------------------"
     input = gets.strip.capitalize
        medium = Artwork.find_by_medium(input)
        if medium != nil
            puts "If you would like more information about a piece of artwork enter 'yes', or to return to the main menu enter 'menu'.".colorize(:light_cyan)
            extra_search
        else   
            error
            search_by_medium
        end
    end

    def search_by_department    ##works for now until something else breaks it.
        puts "---------------------------------"
        puts "Please enter the department name, or enter 'menu' to return to the last search option.:".colorize(:light_blue)
        puts "---------------------------------"
        input = gets.strip.capitalize
        dept = Artwork.find_by_department(input)
        if dept != nil
            puts "If you would like more information about a piece of artwork enter 'yes', or to return to the main menu enter 'menu'.".colorize(:light_blue)
            extra_search
        else
        error
        search_by_department
        end
    end

    def list_of_departments ##works!!
        Artwork.all.collect{|artwork| artwork.department}.uniq.sort.each {|d| puts "- #{d}"}.colorize(:magenta)
    end

    def list_of_mediums ##Works!
        Artwork.all.collect{|artwork| artwork.type}.uniq.sort.each {|m| puts "- #{m}"}.colorize(:yellow)
    end
    
    def extra_search
       
        input = gets.strip.downcase
        if input == "yes"
            search_by_title
        elsif input == "menu"
            
        end
    end

    def error ##things aren't raising errors when misspelled. UGH
        puts "I'm sorry, that was not a valid entry. Please check your spelling and try again.".colorize(:background => :red)
    end
end
