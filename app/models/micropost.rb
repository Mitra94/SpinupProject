class Micropost < ActiveRecord::Base
  belongs_to :developer
  belongs_to :app
  
  has_many :passive_likes, class_name:  "Like",
                                   foreign_key: "liked_id",
                                   dependent:   :destroy

  has_many :likers, through: :passive_likes, source: :liker
  
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader 
  validates :developer_id, presence: true
  validates :app_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  
  validate  :picture_size

  private

    # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end

end
