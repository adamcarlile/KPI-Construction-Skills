class CourseEvent < ActiveRecord::Base
  belongs_to :course
  has_event_calendar :start_at_field  => 'start_date', :end_at_field => 'finish_date'
  
  named_scope :in_date_range, lambda{|range| { :conditions => ["DATE(start_date) BETWEEN ? AND ?", range.begin.to_date, range.end.to_date] } }
  named_scope :from_today, lambda{{:conditions => ["DATE(start_date) > ?", Time.now.to_date]}}
  
  composed_of :price,
    :class_name => "Money",
    :mapping => [%w(price_cents cents), %w(currency currency_as_string)],
    :constructor => Proc.new { |cents, currency| Money.new(cents || 0, currency || Money.default_currency) },
    :converter => Proc.new { |value| value.respond_to?(:to_money) ? value.to_money : raise(ArgumentError, "Can't convert #{value.class} to Money") }
    
  def name
    title
  end
  
  def to_param
    "#{id}-#{title.parameterize}"
  end
   
end
