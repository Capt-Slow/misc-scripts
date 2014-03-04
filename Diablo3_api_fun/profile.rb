require 'rubygems'
require 'rest_client'
require 'json'
require 'pp'
require 'date'


#XxElDiabloxX-1104/

battle_tag_name = ARGV[0]
battle_tag_code = ARGV[1]

api_host = 'https://us.battle.net'


  def profile_call(host, name, code)
    resource = RestClient::Resource.new "#{host}/api/d3/profile/#{name}-#{code}/"
    puts resource
    @response = resource.get
    puts @response
  end

profile_call(api_host, battle_tag_name, battle_tag_code)

  def parse_profile_response
    @response_json = JSON.parse(@response)
  end

parse_profile_response

  def get_character_info
    get_name_array = @response_json['heroes'].size
    get_name_array.times do |name_i|
    c_name = @response_json['heroes'][name_i]['name']
    cl_type = @response_json['heroes'][name_i]['class']
    c_level = @response_json['heroes'][name_i]['level']
    c_update = @response_json['heroes'][name_i]['last-updated']
    #puts @response_json
    get_proper_date = DateTime.strptime(c_update.to_s, '%s')
    puts "Name: #{c_name}"
    puts "Class: #{cl_type}"
    puts "Level: #{c_level}"
    puts "Last Updated: #{get_proper_date}"
    puts '-----------------------'
    end
    puts "Last Hero Played:"

  end

get_character_info


