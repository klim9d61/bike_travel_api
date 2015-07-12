class ReviewCategory < ActiveRecord::Base

  # belongs_to :subject
  has_many :reviews

  scope :visible, lambda { where(:visible => true) }
  scope :invisible, lambda { where(:visible => false) }

end
