class Song < ApplicationRecord
  validates :title,
    presence: true,
    uniqueness: { scope: [:artist_name, :release_year], message: "This song cannot be repeated in the same year" }
  validates :released, inclusion: {in: %w(true false)}
  validates :artist_name, presence: true
  validate :has_release_year_if_released

  def has_release_year_if_released
    if released
      if release_year.nil?
        errors.add(:has_release_year, "Release year cannot be left blank")
      elsif release_year > Date.today.year
        errors.add(:has_release_year, "Release year cannot be in the future")
      end
    end
  end
end
