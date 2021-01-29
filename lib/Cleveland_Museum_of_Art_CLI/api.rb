##cares about getting requests and sending/formating them for artwork class
##in art the label("Aggregated information about the artwork.") for the artwork is called a tombstone :)
require "httparty"
require_relative "./artwork"
# tombstone = HTTParty.get("https://openaccess-api.clevelandart.org/api/artworks/")
# puts tombstone["data"].first
  
class Api  

    def get_artwork
           url = "https://openaccess-api.clevelandart.org/api/artworks/"
           tombstone = HTTParty.get(url)
         artworks_hash = {
            title: tombstone["data"].first["title"],
            series: tombstone["data"].first["series"],
            creation_date: tombstone["data"].first["creation_date"],
            creators: tombstone["data"].first["creators"].first["description"],
            creator_bio: tombstone["data"].first["creators"].first["biography"],
            culture: tombstone["data"].first["culture"],
            department: tombstone["data"].first["department"],
            type: tombstone["data"].first["type"],
            fun_fact: tombstone["data"].first["fun_fact"],
            wall_description: tombstone["data"].first["wall_description"]
      }
     artwork = Artwork.new(artworks_hash)
    end

end

##available keys from url hash = info, data
## data = a hash and seems like it has all the info we need!! yay!!
## data.first.keys returns a buncha keys, want to use just these for this app i think !!!::

## title
## series
## creation_date
## creators ----> ALSO HAS A BIOGRAPHY??!
## culture
## department
## fun_fact
## digital_description
## wall_description
## type
##maybe add in opening and closing dates for a search? maybe.

## using data["info"] outputs : {"total"=>63616, "parameters"=>{}} ?? not sure what this is for??


##if using several different URLs make search_by_blah a class method. 