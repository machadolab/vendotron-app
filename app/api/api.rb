module API

  #======================================================
  # API View Classes
  #======================================================

  class ItemView < Grape::Entity
    expose :id, :picture_url
  end


  #======================================================
  # The V1 API
  #======================================================
  class APIV1 < Grape::API

    format :json

    rescue_from :all do |e|
      error_response({message: e.message})
    end


    get 'zzt' do

      {:status => Carousel.get_status}
    end

  end

  class APIRoot < Grape::API

    def self.base_path
      begin
        return 'http://localhost:3000/v1' if Rails.env.development?
      rescue
        # ignore
      end
      'https://vendotron.example.org/v1'
    end

    before do
      header['Access-Control-Allow-Origin'] = '*'
      header['Access-Control-Request-Method'] = '*'
    end

    mount APIV1

    add_swagger_documentation :api_version => 'v1', :base_path => base_path, :hide_documentation_path => true
    allow_cross_domain_request_from '*'
  end
end
