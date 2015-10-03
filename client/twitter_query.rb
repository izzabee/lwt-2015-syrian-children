class TwitterQuery

	def initialize
		@client = Twitter::REST::Client.new do |config|
			config.consumer_key        = ENV['consumer_key']
			config.consumer_secret     = ENV['consumer_secret']
			config.access_token        = ENV['access_token']
			config.access_token_secret = ENV['access_secret']
		end
		@statuses = []
	end

	def fetch_tweets(q, options = {}, max)
		max.times do
			results = @client.search(q, options)
			hash = results.to_h
			@statuses.push(*hash[:statuses])
		end
		
	end

	def statuses
		@statuses	
	end

	def filter_tweets(regex)
		statuses.select { |tweet| tweet[:user][:location].downcase.include?(regex) }
	end
end

# client = TwitterQuery.new
# client.fetch_tweets('', {geocode: '35.1697496,33.436982,100mi'}, 5)
# client.fetch_tweets('#plasticboats', {geocode: '41.0136,28.955,100mi'}, 30)


 
# hash = results.to_h
# statuses = hash[:statuses]
# filtered = statuses.select { |tweet| tweet[:user][:location] == 'Syria' }
# filtered = statuses.sort_by { |tweet| tweet[:user][:location] }
# filtered = 

# locations = statuses.map{ |tweet| tweet[:user][:location] }
# client.fetch_tweets('', {geocode: '35.1697496,33.436982,100mi', until_id: statuses.last[:id]})
# results = client.fetch_tweets('', {geocode: '35.1697496,33.436982,100mi'})
# hash = results.to_h
# new_statuses = hash[:statuses]





# lat: , long: , radius:

# ALEPPO:
# 36.2064346,37.1485851

# CYPURS
# 35.1697496,33.436982, 100 mi

