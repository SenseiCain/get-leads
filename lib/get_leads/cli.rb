class GetLeads::CLI
    def call
        puts "Welcome to my lead generation gem!"
        puts "This app returns a list of specific leads."
        start
    end

    def start
        
        puts ""
        puts "What industry are you looking for?"
        industry = get_valid_industry

        puts ""
        puts "Where are you interested in? (City, State or Zipcode)"
        location = get_valid_location

        max_leads = 15
        puts ""
        puts "How many leads would you like? (max #{max_leads})"
        amount = get_valid_amount(max_leads)

        puts ""
        puts "#{industry} - #{location} - #{amount}"
    end

    def get_valid_industry
        industry = gets.chomp

        while industry.to_i != 0
            puts ""
            puts "That's not a valid industry."
            puts "What industry are you looking for?"
            industry = gets.chomp
        end

        industry
    end

    def get_valid_location
        location = gets.chomp

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

        while !(amount.to_i.between?(0, max_leads))
            puts ""
            puts "That's not a valid amount."
            puts "How many leads would you like? (max #{max_leads})"
            amount = gets.chomp
        end

        amount
    end
    
end