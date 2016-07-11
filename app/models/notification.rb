class Notification < ActiveRecord::Base
  belongs_to :notifier, class_name: 'User'
  belongs_to :notified, class_name: 'User'
  belongs_to :opinion  
end
