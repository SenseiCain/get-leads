class GetLeads::Lead
    attr_accessor :name, :address, :number

    @@all = []

    def initialize
        #puts "hey #{test}"
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end
end