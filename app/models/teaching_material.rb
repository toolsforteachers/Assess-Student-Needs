class TeachingMaterial < ActiveRecord::Base
  attachment :file
  belongs_to :attachable, polymorphic: true
end
