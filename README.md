# PowerShell-Scripts
General purpose PowerShell scripts that I've created for various uses.
As these are just Powershell cmdlets that I've organized a certain way, they are free to copy and use if you happen to have a use-case for one.
#
<b>How to run:</b>
If you've never ran a Powershell script before, you'll need to enable Powershell to execute them with the following command
```
Set-ExecutionPolicy Bypass
```
There are a few options available for the Execution Policy as listed below

AllSigned |
Bypass |
Default |
RemoteSigned |
Restricted |
Undefined |
Unrestricted

Bypass will let us run anything without it being signed, including any old script you find off of Github. Be sure to thoroughly check through a script before running it to make sure you have a clear idea of what actions it is going to perform.

To maintain security / follow best practices, you can run Set-ExecutionPolicy again with AllSigned once you're done running any unsigned scripts.
