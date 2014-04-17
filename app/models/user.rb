class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :approved
  # attr_accessible :title, :body

  has_many :api_keys
  after_save :create_api_key_after_approval

  before_destroy :deactivate_api_keys

  def deactivate_api_keys
    self.api_keys.each{|k| k.update_attributes(active: false)}
  end

  def email_required?
		false
  end

  def create_api_key_after_approval
    if self.approved?
      create_api_key
    end
  end

  private

  def create_api_key
    ApiKey.create(user_id: self.id, active: true)
  end
end
