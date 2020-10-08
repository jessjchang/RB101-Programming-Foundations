munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name, data_hash|
  case data_hash['age']
  when (0..17)
    data_hash['age_group'] = 'kid'
  when (18..64)
    data_hash['age_group'] = 'adult'
  else
    data_hash['age_group'] = 'senior'
  end
end

p munsters