API_KEY = "6b5a968507f728b72bac005321001c28"
require "api_response"
require "parse_json_response"

class FindPersonsController < ApplicationController
  def index
    if request.post?
      @results = Hash.new
      api_response = find_person(API_KEY,params['first_name'],params['last_name'],params['where'])
      @results["error"] = api_response["error"]["message"] if api_response["error"]
      unless api_response["results"].blank?
        person_obj = Person.new(api_response)
        @results["result"] = person_obj.formatted_result
      end
    end
  end

  def find_person(api_key,first_name,last_name,address)
    response = ApiResponse.new(API_KEY,params['first_name'],params['last_name'],params['where'])
    response.get_api_response
  end
end
