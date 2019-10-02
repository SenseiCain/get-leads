class GetLeads::CLI
    attr_accessor :industry, :location, :amount

    def call
        puts "Welcome to my lead generation gem!"
        puts "This app returns a list of specific leads."
        start
    end

    def start
        
        #CLI flow
        puts ""
        puts "What industry are you looking for?"
        @industry = get_valid_industry

        puts ""
        puts "Where are you interested in? (City, State or Zipcode)"
        @location = get_valid_location

        max_leads = 15
        puts ""
        puts "How many leads would you like? (max #{max_leads})"
        @amount = get_valid_amount(max_leads)

        #TODO - return leads based on industry, location, and amount
        GetLeads::Scraper.new.gen_leads(
            industry: self.industry,
            location: self.location,
            amount: self.amount
        )

        puts ""
        puts "#{self.industry} - #{self.location} - #{self.amount}"
    end

    def get_valid_industry
        industry = gets.chomp

        #Tests to see if input is a string
        while industry.to_i != 0 || industry == "0"
            puts ""
            puts "That's not a valid industry."
            puts "What industry are you looking for?"
            industry = gets.chomp
        end

        industry
    end

    def get_valid_location
        location = gets.chomp

        #Tests to see if input is a valid zip or city & state combo
        while !(is_valid_location?(location))
            puts ""
            puts "That's not a valid location."
            puts "Please put a 5 digit Zip, or City, State!"
            location = gets.chomp
        end

        location
    end

    def is_valid_location?(location)

        if location.to_i == 0 && location.split(", ").length == 2
            true
        elsif location.to_i > 0 && location.length == 5
            true
        else
            false
        end
    end

    def get_valid_amount(max_leads)
        amount = gets.chomp

        #Tests to see if the input is between 0 & set max
        while !(amount.to_i.between?(1, max_leads))
            puts ""
            puts "That's not a valid amount."
            puts "How many leads would you like? (max #{max_leads})"
            amount = gets.chomp
        end

        amount.to_i
    end

    def print_business_names
        
    end
    
end