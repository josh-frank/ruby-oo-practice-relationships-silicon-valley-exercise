# Angel, Pre-Seed, Seed, Series A, Series B, Series C

class FundingRound

    @@all = []

    # - `FundingRound#startup`
    #   - returns the startup object for that given funding round
    #   - Once a funding round is created, I should not be able to change the startup
    # - `FundingRound#venture_capitalist`
    #   - returns the venture capitalist object for that given funding round
    #   - Once a funding round is created, I should not be able to change the venture capitalist
    # - `FundingRound#type`
    #   - returns a **string** that is the type of funding round
    #   - Examples include: Angel, Pre-Seed, Seed, Series A, Series B, Series C, etc.
    # - `FundingRound#investment`
    #   - returns a **number** that is the amount invested during this funding round
    #   - This should be a float that is not a negative number.
    attr_reader :startup, :venture_capitalist
    attr_accessor :type, :investment

    def initialize( this_startup, this_venture_capitalist, this_type, this_investment )
        @startup = this_startup
        @venture_capitalist = this_venture_capitalist
        @type = this_type
        @investment = this_investment
        @@all << self
    end

    # - `FundingRound.all`
    #   - returns all of the funding rounds
    def self.all
        @@all
    end

end
