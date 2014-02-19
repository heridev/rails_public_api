class KindleRequestDecorator < Draper::Decorator
  delegate_all

  def user_name
    object.user.name
  end
end
