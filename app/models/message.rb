class Message < ApplicationRecord

  belongs_to :p2p_order
  has_many :attachments, as: :object

  after_create :send_notification
  def send_notification
    Pusher.trigger "vpex-p2p-development", "new", self.as_json
  end
end