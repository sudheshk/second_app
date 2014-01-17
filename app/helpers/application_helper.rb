require 'httparty'

module ApplicationHelper

	def get_address (lattitude, longitude)

		response =  HTTParty.get ('http://maps.googleapis.com/maps/api/geocode/json?latlng='.to_s + lattitude +','+ longitude + '&sensor=false')
		#return "http://maps.googleapis.com/maps/api/geocode/json?latlng=15,12&sensor=true" 
		return response["results"][0]["formatted_address"]
	end
	
	def sudhesh  (numb)

		return "sudhesh" + numb.to_s
	end

end
