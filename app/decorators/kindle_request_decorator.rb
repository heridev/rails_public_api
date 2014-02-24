class KindleRequestDecorator < Draper::Decorator
  delegate_all

  def user_name
    object.user.name
  end

  def kindle_inventory
    object.kindle.inventory_id if object.kindle
  end
end
