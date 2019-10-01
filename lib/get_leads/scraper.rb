class GetLeads::Scraper
    attr_accessor :industry, :location, :amount

    def gen_leads(industry:, location:, amount:)
        @industry = industry
        @location = location
        @amount = amount

        #binding.pry
        puts "Scraper init"
    end
end