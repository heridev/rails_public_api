class KindleRequest < ActiveRecord::Base
  belongs_to :user

  validate :verify_existent_kindle_request, :on => :create

  def verify_existent_kindle_request
    current_user = User.find(self.user_id)
    record_found = current_user.kindle_requests.find_by(status: ['active', 'in_progress'])
    errors.add(:status, 'Already exists a request created') if record_found
  end
end
