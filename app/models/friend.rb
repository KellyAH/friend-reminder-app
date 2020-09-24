class Friend < ApplicationRecord
  # narrow db query to get specific data for spec tests
  scope :active_friends, -> { where(status: 'active') }
  scope :pending_friends, -> { where(status: 'pending') }
  has_many :events, dependent: :destroy
  validates_presence_of :first_name, :last_name, :email, :status
  enum status: { active: 'active', deactivated: 'deactivated', pending: 'pending' }

  include PhotoUploader::Attachment(:photo) # adds an `photo` virtual attribute

  def name
    "#{first_name} #{last_name}"
  end

  def events_descending
    events.order(date_attended: :desc)
  end
end
