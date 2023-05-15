module ApplicationHelper
  def icons_for_skills(skill)
    case skill
    when "Carpenter"
      '<i class="fas fa-hammer"></i> '.html_safe
    when "Plumber"
      '<i class="fas fa-wrench"></i> '.html_safe
    when "Blacksmith"
      '<i class="fas fa-weight-hanging"></i> '.html_safe
    when "Electrician"
      '<i class="fas fa-bolt"></i> '.html_safe
    when "Gasfitter"
      '<i class="fas fa-dumpster-fire"></i> '.html_safe
    when "Turner"
      '<i class="fas fa-screwdriver"></i> '.html_safe
    when "Bricklayer"
      '<i class="fas fa-home"></i> '.html_safe
    when "Painter"
      '<i class="fas fa-paint-roller"></i> '.html_safe
    end
  end

  def badges_for_skills(skill)
    case skill
    when "Carpenter"
      "badge p-2 bg-dark"
    when "Plumber"
      "badge p-2 bg-dark"
    when "Blacksmith"
      "badge p-2 bg-dark"
    when "Electrician"
      "badge p-2 bg-dark"
    when "Gasfitter"
      "badge p-2 bg-dark"
    when "Turner"
      "badge p-2 bg-dark"
    when "Bricklayer"
      "badge p-2 bg-dark"
    when "Painter"
      "badge p-2 bg-dark"
    end
  end
end
# %w[Carpenter Plumber Blacksmith Electrician Gasfitter Turner Bricklayer Painter]
