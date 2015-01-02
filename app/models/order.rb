class Order < ActiveRecord::Base
  before_save :set_order_number
  has_many :order_lines
  accepts_nested_attributes_for :order_lines, :reject_if => :all_blank, :allow_destroy => true
  
  private
  def set_order_number
    id = Order.last.id+1
    self.order_number = "SO#{"%03d" % id}"
  end
end
