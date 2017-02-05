Bundler.require(:default)
Dotenv.load('discourse.env')

opts = Slop.parse do |o|
  o.string '-e', '--endpoint', 'Discourse endpoint name (e.g. notifications)'
  o.string '-p', '--params', 'Discourse endpoint parameter (JSON string)'
  o.string '-u', '--username', 'Discourse API username'
end

unless opts[:endpoint]
  puts "Endpoint is required. Pass -e or --endpoint option to set it."
  exit
end

client = DiscourseApi::Client.new(ENV['DISCOURSE_API'])
client.api_key = ENV['DISCOURSE_API_KEY']
client.api_username = opts[:username] if opts[:username]

params = begin
  JSON.parse(opts[:params], symbolize_names: true) if opts[:params]
rescue JSON::ParserError
  opts[:params]
end

if params
  puts client.send(opts[:endpoint], params)
else
  puts client.send(opts[:endpoint])
end
