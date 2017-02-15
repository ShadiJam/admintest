class User < ApplicationRecord
  before_create :add_to_list
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def add_to_list
    list_id = ENV['LIST_ID']
    @gb = Gibbon::Request.new
    subscribe = @gb.lists(list_id).members.create(body: { email_address: self.email, status: 'subscribed', double_optin: false })
  end

end
