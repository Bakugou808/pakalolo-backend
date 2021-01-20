# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
cannabinoidList = "DELTA_9 THC_A,DELTA_9_THC_A,DELTA_9_THC,DELTA_8_THC,DELTA_8 THC,THC_A,THCV,CBN,CBD_A,CBD,CBDV,CBDV_A,DELTA_9 CBG_A,DELTA_9_CBG_A,DELTA_9 CBG,DELTA_9_CBG,CBC"
cannabinoidList = cannabinoidList.split(',')
terpeneList = "Cis_Nerolidol,Trans_Nerolidol,Trans_Nerolidol 1,Trans_Nerolidol 2,Trans_Ocimene,3_Carene,Camphene,Caryophyllene Oxide,Eucalyptol,Geraniol,Guaiol,Isopulegol,Linalool,Ocimene,Terpinolene,Alpha_Bisabolol,Alpha_Humulene,Alpha_Pinene,Alpha_Terpinene,Beta_Caryophyllene,Beta_Myrcene,Beta_Ocimene,Beta_Pinene,Delta_Limonene,Gamma_Terpinene,P_Cymene"
terpeneList = terpeneList.split(',')

require_relative '../app/data/api_communications.rb'


Entry.delete_all 
User.delete_all 
Collection.delete_all 
Comment.delete_all
Strain.delete_all 
Like.delete_all 
SmokeList.delete_all 
Tag.delete_all 
Vendor.delete_all 



terpene_data = SmarterCSV.process( Rails.root.join('data/results.csv') ) #count 8905 Acquires lab results
strain_names = Strain.list_of_strain_names #count 1970 Acquires cannabis strain descriptions from API

#count 1281 - finds matching names from lab results
match_list = terpene_data.select{|strain| strain_names.to_enum.include?(strain[:sample_name]) && strain[:sample_type] == "Flower, Inhalable"} 
#count 441  - filters through matches to only select flower results
# flower_list = match_list.select{|strain| strain[:sample_type] == "Flower, Inhalable" } 
#strains_to_add 
added_strains = match_list.map{|lab| lab[:sample_name] }.uniq



# fill in strains table
added_strains.each do |strain|
    strain_info = ApiCommunications.new
    id = strain_info.get_id(strain)
     
    terp = {}
    cannabinoids = {}
    match_list.each do |sample|
        if sample[:sample_name] == strain 
            sample.map do|key, value| 
                cannabinoidList.include?(key.to_s.upcase) && value > 0.00 ? cannabinoids[key] = value : 0
                terpeneList.include?(key.to_s.titleize) && value > 0.0000 ? terp[key] = value : 0 
                
            end
        end 
    end
    if !Strain.find_by(name: strain)
        Strain.create(name: strain, description: strain_info.get_desc(id), flavorList: strain_info.get_flavors(id), genus: strain_info.get_genus(strain), effects: strain_info.get_effects(id), terpeneList: terp, cannabinoidList: cannabinoids)
    end 
    
end 


