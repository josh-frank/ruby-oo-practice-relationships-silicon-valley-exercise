class VentureCapitalist

    @@all = []

    # - `VentureCapitalist#name`
    #   - returns a **string** that is the venture capitalist's name
    # - `VentureCapitalist#total_worth`
    #   - returns a **number** that is the total worth of this investor (e.g., think of it as how much money they have)
    attr_accessor :name, :total_worth

    def initialize( this_name, this_total_worth )
        @name = this_name
        @total_worth = this_total_worth
        @@all << self
    end

    # - `VentureCapitalist.all`
    #   - returns an array of all venture capitalists
    def self.all
        @@all
    end

    # - `VentureCapitalist.tres_commas_club`
    #   - returns an array of all venture capitalists in the Trés Commas club (they have more then 1,000,000,000 `total_worth`)
    def self.tres_commas_club
        # self.all.select{ | vc | vc.total_worth >= 1000000000.0 }
        self.all.reject{ | vc | vc.total_worth < 1000000000.0 }
    end

    # - `VentureCapitalist#offer_contract`
    #   - given a **startup object**, type of investment (as a string), and the amount invested (as a float), creates a new funding round and associates it with that startup and venture capitalist.
    def offer_contract( startup, investment_type, amount_invested )
        FundingRound.new( startup, self, investment_type, amount_invested )
    end

    # - `VentureCapitalist#funding_rounds`
    #   - returns an array of all funding rounds for that venture capitalist
    def funding_rounds
        FundingRound.all.select{ | round | round.venture_capitalist == self }
    end

    # - `VentureCapitalist#portfolio`
    #   - Returns a **unique** list of all startups this venture capitalist has funded
    def portfolio
        FundingRound.all.map{ | round | round.startup if round.venture_capitalist == self }.uniq
    end

    # - `VentureCapitalist#biggest_investment`
    #   - returns the largest funding round given by this venture capitalist
    def biggest_investment
        FundingRound.all.max{ | this_round, that_round | this_round.investment <=> that_round.investment }
    end

    # - `VentureCapitalist#invested`
    #   - given a **domain string**, returns the total amount invested in that domain
    def invested( domain_name )
        rounds_with_this_domain = FundingRound.all.select{ | round | round.venture_capitalist == self && round.startup.domain == domain_name }
        rounds_with_this_domain.sum{ | round | round.investment }
    end

end
