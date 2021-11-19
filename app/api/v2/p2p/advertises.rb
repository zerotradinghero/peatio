# encoding: UTF-8
# frozen_string_literal: true

module API::V2
  module P2p
    class Advertises < Grape::API
      # include API::V2::Entities::Advertis
      # desc 'Get all Advertis'
      get '/advertises' do
        Advertis.all
      end
    end
  end
end
