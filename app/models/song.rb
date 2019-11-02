class Song < ApplicationRecord
    validates :title, presence: true
    validates :title, uniqueness: {scope: [:artist_name, :release_year], message: "Cannot be repeated by the same artist in the same year"}
    with_options if: :released? do |song|
        song.validates :release_year, presence: true
        song.validates :release_year, numericality: {less_than_or_equal_to: Date.today.year}
    end
    validates :released, inclusion: {in: [true, false]}
    validates :artist_name, presence: true

    def released? 
        self.released
    end
end
