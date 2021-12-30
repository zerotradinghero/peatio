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
        if params[:name].present?
          trade_methods = TradeMethod.where("name like ?", params[:name].to_s + '%').order(name: :asc).page(params[:page] || 1).per(params[:limit] || 15)
          present :total, TradeMethod.where("name like ?", params[:name].to_s + '%').count
        else
          trade_methods = TradeMethod.all.page(params[:page] || 1).per(params[:limit] || 15)
          present :total, TradeMethod.all.count
        end
        present :data, trade_methods, with: API::V2::Entities::TradeMethod

      end
    end
  end
end
