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

      desc 'Check OPT'
      params do
        requires :otp,
                 type: { value: Integer, message: 'account.beneficiary.non_integer_otp' },
                 allow_blank: false,
                 desc: 'OTP to perform action'
      end
      get '/otp/check' do
        unless Vault::TOTP.validate?(current_user.uid, params[:otp])
          return error!({ errors: ['account.withdraw.invalid_otp'] }, 422)
        end
        present :status, 200
      end
    end
  end
end

