class Slot
  include Mongoid::Document
  include Mongoid::Timestamps

  field :_id, type: String, default: -> {column+row.to_s}

  field :column, type: String # A
  field :row, type: Integer   # 3
  field :empty, type: Boolean, default: true

  belongs_to :item, inverse_of: nil

end
