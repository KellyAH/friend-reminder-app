class Friend < ApplicationRecord
  has_many :events
  validates_presence_of :first_name, :last_name, :email, :status
  enum status: { active: 'active', deactivated: 'deactivated', pending: 'pending' }
end
