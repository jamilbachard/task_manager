module TasksHelper
  def priority_style(priority)
    case priority
    when "high" then "bg-red-100 text-red-800"
    when "medium" then "bg-yellow-100 text-yellow-800"
    else "bg-green-100 text-green-800"
    end
  end
end
