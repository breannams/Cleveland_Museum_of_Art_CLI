
class Cli

    ##TO DO!!: get the stupid creator method to search things >:(
    
    ##To Do: Why will search by title not work on its own??
    ##To do... figure out why this has broken my mediums and departments list :(
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

    def search_by_creator_name
        puts "Please enter the name of the creator:"
        input = gets.strip
        c = Artwork.find_by_creator(input)
        if c != nil
            puts "Artwork title: #{c.title}."
            puts "If you would like more information about a specific piece of artwork enter 'artwork', if you would like more information on the creator enter 'bio', or to return to the main menu enter 'menu'."
            input2 = gets.strip.downcase
            if input2 == "bio"
                puts "Creator bio: #{c.creator_bio}"
            elsif input2 == "artwork"
                search_by_title
            elsif input2 == "menu"
                run
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
           # art.each do |test|
           # puts "Description: #{art.tombstone_description}, Fun fact! #{art.fun_fact}"
            puts "If you would like to search for another artwork by title enter 'yes', or enter 'menu' to return to the main menu."
                input2 = gets.strip.downcase
                if input2 == 'menu'
                    run
                elsif input2 == 'yes'
                search_by_title
              #  end
                elsif art == nil
                    puts "I'm sorry, we do not have more detailed information about this artwork at this time."
                    search_by_title
            end
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

    def search_by_department
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
        dept = Artwork.all.collect{|artwork| artwork.department}.uniq.sort.each {|d| puts "#{d}"}
        run
     
    end

    def list_of_mediums
        medium = Artwork.all.collect{|artwork| artwork.type}.uniq.sort.each {|m| puts "#{m}"}
        run
    end
    
    def extra_search
        puts "If you would like more information about a piece of artwork enter 'yes', or to return to the main menu enter 'menu'."
        input = gets.strip.downcase
        if input == "yes"
            search_by_title
        elsif input == "menu"
            run
        end
    end

    def error
        puts "I'm not sure what you entered, please check your spelling and try again."
    end
end
