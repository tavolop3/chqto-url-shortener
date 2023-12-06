class Link < ApplicationRecord
  belongs_to :user
  has_many :accesses, dependent: :destroy
  validates :url, presence: true, format: { with: URI::DEFAULT_PARSER.make_regexp }
  validates :slug, presence: true, uniqueness: true
  encrypts :password

  def check_password(password)
    password == self.password
  end

  def private?
    type == 'PrivateLink'
  end

  def unusable?
    return false unless type == 'EphemeralLink'

    accesses_count == 1
  end

  def expired?
    return false unless type == 'TemporalLink'

    DateTime.now.utc.after? expiration_date
  end
end
