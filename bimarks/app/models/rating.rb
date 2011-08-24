class Rating < ActiveRecord::Base
belongs_to :user, :bookmark
end
