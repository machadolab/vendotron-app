class Carousel

  STATUS_OK = 1
  STATUS_BUSY = 2
  STATUS_DISPENSING = 3
  STATUS_ERROR = 4

  COLUMNS = %w[A B C D E F]
  ROWS = 1..5

  def self.dispense(column, row)
    particle_call_function('dispense', "#{column}:#{row}")
  end

  def self.open(row)
    particle_call_function('open', row)
  end

  def self.rotate(angle)
    particle_call_function('rotate', angle)
  end

  def self.ping
  end

  def self.get_status
    return STATUS_OK
  end


  private

  def self.particle_device_url
    particle_base_url+"/devices/#{ENV['PARTICLE_DEVICE_ID']}"
  end

  def self.particle_base_url
    "https://api.particle.io/v1"
  end

  def self.particle_get_variable(variable)
    get_req particle_device_url+"/#{variable}"
  end

  def self.particle_call_function(function, arg = '')
    post_req particle_device_url+"/#{function}", {arg: arg}
  end

  def self.particle_parse_resp(str)
    JSON.parse str
  end

  def self.get_req(path, params = {})
    particle_parse_resp(RestClient.get path, {:params => params.merge!(access_token: ENV['PARTICLE_AUTH_TOKEN'])})
  end

  def self.post_req(path, params)
    particle_parse_resp(RestClient.post path, params.merge!(access_token: ENV['PARTICLE_AUTH_TOKEN']))
  end

end