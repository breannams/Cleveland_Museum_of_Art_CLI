##cares about getting requests and sending/formating them for artwork class
##in art the label("Aggregated information about the artwork.") for the artwork is called a tombstone :)
require "httparty"
require_relative "./artwork"
# require "pry"
  # tombstone = HTTParty.get("https://openaccess-api.clevelandart.org/api/artworks/")
  # puts tombstone["data"].first.keys
  
class Api  

    def get_artwork
          url = "https://openaccess-api.clevelandart.org/api/artworks/"
          tombstone = HTTParty.get(url)
          # tombstone.each do |h,v|
          #    ##get access to title,series, etc. in a hash
          #   end
          artworks_hash = {
            title: tombstone["data"].first["title"],
            series: tombstone["data"].first["series"],
            creators: tombstone["data"].first["creators"].first["description"],
            creator_bio: tombstone["data"].first["creators"].first["biography"],
            culture: tombstone["data"].first["culture"],
            department: tombstone["data"].first["department"],
            type: tombstone["data"].first["type"],
            fun_fact: tombstone["data"].first["fun_fact"],
        
      }
     artwork = Artwork.new(artworks_hash)
    
     puts Artwork.all
    end


end



 api = Api.new
 api.get_artwork

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
