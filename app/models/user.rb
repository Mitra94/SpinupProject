class User < ActiveRecord::Base

    before_save { self.email = email.downcase }
    
    attr_accessor :remember_token

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :username, presence: true, length: { maximum: 50 }, uniqueness: { case_sensitive: false }
    validates :email, presence: true, length: { maximum: 255 }, 
        format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }

    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
    
    ratyrate_rater
    
    has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy
                                  
    has_many :following, through: :active_relationships, source: :followed
    
    has_many :active_likes, class_name:  "Like",
                                  foreign_key: "liker_id",
                                  dependent:   :destroy
                                  
    has_many :likes, through: :active_likes, source: :liked
    
    has_many :active_spins, class_name:  "Spin",
                                  foreign_key: "spiner_id",
                                  dependent:   :destroy
                                  
    has_many :spins, through: :active_spins, source: :spined
    
    has_many :active_loves, class_name:  "Love",
                                  foreign_key: "lover_id",
                                  dependent:   :destroy
                                  
    has_many :loves, through: :active_loves, source: :loved
    
    has_many :opinions, dependent: :destroy
    
        # Follows a user.
      def follow(app)
        active_relationships.create(followed_id: app.id)
      end

      # Unfollows a user.
      def unfollow(app)
        active_relationships.find_by(followed_id: app.id).destroy
      end

      # Returns true if the current user is following the other user.
      def following?(app)
        following.include?(app)
      end
      
    #Like a post
	def like(micropost)
		active_likes.create(liked_id: micropost.id)
	end
	
	#Unlike a post
	def unlike(micropost)
		active_likes.find_by(liked_id: micropost.id).destroy
	end
	
	#Returns true if the current user likes the micropost
	def likes?(micropost)
		likes.include?(micropost)
	end
	
	#Like a Opinion
	def spin(opinion)
		active_spins.create(spined_id: opinion.id)
	end

	#Unlike a Opinion
	def unspin(opinion)
		active_spins.find_by(spined_id: opinion.id).destroy
	end
	
	#Returns true if the current user likes the opinion
	def spins?(opinion)
		spins.include?(opinion)
	end
	
	#Like a Comment
	def love(comment)
		active_loves.create(loved_id: comment.id)
	end

	#Unlike a Comment
	def unlove(comment)
		active_loves.find_by(loved_id: comment.id).destroy
	end
	
	#Returns true if the current user likes the comment
	def loves?(comment)
		loves.include?(comment)
	end
	
    # Returns the hash digest of the given string.
    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end
    
    # Returns a random token.
    def User.new_token
        SecureRandom.urlsafe_base64
    end
    
    def remember
        self.remember_token = User.new_token
        update_attribute(:remember_digest, User.digest(remember_token))
    end
    
    # Returns true if the given token matches the digest.
      def authenticated?(remember_token)
        BCrypt::Password.new(remember_digest).is_password?(remember_token)
      end
  
    # Forgets a user.
      def forget
        update_attribute(:remember_digest, nil)
      end

end
