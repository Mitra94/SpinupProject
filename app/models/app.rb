class App < ActiveRecord::Base

    belongs_to :developer
    
    ratyrate_rateable "vote"
end
