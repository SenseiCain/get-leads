class GetLeads::Scraper
    attr_accessor :industry, :location

    def format_industry
        #Formats industry input to be URL friendly
        self.industry.split(" ").join("+")
    end

    def format_location
        #If location.split.length is 2, that means city and state combo. Else zipcode.
        self.location.split(", ").length == 2 ? self.location.split(", ").join("%2C+") : self.location
    end

    def get_page
        formatted_url = "https://www.yellowpages.com/search?search_terms=#{format_industry}&geo_location_terms=#{format_location}"
        Nokogiri::HTML(open(formatted_url))
        #binding.pry
    end

    def scrape_page_results
        self.get_page.css('.organic .result')
    end

    def gen_leads(industry:, location:, amount:)
        @industry = industry
        @location = location

        results = scrape_page_results[0, amount]
        results.each do |result|
            new_lead = GetLeads::Lead.new
            new_lead.name = result.css(".info h2 a span").text
            new_lead.number = result.css(".info .info-secondary .phone").text
            new_lead.address = result.css(".info .info-secondary .street-address").text
        end
    end
end