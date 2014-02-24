class KindleRequestSerializer < ActiveModel::Serializer
  attributes :id,
             :created_at,
             :user_name,
             :kindle_id,
             :status,
             :amount_day,
             :kindle_inventory
end
