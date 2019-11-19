class Song < ApplicationRecord
    validates :title, presence: true
    validates :title, uniqueness: { scope: [:artist_name, :release_year], message: "Cannot be repeated by the same artist in the same year"}
    validate :release_year_if_released_is_false
    validates :artist_name, presence: true

    def release_year_if_released_is_false
        if released
            if release_year.nil?
                errors.add(:year_released, "Must not be blank if released")
            elsif release_year > Date.today.year
                errors.add(:year_released, "Must be less than or equal to the current year")
                
            end 
        end 
    end
end