def get_first_name_of_season_winner(data, season)
  winner_name = ""
  name_holder = ""

  data.each do |season_num, season_attributes|
    if season_num.to_s == season
      season_attributes[0].each do |attribute_name, attribute_value|
        if attribute_name.to_s == "name"
          name_holder = attribute_value
        end
        if attribute_value == "Winner"
          winner_name = name_holder
        end
      end
    end
  end
  winner_name.partition(" ").first
end

def get_contestant_name(data, occupation)
  target_name = ""
  name_holder = ""

  data.each do |season, season_data|
    season_data.each do |contestants, value|
      contestants.each do |contestants_attr, contestants_value|
        if contestants_attr.to_s == "name"
          name_holder = contestants_value
        end
        if contestants_value == occupation
          target_name = name_holder
        end
      end
    end
  end

  target_name
end

def count_contestants_by_hometown(data, hometown)
  count = 0

  data.each do |season, season_data|
    season_data.each do |contestants, value|
      contestants.each do |contestants_attr, contestants_value|
        if contestants_value == hometown
          count += 1
        end
      end
    end
  end

  count
end

def get_occupation(data, hometown)
  flag = false
  occupation = ""

  data.each do |season, contestants|
    contestants.each do |contestant|
      contestant.each do |contestant_attr, contestant_value|
        if contestant_value == hometown
          flag = true
        end
        if contestant_attr == "occupation" && flag == true
          occupation = contestant_value
          return occupation
        end
      end
    end
  end
end

def get_average_age_for_season(data, season)
  total = 0.0
  count = 0.0
  average = 0.0

  data.each do |season_name, contestants|
    if season_name.to_s == season
      contestants.each do |contestant|
        contestant.each do |contestant_attr, contestant_value|
          if contestant_attr.to_s == "age"
            total += contestant_value.to_f
            count += 1
          end
        end
      end
    end
  end
  average = total / count
  average.round
end
