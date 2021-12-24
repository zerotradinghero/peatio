# encoding: UTF-8
# frozen_string_literal: true

module API::V2
  module P2p
    class Member < Grape::API

      desc 'Member info',
           is_array: true,
           success: API::V2::Entities::P2pOrder
      get '/member/info' do
        present current_user, with: API::V2::P2p::Entities::Member
      end
    end
  end
end

