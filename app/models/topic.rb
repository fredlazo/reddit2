class Topic < ActiveRecord::Base
  belongs_to :user
  has_many :posts, dependent: :destroy

  has_many :labelings, as: :labelable
  has_many :labels, through: :labelings
  
end
