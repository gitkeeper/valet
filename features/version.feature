Feature: Version

  In order to check an application's version and legal information
  As a software developer
  I want to print out its version summary

  A complete version summary may look like this:

    Valet 1.2.3
    Copyright (c) 2012 Alexander Baumann
    License: <http://www.opensource.org/licenses/MIT> MIT License

  GNU Coding Standards:
  http://www.gnu.org/prep/standards/standards.html#g_t_002d_002dversion

  Scenario: Print out application name
    Given a command-line interface named "name.rb" with:
      """
      self.name = 'Backup'
      """
    When I successfully run the script `name.rb`
    Then the stdout should contain "Backup"

  Scenario: Print out application name and version
    Given a command-line interface named "name_and_version.rb" with:
      """
      self.name = 'Backup'
      self.version = '1.2.3'
      """
    When I successfully run the script `name_and_version.rb`
    Then the stdout should contain "Backup 1.2.3"

  Scenario: Print out copyright notice
    Given an empty command-line interface named "copyright.rb"
    When I successfully run the script `copyright.rb`
    Then the stdout should contain:
      """
      Copyright (C) 2007 Free Software Foundation, Inc.
      """

  Scenario: Print out legal status
    Given an empty command-line interface named "legal_status.rb"
    When I successfully run the script `legal_status.rb`
    Then the stdout should contain:
      """
      License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
      This is free software: you are free to change and redistribute it.
      There is NO WARRANTY, to the extent permitted by law.
      """

  Scenario: Print out application name, version, copyright and legal status
    Given a command-line interface named "version.rb" with:
      """
      self.name = 'Backup'
      self.version = '1.2.3'
      """
    When I successfully run the script `version.rb`
    Then the stdout should contain exactly:
      """
      Backup 1.2.3
      Copyright (C) 2007 Free Software Foundation, Inc.
      License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
      This is free software: you are free to change and redistribute it.
      There is NO WARRANTY, to the extent permitted by law.
      """

  @wip
  Scenario: Print out humanized file name if no application name is set

  @wip
  Scenario: Other commands, options and operands are ignored
