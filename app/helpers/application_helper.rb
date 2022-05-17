module ApplicationHelper
  def inclination(count, one, many)
    (count > 1) ? (return many) : (return one)
  end
end
