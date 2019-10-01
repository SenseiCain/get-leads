class GetLeads::CLI
    def call
        puts "Welcome to my lead generation gem!"
        start
    end

    def start
        puts "This app returns a list of specific leads."

        puts ""
        puts "What industry are you looking for?"

        industry = gets

        puts ""
        puts "Where are you interested in? (City, State or Zipcode)"

        location = gets
        editted_location = editted_location(location)

        puts ""
        puts "How many leads would you like? (max 15)"

        #TODO - check to see if this is less than the max. Reask if not.
        amount = gets

        puts ""
        puts "Here ya go!"
    end

    def editted_location(location)
        #TODO - return city & state or zipcode
        location
    end
end