class Artist < ActiveRecord::Base
has_many :songs
has_many :artist_genres
has_many :genres, through: :songs 

def slug
    self.name.downcase.gsub(" ", "-")
end

def self.find_by_slug(slug)
    name = slug.split("-").each { |word| word.capitalize! }.join(" ")
    result = self.find_by(name: name)
end


end