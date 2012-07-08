@wip
Feature: Help (--help)

  In order to get standard help on how to use the application
  As a software developer and user of the application
  I want to print out its usage with syntax, description, examples, available
  global options and commands

    Usage: ls [OPTION]... [FILE]...
    List information about the FILEs (the current directory by default).
    Sort entries alphabetically if none of -cftuvSUX nor --sort is specified.

    Mandatory arguments to long options are mandatory for short options too.
      -a, --all                do not ignore entries starting with .
      -A, --almost-all         do not list implied . and ..
          --author             with -l, print the author of each file
      -b, --escape             print C-style escapes for nongraphic characters
          --block-size=SIZE    scale sizes by SIZE before printing them.  E.g.,
                                 '--block-size=M' prints sizes in units of
                                 1,048,576 bytes.  See SIZE format below.

                                    (...)

    Report ls bugs to bug-coreutils@gnu.org
    GNU coreutils home page: <http://www.gnu.org/software/coreutils/>
    General help using GNU software: <http://www.gnu.org/gethelp/>
    For complete documentation, run: info coreutils 'ls invocation'

  GNU Coding Standards:
  http://www.gnu.org/prep/standards/standards.html#g_t_002d_002dhelp

  Scenario: Usage and syntax reference
  Scenario: Short description about the application's purpose
  Scenario: List of examples
  Scenario: Available global options
  Scenario: Available sub-commands
  Scenario: Bug reporting address
  Scenario: Application homepage
  Scenario: Other commands, options and operands are ignored
