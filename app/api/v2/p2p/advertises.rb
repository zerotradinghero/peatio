# encoding: UTF-8
# frozen_string_literal: true

module API::V2
  module P2p
    class Advertises < Grape::API
      helpers ::API::V2::ParamHelpers

      desc 'Get all Advertis',
        is_array: true,
        success: API::V2::Entities::Advertisement
      params do
        use :pagination
        optional :advertis_type,
                 type: String,
                 values: { value: %w[sell buy], message: 'public.advertis.invalid_type' },
                 desc: -> { API::V2::Entities::Advertisement.documentation[:advertis_type][:desc] }
        optional :currency_id,
                 type: String
        optional :page,
                 type: String
      end
      get '/advertises' do
        result = Advertisement.send(params[:advertis_type])
        result = result.where(currency_id: params[:currency_id]) if params[:currency_id].present?
        present result.page(params[:page] || 1), with: API::V2::Entities::Advertisement
      end
    end
  end
end
