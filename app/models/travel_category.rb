class TravelCategory < ActiveRecord::Base

  # belongs_to :subject
  has_many :travels

  scope :visible, lambda { where(:visible => true) }
  scope :invisible, lambda { where(:visible => false) }

end
