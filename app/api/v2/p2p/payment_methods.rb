# encoding: UTF-8
# frozen_string_literal: true

module API::V2
  module P2p
    class PaymentMethods < Grape::API
      helpers ::API::V2::P2p::NamedParams
      helpers ::API::V2::ParamHelpers

      #------------------------------------------------------
      desc 'List Payment Method',
           is_array: true,
           success: API::V2::P2p::Entities::PaymentMethod
      params do
      end
      get '/payment_methods' do
        payment_methods = current_user.payment_methods
        present payment_methods, with: API::V2::P2p::Entities::PaymentMethod
      end

      #------------------------------------------------------
      desc 'Show a Payment Method',
           is_array: true,
           success: API::V2::P2p::Entities::PaymentMethod
      params do
      end
      get '/payment_method/:id' do
        payment_method = PaymentMethod.find_by(id: params[:id], member_id: current_user.id)
        return error!({ errors: ['payment_method.not_found!'] }, 404) unless payment_method

        present payment_method, with: API::V2::P2p::Entities::PaymentMethod
      end

      #------------------------------------------------------
      desc 'Create Payment Method',
           is_array: true,
           success: API::V2::P2p::Entities::PaymentMethod
      params do
        use :p2p_payment_method
      end

      post '/payment_method' do
        payment_method = current_user.payment_methods.new(params)
        if payment_method.save
          present payment_method, with: API::V2::P2p::Entities::PaymentMethod
        else
          return error!({ errors: ['payment_method.create_failed!'] }, 412)
        end
      end

      #--------------------------------------------------------------------------

      desc 'Update Payment Method',
           is_array: true,
           success: API::V2::P2p::Entities::PaymentMethod
      params do
        use :p2p_edit_payment_method
      end

      put '/payment_method/:id' do
        payment_method = PaymentMethod.find_by(id: params[:id], member_id: current_user.id)
        return error!({ errors: ['payment_method.not_found!'] }, 404) unless payment_method

        if payment_method.update(params)
          present payment_method, with: API::V2::P2p::Entities::PaymentMethod
        else
          error!({ errors: ['payment_method.update_false!'] }, 412)
        end
      end

      #--------------------------------------------------------------------------

      desc 'DELETE Payment Method',
           is_array: true,
           success: API::V2::P2p::Entities::PaymentMethod
      params do

      end

      delete '/payment_method/:id' do
        payment_method = PaymentMethod.find_by(id: params[:id], member_id: current_user.id)
        return error!({ errors: ['payment_method.not_found!'] }, 404) unless payment_method

        payment_method.destroy!
        present "destroy success"
      end
    end
  end
end
