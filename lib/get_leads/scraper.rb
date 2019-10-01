class GetLeads::Scraper
    attr_accessor :industry, :location, :amount

    def format_industry
        self.industry.split(" ").join("+")
    end

    def format_location
        type = nil
        #If you location.split.length is 2, that means city and state combo
        if self.location.split(", ").length == 2
            type = "city & state"
        else
            type = "zipcode"
        end
        binding.pry
    end

    def get_page
        url_formatted_industry = self.format_industry
        url_formatted_location = format_location
        formatted_url = "https://www.yellowpages.com/search?search_terms=#{url_formatted_industry}&geo_location_terms=Austin%2C+TX"

        binding.pry

        #Template URL - https://www.yellowpages.com/search?search_terms=cbd+shop&geo_location_terms=Austin%2C+TX
        #Nokogiri::HTML(open("https://www.yellowpages.com/search?search_terms=#{url_formatted_industry}&geo_location_terms=Austin%2C+TX"))
    end

    def scrape_page

    end

    def gen_leads(industry:, location:, amount:)
        @industry = industry
        @location = location
        @amount = amount

        doc = get_page
        binding.pry
        puts "Scraper init"
    end
end