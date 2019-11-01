class Song < ApplicationRecord
    validates :title, presence: true, uniqueness: { scope: [:release_year, :artist_name]}
    validates :artist_name, presence: true
    validates :release_year, presence: true, numericality: { less_than: Date.current.year }, if: :is_released?
end

def is_released?
    self.released == true
end


# flatiron solution
    # validates :title, presence: true
    # validates :title, uniqueness: {
    #   scope: %i[release_year artist_name],
    #   message: 'cannot be repeated by the same artist in the same year'
    # }
    # validates :released, inclusion: { in: [true, false] }
    # validates :artist_name, presence: true
  
    # with_options if: :released? do |song|
    #   song.validates :release_year, presence: true
    #   song.validates :release_year, numericality: {
    #     less_than_or_equal_to: Date.today.year
    #   }
    # end
  
    # def released?
    #   released
    # end