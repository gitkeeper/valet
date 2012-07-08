Feature: Version (--version)

  In order to check an application's version and legal information
  As a software developer and user of the application
  I want to print out its version summary

  A complete version summary may look like this:

    Valet 1.2.3
    Copyright (c) 2012 Alexander Baumann
    License: <http://www.opensource.org/licenses/MIT> MIT License

    Written by Alexander Baumann

  GNU Coding Standards:
  http://www.gnu.org/prep/standards/standards.html#g_t_002d_002dversion

  Scenario: Print out application name
    Given a Valet application named "name.rb" with:
      """
      self.name = 'Backup'
      """
    When I successfully run the script `name.rb --version`
    Then the stdout should contain "Backup"

  Scenario: Print out application name and version
    Given a Valet application named "name_and_version.rb" with:
      """
      self.name = 'Backup'
      self.version = '1.2.3'
      """
    When I successfully run the script `name_and_version.rb --version`
    Then the stdout should contain "Backup 1.2.3"

  Scenario: Print out authors
    Given a Valet application named "authors.rb" with:
      """
      self.authors = ['Alexander Baumann', 'Bob the Builder']
      """
    When I successfully run the script `authors.rb --version`
    Then the stdout should contain:
      """
      Written by Alexander Baumann, Bob the Builder
      """

  Scenario: Print out copyright notice
    Given a Valet application named "copyright.rb" with:
      """
      self.copyright = 'Copyright (c) 2012 Free Software Foundation, Inc.'
      """
    When I successfully run the script `copyright.rb --version`
    Then the stdout should contain:
      """
      Copyright (c) 2012 Free Software Foundation, Inc.
      """

  Scenario: Print out legal status
    Given a Valet application named "legal_status.rb" with:
      """
      self.license = <<-LICENSE.gsub(/^ {4}/, '').strip
        License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
        This is free software: You are free to change and redistribute it.
        There is NO WARRANTY, to the extent permitted by law.
      LICENSE
      """
    When I successfully run the script `legal_status.rb --version`
    Then the stdout should contain:
      """
      License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
      This is free software: You are free to change and redistribute it.
      There is NO WARRANTY, to the extent permitted by law.
      """

  Scenario: Print out the complete version summary
    Given a Valet application named "version.rb" with:
      """
      self.name = 'Backup'
      self.version = '1.2.3'
      self.authors = ['Alexander Baumann', 'Bob the Builder']
      self.copyright = 'Copyright (c) 2012 Free Software Foundation, Inc.'
      self.license = <<-LICENSE.gsub(/^ {4}/, '').strip
        License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
        This is free software: You are free to change and redistribute it.
        There is NO WARRANTY, to the extent permitted by law.
      LICENSE
      """
    When I successfully run the script `version.rb --version`
    Then the stdout should contain:
      """
      Backup 1.2.3
      Copyright (c) 2012 Free Software Foundation, Inc.
      License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
      This is free software: You are free to change and redistribute it.
      There is NO WARRANTY, to the extent permitted by law.

      Written by Alexander Baumann, Bob the Builder
      """

  Scenario: Customizable/Overridable version summary template
    Given a file named "templates/version.mustache" with:
      """
      {{name}} {{version}}
      For more information, please visit http://gitkeeper.github.com/valet
      """
    And a Valet application named "custom_version_template.rb" with:
      """
      self.name = 'Backup'
      self.version = '1.2.3'
      """
    When I successfully run the script `custom_version_template.rb --version`
    Then the stdout should contain:
      """
      Backup 1.2.3
      For more information, please visit http://gitkeeper.github.com/valet
      """

  @wip
  Scenario: Other commands, options and operands are ignored
