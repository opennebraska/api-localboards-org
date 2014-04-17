class ApiKey < ActiveRecord::Base
  attr_accessible :key, :user_id, :active, :application_url
  belongs_to :user

  before_create :generate_api_key
  before_save :prevent_reactivating

  validates_presence_of :application_url

  def prevent_reactivating
    return false if (self.active_was == false && self.active == true)
  end

  def generate_api_key 
    begin 
        key = new_key
    end while !ApiKey.where(key: key).count == 0
    self.key = new_key
  end
  
  def whitelisted_sites
    self.application_url.split(",").map(&:strip)
  end

  private

  def new_key
    Array.new(14){[*'0'..'9', *'a'..'z', *'A'..'Z'].sample}.join
  end
end
