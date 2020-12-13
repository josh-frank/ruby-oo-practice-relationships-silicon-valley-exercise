class Startup

    @@all = []

    # - `Startup#name`
    #   - returns a **string** that is the startup's name
    # - `Startup#founder`
    #   - returns a **string** that is the founder's name
    #   - Once a startup is created, the founder cannot be changed.
    # - `Startup#domain`
    #   - returns a **string** that is the startup's domain
    attr_reader :founder
    attr_accessor :name, :domain

    def initialize( this_name, this_founder, this_domain )
        @name = this_name
        @founder = this_founder
        @domain = this_domain
        @@all << self
    end

    # - `Startup.all`
    #   - should return **all** of the startup instances
    def self.all
        @@all
    end

    # - `Startup#pivot`
    #   - given a string of a **domain** and a string of a **name**, change the domain and name of the startup. This is the only public method through which the domain should be changed.
    def pivot( new_domain, new_name )
        self.name = new_name
        self.domain = new_domain
    end

    # - `Startup.find_by_founder`
    #   - given a string of a **founder's name**, returns the **first startup** whose founder's name matches
    def self.find_by_founder( founder_name )
        self.all.find{ | startup | startup.founder == founder_name }
    end

    # - `Startup.domains`
    #   - should return an **array** of all of the different startup domains
    def self.domains
        self.all.map{ | startup | startup.domain }.uniq
    end

    # - `Startup#sign_contract`
    #   - given a **venture capitalist object**, type of investment (as a string), and the amount invested (as a float), creates a new funding round and associates it with that startup and venture capitalist.    
    def sign_contract( venture_capitalist, investment_type, amount_invested )
        FundingRound.new( self, venture_capitalist, investment_type, amount_invested )
    end

    # - `Startup#num_funding_rounds`
    #   - Returns the total number of funding rounds that the startup has gotten
    def num_funding_rounds
        FundingRound.all.count{ | round | round.startup == self }
    end

    # - `Startup#total_funds`
    #   - Returns the total sum of investments that the startup has gotten
    def total_funds
        FundingRound.all.sum{ | round | round.investment if round.startup == self }
    end

    # - `Startup#investors`
    #   - Returns a **unique** array of all the venture capitalists that have invested in this company
    def investors
        FundingRound.all.map{ | round | round.venture_capitalist if round.startup == self }.uniq
    end

    # - `Startup#big_investors`
    #   - Returns a **unique** array of all the venture capitalists that have invested in this company and are in the Trés Commas club
    def big_investors
        investors.all.select{ | investor | investor.total_worth >= 1000000000.0 }
    end

end
