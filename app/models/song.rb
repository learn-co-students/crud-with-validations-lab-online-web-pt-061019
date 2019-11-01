class Song < ApplicationRecord
    validates :title, presence: true, uniqueness: { scope: [:release_year, :artist_name]}
    validates :artist_name, presence: true
    validates :release_year, presence: true, numericality: { less_than: Date.current.year }, if: :is_released?
end

def is_released?
    self.released == true
end