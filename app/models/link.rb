class Link < ApplicationRecord
  belongs_to :user
  has_many :accesses, dependent: :destroy, counter_cache: true

  enum link_type: %i[regular temporal private ephemeral]

  validates :slug, uniqueness: true
  validates :password, presence: true, if: :private?

  def private?
    link_type == 'private'
  end
end
