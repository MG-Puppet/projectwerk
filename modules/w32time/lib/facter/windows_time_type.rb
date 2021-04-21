Facter.add('windows_time_type') do
  confine :osfamily => :windows
  setcode do
    begin
      value = nil
	  Win32::Registry::HKEY_LOCAL_MACHINE.open('SYSTEM\CurrentControlSet\Services\W32Time\Parameters') do |regkey|
	    value = regkey['type']
	  end
	  value
    rescue
      nil
    end
  end
end
