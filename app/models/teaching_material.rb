class TeachingMaterial < ActiveRecord::Base
  belongs_to :attachable, polymorphic: true
end
