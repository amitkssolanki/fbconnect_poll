class Poll < ActiveRecord::Base
  validates_presence_of :user_id, :question
  validates_uniqueness_of :question
  
  belongs_to :user
  has_many :votes
end
