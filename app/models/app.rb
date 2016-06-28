class App < ActiveRecord::Base

    has_and_belongs_to_many :developers
    has_many :microposts, dependent: :destroy
    has_many :invites
    
    ratyrate_rateable "vote"
    
    has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy

    has_many :followers, through: :passive_relationships, source: :follower
    
    
    def self.search(search)
        if search
            search.downcase!
            where('LOWER(name) LIKE ?', "%#{search}%")
        else
            all
        end
    end
end
