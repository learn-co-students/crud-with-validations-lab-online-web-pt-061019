class Song < ApplicationRecord
    validates :title, presence: true
    validates :title, uniqueness: {scope: [:artist_name, :release_year],    message: "Cannot be repeated by the same artist in the same year"}
end

    validates :released, inclusion: {in: %w(true false)}

    validates :release_year, 
    # validates : 
    
    # validates :artist_name, presence: true
end
