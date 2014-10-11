module ParseJsonResponse
  #method for address details
  def self.address_details(location)
    address_hash = {}
    unless location.blank?
      address_hash["city"] =  location["city"]
      address_hash["postal_code"]=  location["postal_code"]
      address_hash["standard_address_line1"]=  location["standard_address_line1"]
      address_hash["standard_address_line2"]= location["standard_address_line2"]
      address_hash["standard_address_location"]= location["standard_address_location"]
      address_hash["usage"]=location["usage"]
      address_hash["delivery_point"]=location["delivery_point"]
      address_hash["is_receiving_mail"] = location["is_receiving_mail"]== false ? "No" : "Yes"
    end
    return address_hash
  end
end