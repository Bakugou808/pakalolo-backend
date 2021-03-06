class Strain < ApplicationRecord
    has_many :collections 
    serialize :cannabinoidList
    serialize :terpeneList
    serialize :effects
    has_many :comments, as: :commentable 
    has_many :likes, as: :likeable 

    def self.list_of_strain_names
        api_key = ENV['KEY']
        response_string = RestClient.get("strainapi.evanbusse.com/#{api_key}/strains/search/all")
        parsed_arr = JSON.parse(response_string)
        list_of_strains = parsed_arr.keys
        # hash_of_name_groups = list_of_strains.group_by { |name| name[0] } 
    end 

end
