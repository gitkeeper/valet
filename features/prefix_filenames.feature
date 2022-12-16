Feature: Prefix Filenames

  In order to reduce the effort and time needed to rename files manually
  As a project manager
  I want to prepend prefixes to multiple filenames all at once

  Background:
    Given an empty file named "221216_Minutes.pdf"
    And an empty file named "221206_Mail Excerpt.pdf"
    And an empty file named "Project Overview.xlsx"
    And an empty file named "Presentations/221215_Presentation.pptx"
    And an empty file named "Presentations/221215_Presentation.pdf"

  Scenario: Prefix one file with a given project number
    When I successfully run `valet prefix 123_ 221216_Minutes.pdf`
    Then the following files should exist:
      | 123_221216_Minutes.pdf  |
      | 221206_Mail Excerpt.pdf |
      | Project Overview.xlsx   |
    And a file named "221216_Minutes.pdf" should not exist anymore

  Scenario: Prefix multiple files with a given project number
    When I successfully run `valet prefix 123_ *`
    Then the following files should exist:
      | 123_221216_Minutes.pdf      |
      | 123_Project Overview.xlsx   |
      | 123_221206_Mail Excerpt.pdf |

  Scenario: Prefix only PDF files with a given project number
    When I successfully run `valet prefix 123_ *.pdf`
    Then the following files should exist:
      | 123_221216_Minutes.pdf      |
      | 123_221206_Mail Excerpt.pdf |
      | Project Overview.xlsx       |

  Scenario: Prefix multiple files recursively with a given project number
    When I successfully run `valet prefix 123_ **/*`
    Then the following files should exist:
      | 123_221216_Minutes.pdf                     |
      | 123_Project Overview.xlsx                  |
      | 123_221206_Mail Excerpt.pdf                |
      | Presentations/123_221215_Presentation.pptx |
      | Presentations/123_221215_Presentation.pdf  |

  @wip
  Scenario: Print the renamed files to STDOUT if in verbose mode

  @wip
  Scenario: Prefix one file with its timestamp

  @wip
  Scenario: Prefix multiple files with their respective timestamps
