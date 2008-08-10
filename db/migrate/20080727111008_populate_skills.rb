class PopulateSkills < ActiveRecord::Migration
  def self.up
    a = {"Tomcat"=>nil, "JUnit"=>nil, "Oracle"=>nil, "UI"=>nil, "RPG"=>nil, "MySql"=>nil, "Cake"=> nil, "Objective-C"=>"ObjC, Obj-C", "Java"=>nil, "Turbo Pascal"=>nil, "MATLAB"=>nil, "NewtonScript"=>nil, "PowerShell"=>nil, "ABAP"=>nil, "JDK"=>nil, "Test case design"=>nil, "Scripting"=>nil, "LDAP"=>nil, "XML"=>nil, "HTML"=>nil, "PL/SQL"=>nil, "Lisp"=>nil, "Fortran"=>nil, "LabVIEW"=>nil, "C++"=>nil, "Hibernate"=>nil, "CSS"=>nil, "Spring"=>nil, "Euphoria"=>nil, "Ajax"=>nil, "APL"=>nil, "Erlang"=>nil, "BASIC"=>nil, "MS SQL"=>nil, "Access"=>nil, "ML"=>nil, "Tcl/Tk"=>nil, "Siebel"=>nil, "Caml"=>nil, "VB.NET"=>nil, "Awk"=>nil, "J2SE"=>nil, "JSP"=>nil, "Symfony"=>nil, "Smalltalk"=>nil, "Oracle web server"=>nil, "C#"=>nil, ".Net"=>nil, "COBOL"=>nil, "FoxPro"=>nil, "Visual Basic"=>"VB, VBScript, VB6", "Prolog"=>nil, "Lua"=>nil, "Cognos"=>nil, "xBase"=>nil, "Perl"=>nil, "Ruby on Rails"=>"Rails", "C"=>nil, "PHP"=>"PHP3, PHP4, PHP5, PHP/FI", "ASP.NET"=>nil, "Java Servlets"=>nil, "SAP web server"=>nil, "SAS"=>nil, "J2ME"=>nil, "Transact-SQL"=>nil, "Apache"=>nil, "ActionScript"=>nil, "Automated software testing"=>nil, "Bourne shell"=>nil, "PL/I"=>nil, "Eclipse"=>nil, "Agile"=>nil, "PeopleSoft"=>nil, "Groovy"=>nil, "JavaScript"=>nil, "JBoss"=>nil, "REXX"=>nil, "Sun web server"=>nil, "Haksell"=>nil, "WebSphere"=>nil, "Logo"=>nil, "DHTML"=>nil, "XHTML"=>nil, "Scriptalicious"=>nil, "Delphi"=>nil, "J2EE"=>nil, "Manual software testing"=>nil, "SQlite"=>nil, "Zend"=>nil, "Scheme"=>nil, "Ada"=>nil, "Python"=>nil, "Java Beans"=>nil, "Ruby"=>nil}


    a.each_pair do |skill, synonyms|
    temp = Skill.new
    temp.name = skill
    temp.other_names = synonyms unless synonyms.nil?
    temp.save
    end
  end

  def self.down
  end
end
