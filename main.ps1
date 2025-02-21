
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

        <!-- Title -->
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

        <!-- Search Area -->
        <Grid Grid.Row="1" Margin="10">
            <Grid.RowDefinitions>
                <RowDefinition Height="Auto"/>
                <RowDefinition Height="Auto"/>
            </Grid.RowDefinitions>
            
            <!-- Manual Search Row -->
            <Grid Grid.Row="0" Margin="0,0,0,10">
                <Grid.ColumnDefinitions>
                    <ColumnDefinition Width="*"/>
                    <ColumnDefinition Width="Auto"/>
                </Grid.ColumnDefinitions>

                <TextBox Name="txtComputerName" 
                         Grid.Column="0" 
                         Height="25" 
                         Margin="0,0,10,0"
                         VerticalContentAlignment="Center"/>
                
                <TextBlock Name="txtPlaceholder"
                          Text="Computername eingeben..."
                          Grid.Column="0"
                          Margin="5,0,0,0"
                          VerticalAlignment="Center"
                          Foreground="Gray"
                          IsHitTestVisible="False">
                    <TextBlock.Style>
                        <Style TargetType="TextBlock">
                            <Setter Property="Visibility" Value="Collapsed"/>
                            <Style.Triggers>
                                <MultiDataTrigger>
                                    <MultiDataTrigger.Conditions>
                                        <Condition Binding="{Binding Text, ElementName=txtComputerName}" Value=""/>
                                        <Condition Binding="{Binding IsFocused, ElementName=txtComputerName}" Value="False"/>
                                    </MultiDataTrigger.Conditions>
                                    <Setter Property="Visibility" Value="Visible"/>
                                </MultiDataTrigger>
                            </Style.Triggers>
                        </Style>
                    </TextBlock.Style>
                </TextBlock>
                
                <Button Name="btnSearch" 
                        Grid.Column="1" 
                        Content="Computer suchen" 
                        Height="25" 
                        Width="140"/>
            </Grid>
            
            <!-- Network Search Row -->
            <Grid Grid.Row="1">
                <Grid.ColumnDefinitions>
                    <ColumnDefinition Width="*"/>
                    <ColumnDefinition Width="Auto"/>
                </Grid.ColumnDefinitions>

                <ComboBox Name="cmbNetworkComputers"
                          Grid.Column="0"
                          Height="25"
                          Margin="0,0,10,0"
                          VerticalContentAlignment="Center"
                          IsEnabled="False"/>
                
                <Button Name="btnDiscoverNetwork" 
                        Grid.Column="1" 
                        Content="Netzwerk durchsuchen" 
                        Height="25" 
                        Width="140"/>
            </Grid>
        </Grid>

        <!-- Progress Bar -->
        <ProgressBar Name="pbSearch" 
                     Grid.Row="1" 
                     Height="2"
                     Margin="10,0,10,0"
                     VerticalAlignment="Bottom"
                     Minimum="0" 
                     Maximum="100"
                     Visibility="Hidden"/>

        <!-- Information Area -->
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
$btnDiscoverNetwork = $Window.FindName("btnDiscoverNetwork")
$cmbNetworkComputers = $Window.FindName("cmbNetworkComputers")

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
$sync.btnDiscoverNetwork = $btnDiscoverNetwork
$sync.cmbNetworkComputers = $cmbNetworkComputers

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
                            $sync.txtModel.Text = if ($result.Model) { $result.Model } else { "N/A" }
                            $sync.txtUser.Text = if ($result.UserName) { $result.UserName } else { "N/A" }
                            $sync.txtOS.Text = if ($result.OSCaption) { $result.OSCaption } else { "N/A" }
                            $sync.txtArch.Text = if ($result.OSArchitecture) { $result.OSArchitecture } else { "N/A" }
                            $sync.txtIP.Text = if ($result.IPAddress) { $result.IPAddress } else { "N/A" }
                            $sync.txtMAC.Text = if ($result.MACAddress) { $result.MACAddress } else { "N/A" }
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


# The button click handler
$btnDiscoverNetwork.Add_Click({
    $sync.btnDiscoverNetwork.IsEnabled = $false
    $sync.cmbNetworkComputers.IsEnabled = $false
    $sync.pbSearch.Visibility = "Visible"
    $sync.pbSearch.IsIndeterminate = $true
    
    # Store the job in the sync hashtable with the function defined directly in the scriptblock
    $sync.networkJob = Start-Job -ScriptBlock {
        # Define the network discovery function
        function Get-NetworkComputers {
            $computers = @()
            try {
                # Get network neighbors
                $neighbors = Get-NetNeighbor | 
                    Where-Object { $_.State -ne 'Unreachable' -and $_.State -ne 'Permanent' } | 
                    Select-Object IPaddress, LinkLayerAddress, State

                Write-Host "Found $($neighbors.Count) network neighbors"

                foreach ($neighbor in $neighbors) {
                    try {
                        Write-Host "Processing neighbor $($neighbor.IPAddress)"
                        # Get hostname using Resolve-DnsName
                        $hostname = $null
                        try {
                            $dnsResult = Resolve-DnsName -Name $neighbor.IPAddress -ErrorAction Stop
                            $hostname = $dnsResult.NameHost
                            Write-Host "Resolved hostname: $hostname"
                        }
                        catch {
                            Write-Warning "Could not resolve hostname for $($neighbor.IPAddress): $_"
                            continue
                        }

                        # Add to computers array if we have a hostname
                        if (-not [string]::IsNullOrEmpty($hostname)) {
                            $computers += [PSCustomObject]@{
                                IPAddress = $neighbor.IPAddress
                                Hostname = $hostname
                                LinkLayerAddress = $neighbor.LinkLayerAddress
                                State = $neighbor.State
                            }
                            Write-Host "Added computer: $hostname ($($neighbor.IPAddress))"
                        }
                    }
                    catch {
                        Write-Warning "Error processing neighbor $($neighbor.IPAddress): $_"
                    }
                }
            }
            catch {
                Write-Warning "Error discovering network computers: $_"
            }

            Write-Host "Found total of $($computers.Count) computers"
            # Sort and return unique computers
            return $computers | 
                Sort-Object Hostname -Unique |
                Where-Object { $_.Hostname -ne $env:COMPUTERNAME }  # Exclude local computer
        }

        # Call the function and return results
        Get-NetworkComputers
    }
    
    # Create timer to check job status
    $sync.networkTimer = New-Object System.Windows.Threading.DispatcherTimer
    $sync.networkTimer.Interval = [TimeSpan]::FromSeconds(1)
    $sync.networkTimerCount = 0
    
    $sync.networkTimer.Add_Tick({
        $sync.networkTimerCount++
        Write-Host "Network discovery job state: $($sync.networkJob.State), timer count: $($sync.networkTimerCount)"
        
        if ($sync.networkJob.State -eq 'Completed' -or $sync.networkTimerCount -ge 60) {
            $sync.networkTimer.Stop()
            
            try {
                if ($sync.networkTimerCount -ge 60) {
                    Write-Host "Network discovery timed out"
                    if ($sync.networkJob) {
                        Stop-Job -Job $sync.networkJob
                    }
                    
                    $Window.Dispatcher.Invoke([Action]{
                        [System.Windows.MessageBox]::Show(
                            "Zeitüberschreitung bei der Netzwerksuche.",
                            "Timeout",
                            [System.Windows.MessageBoxButton]::OK,
                            [System.Windows.MessageBoxImage]::Warning
                        )
                    })
                }
                else {
                    $computers = Receive-Job -Job $sync.networkJob -ErrorAction Stop
                    Write-Host "Received computers from job: $($computers | ConvertTo-Json)"
                    
                    $Window.Dispatcher.Invoke([Action]{
                        $sync.cmbNetworkComputers.Items.Clear()
                        
                        if ($computers -and $computers.Count -gt 0) {
                            foreach ($computer in $computers) {
                                $displayText = "$($computer.Hostname) ($($computer.IPAddress))"
                                if ($computer.State) {
                                    $displayText += " - $($computer.State)"
                                }
                                if ($computer.LinkLayerAddress) {
                                    $displayText += " - MAC: $($computer.LinkLayerAddress)"
                                }
                                $sync.cmbNetworkComputers.Items.Add($displayText)
                                Write-Host "Added to ComboBox: $displayText"
                            }
                            $sync.cmbNetworkComputers.IsEnabled = $true
                        }
                        else {
                            [System.Windows.MessageBox]::Show(
                                "Keine Computer im Netzwerk gefunden.",
                                "Information",
                                [System.Windows.MessageBoxButton]::OK,
                                [System.Windows.MessageBoxImage]::Information
                            )
                        }
                    })
                }
            }
            catch {
                Write-Warning "Error processing network discovery results: $_"
                $Window.Dispatcher.Invoke([Action]{
                    [System.Windows.MessageBox]::Show(
                        "Fehler bei der Netzwerksuche: $_",
                        "Fehler",
                        [System.Windows.MessageBoxButton]::OK,
                        [System.Windows.MessageBoxImage]::Error
                    )
                })
            }
            finally {
                if ($sync.networkJob) {
                    Remove-Job -Job $sync.networkJob
                    $sync.networkJob = $null
                }
                
                $Window.Dispatcher.Invoke([Action]{
                    $sync.btnDiscoverNetwork.IsEnabled = $true
                    $sync.pbSearch.Visibility = "Hidden"
                    $sync.pbSearch.IsIndeterminate = $false
                })
            }
        }
    })
    
    $sync.networkTimer.Start()
})

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

$cmbNetworkComputers.Add_SelectionChanged({
    if ($sync.cmbNetworkComputers.SelectedItem) {
        $selected = $sync.cmbNetworkComputers.SelectedItem.ToString()
        # Extract only the hostname part (everything before the first space or parenthesis)
        $hostname = $selected -replace '\s*\(.*$', ''
        $txtComputerName.Text = $hostname
    }
})

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
# MIIFpgYJKoZIhvcNAQcCoIIFlzCCBZMCAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUTVuDnCKM7ajPbNyoJV5GOxfZ
# X0ugggMuMIIDKjCCAhKgAwIBAgIQE6+AfpCKbppD5IxirnFqkjANBgkqhkiG9w0B
# AQsFADAtMSswKQYDVQQDDCJEaWdpdGFsIFRhbGVudCBQb3dlclNoZWxsIFNvZnR3
# YXJlMB4XDTI1MDIyMTA3MDE0NVoXDTMwMDIyMTA3MTE0NVowLTErMCkGA1UEAwwi
# RGlnaXRhbCBUYWxlbnQgUG93ZXJTaGVsbCBTb2Z0d2FyZTCCASIwDQYJKoZIhvcN
# AQEBBQADggEPADCCAQoCggEBANVVUNnEMpWJTu1F5qABWXXzrASpXnNh+xX9ATwO
# 7pEuTn5AhYeq1iPfUfsS9TGfgbu+FRnsOkz9NyTPhYHogRb9YtoLY+FQb5v8mg5k
# iTinBpxfGY1OUyheuYuziUBNFdVDqd/lfuDTD9aQzCzIOFMisIz0DFbMo+Sdij91
# j+IcTu3wBeJChpust3dVK+x6g+flOGjzGa0Xc2GEZAZSEMZd7is2LcRvX+oEfdnI
# wJOA7F2AaXIaTK3GdTvIX2SPeYB507G5c1xoykaDT5F38Ku2ymjLYRj5Pz8UbGQu
# mUhd6CmmI8cnjn5pzKW6JeMhh8E5txBAjwgtNSv8r9kk8s0CAwEAAaNGMEQwDgYD
# VR0PAQH/BAQDAgeAMBMGA1UdJQQMMAoGCCsGAQUFBwMDMB0GA1UdDgQWBBQnA2Ah
# q2enTFuBvB0BF6lhKCq3djANBgkqhkiG9w0BAQsFAAOCAQEASfE1NO2s0HLzSM08
# 04M7o8Q4pWENv7S/G5uSJmMceVILfFuWEIaDdfezHYXa4PJStETnzBLST9sYi0AR
# TDEzhz5/WYdCS8SGt6AVFz9xVTzGjIy15J0dJ5X+TACzma9e8gfSTk3TjANgzCCh
# q42y26Cx1ML2fyzm+hCfbk/kr3UMHtyzBmZlHcbCh4nI9NZSyn3AfbKZb1xIwDFt
# /CIsM7Z/+gZKgV5UHysOo9VX6c34Svj3BEM9TIpdaTqrO6X5pIKaCcMjf/VYV1hi
# zP+egP9C7jOzlPc6idOP5ZxW8UjHsWreh84UWuap6aR6PGxBwEL9ITr17GkFkTlI
# 3RQDYTGCAeIwggHeAgEBMEEwLTErMCkGA1UEAwwiRGlnaXRhbCBUYWxlbnQgUG93
# ZXJTaGVsbCBTb2Z0d2FyZQIQE6+AfpCKbppD5IxirnFqkjAJBgUrDgMCGgUAoHgw
# GAYKKwYBBAGCNwIBDDEKMAigAoAAoQKAADAZBgkqhkiG9w0BCQMxDAYKKwYBBAGC
# NwIBBDAcBgorBgEEAYI3AgELMQ4wDAYKKwYBBAGCNwIBFTAjBgkqhkiG9w0BCQQx
# FgQUQlLI9yZQ75gSUcN5QRZ7I7cvr/cwDQYJKoZIhvcNAQEBBQAEggEAVOfIw03K
# 7Lya1mpLvqCQHI8XOgN30il3uFBDouLZmnrCps0kunru2Vh2GtyLNTugsVlQqn+p
# kg0cSExh1V0zIRR1d7c5JDbYQ1jTK3MB1YCDW+VzXHgd5AfE+/9oofWXIJUI2x7C
# 1Bdtrbefbt9iwyb1eClSXomIlS2ZvPwFImnL5TQbMVXWBMQPX3P0Uv1rnwEbkXMx
# Uqhqjod+Z5T5KGU55pkId8uHaMvqJdFlqz5HJKeLUQBSalqzYhc+NeBhDCOu+YJA
# FUSYyBtKJebWb1krtUXCoMBr1h0Mf6m4DauUP75MfVqUfBM3tMrAo6Z0stdr1PiW
# CM8RJCYwQdXomA==
# SIG # End signature block
