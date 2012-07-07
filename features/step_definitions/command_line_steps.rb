When /^I successfully run the script `([^`]*)`$/ do |script|
  run_simple("ruby -S #{unescape(script)}")
end
