class Article < ApplicationRecord
  # searchkick
  belongs_to :portal_source
  default_scope { order(created_at: :desc) }
end
