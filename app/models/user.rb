class User < ActiveRecord::Base
  has_many :polls
  has_many :votes
  has_many :voted_polls, :through => :votes, :source => :poll
end
