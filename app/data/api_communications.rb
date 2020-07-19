class ApiCommunications
    
    API_KEY = "l7yuhjl"

def get_desc(id)
    
    response_string = RestClient.get("strainapi.evanbusse.com/#{API_KEY}/strains/data/desc/#{id}")
    parsed_arr = JSON.parse(response_string)
  
    if parsed_arr["desc"]
        parsed_arr["desc"]
    
    else
        "No Description"
    end 
end



  def get_id(strain_name)
    
    formatted_name = URI.escape(strain_name)
    response_string = RestClient.get("strainapi.evanbusse.com/#{API_KEY}/strains/search/name/#{formatted_name}")
    parsed_arr = JSON.parse(response_string)

    
    strain_arr = parsed_arr.select{|arr| arr["name"] == strain_name }

    strain_id = strain_arr[0]["id"] 
    strain_id
    
  end 

  def get_flavors(id)
    response_string = RestClient.get("strainapi.evanbusse.com/#{API_KEY}/strains/data/flavors/#{id}")
    parsed_arr = JSON.parse(response_string)
    
    if parsed_arr.length == 0 || parsed_arr == nil
        "No flavors" 
    else
        flavors = parsed_arr.join(' - ')
        flavors
    end 
  end 

  def get_effects(id)
    response_string = RestClient.get("strainapi.evanbusse.com/#{API_KEY}/strains/data/effects/#{id}")
    parsed_arr = JSON.parse(response_string)
   
    if parsed_arr.length == 0 || parsed_arr == nil 
        "No effects" 
    else
        # effects = "Positives - #{parsed_arr["positive"].join(" - ")} || Negatives - #{parsed_arr["negative"].join(" - ")} || Medicinal - #{parsed_arr["medical"].join(" - ")}"
        parsed_arr
    end 
  end 

  def get_genus(strain_name)

    formatted_name = URI.escape(strain_name)
    response_string = RestClient.get("strainapi.evanbusse.com/#{API_KEY}/strains/search/name/#{formatted_name}")
    parsed_arr = JSON.parse(response_string)
  
    if parsed_arr.length == 0 || parsed_arr == nil
      "No Genus" 
    else
        parsed_arr[0]["race"]
    end 
  end

end