class AppComment < ActiveRecord::Base
  belongs_to :app
  belongs_to :micropost
end
