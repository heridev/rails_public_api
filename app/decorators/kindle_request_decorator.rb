class KindleRequestDecorator < Draper::Decorator
  delegate_all

  def user_name
    object.user.name
  end
end

#class KindleRequestDecorator < Draper::CollectionDecorator
  ##delegate :current_page, :total_pages, :limit_value
  #delegate_all

  #def user_name
    #object.user.name
  #end
#end
