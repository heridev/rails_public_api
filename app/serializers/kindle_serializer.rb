class KindleSerializer < ActiveModel::Serializer
  attributes :id,
             :inventory_id,
             :status
end
