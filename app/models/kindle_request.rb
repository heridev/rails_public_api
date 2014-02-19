class KindleRequest < ActiveRecord::Base
  belongs_to :user

  belongs_to :kindle

  validates :amount_day,
          :numericality => { only_integer: true }

  validate :verify_existent_kindle_request, :on => :create

  validate :change_status, :on => :update

  scope :created_status_order, -> (type) { where(status: type).order('created_at ASC') }

  def return_kindle
    if status == 'active'
      update_attributes(status: 'inactive')
    end
  end

  private

  def verify_existent_kindle_request
    current_user = User.find(self.user_id)
    record_found = current_user.kindle_requests.find_by(status: ['active', 'in_progress'])
    errors.add(:status, 'Already exists a request created') if record_found
  end

  def change_status
    if !kindle_id.nil? && status == 'in_progress'
      update_attributes({ status: 'active', amount_day: 14, delivery_date: Date.today } )
    end
  end
end


