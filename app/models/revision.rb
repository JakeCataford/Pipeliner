class Revision < ActiveRecord::Base
  belongs_to :model
  belongs_to :mesh
end
