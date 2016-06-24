# == Schema Information
#
# Table name: captains
#
#  id         :integer          not null, primary key
#  name       :string
#  admiral    :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Captain < ActiveRecord::Base
  has_many :boats
  has_many :classifications, through: :boats

  def self.catamaran_operators
    joins(:classifications).where("classifications.name = 'Catamaran'")
  end

  def self.sailors
    joins(:classifications).where("classifications.name = 'Sailboat'").distinct
    
  end

  def self.motorboats
    joins(:classifications).where("classifications.name = 'Motorboat'").distinct
  end

  def self.talented_seamen
    where(:id => sailors&motorboats)
  end

  def self.non_sailors
    joins(:classifications).where.not(:id => sailors).distinct
  end
end
