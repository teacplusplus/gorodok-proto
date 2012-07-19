[Time, DateTime].each do |c| c.class_eval do
  def to_local
    strftime "%Y.%m.%d %H:%M"
  end
  def time_code
    hour*60+min
  end
  def self.today_at hours,minutes
    now = DateTime.now
    DateTime.new(now.year, now.month, now.day, hours, minutes, 0, 0)
  end
  def self.total_hours from, to
    ((to - from - 0.5)/3600).to_i + 1
  end
end end
