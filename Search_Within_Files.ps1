# You'll want to change your location to search and your query text on line 9, other than that nothing needs to be modified in order for the script to run.
# Be wary that this script will OPEN each file and scan through it at a pretty fast speed, but the opening and closing of files is normal although maybe not intentional.

Write-Verbose -Message "Searching for that file you need help finding" -Verbose
$confirmation = Read-Host "Do you wanna continue running the script or not? You can put y/n or yes or no and it will run"
if ($confirmation -eq 'y') {
    # proceed
}
Get-ChildItem "C:\Users\" -recurse | Where-Object {$_.name -match "Your Query Here"} | foreach-object {write-host $_.FullName}

$msgBoxInput = [System.Windows.MessageBox]::Show('Did it work?','Hope you found the file!','YesNoCancel','Question')
 
  switch  ($msgBoxInput) {

  'Yes' {

  [System.Windows.MessageBox]::Show('Wooh!','Success!')

  }

  'No' {

  [System.Windows.MessageBox]::Show('Dang...','Failure')

  }

  'Cancel' {

  ##

  }

  }