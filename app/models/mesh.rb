class Mesh < ActiveRecord::Base
  has_many :revisions
  has_attached_file :file
  has_attached_file :normal
  has_attached_file :diffuse
end
