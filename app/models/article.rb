class Article < ApplicationRecord
  searchkick callbacks: :async
  belongs_to :portal_source
  #default_scope { order(created_at: :desc) }
end
