class Url < ActiveRecord::Base
  attr_accessible :alias, :url

  # validates_format_of :url, :with => URI::regexp(%w(http https))
  before_save :create_alias

  def create_alias
  	self.alias = rand(36**6).to_s(36)
  end

end
