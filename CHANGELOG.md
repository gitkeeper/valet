## 0.2.0 (December 17, 2022)

Features:

- Added a command-line interface (CLI) for Valet, powered by Thor.
- Added a prefix command to batch rename a pattern of files with the options of
  `--verbose`, `--dry-run` and `--timestamp`.

Changes:

- Added runtime dependency for **Thor** and **Rake** (particularly for FileList)

## 0.1.1 (December 12, 2022)

Features:

- Added **Thor** gem for building self-documenting command line utilities
- Added **Cucumber** and **Aruba** gem for automated features testing
- Added **YARD** gem, including `.yardopts`, for documentation purposes
- Added this `CHANGELOG.md` to document version changes, sorted by: features,
  changes, bugfixes, notes, breaking changes and deprecations

Changes:

- Added more **RSpec** settings (`--warning`, `--order random`) to .rspec
- Complemented **Rake** tasks for **Cucumber** and **YARD**

## 0.1.0 (December 7, 2022)

Features:

- Specified `valet.gemspec` to include all necessary metadata for **RubyGems**  
- Added **RSpec** for automated unit testing
- Added **Rubocop** for static code analyzing and code formatting

Note:

- Initial commit for **Valet**, a humble servant for everyday office tasks
