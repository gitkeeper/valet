Feature: Prefix Filenames

  In order to reduce the effort and time needed to rename files manually
  As a project manager
  I want to prepend prefixes to multiple filenames all at once

  Background:
    Given an empty file named "221216_Minutes.pdf"
    And an empty file named "221206_Mail Excerpt.pdf"
    And an empty file named "Project Overview.xlsx"
    And an empty file named "Presentations/Presentation.pptx"
    And an empty file named "Presentations/Presentation.pdf"

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
      | Presentations/123_Presentation.pptx |
      | Presentations/123_Presentation.pdf  |

  Scenario: Print the renamed files to STDOUT if in `--verbose` mode
    When I successfully run `valet prefix --verbose 123_ *.pdf`
    Then the stdout should contain all of these lines:
      | mv 221216_Minutes.pdf ./123_221216_Minutes.pdf           |
      | mv 221206_Mail Excerpt.pdf ./123_221206_Mail Excerpt.pdf |
    And the following files should exist:
      | 123_221216_Minutes.pdf      |
      | 123_221206_Mail Excerpt.pdf |
      | Project Overview.xlsx       |

  Scenario: Do a dry run for a batch rename if in `--dry`mode
    When I successfully run `valet prefix --dry-run 123_ *.pdf`
    Then the following files should not exist:
      | 123_221216_Minutes.pdf      |
      | 123_221206_Mail Excerpt.pdf |

  Scenario: Prefix one file with its timestamp in format `%y%m%d` (six digits)
            according to the file's modification time
    When I successfully run `valet prefix --timestamp 123_ "Project Overview.xlsx"`
    Then the file matching %r<123_\d{6}_Project Overview\.xlsx> should exist

  Scenario: Prefix multiple PowerPoint files with their respective timestamps
    When I successfully run `valet prefix --timestamp 123_ Presentations/*`
    Then the file matching %r<123_\d{6}_Presentation.pptx> should exist
    And the file matching %r<123_\d{6}_Presentation.pdf> should exist
