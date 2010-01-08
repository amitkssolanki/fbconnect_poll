class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :poll
  
  validates_uniqueness_of :poll_id, :scope => :user_id
  
  named_scope :positive, :conditions => ["status = ?", true]
  named_scope :negative, :conditions => ["status = ?", false]
end
