class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :rememberable
  attr_accessor :email, :password, :password_confirmation, :god_mode, :view_only
end
