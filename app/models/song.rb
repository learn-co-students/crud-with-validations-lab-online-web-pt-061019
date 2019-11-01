class Song < ApplicationRecord
  validates :title, presence: true
  validate :title_cannot_be_released_by_same_artist_in_same_year

  validates :released, inclusion: { in: [true, false] }
  validate :released_is_invalid_without_year_when_released_true
  validate :release_year_cannot_be_in_future

  #another way to do this:
  #with_options if: :released? do |song|
  #   song.validates :release_year, presence: true
  #   song.validates :release_year, numerically: { less_than_or_equal_to: Date.today.year }
  # end

  # def released?
  #   self.released
  # end

  validates :artist_name, presence: true

  def title_cannot_be_released_by_same_artist_in_same_year
    same_stuff = Song.find_by(title: title, artist_name: artist_name, release_year: release_year, released: released)
    if same_stuff
      errors.add(:title, "can't be released by the same artist in the same year")
    end
  end

  def released_is_invalid_without_year_when_released_true
    if released == true && release_year == nil
      errors.add(:release_year, "required if released is true")
    end
  end

  def release_year_cannot_be_in_future
    if release_year && release_year > Date.today.year
      errors.add(:release_year, "can't be in the future")
    end
  end

end
