class Link < ApplicationRecord
  belongs_to :user
  has_many :accesses, dependent: :destroy, counter_cache: true
  validates :url, presence: true
  validates :slug, presence: true, uniqueness: true
end
