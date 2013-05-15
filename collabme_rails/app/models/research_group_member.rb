class ResearchGroupMember < ActiveRecord::Base
  belongs_to :group
  belongs_to :researcher
end
