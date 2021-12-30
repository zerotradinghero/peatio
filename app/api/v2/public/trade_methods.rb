# encoding: UTF-8
# frozen_string_literal: true

module API::V2
  module Public
    class TradeMethods < Grape::API
      helpers ::API::V2::ParamHelpers

      #------------------------------------------------------
      desc 'List Trade Methods',
           is_array: true,
           success: API::V2::Entities::TradeMethod
      params do
      end
      get '/trade_methods' do
        trade_methods = TradeMethod.all.page(params[:page] || 1).per(params[:limit] || 15)
        present :data, trade_methods, with: API::V2::Entities::TradeMethod
        present :total, TradeMethod.all.count
      end
    end
  end
end
