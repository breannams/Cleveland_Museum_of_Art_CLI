
require "httparty"
require_relative "./artwork"
# require "pry"
  # tombstone = HTTParty.get("https://openaccess-api.clevelandart.org/api/artworks/")
  # puts tombstone["data"].first.keys
  
class Api  

    def get_artwork
          url = "https://openaccess-api.clevelandart.org/api/artworks/"
          tombstone = HTTParty.get(url)
            tombstone["data"].each do |art|
              artwork_hash = {
                title: art["title"],
                series: art["series"],
                creators: art["description"],
                creator_bio: art["biography"],
                culture: art["culture"],
                department: art["department"],
                type: art["type"],
                fun_fact: art["fun_fact"]
              }
              Artwork.new(artwork_hash)
            end
    
    end

end



 api = Api.new
 api.get_artwork

