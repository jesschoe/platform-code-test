require 'award'

def update_quality(awards)
  awards.each do |award|
    case award.name
    when 'Blue First'
      award.update_blue_first
    when 'Blue Compare'
      award.update_blue_compare
    when 'Blue Star'
      award.update_blue_star
    when 'Blue Distinction Plus'
      award.update_blue_distinction_plus
    else 
      award.update_normal_award
    end

    if award.name != 'Blue Distinction Plus'
      award.update_expires_in
    end
  end
end
