class Slot
  include Mongoid::Document
  include Mongoid::Timestamps

  field :_id, type: String, default: -> {column+row.to_s}

  field :column, type: String, default: '' # A
  field :row, type: Integer, default: 0   # 3
  field :empty, type: Boolean, default: true

  belongs_to :item, inverse_of: nil

  # activeadmin mongoid fix
  self.primary_key = :_id

  def name
    id
  end

end
