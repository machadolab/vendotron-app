class Carousel

  STATUS_OK = 1
  STATUS_BUSY = 2

  COLUMNS = %w[A B C D E F]
  ROWS = 1..5

  def self.dispense(column, row)
  end

  def self.ping
  end

  def self.get_status
    return STATUS_OK
  end


end