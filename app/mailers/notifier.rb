class Notifier < ActionMailer::Base
  default :from => "Crowd Interactive<kindles@crowdint.com>"

  def create_request(user_requester)

    admins = User.where(role: 'admin').pluck(:email)
    admins.each do |admin|
      mail(to: admin, subject: 'A new kindle request was created') do |format|
        format.html { render 'notifier/create_request', locals: { user: user_requester }}
      end
    end
  end

  def expired_requests users
    admins = User.where(role: 'admin').pluck(:email)
    admins.each do |admin|
      mail(to: admin, subject: 'Expired requests') do |format|
        format.html { render 'notifier/expired_request', locals: { users: users }}
      end
    end
  end
end

