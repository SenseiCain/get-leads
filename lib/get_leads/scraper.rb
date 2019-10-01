class GetLeads::Scraper
    attr_accessor :industry, :location, :amount

    def format_industry
        self.industry.split(" ").join("+")
    end

    def format_location
        #If you location.split.length is 2, that means city and state combo
        if self.location.split(", ").length == 2
            self.location.split(", ").join("%2C+")
        else
            self.location
        end
    end

    def get_page
        url_formatted_industry = format_industry
        url_formatted_location = format_location

        binding.pry
        formatted_url = "https://www.yellowpages.com/search?search_terms=#{url_formatted_industry}&geo_location_terms=Austin%2C+TX"

        Nokogiri::HTML(open(formatted_url))
    end

    def scrape_page
        doc = get_page
        binding.pry
    end

    def gen_leads(industry:, location:, amount:)
        @industry = industry
        @location = location
        @amount = amount

        scrape_page
        binding.pry
        puts "Scraper init"
    end
end