class Artist < ActiveRecord::Base
has_many :songs
has_many :artist_genres
has_many :genres, through: :songs 

def slug
    self.name.downcase.gsub(" ", "-")
end

def self.find_by_slug(slug)
    name = slug.gsub("-", " ")
    self.where('lower(name) = ?', name).first
end


end