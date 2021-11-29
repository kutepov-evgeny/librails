class Comment < ApplicationRecord
  belongs_to :article


  def archived?
    status == 'archived'
  end
end
