class GuideCategory < ActiveRecord::Base

  # belongs_to :subject
  has_many :guides

  scope :visible, lambda { where(:visible => true) }
  scope :invisible, lambda { where(:visible => false) }

end
