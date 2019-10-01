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
        formatted_url = "https://www.yellowpages.com/search?search_terms=#{url_formatted_industry}&geo_location_terms=Austin%2C+TX"

        Nokogiri::HTML(open(formatted_url))
    end

    def scrape_page
        #TODO - only get x amount of results
        results = get_page.css('.organic .result')

        results.each_with_index do |result, i|
            new_lead = GetLeads::Lead.new(i)
        end

    end

    def gen_leads(industry:, location:, amount:)
        @industry = industry
        @location = location
        @amount = amount

        scrape_page
        puts "done"
    end
end