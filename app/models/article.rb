class Article < ApplicationRecord
  searchkick
  belongs_to :portal_source
end
