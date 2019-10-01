class GetLeads::Scraper
    attr_accessor :industry, :location, :amount

    def get_page

        #Template URL - https://www.yellowpages.com/search?search_terms=cbd+shop&geo_location_terms=Austin%2C+TX
        Nokogiri::HTML(open("https://www.yellowpages.com/search?search_terms=cbd+shop&geo_location_terms=Austin%2C+TX"))
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