require 'smarter_csv'
require 'rest-client' 
require 'json'
# require_relative 'sclabs_results.csv'

# def parse_n_compare
#     terpene_data = SmarterCSV.process( '/sclabs_results.csv' )

#     strain_names = Strain.list_of_strain_names
    
#     byebug 
    
#     match_list = []

#     terpene_data.select{|strain| strain_names.to_enum.include?(strain[:sample_name])}
# end 

api_key = "l7yuhjl"
        response_string = RestClient.get("strainapi.evanbusse.com/#{api_key}/strains/search/all")
        parsed_arr = JSON.parse(response_string)
        list_of_strains = parsed_arr.keys


terpene_data = SmarterCSV.process('app/results.csv')



match_list = []
binding.pry

match_list = terpene_data.select{|strain| list_of_strains.to_enum.include?(strain[:sample_name])}