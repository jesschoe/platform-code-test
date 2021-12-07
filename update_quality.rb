require 'award'

def update_quality(awards)
  awards.each do |award|
    case award.name
    when 'Blue First'
      award.blue_first
    when 'Blue Compare'
      award.blue_compare
    when 'Blue Star'
      award.blue_star
    when 'Blue Distinction Plus'
      award.blue_distinction_plus
    else 
      award.normal_award
    end

    if award.name != 'Blue Distinction Plus'
      award.expires_in -= 1
    end
  end
end
