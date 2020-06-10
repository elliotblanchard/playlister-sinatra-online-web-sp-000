class Artist < ActiveRecord::Base
    has_many :songs
    has_many :genres, through: :songs 
    
    def slug
        slugify = self.name.downcase 
        slugify.gsub(" ", "-")
    end

    def self.find_by_slug(slug)
        unslug = slug.gsub("-", " ")
        unslug = unslug.titleize
        self.all.find { |artist| artist.name == unslug }
    end
end