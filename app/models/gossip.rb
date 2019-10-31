class Gossip < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: { in: 3..20 }
  validates :content, presence: true
  has_many :comments
  has_many :tag_gossips
  accepts_nested_attributes_for :tag_gossips
  has_many :likes
  #has_many :tags, through: :tag_gossips
end
