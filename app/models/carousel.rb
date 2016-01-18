class Carousel

  STATUS_OK = 1
  STATUS_BUSY = 2
  STATUS_DISPENSING = 3
  STATUS_ERROR = 4

  COLUMNS = %w[A B C D E F]
  ROWS = 1..5

  def self.dispense(column, row)
  end

  def self.ping
  end

  def self.get_status
    return STATUS_OK
  end


  private

  def particle_device_url
    particle_base_url+"/devices/#{ENV['PARTICLE_DEVICE_ID']}"
  end

  def particle_base_url
    "https://api.particle.io/v1"
  end

  def particle_get_variable(variable)
    get_req particle_device_url+"/#{variable}"
  end

  def particle_call_function(function, arg = '')
    post_req particle_device_url+"/#{function}", {arg: arg}
  end

  def particle_parse_resp(str)
    JSON.parse str
  end

  def get_req(path, params = {})
    particle_parse_resp(RestClient.get path, {:params => params.merge!(access_token: ENV['PARTICLE_AUTH_TOKEN'])})
  end

  def post_req(path, params)
    particle_parse_resp(RestClient.post path, params.merge!(access_token: ENV['PARTICLE_AUTH_TOKEN']))
  end

end