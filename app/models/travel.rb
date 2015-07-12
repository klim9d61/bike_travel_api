class Travel < ActiveRecord::Base

  belongs_to :travel_category

  scope :visible, lambda { where(:visible => true) }
  scope :invisible, lambda { where(:visible => false) }

  validates :name, presence: true

end
