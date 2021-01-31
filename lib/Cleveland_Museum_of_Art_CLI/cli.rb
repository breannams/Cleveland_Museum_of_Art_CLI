class Cli

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
        # *prints list of art mediums*
            
            puts "To search for artwork by Departments, enter 'department'"
            puts "For a list of art Departments enter 'd'"
        # *prints list of art departments*
            puts "Or type 'exit' to finish your search."
            
        while input != "exit"
            input = gets.strip.downcase
        end
    end
end


#needs a goodbye statement