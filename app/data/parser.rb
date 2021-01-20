require 'smarter_csv'
require 'rest-client' 
require 'json'


api_key = "l7yuhjl"
        response_string = RestClient.get("strainapi.evanbusse.com/#{api_key}/strains/search/all")
        parsed_arr = JSON.parse(response_string)
        list_of_strains = parsed_arr.keys


terpene_data = SmarterCSV.process(Rails.root.join('controllers/data/results.csv'))



match_list = []
binding.pry

match_list = terpene_data.select{|strain| list_of_strains.to_enum.include?(strain[:sample_name])}