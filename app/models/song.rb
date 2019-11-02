class Song < ApplicationRecord
    validates :title, presence: true
    validates :title, uniqueness: { scope: [:release_year, :artist_name] } 
    validates :release_year, presence: true, if: :released?
    validate :release_year_must_be_in_the_past


  def release_year_must_be_in_the_past
    if release_year.present? && release_year > Date.today.year
      errors.add(:release_year, "must be in the past")
    end
  end  
  
end
