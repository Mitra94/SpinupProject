class App < ActiveRecord::Base
    after_validation :after_validation
    
    has_and_belongs_to_many :developers
    has_many :microposts, dependent: :destroy
    has_many :invites
    has_many :bugs
    
    ratyrate_rateable "vote"
    
    has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy

    has_many :followers, through: :passive_relationships, source: :follower
    
    validates :name, presence: true, length: { maximum: 50 }, uniqueness: { case_sensitive: false }
    validates :platform, presence: true
    validates :category, presence: true
    validates :version, presence: true
    
    mount_uploader :picture, PictureUploader 
    validate  :picture_size
    
    # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
      
    def self.search_name(name)
           name.downcase!
           where('LOWER(name) LIKE ?', "%#{name}%")
    end
    
    def self.search_category(category)
           logger.debug "category: #{category.inspect}"
           where('category LIKE ?', "%#{category}%")
    end
    
    def self.search_platform(platform)
           logger.debug "platform: #{platform.inspect}"
           where('platform LIKE ?', "%#{platform}%")
    end
    
    def self.search(name, platform, category)
        #return home_url unless name.present? || platform.present? || category.present?
        if !name.present?  && !platform.present? && !category.present?
            all
        elsif !name.present? && platform.present? && category.present?
            where('platform LIKE ? AND category LIKE ?', "%#{platform}%", "%#{category}%")
        elsif !name.present? && !platform.present? && category.present?
            search_category(category)
        elsif name.present? && !platform.present? && !category.present?
            search_name(name)
        elsif !name.present? && platform.present? && !category.present?
            search_platform(platform)
        elsif name.present? && !platform.present? && category.present?
            name.downcase!
            where('platform LIKE ? AND name LIKE ?', "%#{platform}%", "%#{name}%")
        elsif name.present? && platform.present? && !category.present?
            name.downcase!
            where('name LIKE ? AND category LIKE ?', "%#{name}%", "%#{category}%")
        else
            name.downcase!
            where('LOWER(name) LIKE ? AND platform LIKE ? AND category LIKE ?', 
                "%#{name}%", "%#{platform}%", "%#{category}%")
        end
    end
    
    def after_validation
        # Skip errors that won't be useful to the end user
      end
    
end

