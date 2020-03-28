class Friend < ApplicationRecord
  has_many :events, dependent: :destroy
  validates_presence_of :first_name, :last_name, :email, :status
  enum status: { active: 'active', deactivated: 'deactivated', pending: 'pending' }

  def name
    "#{first_name} #{last_name}"
  end
end
