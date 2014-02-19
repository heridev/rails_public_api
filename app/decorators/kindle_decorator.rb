class KindleDecorator < Draper::Decorator
  delegate_all

  def status
    Kindle.current_status object.id
  end
end
