# PSSoltra
PowerShell for the Soltra Edge REST API

# Installation
You can clone this repository to manually import PSSoltra, or install from the **[PowerShell Gallery](https://www.powershellgallery.com/packages/PSSoltra)**:\
`PS> Install-Module -Name PSSoltra`

Once installed, you can begin running PSSoltra commands once you `Import-Module -Name PSSoltra`.

## Requirements
Requires **[PowerShell 5.1+](https://github.com/PowerShell/PowerShell#get-powershell)**

# Credentials
In order to interact with the Soltra APIs, you need a valid username and **[API Key](https://members.nhisac.org/plugin/rest_api/config/)**.
If you have previously exported your credentials into `$Home\Soltra.cred`, they will be automatically imported
when you import the PSSoltra module from the `$Home` directory.

## Exporting Credentials
You can save your credentials using the `ExportCred()` method, which will prompt you for your Key (username)
and Secret (password). Once input, the credentials will be exported as `.\Soltra.cred`. If you move the
credentials to your home directory, they will be automatically imported when PSSoltra is loaded.

This exported file is designed to be used only by the user that created it, on the device that it was created on.
Attemping to copy this file to a different device or importing it into PSSoltra under a different user account
will fail. **[Learn more about encrypted credentials here](https://adamtheautomator.com/powershell-export-xml/#Saving_an_Encrypted_Credential)**.

```powershell
PS> $Soltra.ExportCred()
```
**WARNING**: This exported file is encrypted on Windows, but it is not encrypted on MacOS or Linux. Credential
handling in PSSoltra is provided for convenience and not security.

## Importing Credentials
You can rename these files to save different credential sets and import them using the `.ImportCred()`
method. When importing credentials you only need to specify the name of the file, as it will be imported from
the local path and default to using the `.cred` extension.

```powershell
PS> $Soltra.ImportCred('Example')
Imported Example.cred
```

# Usage
You can list all available commands through `Get-Module -Name PSSoltra` once the module has
been imported. Using the `-Help` parameter with any command will show the available parameters and
a brief description.

# Commands
The commands in PSSoltra are currently limited to searching for STIX objects. Other endpoints have been
partially built out, but require permissions I did not have in order to test functionality.

## Account
**Get-SoltraRelated**:\
Get all related objects from a STIX object
```
-Id [String] (Required)
    STIX Id
```

**Get-SoltraStix**:\
Search STIX
```
-Ns [String]
    Namespace to search

-Month [Int32] <1-12>
    Two digit month

-Skip [String]
    Position to begin retrieving results

-Day [Int32] <1-31>
    Two digit day

-Year [Int32] <1970-9999>
    Four digit year

-Type [String] <ind, obs, act, ttp, cam, inc, coa, tgt, pkg>
    Short form STIX types

-Query [String]
    A full text search query field

-Tlp [String] <none, white, green, amber, red>
    TLP color ('white', 'green', 'amber','red')

-Subtype [String]
    Indicator STIX types ('IP Watchlist')
```

Retrieve a single STIX object
```
-Id [String] (Required)
    STIX Id

-Skip [String]
    Position to begin retrieving results
```
