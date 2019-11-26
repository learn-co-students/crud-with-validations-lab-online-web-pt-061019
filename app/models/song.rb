class Song < ApplicationRecord

    validates :title, presence: true, uniqueness: true
    # validates :title, uniqueness: true
    # {scope: [:artist_name, :release_year], message: "Cannot be repeated by the same artist in the same year"}
    # validates :release_year, presence: true
    validates :released, inclusion: {in: [true, false]}
    validate :release_year_valid

    def release_year_valid
        if self.released == true && self.release_year.nil?
            errors.add(:release_year, "must exist.")
        end

        if self.release_year != nil && self.release_year > Time.now.year
            errors.add(:release_year, "can't be in the future.")
        end

    end

    

end
