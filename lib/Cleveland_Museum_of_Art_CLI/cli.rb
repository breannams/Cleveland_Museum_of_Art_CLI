class Cli
    
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
            
            elsif input == "medium"
                search_by_medium
            
            elsif input == "m"
                list_of_mediums
        
            elsif input == "department"
                search_by_department

            elsif input == "d"
                list_of_departments
            elsif input == "exit"
                puts Rainbow("Thank you for visiting the museum, have a great day!").palegreen.underline
                break
            else
                error
            end
        
        end
        
    end

    def instructions
        puts Rainbow("-----------------------------------------------").mediumaquamarine
        puts Rainbow("Hello, and welcome to Cleveland Museum of Arts!").aquamarine
        puts Rainbow("-----------------------------------------------").mediumaquamarine
        puts Rainbow("Please select from the following search options:").wheat
        puts Rainbow("To search for a work of art by creator name, enter 'name'").powderblue
        puts Rainbow("To search for a work of art by artwork title, enter 'title'").aqua
        puts Rainbow("To search for a work of art by art medium, enter 'medium'").lightseagreen
        puts Rainbow("For list of art mediums enter 'm'").springgreen
        puts Rainbow("To search for artwork by departments, enter 'department'").lightgreen
        puts Rainbow("For a list of art departments enter 'd'").palegoldenrod
        puts Rainbow("Or type 'exit' to finish your search.").lemonchiffon
    end

    def search_by_creator_name
        puts Rainbow("-------------------------------------").palegreen
        puts Rainbow("Please enter the name of the creator:").lightseagreen
        puts Rainbow("-------------------------------------").palegreen

        input = gets.strip
        c = Artwork.find_by_creator(input)
        if c.any?
            extra_search
        else
            error
            search_by_creator_name
        end
    end

    def search_by_title 
        puts Rainbow("--------------------------------------").blue
        puts Rainbow("Please enter the title of the artwork:").skyblue
        puts Rainbow("--------------------------------------").blue

        input = gets.strip
        art = Artwork.find_by_title(input)
      
        if art.any?
            puts Rainbow("If you would like more information about the creator(s), please enter 'bio', to search for another piece of art enter 'artwork', or to return to the main menu enter 'menu'.").paleturquoise.underline
            input2 = gets.strip.downcase
            if input2 == 'bio'
                art.each do |x|
                    if x.creators != nil && x.creator_bio != nil && !x.creator_bio.empty? 
                        puts Rainbow("- Artwork title: #{x.title}. Creator: #{x.creators} Biography: #{x.creator_bio}.").teal
                        
                    else
                        art.each do |x2|
                        puts Rainbow("- I'm sorry, we currently do not have a creator biography for #{x2.title}.").palevioletred.underline
                        end 
                      
                    end
                end

            elsif input2 == "artwork"
                search_by_title

            end
        else 
            error
            search_by_title
        end
     end

 
    def search_by_medium 
        puts Rainbow("--------------------------------").green
        puts Rainbow("Please enter the type of medium:").lightgreen
        puts Rainbow("--------------------------------").green

        input = gets.strip
        medium = Artwork.find_by_medium(input)
        
        if medium.any?
            extra_search
        else   
            error
            search_by_medium
        end
    end

    def search_by_department  
        puts Rainbow("---------------------------------").royalblue
        puts Rainbow("Please enter the department name:").aqua
        puts Rainbow("---------------------------------").royalblue

        input = gets.strip
        dept = Artwork.find_by_department(input)
        
        if dept.any?
            extra_search
        else
            error
            search_by_department
        end
    end

    def list_of_departments 
        Artwork.all.collect{|artwork| artwork.department}.uniq.sort.each {|d| puts Rainbow("- #{d}").greenyellow}
    end

    def list_of_mediums 
        Artwork.all.collect{|artwork| artwork.type}.uniq.sort.each {|m| puts Rainbow("- #{m}").chartreuse}
    end
    
    def extra_search 
        puts Rainbow("If you would like more information about a piece of artwork enter 'yes', or to return to the main menu enter 'menu'.").darkcyan.underline
        input = gets.strip.downcase
        if input == "yes"
            search_by_title
        elsif input == "menu"
            
        end
    end

    def error 
        puts Rainbow("I'm sorry, that was not a valid entry. Please check your spelling and try again.").palevioletred.bright.underline
    end
end
