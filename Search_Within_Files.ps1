# This script will find text within any filetype (specifically set to doc/docx and txt). It will open the files in Word and then close Word when finished running through them.
# You'll want to change your location to search and your query text on lines 10 and 11, other than that nothing needs to be modified in order for the script to run.
# Be wary that this script will OPEN each file and scan through it at a pretty fast speed, but the opening and closing of files is normal although maybe not intentional.

Write-Verbose -Message "Searching for that file you need help finding" -Verbose
$confirmation = Read-Host "Do you want to continue running the script? You can put y/n or yes or no."
if ($confirmation -eq 'y') {
    # proceed
}
$directoryToSearch = 'C:\Users\'
$lookingfor = 'Tierney'
$word = New-Object -ComObject Word.Application
Get-ChildItem -Path $directoryToSearch -Include "*.doc*", "*.txt" -Recurse | foreach-object {
  $file = $_.FullName
  if ($_.FullName.SubString(5) -match '.docx') {
    if ($word.Documents.Open($file).Content.Find.Execute($lookingfor)) {
      write-host WARNING: $_.FullName contains $lookingfor
    }
    $word.Application.ActiveDocument.Close()
  } else {
    if ((Get-Content $file | %{$_ -match $lookingfor }) -contains $true) {
        write-host WARNING: $_.FullName contains $lookingfor
        #Add-Content c:\Users\lords\Downloads\log.txt WARNING: $_.FullName contains $lookingfor
    }
  }
}
$word.Application.quit(0)

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
