require 'redmine'

Redmine::Plugin.register :redmine_remove_menus do
  name 'Remove Menus'
  author 'Eric Davis'
  url 'https://projects.littlestreamsoftware.com/projects/redmine-misc'
  author_url 'http://www.littlestreamsoftware.com'
  description 'Removes menus from Redmine'
  version '0.1.0'

  requires_redmine :version_or_higher => '0.9.0'
end
