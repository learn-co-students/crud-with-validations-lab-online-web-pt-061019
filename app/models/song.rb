class Song < ActiveRecord::Base 
    validates :title, presence: true 
    validates :title, uniqueness: {scope: [:release_year, :artist_name] }

    validates :released, inclusion: { in: [true, false] }
   
    validates :release_year, presence: true, if: -> {released? == true}

    validates :release_year, numericality: {less_than_or_equal_to: Date.today.year}, if: ->{released? == true}

    validates :artist_name, presence: true 

    def released? 
        released 
    end 

end
