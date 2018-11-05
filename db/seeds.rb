# require 'rest-client'
# require 'json'
# require 'pry'

# response = RestClient.get('https://developers.zomato.com/api/v2.1/search?entity_id=280&entity_type=city&q=Grimaldi', :content_type => :json, :accept => :json, :'user-key' => "59003495a60ce448262ef01ce0c67c73")



# response = RestClient::Request.execute(
#    :method => :get,
#    :url => "https://developers.zomato.com/api/v2.1/search?entity_id=280&entity_type=city",
#    :headers => {"user-key" => '59003495a60ce448262ef01ce0c67c73'}
# )
#
# json_results = JSON.parse(response.body)
# json_results["restaurants"].map{|restaurant| restaurant["restaurant"]["name"]}



# i = 5
#
# while i < 2000
#   start = i * 20
#   response = RestClient::Request.execute(
#      :method => :get,
#      :url => "https://developers.zomato.com/api/v2.1/search?entity_id=280&entity_type=city&start=#{start}",
#      :headers => {"user-key" => '59003495a60ce448262ef01ce0c67c73'}
#   )
#   json_results = JSON.parse(response.body)
#   names = json_results["restaurants"].map{|restaurant| restaurant["restaurant"]["name"]}
#   names.each {|name| Restaurant.create(name: name)}
#
#   i += 1
# end
