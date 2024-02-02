# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Default routes' do
  it 'routes to /users/api/v1/tokens/revoke' do
    expect(post: '/users/api/v1/tokens/revoke').to route_to('api/v1/devise/api/tokens#revoke')
  end

  it 'routes to /users/api/v1/tokens/refresh' do
    expect(post: '/users/api/v1/tokens/refresh').to route_to('api/v1/devise/api/tokens#refresh')
  end

  it 'routes to /users/api/v1/tokens/info' do
    expect(get: '/users/api/v1/tokens/info').to route_to('api/v1/devise/api/tokens#info')
  end

  it 'routes to /users/api/v1/tokens/sign_in' do
    expect(post: '/users/api/v1/tokens/sign_in').to route_to('api/v1/devise/api/tokens#sign_in')
  end

  it 'routes to /users/api/v1/tokens/sign_up' do
    expect(post: '/users/api/v1/tokens/sign_up').to route_to('api/v1/devise/api/tokens#sign_up')
  end
end
