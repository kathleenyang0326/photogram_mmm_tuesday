class User < ApplicationRecord
  # Direct associations

  has_many   :received_friendrequests,
             :class_name => "Friendrequest",
             :foreign_key => "recipient_id",
             :dependent => :destroy

  has_many   :sent_friendrequests,
             :class_name => "Friendrequest",
             :foreign_key => "sender_id",
             :dependent => :destroy

  has_many   :likes,
             :dependent => :destroy

  has_many   :photos,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
