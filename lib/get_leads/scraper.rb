class GetLeads::Scraper
    attr_accessor :industry, :location, :amount

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
    end

    def scrape_page_results
        #TODO - only get x amount of results
        results = get_page.css('.organic .result')
    end

    def gen_leads(industry:, location:, amount:)
        @industry = industry
        @location = location
        @amount = amount

        self.amount.times do |i|

        end

        puts "done"
    end
end