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

REMOVE_MENUS_CONFIGURATION_FILE = File.dirname(__FILE__) + "/../../../config/remove_menus.yml"

if File.exists? REMOVE_MENUS_CONFIGURATION_FILE
  remove_menus = YAML.load(File.read(REMOVE_MENUS_CONFIGURATION_FILE))

  remove_menus.each do |menu_name, items_to_remove|
    Redmine::MenuManager.map menu_name.to_sym do |menu|
      items_to_remove.each do |item|
        menu.delete(item.to_sym)
      end
    end
    
  end
else
  puts "Missing Remove Menus Configuration file.  Please create a 'config/remove_menus.yml' file."
end
