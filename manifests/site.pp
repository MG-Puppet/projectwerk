node 'srv19-dc1.mitchell.test' {

   include chocolatey
   include ssh
}

node 'w10-puppet' {

  include chocolatey
  
  include ssh

}

node 'centos-agent.mitchell.test' {

  include ssh  

}

node 'ubnt-agent.mitchell.test' {

  include ssh

}
