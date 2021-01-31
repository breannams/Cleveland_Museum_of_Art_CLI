class Cli

    def run
        puts "Hello, and welcome to Cleveland Museum of Arts!"
        Cleveland_Museum_of_Art_CLI = Api.new()
        
        puts "Please select from the following search options:"
        puts "Search for a work of art by artist name:"
        puts "Search for a work of art by artwork title:"
        puts "Search for a work of art by art medium:"
       # puts "For list of art mediums enter M."
       # *prints list of art mediums*
        
        puts "Search for works of art currently on view at CMA:"
        puts "Search for artwork by Departments:"
       # puts "For list of art Departments enter D:"
       # *prints list of art departments*
       input = nil
       while input != "exit"
        input = gets.strip.downcase
        

    end

end


#needs a goodbye statement