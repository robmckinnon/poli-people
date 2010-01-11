Given /I am at the Front page/ do
  visit "/"
end

When /^I search for "(.*)"$/ do |postcode_code|
  twfy_result = case postcode_code
    when "AB101AA"
      'Aberdeen North'
    when "BA6 8NJ"
      'Somerton and Frome'
    when "N1 XXX"
      'Unknown postcode, or problem with lookup'
    when "GY1 1AB"
      'Unknown postcode, or problem with lookup'
    else
      raise 'must create a stub for this case'
  end
  
  Uk2010Constituency.stub!(:lookup_new_name).and_return twfy_result
    
  When "I fill in \"pc\" with \"#{postcode_code}\""
  And 'I press "Look up"'
end
