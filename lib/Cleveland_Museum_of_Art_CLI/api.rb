class Api  

    def get_artwork
          tombstone = HTTParty.get("https://openaccess-api.clevelandart.org/api/artworks/")
            tombstone["data"].each do |art|
              artwork_hash = {
                title: art["title"],
                creators: art["creators"].first ? art["creators"].first["description"] : "",
                creator_bio:  art["creators"].first ? art["creators"].first["biography"] : "", 
                department: art["department"],
                type: art["type"],
                fun_fact: art["fun_fact"],
                tombstone_description: art["tombstone"]
            
              }
              
             Artwork.new(artwork_hash)
            end
    end
end


 api = Api.new
 api.get_artwork

 