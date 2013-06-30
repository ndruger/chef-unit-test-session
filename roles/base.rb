name "base"
description ""

run_list(
  "hello",
  "recipe[yum::epel]",  
  "recipe[rvm::system]",
  "recipe[java]",
  "recipe[nodejs]",
  "recipe[phantomjs]",
  "recipe[nginx]",
  "recipe[jenkins]",
  "recipe[base-iptables]",
)

default_attributes(
    "rvm" => {
      "rubies" => ["ruby-1.9.3-p429"],
      "default_ruby" => "ruby-1.9.3-p429",
    },
    "phantomjs" => {
      "version" => "1.9.0"
    },
    "nodejs" => {
      "version" => "0.10.10"
    }
)
