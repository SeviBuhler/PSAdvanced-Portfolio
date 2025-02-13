
[xml]$XAML = @"
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        Title="Digital Talent - Computer Information Tool" Height="600" Width="800">
    <Grid>
        <Grid.RowDefinitions>
            <RowDefinition Height="Auto"/>
            <RowDefinition Height="Auto"/>
            <RowDefinition Height="*"/>
        </Grid.RowDefinitions>

        <!-- Titel -->
        <TextBlock Grid.Row="0" 
                   Text="Computer Information Tool" 
                   FontSize="24" 
                   FontWeight="Bold" 
                   Margin="10,10,10,5"
                   HorizontalAlignment="Center"/>
        
        <Separator Grid.Row="0" 
                   Margin="10,40,10,0" 
                   Height="2" 
                   Background="#CCCCCC"/>

        <!-- Suchbereich -->
        <Grid Grid.Row="1" Margin="10">
            <Grid.ColumnDefinitions>
                <ColumnDefinition Width="*"/>
                <ColumnDefinition Width="Auto"/>
                <ColumnDefinition Width="200"/>
            </Grid.ColumnDefinitions>

            <TextBox Name="txtComputerName" 
                     Grid.Column="0" 
                     Height="25" 
                     Margin="0,0,10,0"
                     VerticalContentAlignment="Center"/>
            
            <Button Name="btnSearch" 
                    Grid.Column="1" 
                    Content="Computer suchen" 
                    Height="25" 
                    Width="120" 
                    Margin="0,0,10,0"/>
            
            <ProgressBar Name="pbSearch" 
                        Grid.Column="2" 
                        Height="20" 
                        Minimum="0" 
                        Maximum="100"
                        Visibility="Hidden"/>
        </Grid>

        <!-- Informationsbereich -->
        <Border Grid.Row="2" Margin="10" Padding="10" BorderBrush="#CCCCCC" BorderThickness="1">
            <StackPanel>
                <!-- Computer Info Section -->
                <TextBlock Text="Computer Info" 
                          FontSize="16" 
                          FontWeight="Bold" 
                          Margin="0,0,0,10" 
                          Foreground="#2196F3"/>
                
                <Grid Margin="10,0,10,20">
                    <Grid.ColumnDefinitions>
                        <ColumnDefinition Width="Auto" MinWidth="180"/>
                        <ColumnDefinition Width="*"/>
                    </Grid.ColumnDefinitions>
                    <Grid.RowDefinitions>
                        <RowDefinition Height="Auto"/>
                        <RowDefinition Height="Auto"/>
                        <RowDefinition Height="Auto"/>
                        <RowDefinition Height="Auto"/>
                        <RowDefinition Height="Auto"/>
                    </Grid.RowDefinitions>

                    <TextBlock Grid.Row="0" Grid.Column="0" Text="Datum / Uhrzeit:" Margin="0,5,10,5" FontWeight="Bold"/>
                    <TextBlock Grid.Row="1" Grid.Column="0" Text="Computername:" Margin="0,5,10,5" FontWeight="Bold"/>
                    <TextBlock Grid.Row="2" Grid.Column="0" Text="Letzte Startzeit:" Margin="0,5,10,5" FontWeight="Bold"/>
                    <TextBlock Grid.Row="3" Grid.Column="0" Text="Computermodell:" Margin="0,5,10,5" FontWeight="Bold"/>
                    <TextBlock Grid.Row="4" Grid.Column="0" Text="Benutzername:" Margin="0,5,10,5" FontWeight="Bold"/>

                    <TextBlock Name="txtDateTime" Grid.Row="0" Grid.Column="1" Margin="0,5,0,5"/>
                    <TextBlock Name="txtCompName" Grid.Row="1" Grid.Column="1" Margin="0,5,0,5"/>
                    <TextBlock Name="txtLastBoot" Grid.Row="2" Grid.Column="1" Margin="0,5,0,5"/>
                    <TextBlock Name="txtModel" Grid.Row="3" Grid.Column="1" Margin="0,5,0,5"/>
                    <TextBlock Name="txtUser" Grid.Row="4" Grid.Column="1" Margin="0,5,0,5"/>
                </Grid>

                <!-- OS Info Section -->
                <TextBlock Text="OS Info" 
                          FontSize="16" 
                          FontWeight="Bold" 
                          Margin="0,10,0,10" 
                          Foreground="#2196F3"/>
                
                <Grid Margin="10,0,10,20">
                    <Grid.ColumnDefinitions>
                        <ColumnDefinition Width="Auto" MinWidth="180"/>
                        <ColumnDefinition Width="*"/>
                    </Grid.ColumnDefinitions>
                    <Grid.RowDefinitions>
                        <RowDefinition Height="Auto"/>
                        <RowDefinition Height="Auto"/>
                    </Grid.RowDefinitions>

                    <TextBlock Grid.Row="0" Grid.Column="0" Text="Betriebssystem:" Margin="0,5,10,5" FontWeight="Bold"/>
                    <TextBlock Grid.Row="1" Grid.Column="0" Text="Betriebssystem Architektur:" Margin="0,5,10,5" FontWeight="Bold"/>

                    <TextBlock Name="txtOS" Grid.Row="0" Grid.Column="1" Margin="0,5,0,5"/>
                    <TextBlock Name="txtArch" Grid.Row="1" Grid.Column="1" Margin="0,5,0,5"/>
                </Grid>

                <!-- Network Info Section -->
                <TextBlock Text="Netzwerk" 
                          FontSize="16" 
                          FontWeight="Bold" 
                          Margin="0,10,0,10" 
                          Foreground="#2196F3"/>
                
                <Grid Margin="10,0,10,0">
                    <Grid.ColumnDefinitions>
                        <ColumnDefinition Width="Auto" MinWidth="180"/>
                        <ColumnDefinition Width="*"/>
                    </Grid.ColumnDefinitions>
                    <Grid.RowDefinitions>
                        <RowDefinition Height="Auto"/>
                        <RowDefinition Height="Auto"/>
                    </Grid.RowDefinitions>

                    <TextBlock Grid.Row="0" Grid.Column="0" Text="IP Adresse:" Margin="0,5,10,5" FontWeight="Bold"/>
                    <TextBlock Grid.Row="1" Grid.Column="0" Text="MAC Adresse:" Margin="0,5,10,5" FontWeight="Bold"/>

                    <TextBlock Name="txtIP" Grid.Row="0" Grid.Column="1" Margin="0,5,0,5"/>
                    <TextBlock Name="txtMAC" Grid.Row="1" Grid.Column="1" Margin="0,5,0,5"/>
                </Grid>
            </StackPanel>
        </Border>
    </Grid>
</Window>
"@

### Load required assemblies
Add-Type -AssemblyName PresentationFramework
Add-Type -AssemblyName PresentationCore
Add-Type -AssemblyName WindowsBase


### Load XAML
$Reader = (New-Object System.Xml.XmlNodeReader $XAML)
$Window = [Windows.Markup.XamlReader]::Load($Reader)

### Find elements
$txtComputerName = $Window.FindName("txtComputerName")
$btnSearch = $Window.FindName("btnSearch")
$pbSearch = $Window.FindName("pbSearch")
$txtDateTime = $Window.FindName("txtDateTime")
$txtCompName = $Window.FindName("txtCompName")
$txtLastBoot = $Window.FindName("txtLastBoot")
$txtModel = $Window.FindName("txtModel")
$txtUser = $Window.FindName("txtUser")
$txtOS = $Window.FindName("txtOS")
$txtArch = $Window.FindName("txtArch")
$txtIP = $Window.FindName("txtIP")
$txtMAC = $Window.FindName("txtMAC")

### Hashtable for synchronized access
$sync = [System.Collections.Hashtable]::Synchronized(@{})
$sync.Window = $Window
$sync.txtDateTime = $txtDateTime
$sync.txtCompName = $txtCompName
$sync.txtLastBoot = $txtLastBoot
$sync.txtModel = $txtModel
$sync.txtUser = $txtUser
$sync.txtOS = $txtOS
$sync.txtArch = $txtArch
$sync.txtIP = $txtIP
$sync.txtMAC = $txtMAC
$sync.pbSearch = $pbSearch

### Function to get computer information
function Get-ComputerInfo {
    param (
        [string]$ComputerName
    )
    
    ### Update UI to show progress
    $Window.Dispatcher.Invoke([System.Windows.Threading.DispatcherPriority]::Normal, [Action]{
        $sync.pbSearch.Value = 0
        $sync.pbSearch.IsIndeterminate = $true
        $sync.pbSearch.Visibility = "Visible"
        $btnSearch.IsEnabled = $false
    })

    ### Create and start background job
    $sync.job = Start-Job -ScriptBlock {
        param($ComputerName)
        write-host "Getting computer info for $ComputerName..."
        try {
            ### System Info
            $CS = Get-WmiObject -Class Win32_ComputerSystem -ComputerName $ComputerName -ErrorAction Stop
            $OS = Get-WmiObject -Class Win32_OperatingSystem -ComputerName $ComputerName -ErrorAction Stop
            $NIC = Get-WmiObject -Class Win32_NetworkAdapterConfiguration -ComputerName $ComputerName -ErrorAction Stop | 
                Where-Object { $_.IPEnabled -eq $true } | Select-Object -First 1
            $LastBootTime = Get-WmiObject -Class Win32_OperatingSystem | Select-Object csname -ExpandProperty LastBootUpTime
            $FormattedBoot = [Management.ManagementDateTimeConverter]::ToDateTime($LastBootTime).ToString("yyyy/MM/dd hh:mm:ss tt")
            ### Return result
            @{
                Success = $true
                DateTime = (Get-Date).ToString("dd.MM.yyyy HH:mm:ss")
                ComputerName = $CS.Name
                LastBoot = $FormattedBoot
                Model = $CS.Model
                UserName = $CS.UserName
                OSCaption = $OS.Caption
                OSArchitecture = $OS.OSArchitecture
                IPAddress = $NIC.IPAddress[0]
                MACAddress = $NIC.MACAddress
            }
        }
        ### Catch errors and return error message
        catch {
            @{
                Success = $false
                Error = $_.Exception.Message
            }
        }
    ### Pass computer name to job
    } -ArgumentList $ComputerName

    ### Create timer to check job status
    $sync.timer = New-Object System.Windows.Threading.DispatcherTimer
    $sync.timer.Interval = [TimeSpan]::FromMilliseconds(100)
    $sync.timerCount = 0

    ### Timer tick event
    $sync.timer.Add_Tick({
        $sync.timerCount++ ### Increment timer count
        write-host "Job state = $($sync.job.State), timerCount = $($sync.timerCount)"
        ### Check if job is completed or timed out
        if ($sync.job.State -eq 'Completed' -or $sync.timerCount -ge 100) {
            $sync.timer.Stop()
            ### Try to receive job result
            try {
                if ($sync.timerCount -ge 100) {
                    Write-Host "Job timed out"
                    if ($sync.job) {
                        Stop-Job -Job $sync.job
                    }
                    
                    ### Show timeout message
                    $Window.Dispatcher.Invoke([System.Windows.Threading.DispatcherPriority]::Normal, [Action]{
                        [System.Windows.MessageBox]::Show(
                            "Zeitüberschreitung beim Abrufen der Computerinformationen.\n
                            Bitte überprüfen Sie den Computernamen und die Netzwerkverbindung.",
                            "Timeout",
                            [System.Windows.MessageBoxButton]::OK,
                            [System.Windows.MessageBoxImage]::Error
                        )
                    })
                }
                ### Job completed successfully
                else {
                    $result = Receive-Job -Job $sync.job
                    Write-Host "Job completed. Result: $($result | ConvertTo-Json)"
                    
                    ### Update UI with result
                    $Window.Dispatcher.Invoke([System.Windows.Threading.DispatcherPriority]::Normal, [Action]{
                        if ($result.Success) {
                            $sync.txtDateTime.Text = $result.DateTime
                            $sync.txtCompName.Text = $result.ComputerName
                            $sync.txtLastBoot.Text = $result.LastBoot
                            $sync.txtModel.Text = $result.Model ?? "N/A"
                            $sync.txtUser.Text = $result.UserName ?? "N/A"
                            $sync.txtOS.Text = $result.OSCaption ?? "N/A"
                            $sync.txtArch.Text = $result.OSArchitecture ?? "N/A"
                            $sync.txtIP.Text = $result.IPAddress ?? "N/A"
                            $sync.txtMAC.Text = $result.MACAddress ?? "N/A"
                        }
                        else {
                            ### Clear all fields
                            $sync.txtDateTime.Text = ""
                            $sync.txtCompName.Text = ""
                            $sync.txtLastBoot.Text = ""
                            $sync.txtModel.Text = ""
                            $sync.txtUser.Text = ""
                            $sync.txtOS.Text = ""
                            $sync.txtArch.Text = ""
                            $sync.txtIP.Text = ""
                            $sync.txtMAC.Text = ""

                            ### Show error message
                            [System.Windows.MessageBox]::Show(
                                "Fehler beim Abrufen der Computerinformationen:`n$($result.Error)",
                                "Fehler",
                                [System.Windows.MessageBoxButton]::OK,
                                [System.Windows.MessageBoxImage]::Error
                            )
                        }
                    })
                }
            }
            finally {
                ### Clean up job and timer
                if ($sync.job) {
                    Remove-Job -Job $sync.job
                    $sync.job = $null
                }
                
                ### Update UI to show progress
                $Window.Dispatcher.Invoke([System.Windows.Threading.DispatcherPriority]::Normal, [Action]{
                    $sync.pbSearch.IsIndeterminate = $false
                    $sync.pbSearch.Value = 100
                    $sync.pbSearch.Visibility = "Hidden"
                    $btnSearch.IsEnabled = $true
                })
            }
        }
    })
    ### Start timer
    $sync.timer.Start()
}

### Event Handler für Suchen-Button
$searchAction ={
    if ($txtComputerName.Text) {
        ### Show confirmation dialog
        $result = [System.Windows.MessageBox]::Show(
            "Möchten Sie Informationen für Computer '$($txtComputerName.Text)' abrufen?",
            "Bestätigung",
            [System.Windows.MessageBoxButton]::YesNo,
            [System.Windows.MessageBoxImage]::Question
        )
        ### If user confirms, get choosed computer info
        if ($result -eq [System.Windows.MessageBoxResult]::Yes) {
            Get-ComputerInfo -ComputerName $txtComputerName.Text
        }
    }
    else {
        ### Show warning for empty computer name
        [System.Windows.MessageBox]::Show(
            "Bitte geben Sie einen Computernamen ein.`nLokale Computer Informationen werden gelistet!",
            "Warnung",
            [System.Windows.MessageBoxButton]::OK,
            [System.Windows.MessageBoxImage]::Warning
        )
        ### Get local computer info if no computer name is entered
        Get-ComputerInfo -ComputerName $env:COMPUTERNAME
    }
}

### Button click event implementieren
$btnSearch.Add_Click($searchAction)

### TextBox KeyDwon event implementieren
$txtComputerName.Add_KeyDown({
    param($s, $e)
    if ($e.Key -eq "Return") {
        & $searchAction
    }
})

### Show local computer on inital start
$Window.Add_Loaded({
    Write-Host "Window loaded, getting computer info..."
    Get-ComputerInfo -ComputerName $env:COMPUTERNAME
})

### Fenster anzeigen
$Window.ShowDialog()
# SIG # Begin signature block
# MIIFywYJKoZIhvcNAQcCoIIFvDCCBbgCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCCQwqdGWiUBqWva
# F4oJpuqhNsQuMkK8hUr0dgOU0NIIBaCCAy4wggMqMIICEqADAgECAhBpgIK/2NLV
# o0eV5Y6t1wYQMA0GCSqGSIb3DQEBCwUAMC0xKzApBgNVBAMMIkRpZ2l0YWwgVGFs
# ZW50IFBvd2VyU2hlbGwgU29mdHdhcmUwHhcNMjUwMjEzMTMxMzQyWhcNMzAwMjEz
# MTMyMzQyWjAtMSswKQYDVQQDDCJEaWdpdGFsIFRhbGVudCBQb3dlclNoZWxsIFNv
# ZnR3YXJlMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAqxSOE3o1nmVY
# bvetkIyGORT+gwnc3niMrDh4IBq9BZ7lRBecvpFzutvz/BysZQSuwfDZ4TFdRxnj
# aekyJmlRLfAxxhJTwSvogPayDCDO+Q9kDnaVTkbNOqatCpQY/ZGgWbfx3GMF5+mq
# jvh+sHYMHfmram9BZ+Jimc9KxRVHzsoEiUOBM5hDv0wTmkI1CwApUUPiJj/dsP4s
# LtY2LNSqvnlOFvh8Oh8xOHf/V7Q7qid2bQEVKPVf6b071KizqqocD1xEVghjcYIn
# butK6AC7fFxXcOD8Y7iQsrtO+aIQVa0pW6VQqguWj+Cj1FdMTWHHP3xcs6/90fdN
# Y43O4IKrFQIDAQABo0YwRDAOBgNVHQ8BAf8EBAMCB4AwEwYDVR0lBAwwCgYIKwYB
# BQUHAwMwHQYDVR0OBBYEFHeBh60Xc2cz6MLvoeF0WE6GhaxuMA0GCSqGSIb3DQEB
# CwUAA4IBAQBDP9CwilBNteLNo2Nn0TZwzod1mcD5/1q5nhdi1ls+9hrhhbR7gJNW
# b1tdEU/C0YiUmIZ6bQJFKO1rQjodUVlkdnwWEKDRVOJfGBPpCYQc8r3PJX5itHOf
# xgX+Rb8fZBirmSk5YVdGSHTmgCpYqRD2ppZndUfZc0rmzWtguw1FuetgM4hnzmw5
# R0NtGbgJor3y+cyU7mYfjI6NQrNnTKEhnHK7y1EVolc7pA0GgVpNN+kaUoyd4aK0
# bDYn1n6LsXfnedk0nJFewTPhQ+u5BQpb/6rtdzgmAZ2Mo+aTKFmBG/vWhVXhZRJe
# sIzOddvw3ZR6+HS1Kc/uimufm9c9asr/MYIB8zCCAe8CAQEwQTAtMSswKQYDVQQD
# DCJEaWdpdGFsIFRhbGVudCBQb3dlclNoZWxsIFNvZnR3YXJlAhBpgIK/2NLVo0eV
# 5Y6t1wYQMA0GCWCGSAFlAwQCAQUAoIGEMBgGCisGAQQBgjcCAQwxCjAIoAKAAKEC
# gAAwGQYJKoZIhvcNAQkDMQwGCisGAQQBgjcCAQQwHAYKKwYBBAGCNwIBCzEOMAwG
# CisGAQQBgjcCARUwLwYJKoZIhvcNAQkEMSIEIH9hgYRxVj+tS2+NWEYEgWT63yLC
# wr9Swr7GY+QkRDCgMA0GCSqGSIb3DQEBAQUABIIBABp8IEPfjkfQuoOtX7ssKHMd
# o8NK5Q6euavEwczIoegNo+DXUd152aSIaSUwtnJ9Nq+DUotfmPXtEYvSRLJBicyL
# zenhAZLobo+NcXGw6GKIgtvYsUvqW7EIa4b+MR7IFOx/nJNMaEmRGUUT206lWBw/
# zrFRVl+PZey/LrSSG7aP7TPf6Sp0j+M4b9Itx5BrBNxw5LltM9NOniDjfIddyCC9
# +j2EfYDX9djb+S2ChFwJfm+Xak1MJ01RzSK1DHURmO+BwHUNCf1/rjW+7m1jiSKf
# jZEQNzCJ2ZDV8kdF/onZL1G7XeLpjvygI5RjOCsCictQH+WJov/+Hy49O3quZaY=
# SIG # End signature block
