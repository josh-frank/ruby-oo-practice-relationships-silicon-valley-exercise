require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
tesla = Startup.new( "Tesla", "Space Karen", "automotive" )
spacex = Startup.new( "SpaceX", "Space Karen", "spaceflight" )
doordash = Startup.new( "DoorDash", "Tony Xu", "food delivery" )
grubhub = Startup.new( "Grubhub", "Matt Maloney", "food delivery" )
opendoor = Startup.new( "Opendoor", "Keith Rabois", "real estate" )
compass = Startup.new( "Compass", "Ori Allon", "real estate" )

oak = VentureCapitalist.new( "Oak Investment Partners", 8400000000.0 )
sequoia = VentureCapitalist.new( "Sequoia Capital", 4000000000.0 )
wellington = VentureCapitalist.new( "Wellington Partners", 700000000.0 )

angel = FundingRound.new( tesla, oak, "Angel", 1000000.0 )
series_a = FundingRound.new( doordash, sequoia, "Series A", 10000000.0 )
series_b = FundingRound.new( opendoor, wellington, "Series B", 100000000.0 )

binding.pry
0 #leave this here to ensure binding.pry isn't the last line