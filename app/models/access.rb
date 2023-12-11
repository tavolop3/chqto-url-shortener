class Access < ApplicationRecord
  belongs_to :link, counter_cache: true
  validates :ip_address, presence: true
end
