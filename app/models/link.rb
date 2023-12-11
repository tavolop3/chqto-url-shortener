class Link < ApplicationRecord
  belongs_to :user
  has_many :accesses, dependent: :destroy
  validates :url, presence: true, format: { with: URI::DEFAULT_PARSER.make_regexp }
  validates :slug, presence: true, uniqueness: true
  validates :name, length: { maximum: 50 }
  encrypts :password

  after_initialize do
    self.slug ||= SecureRandom.hex(4)
    self.type ||= 'RegularLink'
    self.accesses_count ||= 0
  end

  def self.inherited(child)
    child.instance_eval do
      alias :original_model_name :model_name
      def model_name
        Link.model_name
      end
    end
    super
  end
end
