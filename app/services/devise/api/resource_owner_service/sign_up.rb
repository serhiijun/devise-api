# frozen_string_literal: true

module Devise
  module Api
    module ResourceOwnerService
      class SignUp < Devise::Api::BaseService
        option :params, type: Types::Hash
        option :resource_class, type: Types::Class

        def call
          ActiveRecord::Base.transaction do
            resource_owner = yield create_resource_owner
            devise_api_token = yield call_create_devise_api_token_service(resource_owner)

            Success(devise_api_token)
          end
        end

        private

        def create_resource_owner
          if resource_class.find_by(number: params[:number]).present?
            return Failure(error: :resource_owner_create_error)
          end

          resource_owner = resource_class.new(number: params[:number],
                                              password: params[:password])

          return unless resource_owner.save

          Success(resource_owner)
        end

        def call_create_devise_api_token_service(resource_owner)
          Devise::Api::TokensService::Create.new(resource_owner: resource_owner).call
        end
      end
    end
  end
end
