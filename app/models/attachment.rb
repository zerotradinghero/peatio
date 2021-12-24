
class Attachment < ActiveRecord::Base
  belongs_to :object, polymorphic: true
end