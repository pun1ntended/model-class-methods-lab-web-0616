# == Schema Information
#
# Table name: boat_classifications
#
#  id                :integer          not null, primary key
#  boat_id           :integer
#  classification_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class BoatClassification < ActiveRecord::Base
  belongs_to :boat
  belongs_to :classification
end
