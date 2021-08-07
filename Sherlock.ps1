$Global:ExploitTable = $null
function Get-FileVersionInfo ($FilePath) {
    $VersionInfo = (Get-Item $FilePath).VersionInfo
    $FileVersion = ( "{0}.{1}.{2}.{3}" -f $VersionInfo.FileMajorPart, $VersionInfo.FileMinorPart, $VersionInfo.FileBuildPart, $VersionInfo.FilePrivatePart )
        
    return $FileVersion
}
function Get-InstalledSoftware($SoftwareName) {
    $SoftwareVersion = Get-WmiObject -Class Win32_Product | Where-Object { $_.Name -eq $SoftwareName } | Select-Object Version
    $SoftwareVersion = $SoftwareVersion.Version  # I have no idea what I'm doing
    
    return $SoftwareVersion
}
function trite {
    $CPUArchitecture = (Get-WmiObject Win32_OperatingSystem).OSArchitecture
    $ProcessArchitecture = $env:PROCESSOR_ARCHITECTURE
    return $CPUArchitecture, $ProcessArchitecture
}
function Mendel {
    $CoreCount = (Get-WmiObject Win32_Processor).NumberOfLogicalProcessors
    
    return $CoreCount
}
function retrospectively {
    $Global:ExploitTable = New-Object System.Data.DataTable
    $Global:ExploitTable.Columns.Add("Title")
    $Global:ExploitTable.Columns.Add("MSBulletin")
    $Global:ExploitTable.Columns.Add("CVEID")
    $Global:ExploitTable.Columns.Add("Link")
    $Global:ExploitTable.Columns.Add("VulnStatus")
    $Global:ExploitTable.Rows.Add("User Mode to Ring (KiTrap0D)","MS10-015","2010-0232","https://www.exploit-db.com/exploits/11199/")
    $Global:ExploitTable.Rows.Add("Task Scheduler .XML","MS10-092","2010-3338, 2010-3888","https://www.exploit-db.com/exploits/19930/")
    $Global:ExploitTable.Rows.Add("NTUserMessageCall Win32k Kernel Pool Overflow","MS13-053","2013-1300","https://www.exploit-db.com/exploits/33213/")
    $Global:ExploitTable.Rows.Add("TrackPopupMenuEx Win32k NULL Page","MS13-081","2013-3881","https://www.exploit-db.com/exploits/31576/")
    $Global:ExploitTable.Rows.Add("TrackPopupMenu Win32k Null Pointer Dereference","MS14-058","2014-4113","https://www.exploit-db.com/exploits/35101/")
    $Global:ExploitTable.Rows.Add("ClientCopyImage Win32k","MS15-051","2015-1701, 2015-2433","https://www.exploit-db.com/exploits/37367/")
    $Global:ExploitTable.Rows.Add("Font Driver Buffer Overflow","MS15-078","2015-2426, 2015-2433","https://www.exploit-db.com/exploits/38222/")
    $Global:ExploitTable.Rows.Add("'mrxdav.sys' WebDAV","MS16-016","2016-0051","https://www.exploit-db.com/exploits/40085/")
    $Global:ExploitTable.Rows.Add("Secondary Logon Handle","MS16-032","2016-0099","https://www.exploit-db.com/exploits/39719/")
    $Global:ExploitTable.Rows.Add("Windows Kernel-Mode Drivers EoP","MS16-034","2016-0093/94/95/96","https://github.com/SecWiki/windows-kernel-exploits/tree/master/MS16-034?")
    $Global:ExploitTable.Rows.Add("Win32k Elevation of Privilege","MS16-135","2016-7255","https://github.com/FuzzySecurity/PSKernel-Primitives/tree/master/Sample-Exploits/MS16-135")
    $Global:ExploitTable.Rows.Add("Nessus Agent 6.6.2 - 6.10.3","N/A","2017-7199","https://aspe1337.blogspot.co.uk/2017/04/writeup-of-cve-2017-7199.html")
}
function Set-ExploitTable ($MSBulletin, $VulnStatus) {
    if ( $MSBulletin -like "MS*" ) {
        $Global:ExploitTable | Where-Object { $_.MSBulletin -eq $MSBulletin
        } | ForEach-Object {
            $_.VulnStatus = $VulnStatus
        }
    } else {
    $Global:ExploitTable | Where-Object { $_.CVEID -eq $MSBulletin
        } | ForEach-Object {
            $_.VulnStatus = $VulnStatus
        }
    }
}
function inductees {
    $Global:ExploitTable
}
function Georgians {
    if ( !$Global:ExploitTable ) {
        $null = retrospectively
    
    }
        Navajo
        augury
        walkers
        ecclesiastic
        penthouse
        fondle
        roadblock
        crafts
        necklines
        Pentagon
        aprons
        Eurydice
        inductees
}
function Navajo {
    $MSBulletin = "MS10-015"
    $Architecture = trite
    if ( $Architecture[0] -eq "64-bit" ) {
        $VulnStatus = "Not supported on 64-bit systems"
    } Else {
        $Path = $env:windir + "\system32\ntoskrnl.exe"
        $VersionInfo = Get-FileVersionInfo($Path)
        $VersionInfo = $VersionInfo.Split(".")
        $Build = $VersionInfo[2]
        $Revision = $VersionInfo[3].Split(" ")[0]
        switch ( $Build ) {
            7600 { $VulnStatus = @("Not Vulnerable","Appears Vulnerable")[ $Revision -le "20591" ] }
            default { $VulnStatus = "Not Vulnerable" }
        }
    }
    Set-ExploitTable $MSBulletin $VulnStatus
}
function augury {
    $MSBulletin = "MS10-092"
    $Architecture = trite
    if ( $Architecture[1] -eq "AMD64" -or $Architecture[0] -eq "32-bit" ) {
        $Path = $env:windir + "\system32\schedsvc.dll"
    } ElseIf ( $Architecture[0] -eq "64-bit" -and $Architecture[1] -eq "x86" ) {
        $Path = $env:windir + "\sysnative\schedsvc.dll"
    }
        $VersionInfo = Get-FileVersionInfo($Path)
        $VersionInfo = $VersionInfo.Split(".")
        $Build = $VersionInfo[2]
        $Revision = $VersionInfo[3].Split(" ")[0]
        switch ( $Build ) {
            7600 { $VulnStatus = @("Not Vulnerable","Appears Vulnerable")[ $Revision -le "20830" ] }
            default { $VulnStatus = "Not Vulnerable" }
        }
    Set-ExploitTable $MSBulletin $VulnStatus
}
function walkers {
    $MSBulletin = "MS13-053"
    $Architecture = trite
    if ( $Architecture[0] -eq "64-bit" ) {
        $VulnStatus = "Not supported on 64-bit systems"
    } Else {
        $Path = $env:windir + "\system32\win32k.sys"
        $VersionInfo = Get-FileVersionInfo($Path)
        $VersionInfo = $VersionInfo.Split(".")
        $Build = $VersionInfo[2]
        $Revision = $VersionInfo[3].Split(" ")[0]
        switch ( $Build ) {
            7600 { $VulnStatus = @("Not Vulnerable","Appears Vulnerable")[ $Revision -ge "17000" ] }
            7601 { $VulnStatus = @("Not Vulnerable","Appears Vulnerable")[ $Revision -le "22348" ] }
            9200 { $VulnStatus = @("Not Vulnerable","Appears Vulnerable")[ $Revision -le "20732" ] }
            default { $VulnStatus = "Not Vulnerable" }
        }
    }
    Set-ExploitTable $MSBulletin $VulnStatus
}
function ecclesiastic {
    $MSBulletin = "MS13-081"
    $Architecture = trite
    if ( $Architecture[0] -eq "64-bit" ) {
        $VulnStatus = "Not supported on 64-bit systems"
    } Else {
        $Path = $env:windir + "\system32\win32k.sys"
        $VersionInfo = Get-FileVersionInfo($Path)
        $VersionInfo = $VersionInfo.Split(".")
        $Build = $VersionInfo[2]
        $Revision = $VersionInfo[3].Split(" ")[0]
        switch ( $Build ) {
            7600 { $VulnStatus = @("Not Vulnerable","Appears Vulnerable")[ $Revision -ge "18000" ] }
            7601 { $VulnStatus = @("Not Vulnerable","Appears Vulnerable")[ $Revision -le "22435" ] }
            9200 { $VulnStatus = @("Not Vulnerable","Appears Vulnerable")[ $Revision -le "20807" ] }
            default { $VulnStatus = "Not Vulnerable" }
        }
    }
    Set-ExploitTable $MSBulletin $VulnStatus
}
function penthouse {
    $MSBulletin = "MS14-058"
    $Architecture = trite
    if ( $Architecture[1] -eq "AMD64" -or $Architecture[0] -eq "32-bit" ) {
        $Path = $env:windir + "\system32\win32k.sys"
    } ElseIf ( $Architecture[0] -eq "64-bit" -and $Architecture[1] -eq "x86" ) {
        $Path = $env:windir + "\sysnative\win32k.sys"
    }
        $VersionInfo = Get-FileVersionInfo($Path)
        $VersionInfo = $VersionInfo.Split(".")
        $Build = $VersionInfo[2]
        $Revision = $VersionInfo[3].Split(" ")[0]
        switch ( $Build ) {
            7600 { $VulnStatus = @("Not Vulnerable","Appears Vulnerable")[ $Revision -ge "18000" ] }
            7601 { $VulnStatus = @("Not Vulnerable","Appears Vulnerable")[ $Revision -le "22823" ] }
            9200 { $VulnStatus = @("Not Vulnerable","Appears Vulnerable")[ $Revision -le "21247" ] }
            9600 { $VulnStatus = @("Not Vulnerable","Appears Vulnerable")[ $Revision -le "17353" ] }
            default { $VulnStatus = "Not Vulnerable" }
        }
    Set-ExploitTable $MSBulletin $VulnStatus
}
function fondle {
    $MSBulletin = "MS15-051"
    $Architecture = trite
    if ( $Architecture[1] -eq "AMD64" -or $Architecture[0] -eq "32-bit" ) {
        $Path = $env:windir + "\system32\win32k.sys"
    } ElseIf ( $Architecture[0] -eq "64-bit" -and $Architecture[1] -eq "x86" ) {
        $Path = $env:windir + "\sysnative\win32k.sys"
    }
        $VersionInfo = Get-FileVersionInfo($Path)
        $VersionInfo = $VersionInfo.Split(".")
        $Build = $VersionInfo[2]
        $Revision = $VersionInfo[3].Split(" ")[0]
        switch ( $Build ) {
            7600 { $VulnStatus = @("Not Vulnerable","Appears Vulnerable")[ $Revision -le "18000" ] }
            7601 { $VulnStatus = @("Not Vulnerable","Appears Vulnerable")[ $Revision -le "22823" ] }
            9200 { $VulnStatus = @("Not Vulnerable","Appears Vulnerable")[ $Revision -le "21247" ] }
            9600 { $VulnStatus = @("Not Vulnerable","Appears Vulnerable")[ $Revision -le "17353" ] }
            default { $VulnStatus = "Not Vulnerable" }
        }
    Set-ExploitTable $MSBulletin $VulnStatus
}
function roadblock {
    $MSBulletin = "MS15-078"
    $Path = $env:windir + "\system32\atmfd.dll"
    $VersionInfo = Get-FileVersionInfo($Path)
    $VersionInfo = $VersionInfo.Split(" ")
    $Revision = $VersionInfo[2]
    switch ( $Revision ) {
        243 { $VulnStatus = "Appears Vulnerable" }
        default { $VulnStatus = "Not Vulnerable" }
    }
    Set-ExploitTable $MSBulletin $VulnStatus
}
function crafts {
    $MSBulletin = "MS16-016"
    $Architecture = trite
    if ( $Architecture[0] -eq "64-bit" ) {
        $VulnStatus = "Not supported on 64-bit systems"
    } Else {
        $Path = $env:windir + "\system32\drivers\mrxdav.sys"
        $VersionInfo = Get-FileVersionInfo($Path)
        $VersionInfo = $VersionInfo.Split(".")
        $Build = $VersionInfo[2]
        $Revision = $VersionInfo[3].Split(" ")[0]
        switch ( $Build ) {
            7600 { $VulnStatus = @("Not Vulnerable","Appears Vulnerable")[ $Revision -le "16000" ] }
            7601 { $VulnStatus = @("Not Vulnerable","Appears Vulnerable")[ $Revision -le "23317" ] }
            9200 { $VulnStatus = @("Not Vulnerable","Appears Vulnerable")[ $Revision -le "21738" ] }
            9600 { $VulnStatus = @("Not Vulnerable","Appears Vulnerable")[ $Revision -le "18189" ] }
            10240 { $VulnStatus = @("Not Vulnerable","Appears Vulnerable")[ $Revision -le "16683" ] }
            10586 { $VulnStatus = @("Not Vulnerable","Appears Vulnerable")[ $Revision -le "103" ] }
            default { $VulnStatus = "Not Vulnerable" }
        }
    }
    Set-ExploitTable $MSBulletin $VulnStatus
}
function necklines {
    $MSBulletin = "MS16-032"
    
    $CPUCount = Mendel
    if ( $CPUCount -eq "1" ) {
        $VulnStatus = "Not Supported on single-core systems"
    
    } Else {
    
        $Architecture = trite
        if ( $Architecture[1] -eq "AMD64" -or $Architecture[0] -eq "32-bit" ) {
            $Path = $env:windir + "\system32\seclogon.dll"
        } ElseIf ( $Architecture[0] -eq "64-bit" -and $Architecture[1] -eq "x86" ) {
            $Path = $env:windir + "\sysnative\seclogon.dll"
        } 
            $VersionInfo = Get-FileVersionInfo($Path)
            $VersionInfo = $VersionInfo.Split(".")
            $Build = [int]$VersionInfo[2]
            $Revision = [int]$VersionInfo[3].Split(" ")[0]
            switch ( $Build ) {
                6002 { $VulnStatus = @("Not Vulnerable","Appears Vulnerable")[ $Revison -lt 19598 -Or ( $Revision -ge 23000 -And $Revision -le 23909 ) ] }
                7600 { $VulnStatus = @("Not Vulnerable","Appears Vulnerable")[ $Revision -le 19148 ] }
                7601 { $VulnStatus = @("Not Vulnerable","Appears Vulnerable")[ $Revision -lt 19148 -Or ( $Revision -ge 23000 -And $Revision -le 23347 ) ] }
                9200 { $VulnStatus = @("Not Vulnerable","Appears Vulnerable")[ $Revison -lt 17649 -Or ( $Revision -ge 21000 -And $Revision -le 21767 ) ] }
                9600 { $VulnStatus = @("Not Vulnerable","Appears Vulnerable")[ $Revison -lt 18230 ] }
                10240 { $VulnStatus = @("Not Vulnerable","Appears Vulnerable")[ $Revision -lt 16724 ] }
                10586 { $VulnStatus = @("Not Vulnerable","Appears Vulnerable")[ $Revision -le 161 ] }
                default { $VulnStatus = "Not Vulnerable" }
            }
    }
    
    Set-ExploitTable $MSBulletin $VulnStatus
}
function Pentagon {
    $MSBulletin = "MS16-034"
    
    $Architecture = trite
    if ( $Architecture[1] -eq "AMD64" -or $Architecture[0] -eq "32-bit" ) {
        $Path = $env:windir + "\system32\win32k.sys"
    } ElseIf ( $Architecture[0] -eq "64-bit" -and $Architecture[1] -eq "x86" ) {
        $Path = $env:windir + "\sysnative\win32k.sys"
    } 
    $VersionInfo = Get-FileVersionInfo($Path)
    $VersionInfo = $VersionInfo.Split(".")
    $Build = [int]$VersionInfo[2]
    $Revision = [int]$VersionInfo[3].Split(" ")[0]
    switch ( $Build ) {
        6002 { $VulnStatus = @("Not Vulnerable","Appears Vulnerable")[ $Revison -lt 19597 -Or $Revision -lt 23908 ] }
        7601 { $VulnStatus = @("Not Vulnerable","Appears Vulnerable")[ $Revision -lt 19145 -Or $Revision -lt 23346 ] }
        9200 { $VulnStatus = @("Not Vulnerable","Appears Vulnerable")[ $Revison -lt 17647 -Or $Revision -lt 21766 ] }
        9600 { $VulnStatus = @("Not Vulnerable","Appears Vulnerable")[ $Revison -lt 18228 ] }
        default { $VulnStatus = "Not Vulnerable" }
    }
    
    Set-ExploitTable $MSBulletin $VulnStatus
}
function Eurydice {
    $CVEID = "2017-7199"
    $SoftwareVersion = Get-InstalledSoftware "Nessus Agent"
    
    if ( !$SoftwareVersion ) {
        $VulnStatus = "Not Vulnerable"
    } else {
        $SoftwareVersion = $SoftwareVersion.Split(".")
        $Major = [int]$SoftwareVersion[0]
        $Minor = [int]$SoftwareVersion[1]
        $Build = [int]$SoftwareVersion[2]
        switch( $Major ) {
        6 { $VulnStatus = @("Not Vulnerable","Appears Vulnerable")[ $Minor -eq 10 -and $Build -le 3 -Or ( $Minor -eq 6 -and $Build -le 2 ) -Or ( $Minor -le 9 -and $Minor -ge 7 ) ] } # 6.6.2 - 6.10.3
        default { $VulnStatus = "Not Vulnerable" }
        }
    }
    Set-ExploitTable $CVEID $VulnStatus
}
function aprons {
    $MSBulletin = "MS16-135"
    $Architecture = trite
    if ( $Architecture[1] -eq "AMD64" -or $Architecture[0] -eq "32-bit" ) {
        $Path = $env:windir + "\system32\win32k.sys"
    } ElseIf ( $Architecture[0] -eq "64-bit" -and $Architecture[1] -eq "x86" ) {
        $Path = $env:windir + "\sysnative\win32k.sys"
    }
        $VersionInfo = Get-FileVersionInfo($Path)
        $VersionInfo = $VersionInfo.Split(".")
        
        $Build = [int]$VersionInfo[2]
        $Revision = [int]$VersionInfo[3].Split(" ")[0]
        switch ( $Build ) {
            7601 { $VulnStatus = @("Not Vulnerable","Appears Vulnerable")[ $Revision -lt 23584 ] }
            9600 { $VulnStatus = @("Not Vulnerable","Appears Vulnerable")[ $Revision -le 18524 ] }
            10240 { $VulnStatus = @("Not Vulnerable","Appears Vulnerable")[ $Revision -le 16384 ] }
            10586 { $VulnStatus = @("Not Vulnerable","Appears Vulnerable")[ $Revision -le 19 ] }
            14393 { $VulnStatus = @("Not Vulnerable","Appears Vulnerable")[ $Revision -le 446 ] }
            default { $VulnStatus = "Not Vulnerable" }
        }
    Set-ExploitTable $MSBulletin $VulnStatus
}
