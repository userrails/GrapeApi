require 'grape-swagger'

class API < Grape::API

  prefix 'api'
  version 'v1', using: :path

  mount Employee::Data

  add_swagger_documentation

  # add_swagger_documentation :format => :json,
  #                         :api_version => 'v1',
  #                         :base_path => "http://localhost:3000/api/",
  #                         :hide_documentation_path => true
end