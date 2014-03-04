require 'webrick'
 
include WEBrick

port = 2000
root_path = "#{Dir.home}/qa-automation/reports/"

 
puts "Starting server: http://#{Socket.gethostname}:#{port}"
server = HTTPServer.new(:Port=>2000,:DocumentRoot=>root_path )
trap("INT"){ server.shutdown }
server.start
