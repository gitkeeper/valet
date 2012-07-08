Given /^a command-line interface named "([^"]*)" with:$/ do |file_name, file_content|
  write_file(file_name, new_cli(file_content).source)
end
