@wip
Feature: Version (--version)

  In order to check Valet's version and legal information
  As a software developer and user of Valet
  I want to print out its version summary

  The version summary should look like this:

    Valet 1.2.3
    Copyright (c) 2012 Alexander Baumann
    License: <http://www.opensource.org/licenses/MIT> MIT License

    Written by Alexander Baumann

  GNU Coding Standards:
  http://www.gnu.org/prep/standards/standards.html#g_t_002d_002dversion

  Scenario: The global `--version` option prints out the summary
  Scenario: Other commands, options and operands are ignored
