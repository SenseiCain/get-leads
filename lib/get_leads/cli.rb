class GetLeads::CLI
    def call
        puts "Welcome to my lead generation gem!"
        start
    end

    def start
        puts "This app returns a list of specific leads."

        puts ""
        puts "What industry are you looking for?"

        industry = gets.chomp

        puts ""
        puts "Where are you interested in? (City, State or Zipcode)"

        location = gets.chomp

        while !(is_valid_location?(location))
            puts ""
            puts "That's not a valid location."
            puts "Please put a 5 digit Zip, or City, State!"
            location = gets.chomp
        end

        max_leads = 15
        puts ""
        puts "How many leads would you like? (max #{max_leads})"

        #TODO - check to see if this is less than the max. Reask if not.
        amount = gets.chomp

        puts ""
        puts "Here ya go!"
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


    
end