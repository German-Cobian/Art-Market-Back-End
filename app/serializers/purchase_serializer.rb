class PurchaseSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :user_id, :creation_id, :sale, :quantity, :total
end