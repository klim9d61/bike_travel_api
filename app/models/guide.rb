class Guide < ActiveRecord::Base

  # test.

  belongs_to :guide_category

  scope :visible, lambda { where(:visible => true) }
  scope :invisible, lambda { where(:visible => false) }

end
