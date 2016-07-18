class Developer < ActiveRecord::Base

    before_save { self.email = email.downcase }

    attr_accessor :remember_token
    
    has_and_belongs_to_many :apps
    has_many :microposts, dependent: :destroy
    has_many :skills
    has_many :invites
    has_many :bugs
    
    has_many :comments, dependent: :destroy
    
    validates :name, presence: true, length: {minimum: 3, maximum: 50 }
    validates :surname, presence: true, length: {minimum: 3, maximum: 50 }
    validates :city, presence: true, length: {minimum: 2, maximum: 50 }
    validates :age, presence: true, :numericality => { :greater_than_or_equal_to => 1, :less_than_or_equal_to => 100 }

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 }, 
        format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
    
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
    validates :password_confirmation, presence: true
    
    ratyrate_rater
    
    #Picture
    mount_uploader :picture, PictureUploader 
    validate  :picture_size
    
    # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
    #End Picture
    
    # Returns the hash digest of the given string.
    def Developer.digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end
    
    # Returns a random token.
      def Developer.new_token
        SecureRandom.urlsafe_base64
      end
      
    # Remembers a user in the database for use in persistent sessions.
      def remember
        self.remember_token = Developer.new_token
        update_attribute(:remember_digest, Developer.digest(remember_token))
      end
  
    # Returns true if the given token matches the digest.
      def authenticated?(remember_token)
        BCrypt::Password.new(remember_digest).is_password?(remember_token)
      end
  
    # Forgets a user.
      def forget
        update_attribute(:remember_digest, nil)
      end
      
    def self.search(search)
        if search
            search.downcase!
            where('LOWER(name) LIKE ?', "%#{search}%")
        else
            all
        end
    end
  
end
