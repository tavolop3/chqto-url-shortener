class Link < ApplicationRecord
  belongs_to :user
  has_many :accesses, dependent: :destroy, counter_cache: true
  validates :url, presence: true, format: { with: URI::DEFAULT_PARSER.make_regexp }
  validates :slug, presence: true, uniqueness: true
end
