class GetLeads::Lead
    attr_accessor :name, :address, :number

    @@all = []

    def initialize
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def self.clear
        @@all = []
    end
end