class AddtionalPlan < ApplicationRecord

  belongs_to :order, optional: true
end
