Given /^there are "(\d+)" objects in "(.+)"$/ do |count, model|
  assert model.constantize.count === count.to_i
end
