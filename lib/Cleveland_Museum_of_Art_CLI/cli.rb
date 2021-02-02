
class Cli

 
    ##To do... figure out how to return only ONE creator_bio if the first search returns multiple artowrks from the same guy (ex. GUSTAVEEE!!!!)
    ##if creator does not have a bio needs to not return for a bio otherwise it will just output : "-Creator bio:" with nothing. & add a "Sorry we do not have a bio for this creator right now."thing
    ##To do. FIgure out why title is all of a suddent not outputting "Sorry we blah" when the artwork title doesn't have a tombstone or funfact
    ##Searches wont raise errors when typing random jargon like "dkfjdljfd" into search field :(
        ##artwork not outputting description when searched by full name? but if searched by first work will return desc?? Ex. The Grand Canyon gives nothing. but Grand gives the description wtf.

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
        puts "-------------------------------------"
        puts "Please enter the name of the creator:"
        puts "-------------------------------------"
        input = gets.strip.capitalize
        c = Artwork.find_by_creator(input)
        if c != nil
            puts "If you would like more information about a specific piece of artwork enter 'artwork', if you would like more information on the creator enter 'bio', or to return to the main menu enter 'menu'."
            input2 = gets.strip.downcase
            if input2 == "bio"
                c.each{|c2| puts "- Creator name: #{c2.creators}. Creator bio: #{c2.creator_bio}"}
                search_by_creator_name
            elsif input2 == "artwork"
                search_by_title
            elsif input2 == "menu"
            run
            else
                error
                search_by_creator_name
            end 
        # else
        #     error
        #     search_by_creator_name
        end
    end

    def search_by_title
        puts "--------------------------------------"
        puts "Please enter the title of the artwork:"
        puts "--------------------------------------"
        input = gets.strip.capitalize
        art = Artwork.find_by_title(input)
        if art != nil 
           extra_search
        else
            error
            search_by_title
        end
     end

 
    def search_by_medium
    puts "--------------------------------"
    puts "Please enter the type of medium:"
    puts "--------------------------------"
     input = gets.strip.capitalize
        medium = Artwork.find_by_medium(input)
        if medium != nil
            extra_search
        else   
            error
            search_by_medium
        end
    end

    def search_by_department    ##works for now until something else breaks it.
        puts "---------------------------------"
        puts "Please enter the department name:"
        puts "---------------------------------"
        input = gets.strip.capitalize
        dept = Artwork.find_by_department(input)
        if dept != nil
            extra_search
        else
        error
        search_by_department
        end
    end

    def list_of_departments ##works!!
        Artwork.all.collect{|artwork| artwork.department}.uniq.sort.each {|d| puts "- #{d}"}
    end

    def list_of_mediums ##Works!
        Artwork.all.collect{|artwork| artwork.type}.uniq.sort.each {|m| puts "- #{m}"}
    end
    
    def extra_search
        puts "If you would like more information about a piece of artwork enter 'yes', or to return to the main menu enter 'menu'."
        input = gets.strip.downcase
        if input == "yes"
            search_by_title
        elsif input == "menu"
            
        end
    end

    def error ##things aren't raising errors when misspelled. UGH
        puts "I'm not sure what you entered, please check your spelling and try again."
    end
end
