class KindleRequestSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :user_name, :kindle_id, :status
end
