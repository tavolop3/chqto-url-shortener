class Link < ApplicationRecord
  belongs_to :user
  has_many :accesses, dependent: :destroy, counter_cache: true
  validates :url, presence: true, format: { with: URI::DEFAULT_PARSER.make_regexp }
  validates :slug, presence: true, uniqueness: true

  def check_password(password)
    password == self.password
  end

  def private?
    type == 'PrivateLink'
  end

  def expired?
    if type == 'TemporalLink'
      DateTime.now.utc.after? expiration_date
    elsif type == 'EphemeralLink'
      accesses_count == 1
    else
      false
    end
  end
end
