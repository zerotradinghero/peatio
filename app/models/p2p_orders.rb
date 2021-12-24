# frozen_string_literal: true

class P2pOrder < ApplicationRecord
  belongs_to :advertisement
  belongs_to :payment_method
  belongs_to :advertisement_payment_methods
  belongs_to :member

  enum status: [:ordered, :transfer, :paid, :complete, :cancel]
  enum p2p_orders_type: [:sell, :buy]
  before_update :update_coin

  def update_coin
    if status_changed? && paid?
      successful_p2porder_transfer
    end
  end

  def self.build_order(params, advertis, current_user)
    order = new(params)
    order.price = advertis.price if advertis.fixed?
    order.ammount = order.number_of_coin * order.price * ((advertis.price_percent || 100)/100)
    order.order_number = SecureRandom.hex(6)
    order.member_id = current_user.id
    order
  end

  def send_message(message, member)
    url = URI('http://barong:8001/api/v2/management/phones/send')

    Net::HTTP.start(url.host, url.port, use_ssl: false) do |http|
      request = Net::HTTP::Post.new(url, 'Content-Type' => 'application/json')
      request.body = generate_jwt_management({ uid: member.uid, content: message })
      response = http.request request
      response.body
    end
  end

  def send_message_status
    if paid?
      message = order_number + "is the paid"
    elsif transfer?
      message = order_number + "is the transfer"
    elsif cancel?
      message = order_number + "is the cancel"
    end
    send_message(message, advertisement.creator)
  end

  def successful_p2porder_transfer
    user_advertisement = advertisement.creator.accounts.where(currency_id: advertisement.currency_id).first
    user_order = member.accounts.where(currency_id: advertisement.currency_id).first

    if sell?
      unless user_order
        user_order = Account.create(member_id: advertisement.creator, currency_id: advertisement.currency_id, type: "spot")
      end

      user_advertisement.sub_fund(number_of_coin)
      user_order.add_fund(number_of_coin)

    elsif buy?
      if number_of_coin > user_order.try(:locked)
        return puts "your total coin is not enough to buy"
      end

      user_order.sub_fund(number_of_coin)
      user_advertisement.add_fund(number_of_coin)
    end
    update(status: :complete, claim_status: :approve)
  end

  def reason_claim
    if sell?
      [
        "Tôi đã thanh toán, nhưng người bán không chuyển tiền điện tử",
        "Trả thêm tiền cho người bán",
        "Khác"
      ]
    else
      [
        "Tôi đã nhận được thanh toán từ người mua, nhưng số tiền không chính xác",
        "Người mua đã xác nhận là đã thanh toán nhưng tôi không nhận được thanh toán vào tài khoản của mình",
        "Tôi đã nhận được thanh toán từ tài khoản của bên thứ ba",
        "Khác"
      ]
    end
  end

  def total
    ammount
  end

  def amount
    ammount
  end

end
