Feature: Version

  In order to check Valet's version and legal information
  As a software developer
  I want to print out its version summary

  A version summary may look like this:

    Valet 1.2.3
    Copyright (c) 2012 Alexander Baumann
    License: <http://www.opensource.org/licenses/MIT> MIT License

  GNU Coding Standards:
  http://www.gnu.org/prep/standards/standards.html#g_t_002d_002dversion

  Scenario: Print out version summary
    When I successfully run `valet --version`
    Then the output should match:
      """
      Valet \d+\.\d+\.\d+(\.rc\d+)?
      Copyright \(c\) \d{4}(-\d{4})? Alexander Baumann
      License: <http://www\.opensource\.org/licenses/MIT> MIT License
      """

  Scenario: Other commands, options and operands are ignored
    When I successfully run `valet command --option operand --version`
    Then the output should match:
      """
      Valet \d+\.\d+\.\d+(\.rc\d+)?
      Copyright \(c\) \d{4}(-\d{4})? Alexander Baumann
      License: <http://www\.opensource\.org/licenses/MIT> MIT License
      """
