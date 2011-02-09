use inc::Module::Install;
name 'ShipIt-Step-Faebook';
all_from 'lib/ShipIt/Step/Faebook.pm';
readme_from 'lib/ShipIt/Step/Faebook.pm';
readme_markdown_from 'lib/ShipIt/Step/Faebook.pm';
githubmeta;

# requires '';

tests 't/*.t';
author_tests 'xt';

build_requires 'Test::More';
auto_set_repository;
auto_include;
WriteAll;
